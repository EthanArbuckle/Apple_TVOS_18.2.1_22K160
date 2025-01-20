@interface StoreItemResponseSwift
+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5;
+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5 now:(id)a6 hourSpreadFactor:(id)a7;
- (_TtC9appstored22StoreItemResponseSwift)init;
@end

@implementation StoreItemResponseSwift

+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5
{
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_1000079A0(&qword_100458558);
  __chkstk_darwin(v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getObjCClassMetadata(a1);
  static Date.now.getter();
  sub_100008214(a3, a4, (uint64_t)v12, (uint64_t)v15, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v17 = type metadata accessor for DateInterval(0LL, v16);
  uint64_t v18 = *(void *)(v17 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1LL, v17) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
  }

  return isa;
}

+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5 now:(id)a6 hourSpreadFactor:(id)a7
{
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_1000079A0(&qword_100458558);
  __chkstk_darwin(v17);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v20 = _Block_copy(a7);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a6);
  swift_getObjCClassMetadata(a1);
  _Block_copy(v20);
  sub_100008C30(a3, a4, (uint64_t)v16, (uint64_t (**)(void))v20, (uint64_t)v19, a5);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  _Block_release(v20);
  uint64_t v22 = type metadata accessor for DateInterval(0LL, v21);
  uint64_t v23 = *(void *)(v22 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v19, 1LL, v22) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);
  }

  return isa;
}

- (_TtC9appstored22StoreItemResponseSwift)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[StoreItemResponseSwift init](&v3, "init");
}

@end