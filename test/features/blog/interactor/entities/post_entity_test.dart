import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const map = {
    "userId": 1,
    "id": 1,
    "title":
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body":
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  };
  test("fromMap", () {
    final entity = PostEntity.fromMap(map);
    expect(entity.userId, 1);
    expect(entity.id, 1);
    expect(
      entity.title,
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    );
    expect(
      entity.body,
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    );
  });
}
