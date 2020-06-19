package br.com.fiap.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.fiap.model.SegmentModel;



@Repository
public class SegmentRepository {
	
	private static final String GET_ALL = "SELECT * FROM TB_SEGMENT S INNER JOIN TB_BOT B ON (S.TB_BOT = B.ID_BOT)";
	private static final String GET = "SELECT * FROM TB_SEGMENT S INNER JOIN TB_BOT B ON (S.TB_BOT = B.ID_BOT) WHERE ID_SEGMENT = ?";
	private static final String SAVE = "INSERT INTO TB_SEGMENT (NAME, TB_BOT) VALUES (?, ?)";                       
	private static final String UPDATE = "UPDATE TB_SEGMENT SET NAME = ?, TB_BOT = ? WHERE ID_SEGMENT = ?";
	private static final String DELETE = "DELETE FROM TB_SEGMENT WHERE ID_SEGMENT = ?";

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public SegmentRepository() {
	}

	public List<SegmentModel> findAll() {

		List<SegmentModel> segmento = this.jdbcTemplate.query(GET_ALL, new SegmentRowMapper());
		return segmento;
	}

	public SegmentModel findById(long id) {

		SegmentModel segmento = this.jdbcTemplate.queryForObject(GET, new SegmentRowMapper(), id);
		return segmento;
	}

	public void save(SegmentModel segmentModel) {
		this.jdbcTemplate.update(SAVE, 
				segmentModel.getName(),
				segmentModel.getBot().getIdBot());
	}

	public void update(SegmentModel segmentModel) {
		this.jdbcTemplate.update(UPDATE, 
				segmentModel.getName(),  
				segmentModel.getBot().getIdBot(),
				segmentModel.getIdSegment());
	}

	public void deleteById(long id) {
		this.jdbcTemplate.update(DELETE, id);
	}
	
}
