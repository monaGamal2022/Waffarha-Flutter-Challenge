/*  {
      "albumId":1,
      "id":3,
      "title":"officia porro iure quia iusto qui ipsa ut modi",
      "url":"https://via.placeholder.com/600/24f355",
      "thumbnailUrl":"https://via.placeholder.com/150/24f355"
   },
*/

class PhotoItemModel {
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final String albumId;

  PhotoItemModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
  });

  factory PhotoItemModel.fromMap(Map<String, dynamic> map) {
    return PhotoItemModel(
      id: map['id'].toString(),
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
      albumId: map['albumId'].toString(),
    );
  }
}
