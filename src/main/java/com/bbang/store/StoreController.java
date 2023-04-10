package com.bbang.store;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bbang.review.Review;
import com.bbang.review.ReviewService;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired // DI
	private StoreService storeService;
	
	@Autowired
	ReviewService reviewService;

	@Autowired // DI
	SqlSessionTemplate sqlsessionTemplate;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String storeList(Model model) {

		List<Store> list = storeService.getAllStoreList();
		model.addAttribute("storeList", list);
		return "store/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String storeListReload(String sid, Model model) {

		// List<Store> list = storeService.getAllStoreList();

		List<Store> list = sqlsessionTemplate.selectList("store.select_add_list", sid);

		model.addAttribute("storeList", list);
		System.out.println(sid);

		return "store/list";
	}

	@GetMapping("/detail")
	public String storeDetail(@RequestParam("sid") String sid, Model model) {

		System.out.println(sid);
		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);
		
	//	List<Review> reviewById = ReviewService.getReviewById(sid);
		List<Review> reviewById = sqlsessionTemplate.selectList("review.review_list_by_sid", sid);
		model.addAttribute("reviewList", reviewById);
		

		return "store/detail";

	}
	
	@GetMapping("/info")
	public String storeInfo(@RequestParam("sid") String sid, Model model) {

		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);
		
		List<Review> reviewById = sqlsessionTemplate.selectList("review.review_list_by_sid", sid);
		model.addAttribute("reviewList", reviewById);
	
		return "/store/storeInfo" ;
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String storeAddForm(@ModelAttribute("NewStore") Store store) {

		return "store/add";
	}
	

	// 파일 업로드 처리를 위한 변수 선언
	// servlet-context.xml 파일에 설정한 bean의 id 속성값과 동일한 이름으로 변수를 선언
	// @Resource 어노테이션을 이용해서 변수에 bean 객체를 주입
	@Resource(name = "uploadPath")
	private String uploadPath;

	@PostMapping("/add")
	public String storeAddProc(@ModelAttribute("NewStore") Store store) {

		MultipartFile storeImg = store.getSphotoFile();

		
		String saveName = storeImg.getOriginalFilename();
		System.out.println(saveName);
		store.setSphoto(saveName);

		File saveFile = new File(uploadPath + "\\save_images", saveName);

		if (storeImg != null && !storeImg.isEmpty()) {
			try {
				storeImg.transferTo(saveFile);
				store.setSphoto2(saveName);
			} catch (Exception e) {
				throw new RuntimeException(" 이미지 업로드가 실패했습니다.");
			}
		}
		
		storeService.setNewStore(store);

		return "redirect:/store/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String storeUpdateForm(@RequestParam("sid") String sid, Model model) {

		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);

		return "/store/update";
	}

	@PostMapping("/update")
	public String storeUpdateProc(@RequestParam Map<String, Object> map) {

		System.out.println(map.get("sid"));
		storeService.updateStore(map);

		return "redirect:/store/list" ;
	}

	@PostMapping("/delete")
	public String storeDeleteProc(@RequestParam("sid") String sid) {

		System.out.println(sid);
		storeService.deleteStoreById(sid);
		
		return "redirect:/store/list" ;

	}

}
