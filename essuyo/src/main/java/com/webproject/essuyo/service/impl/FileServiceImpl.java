package com.webproject.essuyo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.service.FileService;
import com.webproject.essuyo.service.ImageAdminService;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private ImageAdminService imageAdminService;
	
	 private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);

	    // 업로드하실 경우 각자의 컴퓨터에 경로수정하셔서 사용하세요!!!
	    private String UPLOAD_PATH = "C:\\Users\\Administrator\\git\\essuyo\\essuyo\\src\\main\\webapp\\resources\\images\\upload";

	    
	    public int uplodaFile(MultipartFile file) {
	        // 파일의 원본이름 저장
	 
	    	
	    	logger.info("파일이름 :"+file.getOriginalFilename());
	        logger.info("파일크기 : "+file.getSize());
	        logger.info("컨텐트 타입 : "+file.getContentType());

	        // 랜덤생성+파일이름 저장
	        // 파일명 랜덤생성 메서드호출
	       	String extendName = file.getContentType().split("/")[1];
	        UUID uuid = UUID.randomUUID();
	        String savePath = uuid.toString() + "." + extendName;
	     
	        File targetFile = new File(UPLOAD_PATH, savePath);
	        
	        try {
				FileCopyUtils.copy(file.getBytes(), targetFile);
				
				  ImageInfoVO imageInfo = new ImageInfoVO();
			        imageInfo.setSavePath(savePath);
			        imageInfo.setName(uuid.toString());
			        imageInfo.setType(file.getContentType());
			        
			       return  imageAdminService.addImageInfo(imageInfo);
			        
			} catch (IOException e) {
				logger.error("이미지 업로드 에러..", e.toString());
				 return 0;
			}
	        
	      
	     }

	    private String savePath(String contentTypeName) {
	    	// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
	    	 UUID uuid = UUID.randomUUID();
		        // 랜덤생성+파일이름 저장
		     return  uuid.toString() + "." + contentTypeName;
	    }
	 
}
