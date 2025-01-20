@interface LocationManagerDelegateTrampoline
- (_TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManagerDelegateTrampoline

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100022898(0LL, (unint64_t *)&qword_1009A5510, &OBJC_CLASS___CLLocation_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  uint64_t Strong = swift_weakLoadStrong( (char *)self + OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    uint64_t v13 = Strong;
    uint64_t v14 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v9, 1LL, 1LL, v14);
    v15 = (void *)swift_allocObject(&unk_10096F3C0, 48LL, 7LL);
    v15[2] = 0LL;
    v15[3] = 0LL;
    v15[4] = v13;
    v15[5] = v11;
    id v16 = a3;
    v17 = self;
    swift_bridgeObjectRetain(v11);
    sub_1003EDB00((uint64_t)v9, (uint64_t)&unk_1009B9940, (uint64_t)v15);

    swift_bridgeObjectRelease();
    swift_release();
  }

  else
  {
    swift_bridgeObjectRelease();
  }

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v7 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t Strong = swift_weakLoadStrong( (char *)self + OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
    uint64_t v13 = (void *)swift_allocObject(&unk_10096F398, 48LL, 7LL);
    v13[2] = 0LL;
    v13[3] = 0LL;
    v13[4] = v11;
    v13[5] = a4;
    id v14 = a4;
    id v15 = a3;
    id v16 = self;
    sub_1003EDB00((uint64_t)v9, (uint64_t)&unk_1009B9920, (uint64_t)v13);

    swift_release();
  }

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t Strong = swift_weakLoadStrong( (char *)self + OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
    uint64_t v11 = (void *)swift_allocObject(&unk_10096F370, 40LL, 7LL);
    v11[2] = 0LL;
    v11[3] = 0LL;
    v11[4] = v9;
    id v12 = a3;
    uint64_t v13 = self;
    sub_1003EDB00((uint64_t)v7, (uint64_t)&unk_1009B9910, (uint64_t)v11);

    swift_release();
  }

- (_TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_weakInit( (char *)self + OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target,  0LL);
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LocationManagerDelegateTrampoline init](&v5, "init");
}

- (void).cxx_destruct
{
}

@end