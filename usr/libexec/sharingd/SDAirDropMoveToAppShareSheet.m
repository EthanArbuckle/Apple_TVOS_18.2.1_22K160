@interface SDAirDropMoveToAppShareSheet
- (_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet)init;
- (void)showShareSheetWith:(id)a3 completion:(id)a4;
@end

@implementation SDAirDropMoveToAppShareSheet

- (void)showShareSheetWith:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = type metadata accessor for URL(0LL);
  v12 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  uint64_t v13 = swift_allocObject(&unk_1005E20E8, 24LL, 7LL);
  *(void *)(v13 + 16) = v10;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v9, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_1005E2110, 64LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = self;
  v15[5] = v12;
  v15[6] = sub_1004411B4;
  v15[7] = v13;
  v16 = self;
  swift_bridgeObjectRetain(v12);
  swift_retain();
  uint64_t v17 = sub_1001B37E8((uint64_t)v9, (uint64_t)&unk_100655B88, (uint64_t)v15);

  swift_bridgeObjectRelease(v12);
  swift_release(v13);
  swift_release(v17);
}

- (_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SDAirDropMoveToAppShareSheet init](&v3, "init");
}

@end