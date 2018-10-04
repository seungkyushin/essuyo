package com.webproject.essuyo.service;

import org.springframework.web.multipart.MultipartFile;


public interface FileService {

	public int uplodaFile(MultipartFile file);
	public boolean delectFile(String filePath, int imageInfoId) throws Exception;
	
}
