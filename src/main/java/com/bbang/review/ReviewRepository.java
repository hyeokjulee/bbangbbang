package com.bbang.review;

import java.util.List;
import java.util.Map;

public interface ReviewRepository {

	public List<Review> getReviewById(String sid) ;
	public void updateReview (Map<String, Object> map) ;
	public void deleteReview (String rid) ;
	public void insertReview (Map<String, Object> map) ;
}
