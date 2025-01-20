@interface EARSpeechRecognitionResultStream
- (_TtC22localspeechrecognition32EARSpeechRecognitionResultStream)init;
- (void)dealloc;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultMultiUserPackages:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5;
@end

@implementation EARSpeechRecognitionResultStream

- (void)dealloc
{
  v2 = self;
  sub_100023980();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_modelContextDelegateInterface));
  sub_100004C1C((uint64_t)self + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_asrID);
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100023A88((uint64_t)v8, a4);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023C98((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023D14((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023D90((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultMultiUserPackages:(id)a4
{
  uint64_t v7 = sub_1000091B8(0LL, (unint64_t *)&unk_10005C360, &OBJC_CLASS____EARSpeechRecognitionResultPackage_ptr);
  id v8 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  v7,  &protocol witness table for String);
  id v9 = a3;
  v10 = self;
  sub_100023E0C((uint64_t)v10, (uint64_t)v8);

  swift_bridgeObjectRelease(v8, v11, v12, v13, v14, v15, v16, v17);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023F24((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023FA0((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100024078();
}

- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  uint64_t v19 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  v20 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a7,  v19);
  id v21 = a3;
  v22 = self;
  sub_1000240EC(a6, a8, a10, (uint64_t)v22, a4, a5, (uint64_t)v20, a9);

  swift_bridgeObjectRelease(v20, v23, v24, v25, v26, v27, v28, v29);
}

- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5
{
  if (a5) {
    id v8 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = a3;
  v10 = self;
  sub_100024274((uint64_t)v10, a4);

  swift_bridgeObjectRelease(v8, v11, v12, v13, v14, v15, v16, v17);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  uint64_t v5 = sub_1000091B8(0LL, &qword_10005C358, &OBJC_CLASS____EARSpeechRecognitionResult_ptr);
  id v6 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a4,  v5);
  swift_bridgeObjectRelease(v6, v7, v8, v9, v10, v11, v12, v13);
}

- (_TtC22localspeechrecognition32EARSpeechRecognitionResultStream)init
{
}

@end