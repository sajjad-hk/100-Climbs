import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hundred_climbs/src/services/auth.dart';

class TagService {
  final Firestore _db = Firestore.instance;

  Future tags() async {
    String uid = (await authService.getUser).uid;
    var ds = _db.collection('common-tags').document('tags').get();
    var dss = _db.collection('personal-tags').document(uid).get();

    Future t1 = ds.then((it) => it.data);
    Future t2 = dss.then((it) => it.data);

    return Future.wait([t1, t2]).then((it) {
      return it.map((it) => it.values).toList();
    });
  }

  Future<void> savePersonalTag(List<String> toCheck) async {
    String uid = (await authService.getUser).uid;

    List<String> tags = [
      ...((await this.tags())[0].toList())[0],
      ...((await this.tags())[1].toList())[0],
    ];

    var personalTagsRef = _db.collection('personal-tags').document(uid);

    Future t2 = personalTagsRef.get().then((it) => it.data);

    toCheck.forEach((it) {
      if (tags.contains(it)) {
        toCheck.remove(it);
      }
    });

    List<String> toSave = [...(await t2)['tags'], ...toCheck];

    return personalTagsRef.setData({
      'tags': [
        ...toSave,
      ]
    }, merge: true);
  }
}

final tagService = TagService();
