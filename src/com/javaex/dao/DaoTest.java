package com.javaex.dao;

import java.util.List;

import com.javaex.vo.BoardVo;

public class DaoTest {

	public static void main(String[] args) {

		BoardDao boardDao = new BoardDao();

		System.out.println(boardDao.search("안").get(1).getNo());

	}

}
