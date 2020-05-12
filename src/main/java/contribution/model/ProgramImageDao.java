package contribution.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramImageDao extends SqlSessionDaoSupport{

	public List<ProgramImage> getProgramBanner(Map<String, Object> map) {
		return getSqlSession().selectList("program.selectProgramImages", map);
	}
	//프로그램의 이미지들의 원본파일명만 습득
	public List<String> getProgramOriginalFileName(Map<String, Object> map) {
		return getSqlSession().selectList("program.selectProgramImagesOriginalFileName", map);
	}
	
	/*
	 * //프로그램의 이미지들의 원본파일명, 저장된 파일명을 습득 public List<Map<String, Object>>
	 * getProgramFileName(Map<String, Object> map) { return
	 * getSqlSession().selectList("program.selectProgramImagesFileName", map); }
	 */
	
	//프로그램의 이미지들의 원본파일명, 저장된 파일명을 습득
	public List<ProgramImage> getProgramFileName(Map<String, Object> map) {
		return getSqlSession().selectList("program.selectProgramImagesFileName", map);
	}
	
}
