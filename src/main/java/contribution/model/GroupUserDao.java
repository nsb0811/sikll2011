package contribution.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class GroupUserDao extends SqlSessionDaoSupport {

	 
	
	
 public int selectGroupUserCount(String organization_id) {
	 
	 
	 return getSqlSession().selectOne("Kim.select-organizations_count",organization_id);
 }	
 
 public int insertOrganizations(GroupUserCommand guc) {
	 
	 return getSqlSession().insert("Kim.insert-organizations",guc); 
 }
 public int insertGroupUser(GroupUserCommand guc) {
	 String user_id=guc.getUser_id();
	 String password=guc.getPassword(); 
	 String nickname=guc.getNickname();
	 Date register_date=guc.getRegister_date();
	 String organization_id=guc.getOrganization_id();
	 String nanmmByNm =guc.getNanmmByNm();
	 Map<String,Object> map =new HashMap<String, Object>();
	 
	 map.put("user_id", user_id);
	 map.put("password",password);
	 map.put("nickname", nickname);
	 map.put("register_date", register_date);
	 map.put("organization_id",organization_id);
	 map.put("name", nanmmByNm); 
	  return getSqlSession().insert("Kim.insert-group_user",map);
	 
 } 
 //이미지테이블에 해당 등록번호와 일치하는 레코드 카운트 뽑아내기
 public int SelectOrganization_logoCount(String organization_id) {
	 
	return getSqlSession().selectOne("Kim.selectCount-organizationsLogo",organization_id);
		 
		 
		 
	 }
 
 //이미지테이블에인서트 추가시키기
 public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
	 
	 Map<String,Object> map = new HashMap<String,Object>();
	 map.put("original_file_name", original_file_name);
	 map.put("organization_id", organization_id);
	 map.put("stored_file_name", stored_file_name);
	 map.put("url", url);
	 return getSqlSession().insert("Kim.insert-organizationsLogo",map);
	 
 }
 public String selectStored_file_name(String organization_id) {
	 
	 return getSqlSession().selectOne("Kim.select-organizationsLogoFilename",organization_id);
	 
 }
 public String selectStored_file_nameList(String organization_id){
	 
	 return getSqlSession().selectOne("Kim.select-organizationsLogoFilenameList",organization_id);
	 
 }
 //단체회원 유저테이블에 데이터 수정
 public int updatelogo(int user_idx,String password,String nickname,String user_id) {
	 
	 Map<String,Object> map = new HashMap<String,Object>();
	 map.put("user_idx", user_idx);
	 map.put("password", password);
	 map.put("nickname", nickname);
	 map.put("user_id", user_id);
	 
	 return getSqlSession().update("Kim.update-User",map);
	 
 }
 //해당 단체유저가 가지고있는 이미지파일 불러오기
 public OrganizationLogosDto selectLogo(String organization_id) {
	 
	 return getSqlSession().selectOne("Kim.select-organizationsLogoAll",organization_id);
	 
 }
 //단체유저가 가지고있는 이미지레코드 딜리트
public int DeleteLogo(String organization_id) {

	return getSqlSession().delete("Kim.delete-logo",organization_id);
}

public int deleteOrganization(String organization_id) {

	return getSqlSession().delete("Kim.delete-organizations",organization_id);
}


//해당단체가 가지고있는 유저데이터뿌려주기
public GroupUserCommand selectUserAll(int user_idx) {
	
	return getSqlSession().selectOne("Kim.select-userAll",user_idx); 
}



 }
	

