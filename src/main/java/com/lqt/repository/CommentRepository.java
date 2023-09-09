package com.lqt.repository;

import com.lqt.pojo.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    // Find comments for a specific property listing
    List<Comment> findByPropertyListingId(Long propertyListingId);

    // Define custom query methods if needed
    // For example, you can define methods to search for comments by user, date, or other criteria
}
