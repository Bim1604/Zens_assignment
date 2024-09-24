import 'dart:math';

import 'package:get/get.dart';
import 'package:zens_assignment/data/local/repository/app_repository.dart';
import 'package:zens_assignment/datas/app_type.dart';
import 'package:zens_assignment/screens/home/models/joke_model.dart';

class HomeController extends GetxController {
  RxString avatar = "".obs;
  RxList<JokeModel> data = RxList.empty(growable: true);
  Rx<JokeModel> currentJoke = JokeModel().obs;
  RxString copyWriteContent = "".obs;
  Random rand = Random();
  final JokeRepository repository = JokeRepository();
  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    loadDataBackground();
    super.onInit();
  }

  @override
  void onReady() async {
    onLoadDataHome();
    super.onReady();
  }

  void onLoadDataHome() async {
    try {
      isLoading.value = true;
      await Future.wait([
        onLoadDataJoke(),
        loadDataCopyWrite(),
      ]);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void loadDataBackground() {
    try {
      avatar.value = "assets/images/no_avatar.png";
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadDataCopyWrite() async {
    copyWriteContent.value = "This app is created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.";
  }
  
  Future<void> onLoadDataJoke() async {
    data.value = [
      JokeModel(
        id: 1,
        content: '''A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on." The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."''',
      ),
      JokeModel(
        id: 2,
        content: '''Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"''',
      ),
      JokeModel(
        id: 3,
        content: '''The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, 'I am going to eat that pussy once Jimmy leaves for school today!'"''',
      ),
      JokeModel(
        id: 4,
        content: '''A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it's either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"''',
      ),
    ];
    if (data.isEmpty) return;
    await loadRandomJoke();
  }

  Future<void> loadRandomJoke() async {
    if (data.isEmpty) return;
    int numberRandom = 0;
    if (data.length != 1) {
      numberRandom = rand.nextInt(data.length - 1);
    }
    JokeModel? result = await repository.findOneJoke(data[numberRandom].id ?? -1);
    if (result != null && result.rate != null) {
      data.removeAt(numberRandom);
      await loadRandomJoke();
    } else {
      currentJoke.value = data[numberRandom];
    }
  }

  Future<void> onRateJoke(JokeType type) async {
    try {
      int index = data.indexWhere((element) => element.id != null && element.id == currentJoke.value.id);
      if (index < 0) return;
      data[index].rate = type;
      await repository.addJoke(data[index]);
      data.removeAt(index);
      if (data.isEmpty) {
        return;
      }
      if (data.length == 1) {
        currentJoke.value = data.first;
      }
      int numberRandom = rand.nextInt(data.length - 1);
      currentJoke.value = data[numberRandom];
    } catch (e) {
      print(e);
    }
  }

}