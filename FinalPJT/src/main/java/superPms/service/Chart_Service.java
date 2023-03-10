package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Chart_Dao;
import superPms.vo.BarChart;
import superPms.vo.DonutChart;

@Service
public class Chart_Service {
	@Autowired(required = false)
	private Chart_Dao dao;
	
	public List<BarChart> getBar(BarChart date){
		if(date.getYear()==0) date.setYear(23);
		if(date.getMonth()==0) date.setMonth(3);
		return dao.getBar(date);
	};
	public List<DonutChart> getDonut(){
		return dao.getDonut();
	};
}
