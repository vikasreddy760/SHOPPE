package com.niit.dao;

import java.util.List;

import com.niit.models.UserDetails;

public interface UserDetailsDAO {


	public List<UserDetails> list();

	public UserDetails get(int id);

	public boolean saveOrUpdate(UserDetails user);

	public void delete(int id);
	
	public boolean isValidUser(String username,String password);
	
	public UserDetails get(String username);
}
