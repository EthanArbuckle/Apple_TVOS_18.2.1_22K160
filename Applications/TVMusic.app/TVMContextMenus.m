@interface TVMContextMenus
+ (id)getCurrentMusicItemFromTracklist:(id)a3;
+ (id)menuForNowPlayingItem:(id)a3;
+ (id)menuWithLibraryObjectWithProperties:(id)a3;
+ (id)menuWithLibraryObjectWithoutProperties:(id)a3;
+ (void)getPropertiesWithLibraryObject:(id)a3 completion:(id)a4;
- (TVMContextMenus)init;
@end

@implementation TVMContextMenus

+ (id)menuWithLibraryObjectWithProperties:(id)a3
{
  return sub_10017C760( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)&unk_1002767E8,  (uint64_t)sub_1001853E0,  (uint64_t)&unk_100276800);
}

+ (id)menuWithLibraryObjectWithoutProperties:(id)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  uint64_t v5 = swift_allocObject(&unk_1002763A8, 32LL, 7LL);
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = ObjCClassMetadata;
  v6 = (void *)objc_opt_self(&OBJC_CLASS___UIContextMenuConfiguration);
  v12[4] = sub_10018514C;
  uint64_t v13 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256LL;
  v12[2] = sub_100181D38;
  v12[3] = &unk_1002763C0;
  v7 = _Block_copy(v12);
  uint64_t v8 = v13;
  id v9 = a3;
  swift_retain(v5);
  id v10 =  objc_msgSend( v6,  "configurationWithIdentifier:previewProvider:actionProvider:",  0,  0,  v7,  swift_release(v8).n128_f64[0]);
  swift_release(v5);
  _Block_release(v7);

  return v10;
}

+ (id)menuForNowPlayingItem:(id)a3
{
  return sub_10017C760( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)&unk_100275B48,  (uint64_t)sub_100184A08,  (uint64_t)&unk_100275B60);
}

+ (void)getPropertiesWithLibraryObject:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v7, v8);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject(&unk_100275AF8, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v10, 1LL, 1LL, v14);
  type metadata accessor for MainActor(0LL);
  id v15 = a3;
  uint64_t v16 = swift_retain(v12);
  uint64_t v17 = static MainActor.shared.getter(v16);
  v18 = (void *)swift_allocObject(&unk_100275B20, 64LL, 7LL);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = ObjCClassMetadata;
  v18[5] = v15;
  v18[6] = sub_100184938;
  v18[7] = v12;
  uint64_t v19 = sub_100125950((uint64_t)v10, (uint64_t)&unk_1002BCB60, (uint64_t)v18);
  swift_release(v19);
  swift_release(v12);
}

+ (id)getCurrentMusicItemFromTracklist:(id)a3
{
  id v3 = a3;
  id v4 = sub_100184394(v3);

  return v4;
}

- (TVMContextMenus)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContextMenus();
  return -[TVMContextMenus init](&v3, "init");
}

@end