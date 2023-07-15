import 'package:image_search_10day/data/data_source/pixabay_api.dart';
import 'package:image_search_10day/data/mapper/photo_mapper.dart';
import 'package:image_search_10day/domain/model/photo.dart';
import 'package:image_search_10day/domain/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    return resultDto.hits.map((e) => e.toPhoto()).toList();
  }
}
