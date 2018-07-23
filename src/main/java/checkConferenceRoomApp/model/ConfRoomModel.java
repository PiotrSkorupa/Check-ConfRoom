package checkConferenceRoomApp.model;


import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ConfRoomModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int floor;

    private String name;

    private boolean hdmi;

    private boolean skypeVc;

    private boolean remotes;

    private boolean lan;

    private boolean instruction;

    private boolean labels;

    private boolean markers;

    private boolean sockets;

    private boolean floorCondition;

    private String comments;

    private String checkedby;

    private Timestamp lastmodified;

}
