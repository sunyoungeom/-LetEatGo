package searchAPI;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.json.JSONArray;
import org.json.JSONObject;

public class SearchAPI {
    private static final String REST_API_KEY = "6c29be1552a99226e602de2aa61bbbbc"; // 카카오 REST API 키

    public static String searchBlog(String keyword) throws IOException {
        keyword = URLEncoder.encode(keyword, "UTF-8");

        String apiUrl = "https://dapi.kakao.com/v2/search/blog";
        String queryString = String.format("query=%s", keyword);
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

            // JSON 파싱
            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray documents = jsonResponse.getJSONArray("documents");

            StringBuilder result = new StringBuilder();
            for (int i = 0; i < documents.length(); i++) {
                JSONObject document = documents.getJSONObject(i);
                String title = document.getString("title");
                String url1 = document.getString("url");
                String contents = document.getString("contents");

                // 각 항목을 20자로 제한
                if (title.length() > 20) {
                    title = title.substring(0, 20);
                }
                if (url1.length() > 20) {
                    url1 = url1.substring(0, 20);
                }
                if (contents.length() > 40) {
                    contents = contents.substring(0, 40);
                }

                // 결과에 추가
                result.append("Title: ").append(title).append(", ");
                result.append("URL: ").append(url1).append(", ");
                result.append("Contents: ").append(contents).append("\n");
            }

            return result.toString();
        } else {
            return "Failed to fetch data from Kakao API";
        }
    }
}