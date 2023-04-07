package com.bbang.store;

import java.util.List;



public interface StoreRepository {

	void setNewStore(Store store) ;

	Store getStoreById(String sid);

	List<Store> getAllStoreList();

}
