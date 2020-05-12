package contribution.yjs.tiles;

import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Component;

//ViewPreparer: definition을 실행할때 모든 jsp에서 쓸수 있는 자바객체를 생성해줌.
//Model(getter, setter)과 같은 기능 생성시점이 다를 뿐 
//Model - 컨트롤러 실행시 | ViewPreparer - definition 실행시
@Component
public class MenuPreparer implements ViewPreparer{

	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) {
		//List<String> menuList = new ArrayList<String>();
		//menuList.add("로그인");
		//menuList.add("회원가입");
		//menuList 이름으로 해당 Attribute에 list를 추가 , true는 여러 컨테츠에서 쓸 수 있도록 허용의 의미
		//attributeContext.putAttribute("menuList", new Attribute(menuList), true);
	}

	
}
