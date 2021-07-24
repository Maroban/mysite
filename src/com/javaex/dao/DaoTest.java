package com.javaex.dao;

public class DaoTest {

	public static void main(String[] args) {

		BoardDao boardDao = new BoardDao();

		System.out.println(boardDao.boardList("안").get(1).getNo());

	}

}
