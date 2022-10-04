import 'package:flutter_bloc/flutter_bloc.dart';

class NewFeedCubit extends Cubit<NewFeedState> {
  NewFeedCubit() : super(NewFeedInitState());
  List<NewFeedModel> listReport = [];
  List<NewFeedModel> listNewFeed = [];

  //lay du lieu từ Json
  //   for (Map<String, dynamic> obj in jsonReport) {
  //     final model = NewFeedModel(
  //       textTitleReport: obj['Title'],
  //       urlPictureAvt: obj['UrlPictureAvt'],
  //       textContentReport: obj['Content'],
  //         urlPicture: obj['UrlPicture']
  //     );
  //     listReport.add(model);
  //   }
  //   // phat tin hieu den UI
  //   emit(NewFeedState());
  final List<String> listImage = [];

  void createListImage() {
    listImage.add('assets/icons/cat1.jpeg');
    listImage.add('assets/icons/cat2.jpeg');
    listImage.add('assets/icons/dog1.jpeg');
    listImage.add('assets/icons/dog2.jpeg');
    listImage.add('assets/icons/chicken2.jpeg');
    listImage.add('assets/icons/chicken1.jpeg');
    listImage.add('assets/icons/dog2.jpeg');
    listImage.add('assets/icons/chicken2.jpeg');
    listImage.add('assets/icons/chicken1.jpeg');
  }

  void addListReport(String itemTitle, String itemContent, List todo) {
    listReport.addAll(
      [
        NewFeedModel(
          urlPictureAvt: 'https://tinhte.vn/store/2016/10/3893837_1_1.jpg',
          urlPicture: todo,
          textContentNewFeed: itemContent.toString(),
          textTitleNewFeed: itemTitle.toString(),
        )
      ],
    );
    emit(NewFeedState());
    // NewFeedModel(
    //   textTitleNewFeed: "Thời trang",
    //   textContentNewFeed: "kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    //   urlPicture: [
    //     "assets/icons/cat1.jpeg",
    //     "assets/icons/cat2.jpeg",
    //     "assets/icons/cat1.jpeg",
    //
    //   ],
    //   urlPictureAvt: "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    // ),
    // NewFeedModel(
    //   textTitleNewFeed: "Thời su",
    //   urlPictureAvt: "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    //   textContentNewFeed:
    //       "  lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    //   urlPicture: [
    //     "assets/icons/cat1.jpeg",
    //   ],
    // ),
    // NewFeedModel(
    //   textTitleNewFeed: "Thời su",
    //   urlPictureAvt: "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    //   textContentNewFeed:
    //       "  lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    //   urlPicture: [
    //     "assets/icons/chicken1.jpeg",
    //     "assets/icons/chicken2.jpeg",
    //     "assets/icons/dog1.jpeg",
    //     "assets/icons/dog2.jpeg",
    //   ],
    // ),
    // NewFeedModel(
    //   textTitleNewFeed: "Thời su",
    //   urlPictureAvt: "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    //   textContentNewFeed:
    //       "  lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    //   urlPicture: [
    //   ],
    // ),
    // NewFeedModel(
    //   textTitleNewFeed: "Thời su",
    //   urlPictureAvt: "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    //   textContentNewFeed:
    //       "  lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    //   urlPicture: [
    //     "assets/icons/dog1.jpeg",
    //     "assets/icons/dog2.jpeg",
    //   ],
    // ),
  }
}

class NewFeedState {}

class NewFeedInitState extends NewFeedState {}

class NewFeedModel {
  String? textTitleNewFeed;
  String? textContentNewFeed;
  String? urlPictureAvt;
  List? urlPicture;

  NewFeedModel(
      {this.textContentNewFeed,
      this.textTitleNewFeed,
      this.urlPictureAvt,
      this.urlPicture});
}
// ReportState copyWith() {
//   return ReportState(textContentReport: textTitleReport,textTitleReport: textTitleReport );

const jsonReport = [
  {
    "Title": "Thời trang",
    "UrlPictureAvt": "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    "Content": "kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    "UrlPicture":
        "https://nld.mediacdn.vn/2020/5/29/doi-hoa-tim-5-1590731334546464136746.jpg",
  },
  {
    "Title": "Thời su",
    "UrlPictureAvt": "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    "Content":
        "  lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    "UrlPicture":
        "https://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-11_044127919.jpg",
  },
  {
    "Title": "Thời diem",
    "UrlPictureAvt": "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    "Content":
        "Nhiều cây xăng ở các tỉnh miền Tây lại diễn ra tình trạng đóng cửa, xin ngừng kinh doanh với lý do thua lỗ, hết vốn nhập hàng.",
    "UrlPicture":
        "https://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-5_044127233.jpg",
  },
  {
    "Title": "Thời the ",
    "UrlPictureAvt": "https://tinhte.vn/store/2016/10/3893837_1_1.jpg",
    "Content": "Ni lý do thua lỗ, hết vốn nhập hàng.",
    "UrlPicture":
        "https://taimienphi.vn/tmp/cf/aut/u4m1-GlxR-XuzQ-NJTd-50GJ-vPkW-hg9F-Q4W5-MHXN-iyjn-VfvL-3SmN-bUcU-naH6-hNIe-jsST-OAKi-krV7-5gGj-anh-dep-1.jpg",
  },
];
