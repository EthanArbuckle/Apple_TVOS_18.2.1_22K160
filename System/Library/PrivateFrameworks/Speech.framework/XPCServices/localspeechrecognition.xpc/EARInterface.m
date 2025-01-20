@interface EARInterface
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22localspeechrecognition12EARInterface)init;
- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6;
- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6;
- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8;
- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7;
- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8;
- (void)processStartTimeOnceWithReply:(id)a3;
@end

@implementation EARInterface

- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8
{
  v14 = _Block_copy(a8);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, &type metadata for String);
  uint64_t v16 = swift_allocObject(&unk_1000517E8, 24LL, 7LL);
  *(void *)(v16 + 16) = v14;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v21 = self;
  sub_10000E2A8(v17, v18, v19, a6, v15, (uint64_t)sub_100010548, v16);

  swift_bridgeObjectRelease(v15);
  swift_release(v16);
}

- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8
{
  BOOL v31 = a7;
  uint64_t v14 = sub_100004B88(&qword_10005C230);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = type metadata accessor for Locale(0LL);
  uint64_t v17 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  id v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v20 = _Block_copy(a8);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v23 = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v26 = v25;
  if (a6)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v27 = 0LL;
  }

  else
  {
    uint64_t v27 = 1LL;
  }

  uint64_t v28 = type metadata accessor for URL(0LL);
  sub_100006CF0((uint64_t)v16, v27, 1LL, v28);
  _Block_copy(v20);
  v29 = self;
  sub_10000E84C( (uint64_t)v19,  v21,  v23,  v24,  v26,  (uint64_t)v16,  v31,  (uint64_t)v29,  (void (**)(void, id, void))v20);
  _Block_release(v20);

  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v26);
  sub_100005658((uint64_t)v16, &qword_10005C230);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v30);
}

- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7
{
  uint64_t v13 = type metadata accessor for Locale(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = _Block_copy(a7);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v20 = v19;
  _Block_copy(v17);
  uint64_t v21 = self;
  sub_10000EDAC((uint64_t)v16, v18, v20, a5, a6, (uint64_t)v21, (void (**)(void, void, void))v17);
  _Block_release(v17);

  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_1000517C0, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = self;
  sub_10000F1F0(v12, v13, a5, (uint64_t)sub_1000104FC, v11);

  swift_release(v11);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000F860((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  _Block_copy(v10);
  uint64_t v18 = self;
  sub_10000FB18(v11, v13, v14, v15, v17, (uint64_t)v18, (void (**)(void, void, void))v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v17);
}

- (void)processStartTimeOnceWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000FF40((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (_TtC22localspeechrecognition12EARInterface)init
{
  return (_TtC22localspeechrecognition12EARInterface *)sub_10000FFEC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listeners));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock));
}

@end