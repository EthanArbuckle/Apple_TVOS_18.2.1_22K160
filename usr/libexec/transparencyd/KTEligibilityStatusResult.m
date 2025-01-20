@interface KTEligibilityStatusResult
+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4;
+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4 dateStored:(id)a5;
+ (id)statusResultWithSuccessWithElement:(id)a3;
+ (id)statusResultWithSuccessWithElement:(id)a3 dateStored:(id)a4;
- (NSDate)dateStored;
- (NSString)description;
- (_TtC13transparencyd25KTEligibilityStatusResult)init;
- (int64_t)result;
@end

@implementation KTEligibilityStatusResult

- (int64_t)result
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result);
}

- (NSDate)dateStored
{
  uint64_t v3 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100085DFC((uint64_t)self + OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSDate *)isa;
}

- (NSString)description
{
  v2 = self;
  sub_1000CD370();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

+ (id)statusResultWithSuccessWithElement:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata(a1);
  uint64_t v5 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v7, 1LL, 1LL, v11);
  v12 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v12[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_error] = 0LL;
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_element];
  uint64_t *v13 = v8;
  v13[1] = v10;
  sub_100085DFC((uint64_t)v7, (uint64_t)&v12[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored]);
  v17.receiver = v12;
  v17.super_class = ObjCClassMetadata;
  *(void *)&double v14 = swift_bridgeObjectRetain(v10).n128_u64[0];
  id v15 = objc_msgSendSuper2(&v17, "init", v14);
  sub_100077CFC((uint64_t)v7, (uint64_t *)&unk_1002DF740);
  swift_bridgeObjectRelease(v10);
  return v15;
}

+ (id)statusResultWithSuccessWithElement:(id)a3 dateStored:(id)a4
{
  uint64_t v7 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  v12 = (char *)&v24 - v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v16 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v12, 0LL, 1LL, v16);
  }

  else
  {
    uint64_t v17 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v12, 1LL, 1LL, v17);
  }

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata(a1);
  sub_100085DFC((uint64_t)v12, (uint64_t)v10);
  v19 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v19[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result] = 0LL;
  *(void *)&v19[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_error] = 0LL;
  v20 = (uint64_t *)&v19[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_element];
  uint64_t *v20 = v13;
  v20[1] = v15;
  sub_100085DFC((uint64_t)v10, (uint64_t)&v19[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored]);
  v24.receiver = v19;
  v24.super_class = ObjCClassMetadata;
  *(void *)&double v21 = swift_bridgeObjectRetain(v15).n128_u64[0];
  id v22 = objc_msgSendSuper2(&v24, "init", v21);
  sub_100077CFC((uint64_t)v10, (uint64_t *)&unk_1002DF740);
  swift_bridgeObjectRelease(v15);
  sub_100077CFC((uint64_t)v12, (uint64_t *)&unk_1002DF740);
  return v22;
}

+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4 dateStored:(id)a5
{
  uint64_t v8 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v14 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v10, 0LL, 1LL, v14);
  }

  else
  {
    uint64_t v15 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v10, 1LL, 1LL, v15);
  }

  id v16 = a4;
  id v17 = sub_1000D4EE4(v11, v13, v16, (uint64_t)v10);

  swift_bridgeObjectRelease(v13);
  sub_100077CFC((uint64_t)v10, (uint64_t *)&unk_1002DF740);
  return v17;
}

+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  id v8 = a4;
  id v9 = sub_1000D5000(v5, v7, v8);

  swift_bridgeObjectRelease(v7);
  return v9;
}

- (_TtC13transparencyd25KTEligibilityStatusResult)init
{
  result = (_TtC13transparencyd25KTEligibilityStatusResult *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTEligibilityStatusResult",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end