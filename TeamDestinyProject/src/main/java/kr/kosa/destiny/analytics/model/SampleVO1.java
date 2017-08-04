package kr.kosa.destiny.analytics.model;

import java.util.Arrays;

public class SampleVO1 {

	private String[] name;
	private double[] y;
	private Marker marker;
	public String[] getName() {
		return name;
	}
	public void setName(String[] name) {
		this.name = name;
	}
	public double[] getY() {
		return y;
	}
	public void setY(double[] y) {
		this.y = y;
	}
	public Marker getMarker() {
		return marker;
	}
	public void setMarker(Marker marker) {
		this.marker = marker;
	}
}
