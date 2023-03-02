package superPms.vo;

public class NoticeRep {
	private int repno;
	private int refno;
	private String content;
	private String regdte;
	private String uptdte;
	private int noticeno;
	private String writer;
	private String ename;
	
	public NoticeRep(int repno, int refno, String content, String regdte, String uptdte, int noticeno, String writer,
			String ename) {
		this.repno = repno;
		this.refno = refno;
		this.content = content;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.noticeno = noticeno;
		this.writer = writer;
		this.ename = ename;
	}

	public NoticeRep() {
		// TODO Auto-generated constructor stub
	}

	public int getRepno() {
		return repno;
	}

	public void setRepno(int repno) {
		this.repno = repno;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdte() {
		return regdte;
	}

	public void setRegdte(String regdte) {
		this.regdte = regdte;
	}

	public String getUptdte() {
		return uptdte;
	}

	public void setUptdte(String uptdte) {
		this.uptdte = uptdte;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}
	
}
