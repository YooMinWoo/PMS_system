package superPms.vo;

public class Calendar {
	
	private int calno;
	private String title;
	private String startdte;
	private String enddte;
	private String id;
	private String textColor;
	private String backColor;
	private int allday;
	private String content;
	private String url;
	
	public Calendar(int calno, String title, String startdte, String enddte, String id, String textColor,
			String backColor, int allday, String content, String url) {
		this.calno = calno;
		this.title = title;
		this.startdte = startdte;
		this.enddte = enddte;
		this.id = id;
		this.textColor = textColor;
		this.backColor = backColor;
		this.allday = allday;
		this.content = content;
		this.url = url;
	}
	public Calendar() {
		// TODO Auto-generated constructor stub
	}
	public int getCalno() {
		return calno;
	}
	public void setCalno(int calno) {
		this.calno = calno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartdte() {
		return startdte;
	}
	public void setStartdte(String startdte) {
		this.startdte = startdte;
	}
	public String getEnddte() {
		return enddte;
	}
	public void setEnddte(String enddte) {
		this.enddte = enddte;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackColor() {
		return backColor;
	}
	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}
	public int getAllday() {
		return allday;
	}
	public void setAllday(int allday) {
		this.allday = allday;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
