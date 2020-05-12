package contribution.model;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadOrganization {

	private static Random random = new Random();
	
	
	//프로그램배너이미지 파일출력용 -> 테이블에 필요한 stored_file_name만 리턴.
	public Map<String, String> bannerImageUpload(MultipartFile file, String organization_id,  String root) {
		//원본파일명
		String original_name = file.getOriginalFilename();
		System.out.println(original_name);
		//DB에 저장될 새로운 이름-중복을 피하기 위해서
		int randomNum = random.nextInt(50);
		String randomValue = System.currentTimeMillis()+"_"+randomNum;
		String stored_file_name = randomValue + "_" + original_name;
		System.out.println(stored_file_name);
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
