package controller.member;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Address;
import bean.Member;
import dao.SuperDao;

@Component("adao")
public class AddressDao extends SuperDao{
	
	private final String namespace = "MapAddress" ; 
	
	@Autowired
	SqlSessionTemplate abcd ; 
	
	public AddressDao() {	}
	

	public Member SelectDataList(Member member) {
		return this.abcd.selectOne(namespace + ".SelectDataList" , member);
	}


	public Member SelectDataByPk(String mid) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk" , mid);
	}

	public int ShippingUpdataData(Member bean) {
		return this.abcd.update(namespace + ".ShippingUpdataData" , bean);
	}


	// 경희 수정 부분 
	public Address SelectDataByPk2(String id) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk2" , id);
	}


	public Object SelectAllAddress(String id) {
		return this.abcd.selectList(namespace + ".SelectAllAddress", id);
	}



	//경희 수정 
	public int InsertData(Address address) {
		// TODO Auto-generated method stub
		System.out.println(this.getClass() + "주소를 등록합니다.");
		System.out.println(address.toString());
		return this.abcd.insert(namespace + "InsertData" , address);
	}
	public int updateAddr(HashMap<String, Object> paramMap) {
		return this.abcd.update(namespace+ ".updateAddr",paramMap);

	}


	/*
	 * public List<Address> SelectAllAddress(String mid) { return
	 * this.abcd.selectOne(namespace, ".SelectAllAddress"); }
	 * 
	 * 
	 * public Address SelectDataByPk(String id) { return
	 * this.abcd.selectOne(namespace + ".SelectDataByPk",id); }
	 */

	
}
