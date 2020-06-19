package br.com.fiap.model;

import javax.validation.constraints.NotBlank;

public class SegmentModel {

	private long idSegment;
	private String name;
	private BotModel bot;

	public SegmentModel() {
	}

	public SegmentModel(Long id, String name) {
		this.idSegment = id;
		this.name = name;
	}

	public Long getIdSegment() {
		return idSegment;
	}

	public void setIdSegment(Long id) {
		this.idSegment = id;
	}

	@NotBlank(message = "nome invalido")
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}

	
	public BotModel getBot() {
		return bot;
	}

	public void setBot(BotModel bot) {
		this.bot = bot;
	}
	

}
