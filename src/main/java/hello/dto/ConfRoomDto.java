package hello.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConfRoomDto {

    private int id;

    private int floor;

    private String name;

    private boolean hdmi;

    private boolean skypeVc;

    private boolean remotes;

    private boolean lan;

    private boolean instruction;

    private boolean labels;

    private String comments;

}
