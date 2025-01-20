@interface RDSAPISwiftSpeechAnalyzer
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)init;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)initWithDelegate:(id)a3 locale:(id)a4 highPriority:(BOOL)a5 farField:(BOOL)a6 supportEmojiRecognition:(BOOL)a7;
- (id)getJitProfileData;
- (id)getUserProfileData;
- (void)addAudioSamplesPCMWithAudio:(id)a3;
- (void)addAudioSamplesWithAudio:(id)a3;
- (void)attachAnalysisContextWithCompletionHandler:(id)a3;
- (void)attachTranscriberWithTask:(NSString *)a3 completionHandler:(id)a4;
- (void)cancelRecognition;
- (void)dealloc;
- (void)endAudio;
- (void)newUtteranceBegins;
- (void)setContextWithJitProfileData:(id)a3;
- (void)setContextWithUserProfileData:(id)a3;
- (void)setRecognitionReplacementsWithUseRecognitionReplacements:(BOOL)a3 completionHandler:(id)a4;
- (void)setTextWithLeftContextText:(id)a3;
- (void)startRecognitionFromFile;
- (void)startRecognitionWithTranscriberModuleWrapper:(id)a3;
- (void)useRecognitionReplacements;
@end

@implementation RDSAPISwiftSpeechAnalyzer

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)initWithDelegate:(id)a3 locale:(id)a4 highPriority:(BOOL)a5 farField:(BOOL)a6 supportEmojiRecognition:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  v13 = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer *)sub_100056EBC( v11,  (uint64_t)v12,  v9,  v8,  v7);

  return v13;
}

- (void)dealloc
{
  v2 = self;
  v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SpeechAnalyzer deinit", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for RDSAPISwiftSpeechAnalyzer(0LL);
  -[RDSAPISwiftSpeechAnalyzer dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__delegate));
  v5 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__locale;
  uint64_t v6 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__speechAnalyzer));
  sub_10004BA28( (uint64_t)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__taskHint,  &qword_1000DD6B0);
  BOOL v7 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__modelOptions;
  uint64_t v8 = type metadata accessor for Transcriber.ModelOptions(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  swift_bridgeObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__transcriptionOptions),  v9);
  swift_bridgeObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__reportingOptions),  v10);
  sub_10004BA28( (uint64_t)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__analysisOptions,  &qword_1000DD6B8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__analysisContext));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__recognitionTask));
  id v11 = (char *)self
      + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStream;
  uint64_t v12 = sub_10004B5C0(&qword_1000DD6C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8LL))(v11, v12);
  v13 = (char *)self
      + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStreamBuilder;
  uint64_t v14 = sub_10004B5C0(&qword_1000DD6C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8LL))(v13, v14);
}

- (void)attachAnalysisContextWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10004B5C0(&qword_1000DD628);
  __chkstk_darwin(v5);
  BOOL v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000D0498, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  id v11 = (void *)swift_allocObject(&unk_1000D04C0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1000DD9B0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1000D04E8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1000DD9B8;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100054A80((uint64_t)v7, (uint64_t)&unk_1000DD9C0, (uint64_t)v12);
  swift_release(v14);
}

- (void)attachTranscriberWithTask:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10004B5C0(&qword_1000DD628);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject(&unk_1000D0420, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1000D0448, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1000DD990;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1000D0470, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1000DD998;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100054A80((uint64_t)v9, (uint64_t)&unk_1000DD9A0, (uint64_t)v14);
  swift_release(v17);
}

- (void)setRecognitionReplacementsWithUseRecognitionReplacements:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10004B5C0(&qword_1000DD628);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1000D0380, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1000D03A8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1000DD950;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1000D03D0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1000DD960;
  v14[5] = v13;
  uint64_t v15 = self;
  uint64_t v16 = sub_100054A80((uint64_t)v9, (uint64_t)&unk_1000DD970, (uint64_t)v14);
  swift_release(v16);
}

- (void)cancelRecognition
{
}

- (void)setTextWithLeftContextText:(id)a3
{
  uint64_t v5 = sub_10004B5C0(&qword_1000DD628);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v7, 1LL, 1LL, v11);
  uint64_t v12 = (void *)swift_allocObject(&unk_1000D0358, 56LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = self;
  v12[5] = v8;
  v12[6] = v10;
  v13 = self;
  id v14 = a3;
  uint64_t v15 = sub_10004ABD0((uint64_t)v7, (uint64_t)&unk_1000DD940, (uint64_t)v12);

  swift_release(v15);
}

- (id)getJitProfileData
{
  return result;
}

- (void)setContextWithJitProfileData:(id)a3
{
}

- (id)getUserProfileData
{
  return result;
}

- (void)setContextWithUserProfileData:(id)a3
{
}

- (void)useRecognitionReplacements
{
  v2 = self;
  RDSAPISwiftSpeechAnalyzer.useRecognitionReplacements()();
}

- (void)newUtteranceBegins
{
  v2 = self;
  RDSAPISwiftSpeechAnalyzer.newUtteranceBegins()();
}

- (void)addAudioSamplesWithAudio:(id)a3
{
  v4._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int16);
  uint64_t v5 = self;
  RDSAPISwiftSpeechAnalyzer.addAudioSamples(audio:)(v4);

  swift_bridgeObjectRelease(v4._rawValue, v6);
}

- (void)endAudio
{
}

- (void)addAudioSamplesPCMWithAudio:(id)a3
{
  uint64_t v5 = type metadata accessor for AnalyzerInput(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10004B5C0(&qword_1000DD6C8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10004B5C0(&qword_1000DD758);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))( v11,  (char *)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStreamBuilder,  v8);
  id v16 = a3;
  uint64_t v17 = self;
  CMTimeMake(&v19, 0LL, 1);
  AnalyzerInput.init(buffer:bufferStartTime:)(v16, v19.value, *(void *)&v19.timescale, v19.epoch, 0LL);
  AsyncStream.Continuation.yield(_:)(v7, v8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)startRecognitionWithTranscriberModuleWrapper:(id)a3
{
  uint64_t v5 = sub_10004B5C0(&qword_1000DD628);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 1LL, 1LL, v8);
  uint64_t v9 = (void *)swift_allocObject(&unk_1000D02E0, 48LL, 7LL);
  v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = self;
  v9[5] = a3;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = v10;
  uint64_t v13 = sub_10004ABD0((uint64_t)v7, (uint64_t)&unk_1000DD928, (uint64_t)v9);
  uint64_t v14 = *(uint64_t *)((char *)&v11->super.isa
                   + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__recognitionTask);
  *(Class *)((char *)&v11->super.isa
           + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__recognitionTask) = (Class)v13;

  swift_release(v14);
}

- (void)startRecognitionFromFile
{
  v2 = self;
  RDSAPISwiftSpeechAnalyzer.startRecognitionFromFile()();
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)init
{
  id result = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_SpeechRecognitionCore_speechrecognitiond.RDSAPISwiftSpeechAnalyzer",  76LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end