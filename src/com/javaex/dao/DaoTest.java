package com.javaex.dao;

import com.javaex.vo.UserVo;

public class DaoTest {

	public static void main(String[] args) {


		UserDao userDao = new UserDao();
		/*
		UserVo userVo = userDao.getUser("aaaaa5", "1234");

		System.out.println(userVo);

		UserVo userVo2 = userDao.getUser(1);
		System.out.println(userVo2);
		*/

		int no = 1;
		String name = "강동원";
		String password = "1";
		String gender = "female";

		UserVo userVo3 = new UserVo(no, name, password, gender);

		userDao.update(userVo3);

		UserVo userVo4 = userDao.getUser(1);

		System.out.println(userVo4);

	}

}
