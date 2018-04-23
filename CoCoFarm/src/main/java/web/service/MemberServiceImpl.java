package web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.MemberDao;
import web.dto.Member;

//Annotation driven으로 처리해주고 있음
//servlet-context에 패키지 선언부에 등록해주어야함
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDao memberDao;
	
	@Override
	public List getMembers() {
		// DAO를 통해 조회된 DB정보 반환
		return memberDao.selectAll();
	}

	@Override
	public void insert(Member member) {
		memberDao.insert(member);
		
	}

	@Override
	public void delete(Member member) {
		memberDao.delete(member);
	}

	@Override
	public void update(Member member) {
		memberDao.update(member);
		
	}

	@Override
	public Member getOneMember(Member member) {
		return memberDao.getOneMember(member);
	}

}
