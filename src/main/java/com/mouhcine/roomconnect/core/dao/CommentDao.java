package com.mouhcine.roomconnect.core.dao;

import com.mouhcine.roomconnect.core.bo.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDao extends JpaRepository<Comment,Long> {
}
