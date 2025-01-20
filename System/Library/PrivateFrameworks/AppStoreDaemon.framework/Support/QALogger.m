@interface QALogger
+ (id)serializeLedger;
+ (void)assetWithUrl:(id)a3 variant:(id)a4 isDelta:(BOOL)a5 isParallel:(BOOL)a6 logKey:(id)a7;
+ (void)displayedSpeedWithThroughput:(id)a3 logKey:(id)a4;
+ (void)installWithDuration:(double)a3 logKey:(id)a4;
+ (void)linearDownloadWithLogKey:(id)a3 metrics:(id)a4 throughputMin:(double)a5 throughputMax:(double)a6;
- (_TtC9appstored8QALogger)init;
@end

@implementation QALogger

+ (id)serializeLedger
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (void)assetWithUrl:(id)a3 variant:(id)a4 isDelta:(BOOL)a5 isParallel:(BOOL)a6 logKey:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v12 = sub_1000079A0((uint64_t *)&unk_100459B80);
  __chkstk_darwin(v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v15 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v14, 0LL, 1LL, v15);
  }

  else
  {
    uint64_t v16 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v14, 1LL, 1LL, v16);
  }

  if (a4)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v18;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  id v19 = a7;
  sub_10008C42C((uint64_t)v14, v17, (uint64_t)a4, v9, v8, a7);

  swift_bridgeObjectRelease(a4);
  sub_100015240((uint64_t)v14, (uint64_t *)&unk_100459B80);
}

+ (void)linearDownloadWithLogKey:(id)a3 metrics:(id)a4 throughputMin:(double)a5 throughputMax:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  sub_10008CA1C(a3, a4, a5, a6);
}

+ (void)installWithDuration:(double)a3 logKey:(id)a4
{
  v6 = (int *)type metadata accessor for QALogger.Install(0LL);
  __chkstk_darwin(v6);
  BOOL v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = qword_1004580B0;
  id v10 = (char *)a4;
  if (v9 != -1)
  {
    v18 = v10;
    swift_once(&qword_1004580B0, sub_100087098);
    id v10 = v18;
  }

  id v11 = (void *)qword_10045A648;
  if (qword_10045A648)
  {
    uint64_t v13 = *(void *)&v10[OBJC_IVAR____TtC9appstored6LogKey_value];
    uint64_t v12 = *(void *)&v10[OBJC_IVAR____TtC9appstored6LogKey_value + 8];
    v18 = v10;
    swift_bridgeObjectRetain(v12);
    static Date.now.getter(v14);
    uint64_t v15 = &v8[v6[5]];
    *(void *)uint64_t v15 = 0x6C6C6174736E69LL;
    *((void *)v15 + 1) = 0xE700000000000000LL;
    uint64_t v16 = &v8[v6[6]];
    *(void *)uint64_t v16 = v13;
    *((void *)v16 + 1) = v12;
    *(double *)&v8[v6[7]] = a3;
    sub_10008AA2C((uint64_t)v8, v11);
    sub_10008D7CC((uint64_t)v8, type metadata accessor for QALogger.Install);
  }

  else
  {
  }

+ (void)displayedSpeedWithThroughput:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_10008D4B0((uint64_t)v5, (uint64_t)v6);
}

- (_TtC9appstored8QALogger)init
{
  return (_TtC9appstored8QALogger *)sub_100087E7C();
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9appstored8QALogger_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end