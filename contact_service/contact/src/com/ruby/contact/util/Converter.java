package com.ruby.contact.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;

import com.google.gson.Gson;

public class Converter {
	private static Gson gson;
	static {
		gson = new Gson();
	}
	
	public static String convertToJson(Object obj) {
		return gson.toJson(obj);
	}
	
	public static <T> T convertFromJson(String json, Class<T> type) {
		return gson.fromJson(json, type);
	}
	
	public static <T> T convertFromJSONStream(InputStream is, Class<T> type) {
		try {
			Reader reader = new BufferedReader(
					new InputStreamReader(is, "UTF-8"));
			return gson.fromJson(reader, type);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
