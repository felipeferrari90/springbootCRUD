package br.com.fiap.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;


public class BotModel {
	
	

	private Long idBot;

	private String nameBot;
	
	private String welcomeMsg;
	
	private String farewellMsg;
	
	private double downtime;
	
	private String defaultAnswer;
	
	public BotModel() {}

	public Long getIdBot() {
		return idBot;
	}

	public void setIdBot(Long idBot) {
		this.idBot = idBot;
	}
	
	public BotModel(Long idBot, String nameBot, String welcomeMsg, String farewellMsg, double downtime,
			String defaultAnswer) {
		
		this.idBot = idBot;
		this.nameBot = nameBot;
		this.welcomeMsg = welcomeMsg;
		this.farewellMsg = farewellMsg;
		this.downtime = downtime;
		this.defaultAnswer = defaultAnswer;
	}

	@NotBlank(message = "Name nao pode ser nulo")
	public String getNameBot() {
		return nameBot;
	}
    
	public void setNameBot(String nameBot) {
		this.nameBot = nameBot;
	}
    
	public String getWelcomeMsg() {
		return welcomeMsg;
	}

	public void setWelcomeMsg(String welcomeMsg) {
		this.welcomeMsg = welcomeMsg;
	}

	public String getFarewellMsg() {
		return farewellMsg;
	}

	public void setFarewellMsg(String farewellMsg) {
		this.farewellMsg = farewellMsg;
	}

	@PositiveOrZero(message = "valor invalido") 
	public double getDowntime() {
		return downtime;
	}
	
	
	public void setDowntime(double downtime) {
		this.downtime = downtime;
	}

	public String getDefaultAnswer() {
		return defaultAnswer;
	}

	public void setDefaultAnswer(String defaultAnswer) {
		this.defaultAnswer = defaultAnswer;
	}

	


    
	

	
}
