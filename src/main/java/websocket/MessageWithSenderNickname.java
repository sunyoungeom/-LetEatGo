// MessageWithSenderNickname.java
package websocket;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.protobuf.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class MessageWithSenderNickname {
    private String content;
    private Timestamp sentAt;
    private String senderNickname;
}
