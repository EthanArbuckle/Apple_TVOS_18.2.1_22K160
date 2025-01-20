@interface EARLanguageDetectorAudioBuffer
- (_TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer)init;
- (void)addAudioSampleData:(id)a3;
- (void)endAudio;
@end

@implementation EARLanguageDetectorAudioBuffer

- (void)addAudioSampleData:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    id v3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    unint64_t v7 = v6;
  }

  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000LL;
  }

  sub_1000084DC((uint64_t)v3, v7);
  sub_100008FD4((uint64_t)v3, v7);
}

- (void)endAudio
{
  v2 = self;
  sub_1000086DC();
}

- (_TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer));
}

@end