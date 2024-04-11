package searchbymap;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class SearchAPI {
    private static final String REST_API_KEY = "6c29be1552a99226e602de2aa61bbbbc"; // 카카오 REST API 키

    public static List<SearchResult> searchBlogAsJson(String keyword) throws IOException {
        keyword = URLEncoder.encode(keyword, "UTF-8");

        String apiUrl = "https://dapi.kakao.com/v2/search/blog";
        String queryString = String.format("query=%s&size=6", keyword);
        String requestUrl = apiUrl + "?" + queryString;

        URL url = new URL(requestUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "KakaoAK " + REST_API_KEY);

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray documents = jsonResponse.getJSONArray("documents");

            List<SearchResult> resultList = new ArrayList<>();
            for (int i = 0; i <documents.length(); i++) {
                JSONObject document = documents.getJSONObject(i);
                String title = removeHtmlTags(document.getString("title"));
                String blogurl = removeHtmlTags(document.getString("url"));
                String contents = removeHtmlTags(document.getString("contents"));
                String thumbnail= removeHtmlTags(document.getString("thumbnail"));
                // 각 항목을 20자로 제한
                if (title.length() > 40) {
                    title = title.substring(0, 40);
                }
                if (blogurl.length() > 50) {
                    blogurl = blogurl.substring(0, 50);
                }
                if (contents.length() > 100) {
                    contents = contents.substring(0, 100);
                }

                SearchResult searchResult = new SearchResult(title, blogurl, contents, thumbnail);
                resultList.add(searchResult);
            }
            return resultList;
        } else {
            // 에러 처리
            throw new IOException("Failed to fetch data from Kakao API");
        }
    }
    private static String removeHtmlTags(String html) {
        return html.replaceAll("\\<.*?\\>", "");
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    static class SearchResult {
        private String title;
        private String blogurl;
        private String contents;
        private String thumbnail;
    }
}