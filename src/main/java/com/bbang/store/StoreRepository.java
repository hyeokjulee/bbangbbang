package com.bbang.store;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;



public interface StoreRepository {

	void setNewStore(Store store) ;

	Store getStoreById(String sid);

	List<Store> getAllStoreList();
	
	//경외
	List<Store> getAreaList(Map<String, Object> map);
	List<Store> getStoreListForMap();
	

}
