package Dao;
import javax.annotation.Resource;  
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

  
/** 
 * ����֮����Ҫ��д 
 * HibernateDaoSupport������Ϊ������ҪΪDAO�����ע��SessionFactory������ԡ� 
 * �Ժ����ǿ�����DAO�࣬�Ϳ���ֱ���������MyHibernateDaoSupport�ˡ� 
 * ��ʵ�����������൱�������ļ���ʽ�Ĵ��룺 
 * <bean id="userDao" class="com.oa.dao.UserDaoImpl">  
 * <property 
 * name="sessionFactory" ref="sessionFactory"/>  
 * </bean> 
 *  
 * @author Administrator 
 *  
 */  
public class MyHibernateDaoSupport extends HibernateDaoSupport {  
      
    @Resource(name="sessionFactory")    //Ϊ����HibernateDaoSupportע��sessionFactory��ֵ
	
    public void setSuperSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }
  
}