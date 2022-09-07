package kr.spring.used.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.used.service.UsedService;
import kr.spring.used.vo.UsedVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class UsedController {
	private static final Logger logger = LoggerFactory.getLogger(UsedController.class);
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private UsedService usedService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public UsedVO initCommand() {
		return new UsedVO();
	}
	
	//========중고거래 글 등록=========//
	//등록 폼
	@GetMapping("/used/write.do")
	public String form() {
		return "usedWrite";
	}
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/used/write.do")
	public String submit(@Valid UsedVO usedVO, BindingResult result, 
						HttpServletRequest request, HttpSession session, Model model) {
		
		logger.debug("<<중고거래 글 저장>> : " + usedVO);
		
		//유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		//회원번호 셋팅
		usedVO.setMem_num(user.getMem_num());
		
		//글쓰기
		usedService.insertUsed(usedVO);
		
		//View에 표시할 메시지
		model.addAttribute("message","글 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/used/list.do");
		
		return "common/resultView";
	}
	
	//========중고거래 글 목록=========//
	@RequestMapping("/used/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue = "1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue = "")
			String keyfield,
			@RequestParam(value="keyword",defaultValue = "")
			String keyword) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		//글의 총 개수(검색된 글의 개수)
		int count = usedService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount,pageCount,"list.do");
		
		List<UsedVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = usedService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usedList");
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	
	//========중고거래 글 상세=========//
	@RequestMapping("/used/detail.do")
	public ModelAndView detail(@RequestParam int used_num) {
		
		logger.debug("<<board_num>> : " + used_num);
		
		//해당 글의 조회수 증가
		usedService.updateHit(used_num);
		
		UsedVO used = usedService.selectUsed(used_num);
		
		//제목에 태그를 허용하지 않음
		used.setTitle(StringUtil.useNoHtml(used.getTitle()));
		
								//뷰 이름		속성명   속성값
		return new ModelAndView("usedView","used",used);
	}
}
