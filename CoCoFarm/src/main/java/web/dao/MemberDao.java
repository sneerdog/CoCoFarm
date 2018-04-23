package web.dao;

import java.util.List;

import web.dto.Member;

public interface MemberDao {
	// Member Table 전체 조회 쿼리
	public List selectAll();
	// member 삽입
	public void insert(Member member);
	//member 삭제
	public void delete(Member member);
	
	// member 수정
	public void update(Member member);
	
	// member 조회
	public Member getOneMember(Member member);
}
