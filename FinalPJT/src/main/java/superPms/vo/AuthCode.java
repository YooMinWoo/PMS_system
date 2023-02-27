package superPms.vo;
public class AuthCode {
	private String key;
	private String val;
	public AuthCode() {
	}
	public AuthCode(String key, String val) {
		this.key = key;
		this.val = val;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}
	
}
