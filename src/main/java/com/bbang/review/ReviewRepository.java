package com.bbang.review;

import java.util.List;

public interface ReviewRepository {

	public List<Review> getReviewById(String sid) ;

}
