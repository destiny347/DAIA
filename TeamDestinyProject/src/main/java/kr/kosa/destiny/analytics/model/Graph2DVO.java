package kr.kosa.destiny.analytics.model;

public class Graph2DVO {
	private String type;
	private String name;
	private double[] data;
	private int y;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double[] getData() {
		return data;
	}
	public void setData(double[] data) {
		this.data = data;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}

}

