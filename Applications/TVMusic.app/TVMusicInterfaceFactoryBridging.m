@interface TVMusicInterfaceFactoryBridging
+ (double)setup;
+ (id)viewForElement:(id)a3 existingView:(id)a4;
- (_TtC7TVMusic31TVMusicInterfaceFactoryBridging)init;
@end

@implementation TVMusicInterfaceFactoryBridging

+ (id)viewForElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)sub_10014DDDC(v5, a4);

  return v7;
}

- (_TtC7TVMusic31TVMusicInterfaceFactoryBridging)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVMusicInterfaceFactoryBridging();
  return -[TVMusicInterfaceFactoryBridging init](&v3, "init");
}

+ (double)setup
{
  uint64_t v0 = type metadata accessor for Mirror(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1002B70C8 != -1) {
    swift_once(&qword_1002B70C8, sub_1000E4238);
  }
  uint64_t v5 = qword_1002C5970;
  uint64_t v6 = *(void *)(qword_1002C5970 + 16);
  if (v6)
  {
    uint64_t v37 = v0;
    v7 = (void *)objc_opt_self(&OBJC_CLASS___TVElementFactory);
    uint64_t v8 = sub_1000E0418(0LL, &qword_1002B8388, &OBJC_CLASS___TVViewElement_ptr);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v8);
    swift_bridgeObjectRetain(v5);
    uint64_t v10 = v5 + 40;
    do
    {
      (*(void (**)(void))(*(void *)v10 + 8LL))();
      uint64_t v12 = v11;
      NSString v13 = String._bridgeToObjectiveC()();
      objc_msgSend( v7,  "registerViewElementClass:forElementName:",  ObjCClassFromMetadata,  v13,  swift_bridgeObjectRelease(v12).n128_f64[0]);

      v10 += 16LL;
      --v6;
    }

    while (v6);
    swift_bridgeObjectRelease(v5);
    uint64_t v0 = v37;
  }

  if (qword_1002B70C0 != -1) {
    swift_once(&qword_1002B70C0, sub_1000E3E0C);
  }
  uint64_t v14 = qword_1002C5968;
  *((void *)&v46 + 1) = type metadata accessor for TVMLStyle();
  *(void *)&__int128 v45 = v14;
  swift_retain(v14);
  uint64_t v15 = Mirror.init(reflecting:)(&v45);
  uint64_t v16 = Mirror.children.getter(v15);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v17 = swift_retain(v16);
  uint64_t v18 = dispatch thunk of _AnySequenceBox._makeIterator()(v17);
  uint64_t v37 = v16;
  __n128 v19 = swift_release(v16);
  dispatch thunk of _AnyIteratorBoxBase.next()(&v45, v19);
  if (*((void *)&v47 + 1))
  {
    v20 = _swiftEmptyArrayStorage;
    do
    {
      __int128 v43 = v45;
      v44[0] = v46;
      v44[1] = v47;
      __int128 v38 = v45;
      sub_1000E0094((uint64_t)v44, (uint64_t)v39);
      uint64_t v22 = sub_1000DFE10((uint64_t *)&unk_1002BBE30);
      if ((swift_dynamicCast(&v40, v39, (char *)&type metadata for Any + 8, v22, 6LL) & 1) == 0)
      {
        uint64_t v42 = 0LL;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
      }

      sub_1000E03B4((uint64_t)&v43, &qword_1002BB970);
      if (*((void *)&v41 + 1))
      {
        sub_100110D4C(&v40, (uint64_t)&v38);
        sub_100110D4C(&v38, (uint64_t)&v40);
        if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) == 0) {
          v20 = sub_10015AEA0(0LL, v20[2] + 1LL, 1, v20);
        }
        unint64_t v24 = v20[2];
        unint64_t v23 = v20[3];
        if (v24 >= v23 >> 1) {
          v20 = sub_10015AEA0((void *)(v23 > 1), v24 + 1, 1, v20);
        }
        v20[2] = v24 + 1;
        sub_100110D4C(&v40, (uint64_t)&v20[5 * v24 + 4]);
      }

      else
      {
        sub_1000E03B4((uint64_t)&v40, &qword_1002BB978);
      }

      dispatch thunk of _AnyIteratorBoxBase.next()(&v45, v21);
    }

    while (*((void *)&v47 + 1));
  }

  else
  {
    v20 = _swiftEmptyArrayStorage;
  }

  swift_release(v37);
  swift_release(v18);
  uint64_t v25 = v20[2];
  if (v25)
  {
    v26 = (void *)objc_opt_self(&OBJC_CLASS___TVStyleFactory);
    uint64_t v27 = (uint64_t)(v20 + 4);
    swift_bridgeObjectRetain(v20);
    do
    {
      sub_1000FF28C(v27, (uint64_t)&v45);
      uint64_t v28 = *((void *)&v46 + 1);
      uint64_t v29 = v47;
      sub_1000E0518(&v45, *((uint64_t *)&v46 + 1));
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v29);
      uint64_t v31 = v30;
      NSString v32 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v31);
      uint64_t v33 = *((void *)&v46 + 1);
      uint64_t v34 = v47;
      sub_1000E0518(&v45, *((uint64_t *)&v46 + 1));
      objc_msgSend( v26,  "registerStyle:withType:inherited:",  v32,  (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34),  0);

      sub_1000E053C(&v45);
      v27 += 40LL;
      --v25;
    }

    while (v25);
    swift_bridgeObjectRelease_n(v20, 2LL);
  }

  else
  {
    *(void *)&double result = swift_bridgeObjectRelease(v20).n128_u64[0];
  }

  return result;
}

@end