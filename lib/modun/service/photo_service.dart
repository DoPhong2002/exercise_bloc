import 'package:Flutter_father/models/photo.dart';
import 'package:Flutter_father/modun/service/api_service.dart';
import 'package:image_picker/image_picker.dart';

extension PhotoService on APIService {
  Future<Photo> upLoadAvatar({
    required XFile file,
  }) async {
    final result = await request(path: '/api/upload', file: file);
    final photo = Photo.fromJson(result);
    return photo;
  }
}
