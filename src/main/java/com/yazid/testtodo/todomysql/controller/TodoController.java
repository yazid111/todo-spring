package com.yazid.testtodo.todomysql.controller;


import com.yazid.testtodo.todomysql.model.Todo;
import com.yazid.testtodo.todomysql.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api")
public class TodoController {

    @Autowired
    TodoRepository todoRepository;

    @GetMapping("/todos")
    public List<Todo> getAllTodos(){
        Sort sortByCreatedAtDesc = new Sort(Sort.Direction.DESC,"createdAt");
        return todoRepository.findAll(sortByCreatedAtDesc);
    }

    @PostMapping("/todos")
    public Todo createTodo(@Valid @RequestBody Todo todo){ todo.setCompleted(false);
        return todoRepository.save(todo);
    }

    @GetMapping(value = "/todos/{id}")
    public ResponseEntity<Todo> getTodoById(@PathVariable(value = "id") Long id){
        return todoRepository.findById(id)
                .map(todo -> ResponseEntity.ok()
                .body(todo)).orElse(ResponseEntity.notFound().build());
    }

    @PutMapping(value = "/todos/{id}")
    public ResponseEntity<Todo> updateTodo(@PathVariable("id") Long id, @Valid @RequestBody Todo todo){
        return todoRepository.findById(id)
                .map(
                newTodo -> {
                    newTodo.setTitle(todo.getTitle());
                    newTodo.setCompleted(todo.getCompleted());
                    Todo updatedTodo = todoRepository.save(newTodo);
                    return ResponseEntity.ok().body(updatedTodo);}
        ).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping(value = "/todos/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") Long id){
        return todoRepository.findById(id)
                .map(todo -> {
                    todoRepository.deleteById(id);
                    return ResponseEntity.ok().build();
                }).orElse(ResponseEntity.notFound().build());
    }
}
