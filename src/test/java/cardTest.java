
import java.sql.SQLException;
import java.util.List;
import static junit.framework.Assert.assertTrue;
import opal.dao.CardManagementDao;
import opal.entity.OpalCard;
import org.junit.Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author chengming
 */
public class cardTest {
    CardManagementDao cardDao;

    public cardTest() throws ClassNotFoundException, SQLException {
        this.cardDao = new CardManagementDao();
    }
    
    @Test
    public void testGetAllCards() throws SQLException{
        List<OpalCard> list = cardDao.getAllCards();
        assertTrue(list.size() > 0);
    }
}
