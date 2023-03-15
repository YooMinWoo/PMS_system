package superPms.dao;

import java.util.List;

import superPms.vo.BarChart;
import superPms.vo.DonutChart;

public interface Chart_Dao {
	public List<BarChart> getBar(BarChart date);
	public List<DonutChart> getDonut();
	public List<BarChart> rateByMember(int prjno);
	public BarChart totRate(int prjno);
	public List<BarChart> infoByMonth(int year);
	public BarChart totAmount(int year);
	
}
