@interface KTTapToRadar
+ (id)SASTTRRequestWithUnique:(id)a3 title:(id)a4 description:(id)a5 relatedRadar:(id)a6 radar:(id)a7 failingDevices:(id)a8 error:(id *)a9;
- (BOOL)hasRecentlyFiledTTRWithTapToRadarType:(id)a3;
- (_TtC13transparencyd12KTTapToRadar)init;
- (_TtC13transparencyd12KTTapToRadar)initWithDataStore:(id)a3 configBag:(id)a4 dewConfig:(id)a5;
- (void)clearTapToRadarWithUnique:(id)a3;
- (void)presentTapToRadarError:(id)a3 title:(id)a4 message:(id)a5;
- (void)presentTapToRadarRemote:(id)a3 fromHandle:(id)a4;
@end

@implementation KTTapToRadar

- (_TtC13transparencyd12KTTapToRadar)initWithDataStore:(id)a3 configBag:(id)a4 dewConfig:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_TtC13transparencyd12KTTapToRadar *)sub_1000AF228(v7, v8, v9);

  return v10;
}

- (BOOL)hasRecentlyFiledTTRWithTapToRadarType:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = KTTapToRadar.hasRecentlyFiledTTR(tapToRadarType:)(v8);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

+ (id)SASTTRRequestWithUnique:(id)a3 title:(id)a4 description:(id)a5 relatedRadar:(id)a6 radar:(id)a7 failingDevices:(id)a8 error:(id *)a9
{
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = v17;
  v19 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v21 = v20;
  unint64_t v22 = sub_1000AFC6C();
  unint64_t v23 = sub_1000AFCA8();
  uint64_t v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a8, &type metadata for Data, v22, v23);
  id v33 = a6;
  id v25 = a7;
  sub_1000AF454(v32, v15, v16, v18, v19, v21, a6, a7, v24);
  uint64_t v27 = v26;
  unint64_t v29 = v28;
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100072BE0(v27, v29);
  return isa;
}

- (void)presentTapToRadarRemote:(id)a3 fromHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v14 = v13;

  KTTapToRadar.presentTap(toRadarRemote:fromHandle:)(v9, v11, v12, v14);
  swift_bridgeObjectRelease(v14);
  sub_100072BE0(v9, v11);
}

- (void)clearTapToRadarWithUnique:(id)a3
{
  uint64_t v5 = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd12KTTapToRadar_dataStore);
  id v7 = self;
  id v8 = String._bridgeToObjectiveC()();
  [v6 storeTTR:0 withType:v8];

  swift_bridgeObjectRelease(v5);
}

- (void)presentTapToRadarError:(id)a3 title:(id)a4 message:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;
  uint64_t v9 = self;
  _s13transparencyd12KTTapToRadarC010presentTapcD5Error6unique5title7messageySS_S2StF_0(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (_TtC13transparencyd12KTTapToRadar)init
{
  result = (_TtC13transparencyd12KTTapToRadar *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTTapToRadar",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end