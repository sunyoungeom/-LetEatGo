package util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;

public class ConfigLoader {

    private static final String CONFIG_FILE_PATH = "config.json";

    public static String getPropertyValue(String key) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            // 클래스 경로에서 JSON 파일을 로드합니다.
            JsonNode rootNode = mapper.readTree(new File(ConfigLoader.class.getClassLoader().getResource(CONFIG_FILE_PATH).getFile()));
            // 키에 해당하는 값을 반환합니다.
            JsonNode keyValue = rootNode.path(key);
            if (keyValue.isMissingNode()) {
                return null; // 키가 없다면 null 반환
            } else {
                return keyValue.asText();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
