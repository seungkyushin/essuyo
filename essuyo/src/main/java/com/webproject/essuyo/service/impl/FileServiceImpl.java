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
	    private String UPLOAD_PATH = "C:\\Users\\kyu\\git\\essuyo\\essuyo\\src\\main\\webapp\\resources\\images\\upload";

	    
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
			        imageInfo.setSavePath("/resources/images/upload/" + savePath);
			        imageInfo.setName(savePath);
			        imageInfo.setType(file.getContentType());
			        
			       return  imageAdminService.addImageInfo(imageInfo);
			        
			} catch (IOException e) {
				logger.error("이미지 업로드 에러..", e.toString());
				 return 0;
			}
	        
	      
	     }

	    @Override
	    public boolean delectFile(String filePath, int imageInfoId)  throws Exception{
			
	    	
			 File file = new File(UPLOAD_PATH+"//"+filePath);
	         
		        if( file.exists() ){ //파일존재여부확인
		           if(file.delete()){
		        	   logger.info("파일 삭제 성공 | {} ",  filePath);
		        	   if( imageAdminService.deleteImageInfo(imageInfoId) > 0) {
		        		   logger.info("ImageInfo DB 삭제 성공 | {} ",  filePath);
		        	     	return true;
		        	   }
		        	   else {
		        		   logger.info("ImageInfo DB 삭제 실패 | {} ",  filePath);
		        		   return false;
		        	   }
		        	     		   
	                }else{
	                   logger.info("파일 삭제 실패 | {} ",  filePath);
	                   return false;
	                }
		             
		        }else{
		        	logger.info("파일이 존재하지 않습니다. | {} ", filePath);
		        	return false;
		        }
		             
			
		}
	    
	    private String savePath(String contentTypeName) {
	    	// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
	    	 UUID uuid = UUID.randomUUID();
		        // 랜덤생성+파일이름 저장
		     return  uuid.toString() + "." + contentTypeName;
	    }
	 
}
