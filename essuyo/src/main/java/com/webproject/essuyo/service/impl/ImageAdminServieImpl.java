package com.webproject.essuyo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.essuyo.dao.ImageAdminDao;
import com.webproject.essuyo.domain.ImageInfoVO;
import com.webproject.essuyo.domain.SQLParamVO;
import com.webproject.essuyo.service.ImageAdminService;


@Service
public class ImageAdminServieImpl implements ImageAdminService{
	
	
	@Autowired
	private ImageAdminDao imageAdminDao;
	
	private Logger logger = LoggerFactory.getLogger(ImageAdminServieImpl.class);
	


	@Override
	public ImageInfoVO getImageInfo(int imageInfoid) {
		if ( imageInfoid == 0) {
			return null;
		}
		
		try {
			return imageAdminDao.selectImageById(imageInfoid);
		} catch (Exception e) {
			logger.error("이미지 조회 실패.. | {} ", e.toString());
			return null;
		}
		
	}
	
	@Override
	public String getImagePath(int imageInfoid) {
		ImageInfoVO image = this.getImageInfo(imageInfoid);
		
		if( image != null ) {
			return image.getSavePath();
		}
		
		return null;
	}


	@Override
	public List<String> getImagePathList(String findType, int id) {
		
		List<String> resultList = new ArrayList<>();
		
		List<ImageInfoVO> imageList = this.getImageInfoList(findType, id);
		
		if( imageList != null ) {
			for( ImageInfoVO image : imageList) {
				resultList.add(image.getSavePath());
			}
			return resultList;
		}
		return null;
	}

	@Override
	public List<ImageInfoVO> getImageInfoList(String findType, int id) {
		
		if (findType == null || findType.equals("") || id == 0) {
			return null;
		}
		
		SQLParamVO params = new  SQLParamVO(findType, id);
		
		try {
					
				return imageAdminDao.selectImageById(params);
			} catch (Exception e) {
				logger.error("이미지 조회 실패.. | {} ", e.toString());
				return null;
			}
	}


	

}
