package com.bbang.map;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bbang.store.Store;
import com.bbang.store.StoreService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MapController {
	private StoreService storeService;
	@GetMapping("/")
	@ResponseBody
	public String mapPointer(Model model) throws JsonProcessingException {
		List<Store> allList = storeService.getAllStoreList();
		model.addAttribute("list",allList);
		
		ObjectMapper obj = new ObjectMapper();
		String jason = obj.writeValueAsString(model);
		return "main";
	}

}
