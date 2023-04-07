package com.bbang.store;

import java.util.List;


public interface StoreService {
	
	void setNewStore(Store store) ;

	Store getStoreById(String sid);

	List<Store> getAllStoreList();

}
