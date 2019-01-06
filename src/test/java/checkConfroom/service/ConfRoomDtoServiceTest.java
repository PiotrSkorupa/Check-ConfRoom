package checkConfroom.service;

import checkConfroom.model.ConfRoomModel;
import checkConfroom.repository.ConfRoomRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.mockito.Matchers.any;
import static org.mockito.MockitoAnnotations.initMocks;


public class ConfRoomDtoServiceTest {

    @Mock
    private ConfRoomRepository confRoomRepository;

    private ConfRoomService confRoomService;

    @Before
    public void setUp() {
        initMocks(this);
        confRoomService = new ConfRoomService(confRoomRepository);
    }

    @Test
    public void shouldReturnConfRoomById() {
        ConfRoomModel confRoomModel = getConfRoomModel();
        confRoomModel.setId(5);

        ConfRoomModel toSave = getDefaultConfRoomModelById(confRoomModel,5);

        Optional<ConfRoomModel> expected = Optional.ofNullable(toSave);

        Mockito.when(confRoomRepository.findById(5)).thenReturn(expected);

        Optional<ConfRoomModel> actual = confRoomService.getConfRoomById(5);
        Assert.assertEquals(expected, actual);
        Mockito.verify(confRoomRepository, Mockito.timeout(1)).findById(5);
    }


    @Test
    public void shouldReturnListOfConfRooms() {
        List<ConfRoomModel> expected = new ArrayList<>();
        expected.add(getDefaultConfRoomModel());

        Mockito.when(confRoomRepository.findAll()).thenReturn(expected);

        List<ConfRoomModel> actual = confRoomService.getAllConfRooms();

        Assert.assertEquals(expected, actual);
        Mockito.verify(confRoomRepository, Mockito.timeout(1)).findAll();
    }

    @Test
    public void shouldSaveConfRoom() {
        ConfRoomModel expected = getDefaultConfRoomModel();
        ConfRoomModel confReturnedFromBb = getDefaultConfRoomModelById(getDefaultConfRoomModel(), 5);

        Mockito.when(confRoomRepository.save(any(ConfRoomModel.class))).thenReturn(confReturnedFromBb);

        ConfRoomModel actual = confRoomService.saveConfRoom(expected);

        Assert.assertEquals(expected,actual);
        Mockito.verify(confRoomRepository,Mockito.timeout(1)).save(any(ConfRoomModel.class));
    }

    @Test
    public void shouldReturnConfByFloor() {
        List<ConfRoomModel> expected = new ArrayList<>();
        ConfRoomModel confToAdd = getConfRoomModel();
        confToAdd.setFloor(1);
        expected.add(confToAdd);

        Mockito.when(confRoomRepository.findAll()).thenReturn(expected);

        List<ConfRoomModel> actual = confRoomService.getConfsByFloor(1);

        Assert.assertEquals(expected,actual);
        Mockito.verify(confRoomRepository, Mockito.timeout(1)).findAll();
    }


    @Test
    public void shouldReturnConfByName() {
        List<ConfRoomModel> expected = new ArrayList<>();
        ConfRoomModel confToAdd = getConfRoomModel();
        confToAdd.setName("Java");
        expected.add(confToAdd);

        Mockito.when(confRoomRepository.findAll()).thenReturn(expected);

        List<ConfRoomModel> actual = confRoomService.getConfsByName("Java");

        Assert.assertEquals(expected,actual);
        Mockito.verify(confRoomRepository, Mockito.timeout(1)).findAll();
    }

    @Test
    public void shouldDeleteConfRoom() {
       /* List<ConfRoomModel> listWithConfToDelete = new ArrayList<>();
        ConfRoomModel confToDelete = getConfRoomModel();
        confToDelete.setId(1);
        listWithConfToDelete.add(confToDelete);

        Integer expected = listWithConfToDelete.size();


        //when(userRepository.findOneByEmail(any(String.class))).thenReturn(user);
      //  Matchers.<AsyncCallback<ResponseX>>any()
                //CrudRepository
     //   Mockito.when(confRoomRepository.deleteById(Matchers.<AsyncCallback<Integer>>any())).thenReturn(new Integer(2));
        //ArgumentMatchers.<AsyncCallback<ResponseX>>any()

        //Mockito.when(confRoomRepository.deleteById(any())).then(AdditionalAnswers.returnsFirstArg());
        //Mockito.when(confRoomRepository.deleteById(Matchers.<CrudRepository<ConfRoomModel, Integer>>any())).thenReturn(new Integer(0));
        //Mockito.<DbOperationResult<ConfRoomModel>>when(DbProcExecutor.executeDbProc1(Mockito.anyObject(),Mockito.anyObject())).thenReturn(getResult);

        int actual = listWithConfToDelete.size();*/

    }


    private ConfRoomModel getConfRoomModel() {
        return ConfRoomModel.builder()
                .id(1)
                .name("Kraków")
                .floor(6)
                .skypeVc(true)
                .hdmi(true)
                .lan(true)
                .remotes(true)
                .labels(true)
                .comments("no comment")
                .build();
    }

    private ConfRoomModel getDefaultConfRoomModelById(ConfRoomModel confRoomModel, int id) {
        confRoomModel.setId(id);
        return confRoomModel;
    }

   private ConfRoomModel getDefaultConfRoomModel() {
        ConfRoomModel confRoomModel = new ConfRoomModel();
        confRoomModel.setId(2);
        confRoomModel.setName("Wrocław");
        confRoomModel.setFloor(5);
        confRoomModel.setSkypeVc(false);
        confRoomModel.setHdmi(false);
        confRoomModel.setLan(false);
        confRoomModel.setLabels(false);
        confRoomModel.setComments("comment 1");
        return confRoomModel;
    }
}