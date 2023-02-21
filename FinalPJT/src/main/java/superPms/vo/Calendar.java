package superPms.vo;

public class Calendar {
	
	private int calno;
	private String title;
	private String start;
	private String end;
	private String id;
	private String textColor;
	private String backgroundColor;
	private boolean allDay;
	private String content;
	private String urllink;
	
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

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
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

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrllink() {
		return urllink;
	}

	public void setUrllink(String urllink) {
		this.urllink = urllink;
	}

	public Calendar(int calno, String title, String start, String end, String id, String textColor,
			String backgroundColor, boolean allDay, String content, String urllink) {
		this.calno = calno;
		this.title = title;
		this.start = start;
		this.end = end;
		this.id = id;
		this.textColor = textColor;
		this.backgroundColor = backgroundColor;
		this.allDay = allDay;
		this.content = content;
		this.urllink = urllink;
	}

	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
