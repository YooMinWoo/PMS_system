package superPms.vo;

public class StrategycareSch {
	private int strategyno;
	private int count;	// 전체 데이터 건ㄴ수
	private int pageSize;	// 한 번 보여줄 페이지 크기
	private int pageCount;	// 총페이지수 count/pageSize
	private int curPage;	// 클릭한 현재 ㅠㅔ이지 번호
	private int start;		// 현재 페이지 시작
	private int end;		// 현재 페이지 마지막
	
	// 3. 페이징 처리 2단계(블럭)
	private int blockSize;	// 한번에 보여중 block의크기
	private int startBlock;	// block 시작번호
	private int endBlock;	// block 마지막번호
	public StrategycareSch() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StrategycareSch(int count, int pageSize, int pageCount, int curPage, int start, int end, int blockSize,
			int startBlock, int endBlock) {
		super();
		this.count = count;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
		this.curPage = curPage;
		this.start = start;
		this.end = end;
		this.blockSize = blockSize;
		this.startBlock = startBlock;
		this.endBlock = endBlock;
	}


	public int getStrategyno() {
		return strategyno;
	}

	public void setStrategyno(int strategyno) {
		this.strategyno = strategyno;
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
	
}
