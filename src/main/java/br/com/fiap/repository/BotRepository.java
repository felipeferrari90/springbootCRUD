package br.com.fiap.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.fiap.model.BotModel;


@Repository
public class BotRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FIND_ALL = "SELECT * FROM TB_BOT";
	private static final String FIND_BY_ID = "SELECT * FROM TB_BOT WHERE ID_BOT = ?";
	private static final String SAVE = "INSERT INTO TB_BOT (NAME_BOT, WELCOME_MSG, FAREWELL_MSG, DOWNTIME, DEFAULT_ANSWER) VALUES (?,?,?,?,?)";
	private static final String UPDATE = "UPDATE TB_BOT SET NAME_BOT = ?, WELCOME_MSG = ?, FAREWELL_MSG = ?, DOWNTIME = ?, DEFAULT_ANSWER = ? WHERE ID_BOT = ?";                          
	private static final String DELETE = "DELETE FROM TB_BOT WHERE ID_BOT = ?";

	public List<BotModel> findAll() {

		List<BotModel> bots = jdbcTemplate.query(FIND_ALL,
				new BeanPropertyRowMapper<BotModel>(BotModel.class));
		return bots;
	}

	public BotModel findById(long id) {

		BotModel botModel = jdbcTemplate.queryForObject(FIND_BY_ID,
				new BeanPropertyRowMapper<BotModel>(BotModel.class), id);

		return botModel;
	}

	public void save(BotModel botModel) {
		jdbcTemplate.update(SAVE, botModel.getNameBot(),
				            botModel.getWelcomeMsg(),
				            botModel.getFarewellMsg(),
				            botModel.getDowntime(),
				            botModel.getDefaultAnswer()
				            
		);
	}
	
	public void update(BotModel botModel) {
		jdbcTemplate.update(UPDATE, 
				botModel.getNameBot(),
	            botModel.getWelcomeMsg(),
	            botModel.getFarewellMsg(),
	            botModel.getDowntime(),
	            botModel.getDefaultAnswer(),
	            botModel.getIdBot()
				);
	}
	
	public void delete(long id) {

			jdbcTemplate.update(DELETE, id);
		
		
	}
}
