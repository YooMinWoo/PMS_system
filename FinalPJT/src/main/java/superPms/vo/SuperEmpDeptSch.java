package superPms.vo;

public class SuperEmpDeptSch {
	// 원주 추가 부분
	private String keyword;
	// 은빈 추가 부분
	private String sename; // 사원명 검색
	private String dname; // 부서명 검색
	private String job; // 직책 검색
	
	private int count; // 전체 데이터 건수
	private int pageSize; // 한 페이지에 보여줄 데이터 건수
	private int pageCount; // 총 페이지 수 counte÷pageSize
	private int curPage; // 클릭한 현재 페이지 번호
	private int start; // 현재 페이지 시작번호
	private int end; // 현재 페이지 마지막 번호
	
	private int blockSize; // 한 번에 보여줄 block의 크기
	private int startBlock; // block 시작 번호
	private int endBlock; // block 마지막 번호
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public String getSename() {
		return sename;
	}
	public void setSename(String sename) {
		this.sename = sename;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	
}
