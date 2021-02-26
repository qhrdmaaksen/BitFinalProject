package controller.member;

import java.util.List;

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

<<<<<<< HEAD
	public Member SelectDataByPk(String mid) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk" , mid);
	}

	public int ShippingUpdataData(Member bean) {
		return this.abcd.update(namespace + ".ShippingUpdataData" , bean);
	}
=======

	/*
	 * public List<Address> SelectAllAddress(String mid) { return
	 * this.abcd.selectOne(namespace, ".SelectAllAddress"); }
	 * 
	 * 
	 * public Address SelectDataByPk(String id) { return
	 * this.abcd.selectOne(namespace + ".SelectDataByPk",id); }
	 */
>>>>>>> f2958e877a79d4bc4b513960096b5e5ed82b6e27
	
}
