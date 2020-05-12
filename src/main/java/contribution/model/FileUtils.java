package contribution.model;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtils {

	
	private static Random random = new Random();
	
	
	
	public ProgramImage imageUpload(MultipartFile file, String organization_id, int program_id, String root) {
		//원본파일명
		String original_name = file.getOriginalFilename();
		//DB에 저장될 새로운 이름-중복을 피하기 위해서
		int randomNum = random.nextInt(50);
		String randomValue = System.currentTimeMillis()+"_"+randomNum;
		String stored_file_name = randomValue + "_" + original_name;
		File storeFile = new File(root, stored_file_name);
		try {
			file.transferTo(storeFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ProgramImage imageInfo = new ProgramImage();
		//url은 http://localhost:8080/프로젝트명 -손으로 박기->디비에서 url은 무의미하니까 지워버릴것.->연결해서 파일명만 받아서 이미지 호출.
		//storeFile을 스트림연결 or transfer해서 서버에 실제저장할것.
		imageInfo.setOriginal_file_name(original_name);
		imageInfo.setStored_file_name(stored_file_name);
		return imageInfo;
	}
	
	/*
	 * //프로그램배너이미지 파일출력용 -> 테이블에 필요한 stored_file_name만 리턴. public String
	 * bannerImageUpload(MultipartFile file, String organization_id, int program_id,
	 * String root) { //원본파일명 String original_name = file.getOriginalFilename();
	 * //DB에 저장될 새로운 이름-중복을 피하기 위해서 int randomNum = random.nextInt(50); String
	 * randomValue = System.currentTimeMillis()+"_"+randomNum; String
	 * stored_file_name = randomValue + "_" + original_name; File storeFile = new
	 * File(root, stored_file_name); try { file.transferTo(storeFile); } catch
	 * (IllegalStateException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); }
	 * 
	 * return stored_file_name; }
	 */
	
	
	//프로그램배너이미지 파일출력용 -> 테이블에 필요한 stored_file_name만 리턴.
	public Map<String, String> bannerImageUpload(MultipartFile file, String organization_id, int program_id, String root) {
		//원본파일명
		String original_name = file.getOriginalFilename();
		//DB에 저장될 새로운 이름-중복을 피하기 위해서
		int randomNum = random.nextInt(50);
		String randomValue = System.currentTimeMillis()+"_"+randomNum;
		String stored_file_name = randomValue + "_" + original_name;
		File storeFile = new File(root, stored_file_name);
		try {
			file.transferTo(storeFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Map<String, String> fileInfo = new HashMap<String, String>();
		fileInfo.put("original_name", original_name);
		fileInfo.put("stored_file_name", stored_file_name);
		return fileInfo;
	}
	
}
