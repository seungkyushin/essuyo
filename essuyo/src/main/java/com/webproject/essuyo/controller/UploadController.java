package com.webproject.essuyo.controller;


import java.io.File;
import java.util.UUID;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    // 업로드하실 경우 각자의 컴퓨터에 경로수정하셔서 사용하세요!!!
    private String UPLOAD_PATH = "C:\\Users\\Administrator\\git\\essuyo\\essuyo\\src\\main\\webapp\\resources\\images\\upload";

    @RequestMapping(value="uploadForm", method=RequestMethod.GET)
    public void uplodaForm(){

    }

    @RequestMapping(value="uploadForm", method=RequestMethod.POST)
    public ModelAndView uplodaForm(MultipartFile file, ModelAndView mav) throws Exception{
        // 파일의 원본이름 저장
        String savedName = file.getOriginalFilename();

        logger.info("파일이름 :"+file.getOriginalFilename());
        logger.info("파일크기 : "+file.getSize());
        logger.info("컨텐트 타입 : "+file.getContentType());

        // 랜덤생성+파일이름 저장
        // 파일명 랜덤생성 메서드호출
        savedName = uploadFile(savedName, file.getBytes());

        mav.setViewName("uploadResult");
        mav.addObject("savedName", savedName);

        return mav; // uploadResult.jsp(결과화면)로 포워딩
    }

    // 파일명 랜덤생성 메서드
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String savedName = uuid.toString()+"_"+originalName;
        File target = new File(UPLOAD_PATH, savedName);
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(fileData, target);
        return savedName;
    }
}


