package com.thinkgem.jeesite.client.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;



@Component
public class ClientValidator implements IClientValidator{
	private ClientContext clientContext;
//UserAgentUtils
	@Override
	public boolean validate() throws Exception{
		if(clientContext==null) {
			throw new Exception("clientContext is required");
		}
		((HttpServletResponse)clientContext.getResponse()).sendRedirect("/jeesite/smartCommunity/login.html");
		return false;
	}

	public ClientContext getClientContext() {
		return clientContext;
	}

	public void setClientContext(ClientContext clientContext) {
		this.clientContext = clientContext;
	}

}
