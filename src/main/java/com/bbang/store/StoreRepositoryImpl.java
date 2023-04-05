package com.bbang.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreRepositoryImpl implements StoreRepository {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate ;
	
	@Override
	public List<Store> getAllStoreList() {
		// TODO Auto-generated method stub
		return this.sqlsessionTemplate.selectList("store.select_list") ;
	}

}
