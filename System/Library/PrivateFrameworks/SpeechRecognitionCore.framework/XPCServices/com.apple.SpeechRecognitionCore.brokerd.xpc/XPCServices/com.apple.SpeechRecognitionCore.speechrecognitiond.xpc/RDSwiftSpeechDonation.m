@interface RDSwiftSpeechDonation
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)init;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)initWithDonorBundleID:(id)a3 donorReferenceID:(id)a4 recordingDate:(id)a5 locale:(id)a6 taskHint:(id)a7 transcription:(id)a8;
- (void)donateWithAudioBuffers:(id)a3 logAudioFile:(BOOL)a4;
@end

@implementation RDSwiftSpeechDonation

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)initWithDonorBundleID:(id)a3 donorReferenceID:(id)a4 recordingDate:(id)a5 locale:(id)a6 taskHint:(id)a7 transcription:(id)a8
{
  v30[1] = self;
  type metadata accessor for Locale(0LL);
  __chkstk_darwin();
  v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for Date(0LL);
  __chkstk_darwin();
  v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v20 = v19;
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v23 = v22;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  uint64_t v26 = v25;
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  return (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation *)RDSwiftSpeechDonation.init(donorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:)( v18,  v20,  v21,  v23,  (uint64_t)v17,  (uint64_t)v15,  v24,  v26,  v27,  v28);
}

- (void)donateWithAudioBuffers:(id)a3 logAudioFile:(BOOL)a4
{
  unint64_t v7 = sub_10004B8A8();
  v8._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = self;
  RDSwiftSpeechDonation.donate(audioBuffers:logAudioFile:)(v8, a4);

  swift_bridgeObjectRelease(v8._rawValue, v10);
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)init
{
  result = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_SpeechRecognit ionCore_speechrecognitio nd.RDSwiftSpeechDonation",  72LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v4 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_recordingDate;
  uint64_t v5 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  v6 = (char *)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_locale;
  uint64_t v7 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_audioFormat));
  swift_bridgeObjectRelease( *(void *)&self->donorBundleID[OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_transcription],  v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_file));
  swift_bridgeObjectRelease( *(void *)&self->donorBundleID[OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_audioPath],  v9);
  uint64_t v10 = (char *)self
      + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_logger;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);
}

@end