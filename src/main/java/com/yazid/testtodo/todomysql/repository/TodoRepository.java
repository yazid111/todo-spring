package com.yazid.testtodo.todomysql.repository;

import com.yazid.testtodo.todomysql.model.Todo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TodoRepository  extends JpaRepository<Todo,Long>{
}
