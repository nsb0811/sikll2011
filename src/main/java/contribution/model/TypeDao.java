package contribution.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TypeDao extends SqlSessionDaoSupport{

	public List<Type> selectTypes(){
		return getSqlSession().selectList("program.selectAllType");
	}
	
	public String selectTypeValue(int type_id) {
		return getSqlSession().selectOne("program.selectType", type_id);
	}
}
