package mybatis.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	public static List<EmpVO> getTotal() {
		/*
		 * 이미 생성되어 있는 factory 객체를 이용하여 SqlSession을 얻어낸다.
		 * select 작업은 auto commit을 하지 않아도 되기 때문에
		 * openSession() 메소드 호출 시 true를 인자값으로 주지 않아도 된다.
		 */
		SqlSession ss = FactoryService.getFactory().openSession();
		List<EmpVO> list = ss.selectList("emp.total");
		ss.close();
		
		return list;
	}  // End getTotal() 메소드 =============================================================
	
	public static int add(String empno, String ename, String dept, String position) {
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("empno", empno);
		map.put("ename", ename);
		map.put("dept", dept);
		map.put("position", position);
		
		SqlSession ss = FactoryService.getFactory().openSession(true);  // true는 commit과 같은 역할(table에 변화를 주는 DML 작업에만 적용)
		int cnt = ss.insert("emp.add", map);
		ss.close();
		return cnt;
	}  // End add() 메소드 ==================================================================
	
	public static int update(String empno, String ename, String dept, String position) {
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("empno", empno);
		map.put("ename", ename);
		map.put("dept", dept);
		map.put("position", position);
		
		SqlSession ss = FactoryService.getFactory().openSession(true);  // true는 commit과 같은 역할(table에 변화를 주는 DML 작업에만 적용)
		int cnt = ss.update("emp.update", map);
		ss.close();
		return cnt;
	}  // End update() 메소드 ===============================================================
	
	public static int delete(String empno) {
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("empno", empno);
		
		SqlSession ss = FactoryService.getFactory().openSession(true);  // true는 commit과 같은 역할(table에 변화를 주는 DML 작업에만 적용)
		int cnt = ss.delete("emp.delete", map);
		ss.close();
		return cnt;
	}  // End delete() 메소드 ===============================================================
}
