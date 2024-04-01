import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.List;

import javax.sql.DataSource;
import org.apache.ibatis.datasource.unpooled.UnpooledDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import Post.Post;
import Post.PostMapper;

public class PostMapperTest {
    public static void main(String[] args) {
        // 데이터베이스 연결 정보 설정
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://192.168.0.107:3306/board";
        String username = "team1";
        String password = "root";

        // 데이터 소스 생성
        DataSource dataSource = new UnpooledDataSource(driver, url, username, password);

        // 트랜잭션 팩토리 생성
        TransactionFactory transactionFactory = new JdbcTransactionFactory();

        // 환경 설정 생성
        Environment environment = new Environment("development", transactionFactory, dataSource);

        // 설정 객체 생성
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration(environment);

        // 매퍼 등록
        configuration.addMapper(PostMapper.class);

        // SqlSessionFactory 생성
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

        // SqlSession 생성
        try (SqlSession session = sqlSessionFactory.openSession()) {
            // PostMapper 인터페이스의 구현체를 가져옴
            PostMapper postMapper = session.getMapper(PostMapper.class);
            
            // 전체 게시물 조회
            List<Post> allPosts = postMapper.getAllPosts();
            System.out.println("전체 게시물:");
            for (Post post : allPosts) {
                System.out.println(post);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}