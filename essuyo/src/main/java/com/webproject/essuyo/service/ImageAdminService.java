package com.webproject.essuyo.service;

import java.util.List;

import com.webproject.essuyo.domain.ImageInfoVO;

public interface ImageAdminService {

	public List<String> getImagePathList(String findType, int id);
	public String getImagePath(int imageInfoid);
	
	public List<ImageInfoVO> getImageInfoList(String findType, int id);
	public ImageInfoVO getImageInfo(int imageInfoid);
	
	
	public int addImageInfo(ImageInfoVO imageInfo);
	public int deleteImageInfo(int id);

}
