@interface EARSpeechRecognizer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22localspeechrecognition19EARSpeechRecognizer)init;
- (void)dealloc;
- (void)isSpeechProfileUsedWithReply:(id)a3;
- (void)modelInfoSamplingRatesWithReply:(id)a3;
- (void)modelInfoWithReply:(id)a3;
- (void)modelLoadTimeWithReply:(id)a3;
- (void)prepareForReuseWithNewSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6;
- (void)recognitionMetricsWithReply:(id)a3;
- (void)recognitionStatisticsWithReply:(id)a3;
- (void)recognitionUtterenceStatisticsWithReply:(id)a3;
- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5;
- (void)rightContextWithReply:(id)a3;
- (void)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 reply:(id)a7;
- (void)setExtraLmList:(id)a3 sandboxExtensions:(id)a4;
- (void)setRightContext:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setUserProfileData:(id)a3;
- (void)speechProfileCodepathIdsWithReply:(id)a3;
- (void)updateJitProfileData:(id)a3;
- (void)updateUserProfileData:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation EARSpeechRecognizer

- (void)dealloc
{
  v2 = self;
  sub_100018EC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_transaction));
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream);
  sub_100023518(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock));
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr);
  sub_100023518(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface);
  sub_100022E60( (uint64_t)self + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate,  &qword_10005C200);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion);
  swift_bridgeObjectRelease(*(void *)&self->recognizer[OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID]);
}

- (void)prepareForReuseWithNewSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_100019094(v10, v11, v12, a6);
}

- (void)modelInfoSamplingRatesWithReply:(id)a3
{
}

- (void)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 reply:(id)a7
{
  id v12 = _Block_copy(a7);
  id v13 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v18 = v17;
  _Block_copy(v12);
  id v19 = a3;
  v20 = self;
  sub_100019F44(v19, v13, v15, v16, v18, a6, (uint64_t)v20, (void (**)(void, void, void))v12);
  _Block_release(v12);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_10001AEF4((uint64_t)v6, v7);

  return v9;
}

- (void)setExtraLmList:(id)a3 sandboxExtensions:(id)a4
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v8 = self;
  sub_10001B114();

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
}

- (void)setUserProfileData:(id)a3
{
}

- (void)updateUserProfileData:(id)a3
{
}

- (void)updateJitProfileData:(id)a3
{
}

- (void)rightContextWithReply:(id)a3
{
}

- (void)modelInfoWithReply:(id)a3
{
}

- (void)recognitionStatisticsWithReply:(id)a3
{
}

- (void)recognitionUtterenceStatisticsWithReply:(id)a3
{
}

- (void)recognitionMetricsWithReply:(id)a3
{
}

- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5
{
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v13 = v12;
  uint64_t v14 = self;
  sub_10001BC20();

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v13);
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  if (a3)
  {
    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v57 = v15;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v52 = 0LL;
    v56 = 0LL;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v51 = 0LL;
    v53 = 0LL;
    goto LABEL_8;
  }

  uint64_t v54 = 0LL;
  v57 = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v56 = v16;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v53 = v17;
LABEL_8:
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = self;
  id v24 = a6;
  v25 = v23;
  sub_10001BF08( v54,  (uint64_t)v57,  v52,  v56,  v51,  v53,  (uint64_t)v24,  (uint64_t)a7,  (uint64_t)a8,  (uint64_t)a9,  (uint64_t)a10);

  swift_bridgeObjectRelease(v53, v26, v27, v28, v29, v30, v31, v32, v47, v49);
  swift_bridgeObjectRelease(v56, v33, v34, v35, v36, v37, v38, v39, v48, v50);
  swift_bridgeObjectRelease(v57, v40, v41, v42, v43, v44, v45, v46, a9, a10);
}

- (void)isSpeechProfileUsedWithReply:(id)a3
{
}

- (void)speechProfileCodepathIdsWithReply:(id)a3
{
}

- (void)modelLoadTimeWithReply:(id)a3
{
}

- (void)setRightContext:(id)a3
{
}

- (void)setSelectedText:(id)a3
{
}

- (_TtC22localspeechrecognition19EARSpeechRecognizer)init
{
}

@end