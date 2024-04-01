package Post;

import java.util.List;

public class PostService {
    private PostMapper postMapper;

    public PostService(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    public List<Post> getPostsByPage(int pageNum, int pageSize) {
        int startIdx = (pageNum - 1) * pageSize;
        return postMapper.getPostsByRange(startIdx, pageSize);
    }
    
    
}