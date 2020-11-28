package com.yori.zori.broadcast.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpsFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpsRequestWrapper httpsRequest = new HttpsRequestWrapper((HttpServletRequest) request);

		httpsRequest.setResponse((HttpServletResponse) response);
		chain.doFilter(httpsRequest, response);
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}
}
