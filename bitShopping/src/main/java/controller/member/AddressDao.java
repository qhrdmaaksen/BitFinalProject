package controller.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

<<<<<<< .merge_file_a06060

=======
>>>>>>> .merge_file_a02248
	public Member SelectDataByPk(String mid) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk" , mid);
	}

	public int ShippingUpdataData(Member bean) {
		return this.abcd.update(namespace + ".ShippingUpdataData" , bean);
	}
<<<<<<< .merge_file_a06060


	// 경희 수정 부분 
	public Address SelectDataByPk2(String id) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk2" , id);
	}


	public Object SelectAllAddress(String id) {
		return this.abcd.selectList(namespace + ".SelectAllAddress", id);
	}

=======
>>>>>>> .merge_file_a02248

	/*
	 * public List<Address> SelectAllAddress(String mid) { return
	 * this.abcd.selectOne(namespace, ".SelectAllAddress"); }
	 * 
	 * 
	 * public Address SelectDataByPk(String id) { return
	 * this.abcd.selectOne(namespace + ".SelectDataByPk",id); }
	 */
<<<<<<< .merge_file_a06060

=======
>>>>>>> .merge_file_a02248
	
}
