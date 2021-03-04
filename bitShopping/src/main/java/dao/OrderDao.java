package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Member;
import bean.Order;
import bean.OrderDetail;

@Component("odao")
public class OrderDao extends SuperDao{
	
	private final String namespace = "MapOrder";
	
	@Autowired
	SqlSessionTemplate abcd ; 
	
	public OrderDao () {}
	
	public List<Order> OrderList(String mid) {
		// TODO Auto-generated method stub
		return this.abcd.selectList(namespace + ".OrderList", mid);
	}

	public Map<Integer, Integer> GetAllOrderLists() {
		// TODO Auto-generated method stub
		return null;
	}

	public void Calculate(Member mem, Map<Integer, Integer> maplists) {
		int maxnum = -100 ; 
		maxnum = this.abcd.selectOne(namespace + "GetMaxNum");		
		System.out.println("신규 송장 번호 : " + maxnum); 		
		
		Set<Integer> keylist = maplists.keySet() ;
		System.out.println("상품 개수 : " + keylist.size());
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		// 반복문을 사용하여 
			for(Integer pnum : keylist){
				// 3. 주문 상세(orderdetails) 테이블에 추가합니다.
				
				OrderDetail od = new OrderDetail() ;
				
				// orders의 oid와 orderdetails의 oid는 동일한 값입니다.
				// 송장 번호가 참조 무결성 제약 조건에 의하여 연결이 되어 있습니다.
				od.setOid(maxnum); // 신규로 생성된 송장 번호
				int qty = maplists.get(pnum) ;
				od.setQty(qty); // 구매한 수량
				od.setRemark(" ");
				this.abcd.insert(namespace +  ".InsertOrderDetail" , od);
				
				// 4. 해당 상품 번호(pnum)를 이용하여 재고 수량(stock)을 감소시킵니다.
				map.put("stock", qty) ;
				map.put("num", pnum) ;
				this.abcd.update(namespace + "UpdateStock", map);
			}
		
	}

}
