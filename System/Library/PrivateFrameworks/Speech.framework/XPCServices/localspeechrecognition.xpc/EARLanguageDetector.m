@interface EARLanguageDetector
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22localspeechrecognition19EARLanguageDetector)init;
- (void)modelInfoWithReply:(id)a3;
- (void)runLanguageDetectionWithResultStream:(id)a3 samplingRate:(unint64_t)a4 reply:(id)a5;
- (void)supportedLocalesWithReply:(id)a3;
@end

@implementation EARLanguageDetector

- (void)supportedLocalesWithReply:(id)a3
{
}

- (void)modelInfoWithReply:(id)a3
{
}

- (void)runLanguageDetectionWithResultStream:(id)a3 samplingRate:(unint64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_100007D08(v9, a4, (uint64_t)v10, (void (**)(void, void, void))v8);
  _Block_release(v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_100008064((uint64_t)v6, v7);

  return v9;
}

- (_TtC22localspeechrecognition19EARLanguageDetector)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListeners));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock));
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions);
  sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales));
}

@end