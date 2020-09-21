package com.challenge.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sql = "";
		try {
			// TODO: add escape string to prevent SQL injection
			sql = String.format("insert into PRODUTOS (COD, DESCRICAO, VALOR) values (%d, '%s', '%.2f')",
					Integer.parseInt(request.getParameter("cod")), request.getParameter("desc"),
					Float.parseFloat(request.getParameter("val")));

		} catch (Exception e) {
			System.out.println(e.getMessage());
			response.getWriter().write(e.getMessage());
		}

		System.out.println(sql);
		response.getWriter().write(sql);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
