package hocng.entity;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.junit.Test;

public class NewsEntityTest {

    @Test
    public void testPostedDateAlias() {
        NEWS news = new NEWS();
        Date now = new Date();
        news.setPostedDate(now);
        assertEquals(now, news.getPostedDate());
        assertEquals(now, news.getDATETIME());

        Date earlier = new Date(now.getTime() - 3600000);
        news.setDATETIME(earlier);
        assertEquals(earlier, news.getPostedDate());
    }

    @Test
    public void testNewsProperties() {
        NEWS news = new NEWS();
        news.setId("N01");
        news.setTitle("Title");
        news.setContent("Content");
        news.setAuthor("Author");
        news.setImage("banner.png");
        news.setViewCount(10);
        news.setCategoryId("CAT01");
        news.setHome(true);

        assertEquals("N01", news.getId());
        assertEquals("Title", news.getTitle());
        assertEquals("Content", news.getContent());
        assertEquals("Author", news.getAuthor());
        assertEquals("banner.png", news.getImage());
        assertEquals(Integer.valueOf(10), news.getViewCount());
        assertEquals("CAT01", news.getCategoryId());
        assertTrue(news.isHome());
    }
}
