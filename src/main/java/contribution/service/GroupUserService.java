package contribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.GroupUserCommand;
import contribution.model.GroupUserDao;
import contribution.model.OrganizationLogosDto;

@Service
public class GroupUserService {

	GroupUserDao dao;
	
	@Autowired
	public void setDao(GroupUserDao dao) {
		this.dao = dao;
		
	}
	
	public int insertOrganizations(GroupUserCommand guc) {
		int i;
		
		String organization_id=guc.getOrganization_id();
		if(dao.selectGroupUserCount(organization_id)==0) {
			dao.insertOrganizations(guc);
			dao.insertGroupUser(guc);
		return	i=1;
			
		}else {
		return	i=0;
		
		} 

	}
	//�빐�떦�떒泥닿� 媛�吏�怨좎엳�뒗 �쑀���뜲�씠�꽣肉뚮젮二쇨린
	public  GroupUserCommand selectUserAll(int user_idx) {
		
		return dao.selectUserAll(user_idx);
	} 
	
	
public int deleteOrganization(String organization_id)	{
	
	return dao.deleteOrganization(organization_id);
}
	
	
	//�씠誘몄��뙆�씪 �뵜由ы듃
public int deleteLogo(String organization_id) {
	
	return dao.DeleteLogo(organization_id);
	
}	
	
//�빐�떦 �떒泥댁쑀��媛� �씠誘몄��뙆�씪�씠 �씠誘몄엳�뒗寃쎌슦 �뵜由ы듃�썑 �씤�꽌�듃 �씠誘몄��뙆�씪�씠�뾾�뒗寃쎌슦�뒗 �씤�꽌�듃留� �빐以�
public int InsertorDelete(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		//濡쒓퀬�뀒�씠釉붿뿉  �씠誘몄��젅肄붾뱶媛��뾾�뒗寃쎌슦 諛붾줈 �씤�꽌�듃
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			//濡쒓퀬�뀒�씠釉붿뿉 �씠誘� �씠誘몄��젅肄붾뱶媛� �엳�뒗寃쎌슦 �뵜由ы듃�썑 �씤�꽌�듃
			dao.DeleteLogo(organization_id);
			//�씤�꽌�듃
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			
			return i=1;}
		
		
	}
	
	
	
	
	
	
	//�떒泥댄쉶�썝媛��엯�떆 �씠誘몄��뀒�씠釉붿뿉 �씠誘몄� 異붽��븯湲�
	public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		//泥섏쓬 �쉶�썝媛��엯�떆 �빐�떦 �벑濡앸쾲�샇�뿉 留ㅼ묶�릺�뼱�엳�뒗 �씠誘몄��뀒�씠釉붿뿉 �젅肄붾뱶媛�  �뾾寃좎�留� �샊�떆紐곕씪�꽌 移댁슫�듃 濡쒕퐨�븘�궡�꽌 0�씪寃쎌슦�뿉留� �씤�꽌�듃 �떆�궎湲�
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			
			
			
			
			
			return i=0;}
		
		
	}//怨듦났�뜲�씠�꽣�뿉�꽌諛쏆븘�삩 �벑濡앸쾲�샇�� �슦由촥b�뿉 �씠誘몄��뀒�씠釉붿뿉 �벑濡앸쾲�샇�� �씪移섑븯�뒗 �씠誘몄��뙆�씪�씠由꾨쭔 鍮쇱삤湲�
	public String selectStored_file_name(String organization_id) {
		
		return dao.selectStored_file_name(organization_id);
	}
	//怨듦났�뜲�씠�꽣�뿉�꽌諛쏆븘�삩 �벑濡앸쾲�샇�� �슦由촥b�뿉 �씠誘몄��뀒�씠釉붿뿉 �벑濡앸쾲�샇�� �씪移섑븯�뒗 �씠誘몄��뙆�씪�씠由꾨쭔 鍮쇱삤湲�
	public String selectStored_file_nameList(String organization_id) {
		
		
		return dao.selectStored_file_nameList(organization_id);
		
	}
	//�떒泥댄쉶�썝 �쑀���뀒�씠釉� �닔�젙�븯湲�
	public int updatelogo(int user_idx,String password,String nickname,String user_id) {
		
		return dao.updatelogo(user_idx, password, nickname, user_id);
		
		
	}
	//�빐�떦 �떒泥댁쑀��媛� 媛�吏�怨좎엳�뒗 �씠誘몄��뙆�씪 遺덈윭�삤湲�
	public OrganizationLogosDto selectLogo(String organization_id) {
		
		return dao.selectLogo(organization_id);
	}
	

	
}
