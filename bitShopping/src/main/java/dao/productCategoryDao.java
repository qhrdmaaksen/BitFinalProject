package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Product;

@Component("categoryDao")
public class productCategoryDao extends SuperDao{

	private final String namespace = "MapperCategory" ;
	
	@Autowired
	SqlSessionTemplate abc ; 
	
	public List<Product> SelectDataListFV(String modeFruit, String modeVegetable) {
		// 과일 , 채소 리스트 가져올 다리 
		Map<String, String> FVmap = new HashMap<String, String>();
		FVmap.put("modeFruit", modeFruit);
		FVmap.put("modeVegetable", modeVegetable);
		System.out.println(modeFruit+modeVegetable);
		return this.abc.selectList(namespace + ".SelectDataListFV", FVmap);
	}

	public List<Product> SelectDataListR(String modeRice) {
		// 쌀 리스트 가져올 다리
		Map<String, String> Rmap = new HashMap<String, String>();
		Rmap.put("modeRice", modeRice);
		return this.abc.selectList(namespace + ".SelectDataListR", Rmap);
	}

	public List<Product> SelectDataListSM(String modeSeafood, String modeMeat) {
		// 해산 , 고기 가져올 다리
		Map<String, String> SMmap = new HashMap<String, String>();
		SMmap.put("modeSeafood", modeSeafood);
		SMmap.put("modeMeat", modeMeat);
		return this.abc.selectList(namespace + ".SelectDataListSM", SMmap);
	}

	public List<Product> SelectDataListBS(String modeBakery, String modeSnack) {
		// 베이커리 , 제과 가져올 다리
		Map<String, String> BSmap = new HashMap<String, String>();
		BSmap.put("modeBakery", modeBakery);
		BSmap.put("modeSnack", modeSnack);
		return this.abc.selectList(namespace + ".SelectDataListBS", BSmap);
	}

	public List<Product> SelectDataListEC(String modeEgg, String modeCheese) {
		// 계란 , 치즈 가져올 다리
		Map<String, String> ECmap = new HashMap<String, String>();
		ECmap.put("modeEgg", modeEgg);
		ECmap.put("modeCheese", modeCheese);
		return this.abc.selectList(namespace + ".SelectDataListEC", ECmap);
	}

	public List<Product> SelectDataListSS(String modeSalad, String modeSimplefood) {
		// 샐러드 , 간식 가져올 다리
		Map<String, String> SSmap = new HashMap<String, String>();
		SSmap.put("modeSalad", modeSalad) ; 
		SSmap.put("modeSimplefood", modeSimplefood) ; 
		return this.abc.selectList(namespace + ".SelectDataListSS", SSmap);
	}

}
