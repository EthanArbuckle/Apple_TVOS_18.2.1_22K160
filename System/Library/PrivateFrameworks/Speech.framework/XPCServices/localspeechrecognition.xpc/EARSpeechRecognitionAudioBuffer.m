@interface EARSpeechRecognitionAudioBuffer
- (_TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer)init;
- (void)cancelRecognition;
- (void)endAudio;
- (void)packetArrivalTimestampFromAudioTimestamp:(float)a3 reply:(id)a4;
@end

@implementation EARSpeechRecognitionAudioBuffer

- (void)endAudio
{
  v2 = self;
  sub_10001DA20();
}

- (void)cancelRecognition
{
  v2 = self;
  sub_10001DA78();
}

- (void)packetArrivalTimestampFromAudioTimestamp:(float)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1000518B0, 40LL, 7LL);
  *(float *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  v8 = self;
  sub_10001DF94((uint64_t)&unk_10005C150, v7);
}

- (_TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer));
}

@end