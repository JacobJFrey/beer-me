package com.beerme.JDBC;

import java.time.LocalDate;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.beerme.dao.HistoryDAO;
import com.beerme.model.History;

@Service
public class JDBCHistoryDAO implements HistoryDAO {

	private JdbcTemplate jdbcTemplate;
	
	public JDBCHistoryDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
// THIS DOESNT WORK PROPERLY
	
	
	@Override
	public void addHistory(int id) {
		History h = new History();
		LocalDate today = LocalDate.now();
		String sqlAddHistory = 
				"INSERT INTO history (historyid, breweryname, date) " +
				"VALUES (?, ?, ?)";
		h.setHistoryId(getNewReservationId());
		jdbcTemplate.update(sqlAddHistory, h.getHistoryId(), h.getBreweryName(), today);
	}
	
	private int getNewReservationId() { //generates new reservation id in sql
		SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("SELECT nextval('history_historyid_seq')");
		if(nextIdResult.next()) {
		return nextIdResult.getInt(1);
		}else {
			throw new RuntimeException ("Something went wrong while getting an ID for the new reservation");
		}
	}

}
