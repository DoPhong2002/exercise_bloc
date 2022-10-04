import 'package:flutter_bloc/flutter_bloc.dart';

class BigCubit extends Cubit<BigState> {
  BigCubit() : super(BigInitState());
  List<ReportModel> listReport = [];
  List<ReportModel> listNewFeed = [];
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
        ReportModel(
          urlPictureAvt: 'https://tinhte.vn/store/2016/10/3893837_1_1.jpg',
          urlPicture: todo,
          textContentReport: itemContent.toString(),
          textTitleReport: itemTitle.toString(),
        )
      ],
    );
    emit(BigState());
  }
}

class BigState {}

class BigInitState extends BigState {}

class ReportModel {
  String? textTitleReport;
  String? textContentReport;
  String? urlPictureAvt;
  List? urlPicture;

  ReportModel(
      {this.textContentReport,
      this.textTitleReport,
      this.urlPictureAvt,
      this.urlPicture});
}