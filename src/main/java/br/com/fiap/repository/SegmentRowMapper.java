package br.com.fiap.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;

import br.com.fiap.model.BotModel;
import br.com.fiap.model.SegmentModel;

public class SegmentRowMapper implements RowMapper<SegmentModel> {

	@Override
	public SegmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {

		SegmentModel segmento = new BeanPropertyRowMapper<SegmentModel>(SegmentModel.class).mapRow(rs, rowNum);
		
		BotModel bot = new BeanPropertyRowMapper<BotModel>(BotModel.class).mapRow(rs, rowNum);
		
		segmento.setBot(bot);
		
		return segmento;
	}

}
