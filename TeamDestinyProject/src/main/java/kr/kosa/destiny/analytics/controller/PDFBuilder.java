package kr.kosa.destiny.analytics.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import kr.kosa.destiny.analytics.model.Book;

/**
 * 이 클래스는 최종 데이터를 PDF파일로 저장하기 위한 컨트롤러입니다.
 */
public class PDFBuilder extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		// get data model which is passed by the Spring container
		@SuppressWarnings("unchecked")
		List<Book> listBooks = (List<Book>) model.get("listBooks");

		doc.add(new Paragraph("Test Statistic"));
		doc.add(new Paragraph("\n"));
		PdfPTable table = new PdfPTable(2);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] {3.0f, 3.0f});
		table.setSpacingBefore(10);

		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);

		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.BLUE);
		cell.setPadding(2);

		// write table header 
		cell.setPhrase(new Phrase("Algorism", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Value", font));
		table.addCell(cell);


		// write table row data
		for (Book aBook : listBooks) {
			table.addCell(aBook.getTitle());
			table.addCell(aBook.getAuthor());		
		}

		doc.add(table);
		doc.add(new Paragraph("\n\n\n"));
		
		doc.add(new Paragraph("Test Statistic Graph"));
		doc.add(new Paragraph("\n"));
		Image img = Image.getInstance("C:\\Users\\COM\\git\\DAIA\\TeamDestinyProject\\src\\main\\webapp\\WEB-INF\\resources\\img\\chart.png");
		doc.add(img);
	}

}