package Post;
import java.util.List;

public class PostService {
    private PostDAO postDAO;

    public PostService() {
        this.postDAO = new PostDAO();
    }

    // 게시물 생성
    public void createPost(Post post) {
        postDAO.createPost(post);
    }

    // 모든 게시물 조회
    public List<Post> getAllPosts() {
        return postDAO.getAllPosts();
    }

    // 특정 게시물 조회
    public Post getPostById(int postId) {
        return postDAO.getPostById(postId);
    }

    // 게시물 수정
    public void updatePost(Post post) {
        postDAO.updatePost(post);
    }

    // 게시물 삭제
    public void deletePost(int postId) {
        postDAO.deletePost(postId);
    }
}
