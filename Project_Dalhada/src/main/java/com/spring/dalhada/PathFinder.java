package com.spring.dalhada;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class PathFinder {
	private static PathFinder pathFinder = new PathFinder();
	
	private PathFinder() {}
	public static PathFinder getInstance() {
		return pathFinder;
	}
	
	protected static String findImagePath(String what) {
		String imageurl = null;
		Properties properties = new Properties(); 
		try {
			Reader reader = Resources.getResourceAsReader("config/path.properties");
			properties.load(reader);
			imageurl = properties.getProperty("imageurl")+what;
		}catch(IOException e) {
			e.printStackTrace();
		}
		return imageurl;
	}
}
