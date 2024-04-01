package searchAPI;

import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class searchAPIParsing {
	 public static void parseBlogSearchResult(String jsonResponse) {
		 ObjectMapper objectMapper = new ObjectMapper();
	        try {
	            // JSON 문자열을 JsonNode로 파싱
	            JsonNode rootNode = objectMapper.readTree(jsonResponse);

	            // RSS 채널 정보 가져오기
	            JsonNode channel = rootNode.path("rss").path("channel");
	            int total = channel.path("total").asInt(); // 총 검색 결과 개수
	            int start = channel.path("start").asInt(); // 검색 시작 위치
	            int display = channel.path("display").asInt(); // 한 번에 표시할 검색 결과 개수

	            // 개별 검색 결과 가져오기
	            JsonNode items = channel.path("item");
	            for (JsonNode item : items) {
	                String title = item.path("title").asText(); // 블로그 포스트의 제목
	                String link = item.path("link").asText(); // 블로그 포스트의 URL
	                String description = item.path("description").asText(); // 블로그 포스트의 내용 요약
	                String bloggerName = item.path("bloggername").asText(); // 블로그 포스트가 있는 블로그의 이름
	                String bloggerLink = item.path("bloggerlink").asText(); // 블로그 포스트가 있는 블로그의 주소
	                String postDate = item.path("postdate").asText(); // 블로그 포스트가 작성된 날짜

	                // 원하는 정보를 가지고 원하는 작업 수행
	                System.out.println("Title: " + title);
	                System.out.println("Link: " + link);
	                System.out.println("Description: " + description);
	                System.out.println("Blogger Name: " + bloggerName);
	                System.out.println("Blogger Link: " + bloggerLink);
	                System.out.println("Post Date: " + postDate);
	                System.out.println();
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	 }
}
