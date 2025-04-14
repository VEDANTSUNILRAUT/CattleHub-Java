package com.cattlehub.helper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class Helper {

	public static boolean deleteFile(String path) {
		boolean f =false;
		
		try {
			
			File file=new File(path);
			f=file.delete();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
//	public static boolean saveFile(InputStream is,String path) {
//		boolean f=false;
//		
//		try {
//			
//			byte b[]=new byte[is.available()];
//			is.read(b);
//			FileOutputStream fos=new FileOutputStream(path);
//			
//			fos.write(b);
//			
//			fos.flush();
//			fos.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return f;
//	}
	
	public static boolean saveFile(InputStream is, String path) {
	    boolean success = false;
	    try {
	        Files.copy(is, Paths.get(path), StandardCopyOption.REPLACE_EXISTING);
	        success = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (is != null) is.close(); // Ensure it's closed
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return success;
	}

	
}
