package checkConferenceRoomApp.repository;

import checkConferenceRoomApp.model.ConfRoomModel;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ConfRoomRepository extends CrudRepository<ConfRoomModel, Integer> {

    @Query(value = "ALTER TABLE conf_room_model ADD lastmodified TIMESTAMP; ALTER TABLE conf_room_mode ALTER COLUMN lastmodified SET DEFAULT CURRENT_TIMESTAMP; UPDATE conf_room_mode SET lastmodified=CURRENT_TIMESTAMP; CREATE OR REPLACE FUNCTION update_lastmodified_column() RETURNS TRIGGER AS ' BEGIN NEW.lastmodified = NOW(); RETURN NEW; END; ' LANGUAGE 'plpgsql'; CREATE TRIGGER update_lastmodified_modtime BEFORE UPDATE ON mytable FOR EACH ROW EXECUTE PROCEDURE update_lastmodified_column();", nativeQuery = true)
    ConfRoomModel addTimestamp();
}
