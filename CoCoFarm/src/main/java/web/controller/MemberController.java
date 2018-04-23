package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import web.dto.Member;
import web.service.MemberService;

@Controller
public class MemberController {
	// import org.slf4j.*
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/member/main.do")
	public String main(Model model) {
		logger.info("/member/main.do -- STARTED");
		
		// member 테이블 정보를 service 요청
		List list = memberService.getMembers();
//		System.out.println(list);

		// 받은 정보를 model 담기
		model.addAttribute("list",list);
		
		// view 전달
		return "member/main";
	}
	
	@RequestMapping(value="/member/insert.do", method=RequestMethod.POST)
	public String insert(Member member) {
		
		logger.info(member.toString());
		
		memberService.insert(member);
		
		return "redirect:/member/main.do";
	}
	
	@RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
	public String delete(Member member) {
		
		logger.info(member.toString());
		memberService.delete(member);
		
		return "redirect:/member/main.do";
	}
	
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	//방법 1
//	public void update(Member member, Writer writer) {
//		
//		logger.info(member.toString());
//		
//		
//		//업데이트 수행
//		memberService.update(member);
//		
//		
//		
//		//AJAX 응답
//		//반환값 String 타입으로 return해주는것은
//		//view네임을 return해주는거라 ajax통신을 하는것이 아니다
//		//ajax로 응답해주려면 void형태 반환타입에 writer를 이용해서 넘겨줘야하고
//		//writer의 경우 utf-8인코딩이 안되어있어서 HttpServletResponse를 이용해서 인코딩 시켜줘야 한글이 적용된다
//		
//		try {
//			writer.write("\"complete\"");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	//방법 2
//	public void update(Member member, HttpServletResponse resp) {
//		logger.info(member.toString());
//
//
//		//업데이트 수행
//		memberService.update(member);
//
//		// Member 한명 정보 가져오기
//		// UPDATE의 결과를 확인하기 위해
//		// idx, name, email, phone 전부 조회조건으로 사용중
//		Member res = memberService.getOneMember(member);
//
//		//AJAX 응답
//		//반환값 String 타입으로 return해주는것은
//		//view네임을 return해주는거라 ajax통신을 하는것이 아니다
//		//ajax로 응답해주려면 void형태 반환타입에 writer를 이용해서 넘겨줘야하고
//		//writer의 경우 utf-8인코딩이 안되어있어서 HttpServletResponse를 이용해서 인코딩 시켜줘야 한글이 적용된다
//		Gson gson = new Gson();
//		//		System.out.println(gson.toJson(res));
//		resp.setCharacterEncoding("utf-8");
//		Writer writer = null;
//
//		try {
//			writer = resp.getWriter();
//			//			writer.write("\"complete\"");
//			writer.write(gson.toJson(res));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
	
	//방법3
	public String update(Member member
			, Model model) {
		logger.info(member.toString());
		
		//업데이트 수행
		memberService.update(member);
		
		//업데이트 결과 확인
		Member res = memberService.getOneMember(member);


		
		model.addAttribute("data", res);
		return "member/result";
	}
	
}
