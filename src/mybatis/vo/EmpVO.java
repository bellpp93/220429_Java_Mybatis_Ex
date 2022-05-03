package mybatis.vo;

public class EmpVO {  // 클래스명 줄 때, EmpDO라고 해도 된다. VO(Value Object)의 약자
	// 멤버변수(테이블의 컬럼이 4개)
	private int empno;			// 사원번호
	private String ename;		// 사원명
	private String dept;		// 근무부서
	private String position;	// 직책
	
	// 멤버변수 하나당 getter, setter 메소드
	public int getEmpno() { return empno; }
	public void setEmpno(int empno) { this.empno = empno; }

	public String getEname() { return ename; }
	public void setEname(String ename) { this.ename = ename; }
	
	public String getDept() { return dept; }
	public void setDept(String dept) { this.dept = dept; }
	
	public String getPosition() { return position; }
	public void setPosition(String position) { this.position = position; }
}
