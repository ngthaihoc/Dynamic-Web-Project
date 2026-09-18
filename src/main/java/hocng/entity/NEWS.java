package hocng.entity;

import java.util.Date;

public class NEWS {
	String id;
	String Title;
	String Content;
	String Image;
	Date DATETIME;
	String Author;
	Integer ViewCount;
	String CategoryId;
	boolean Home;

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return Title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		Title = title;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return Content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		Content = content;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return Image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		Image = image;
	}

	/**
	 * @return the dATETIME
	 */
	public Date getDATETIME() {
		return DATETIME;
	}

	/**
	 * @param dATETIME the dATETIME to set
	 */
	public void setDATETIME(Date dATETIME) {
		DATETIME = dATETIME;
	}

	/**
	 * @return the postedDate (alias for DATETIME)
	 */
	public Date getPostedDate() {
		return DATETIME;
	}

	/**
	 * @param postedDate the postedDate to set
	 */
	public void setPostedDate(Date postedDate) {
		this.DATETIME = postedDate;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return Author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		Author = author;
	}

	/**
	 * @return the viewCount
	 */
	public Integer getViewCount() {
		return ViewCount;
	}

	/**
	 * @param viewCount the viewCount to set
	 */
	public void setViewCount(Integer viewCount) {
		ViewCount = viewCount;
	}

	/**
	 * @return the categoryId
	 */
	public String getCategoryId() {
		return CategoryId;
	}

	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}

	public NEWS() {
		super();
	}

	/**
	 * @return the home
	 */
	public boolean isHome() {
		return Home;
	}

	/**
	 * @param home the home to set
	 */
	public void setHome(boolean home) {
		Home = home;
	}
}
