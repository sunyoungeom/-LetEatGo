package searchbymap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchResult {
    private String title;
    private String blogurl;
    private String contents;
    private String thumbnail;
}