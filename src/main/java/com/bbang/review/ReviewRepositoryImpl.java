package com.bbang.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Review> getReviewById(String sid) {
		return sqlSessionTemplate.selectList("review.review_list_by_sid", sid );
	}

}
