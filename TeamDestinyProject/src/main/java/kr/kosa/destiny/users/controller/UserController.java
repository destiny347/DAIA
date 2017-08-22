package kr.kosa.destiny.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kosa.destiny.users.model.UserVO;
import kr.kosa.destiny.users.service.IUserService;

@Controller
public class UserController {

   @Autowired
   IUserService userService;

   //jsp 파일에서 ${} 사용을 위한 모델 생성.
   public Model callNameModel(String userId, Model model) {
      UserVO user = userService.selectUserByUserId(userId);
      model.addAttribute("userId", user.getUserId());
      return model;
   }

   //에러 예외처리
   static final Logger logger = LoggerFactory.getLogger(UserController.class);

   public ModelAndView databaseError(HttpServletRequest req, Exception ex) {
      logger.error("Request: " + req.getRequestURL() + " raised " + ex);

      ModelAndView mav = new ModelAndView();
      mav.addObject("exception", ex);
      mav.addObject("url", req.getRequestURL());
      mav.setViewName("users/error");
      return mav;
   }

   //회원가입
   @RequestMapping(value="/users/signUp", method=RequestMethod.GET)
   public String signUp(Model model) {
      model.addAttribute("user", new UserVO());
      return "/";
   }

   @RequestMapping(value="/users/signUp", method=RequestMethod.POST)
   public String signUp(@ModelAttribute("user") UserVO user, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
      if(result.hasErrors()) {
         return "/";
      } try {
         userService.signUp(user);
      } catch(RuntimeException e) {
         redirectAttrs.addFlashAttribute("message", e.getMessage());
      }
      return "redirect:/";
   }
   
   //탈퇴양식 페이지로 연결
   @RequestMapping(value="/users/withdraw")
   public String withdraw() {
      return "/users/withdrawForm";
   }
   
   //회원 탈퇴
   @RequestMapping(value="/users/withDraw", method=RequestMethod.GET)
   public String withDraw(HttpSession session, Model model) {  
      return "/users/myPage";
   }

   @RequestMapping(value="/users/withDraw", method=RequestMethod.POST)
   public String withDraw(String userId, String userPw, Model model, HttpSession session) {
      callNameModel(userId, model);      
      try {
         if(userService.checkPassword(userId, userPw)) {            
            userService.withDraw(userId, userPw);
            session.removeAttribute(userId);
            session.invalidate();
            return "redirect:/";
         } else {            
              model.addAttribute("errorPw", "비밀번호를 잘못 입력하셨습니다.");
            model.addAttribute("home", "/users/withdraw");
            return "users/PwWrong";
         }
      } catch(Exception e) {
        model.addAttribute("exception", e);
        return "redirect:/";
      }
   }
       
   //정보수정을 위해 비밀번호 확인 페이지로 연결
   @RequestMapping(value="/users/checkpw")
   public String checkpw() {
      return "/users/checkpw";
   }
   
   //비밀번호 확인 후 수정양식 페이지로 연결
   @RequestMapping(value="/users/checkPw", method=RequestMethod.GET)
   public String checkPw(HttpSession session, Model model) {   
      return "/users/myPage";
   }

   @RequestMapping(value="/users/checkPw", method=RequestMethod.POST)
   public String checkPw(String userId, String userPw, Model model, HttpSession session) {
      callNameModel(userId, model);      
      try {
         if(userService.checkPassword(userId, userPw)) {
           UserVO user = userService.selectUserByUserId(userId);
            model.addAttribute("user", user);
            return "redirect:/users/update/"+user.getUserId();
         } else {            
              model.addAttribute("errorPw", "비밀번호를 잘못 입력하셨습니다.");
            model.addAttribute("home", "/users/checkPw");
            return "users/PwWrong";
         }
      } catch(Exception e) {
        model.addAttribute("exception", e);
        return "redirect:/";
      }
   }
   
   //정보수정
   @RequestMapping(value="/users/update/{userId}", method=RequestMethod.GET)
   public String updateInfo(@PathVariable String userId, Model model, HttpSession session) {
      UserVO user = userService.selectUserByUserId(userId);
      /*System.out.println(user.getUserId());*/
      model.addAttribute("user", user);
      return "/users/update";
   }

   @RequestMapping(value="/users/update/{userId}", method=RequestMethod.POST)
   public String updateInfo(@ModelAttribute("user") @Valid UserVO users, Model model) {
      userService.updateInfo(users);
      return "redirect:/greeting";
   }

   //내 정보
   @RequestMapping("/users/myPage/{userId}")
   public String myPage(@PathVariable (value= "userId") String userId,  Model model, HttpSession session) {
      UserVO user = userService.selectUserByUserId(userId);      
      model.addAttribute("user", user);            
      return "/users/myPage";
   }

   //로그인
   @RequestMapping(value="/greeting", method=RequestMethod.GET)
   public String signIn() {
      return "/welcome/welcome";
   }

   @RequestMapping(value="/greeting", method=RequestMethod.POST)
   public String signIn(String userId, String userPw, HttpSession session, Model model) {
      try {
         UserVO user = userService.selectUserByUserId(userId);
         callNameModel(userId, model);

         if(userService.checkPassword(userId, userPw)) {
            session.setAttribute("userId", userId);
            session.setAttribute("user", user);
            return "redirect:/greeting";
         } else {
            session.invalidate();
            model.addAttribute("errorPw", "비밀번호를 잘못 입력하셨습니다.");
            model.addAttribute("home", "/users/login");
            return "users/PwWrong";
         }
      } catch(Exception e) {
         model.addAttribute("errorId", "아이디를 잘못 입력하셨습니다.");
         model.addAttribute("home", "/users/login");
         return "users/IdWrong";
      }
   }

   //로그아웃
   @RequestMapping("/users/logout")
   public String logout(HttpSession session) {      
      session.invalidate();
      return "redirect:/";
   }

   //링크 연결용 controller 모음
   @RequestMapping(value="/include/header")
   public String header() {
      return "/include/header";
   }

   @RequestMapping(value="/include/footer")
   public String footer() {
      return "/include/footer";
   }

   @RequestMapping(value="/aboutPrj")
   public String aboutPrj() {
      return "/webpage/aboutPrj";
   }

   @RequestMapping(value="/greeting/aboutPrj")
   public String aboutPrj_welcome() {
      return "/welcome/aboutPrj_welcome";
   }

   @RequestMapping(value="/aboutUs")
   public String aboutUs() {
      return "/webpage/aboutUs";
   }

   @RequestMapping(value="/greeting/aboutUs")
   public String aboutUs_welcome() {
      return "/welcome/aboutUs_welcome";
   }

   @RequestMapping(value="/contact")
   public String contact() {
      return "/webpage/contact";
   }

   @RequestMapping(value="/greeting/contact")
   public String contact_welcome() {
      return "/welcome/contact_welcome";
   }

   @RequestMapping(value="/board")
   public String board() {
      return "/webpage/board";
   }

   @RequestMapping(value="/greeting/board")
   public String board_welcome() {
      return "/welcome/board_welcome";
   }

   @RequestMapping(value="/users/login")
   public String login() {
      return "/users/login";
   }

   @RequestMapping(value="/users/join")
   public String join() {
      return "/users/join";
   }


   @RequestMapping(value="/users/update")
   public String update() {
      return "/users/update";
   }

}