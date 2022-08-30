package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO member);//회원가입
	public MemberVO selectCheckMember(String id);//아이디 중복 체크
	public MemberVO selectMember(Integer mem_num);//하나의 회원 조회
	public void updateMember(MemberVO member);//회원정보 수정
	//public void updateMember_detail(MemberVO member);//회원정보 수정
	public void updatePassword(MemberVO member);//비밀번호 수정
	public void deleteMember(Integer mem_num);//회원 삭제
	public void deleteMember_detail(Integer mem_num);//회원 삭제
}
