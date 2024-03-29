package com.newsfeed.dao;

import com.newsfeed.models.Model;

import java.util.List;

/**
 * Created by Akhmat on 24.03.2016.
 */
public interface MainDao<T extends Model> {
    public List<T> getAll();

    public T getById(Long id);

    public void add(T model);

    public void update(T model);

    public void remove(T model);

}
