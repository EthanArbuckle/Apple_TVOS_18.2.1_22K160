@interface RingManager
- (_TtC8FaceTime11RingManager)init;
- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4;
@end

@implementation RingManager

- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4
{
  uint64_t v7 = sub_100018A04(&qword_100114970);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v9, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000FA5D8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = self;
  v11[5] = a4;
  id v12 = a4;
  swift_retain_n(self, 2LL);
  id v13 = v12;
  id v14 = a3;
  uint64_t v15 = sub_10008033C((uint64_t)v9, (uint64_t)&unk_100114DB8, (uint64_t)v11);
  swift_release(v15);
  swift_release(self);
}

- (_TtC8FaceTime11RingManager)init
{
  result = (_TtC8FaceTime11RingManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.RingManager",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end