@interface SRAudioDecoder
+ (unint64_t)totalFrames:(id)a3;
- (SRAudioDecoder)init;
- (SRAudioDecoder)initWithStreamDescription:(AudioStreamBasicDescription *)a3 error:(id *)a4;
- (id)decodeAudio:(id)a3 error:(id *)a4;
- (id)endWithError:(id *)a3;
@end

@implementation SRAudioDecoder

- (SRAudioDecoder)initWithStreamDescription:(AudioStreamBasicDescription *)a3 error:(id *)a4
{
  Float64 mSampleRate = a3->mSampleRate;
  __int128 v5 = *(_OWORD *)&a3->mBytesPerFrame;
  __int128 v11 = *(_OWORD *)&a3->mFormatID;
  __int128 v12 = v5;
  uint64_t v6 = type metadata accessor for OpusDecoder(0LL, a2);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___SRAudioDecoder_decoder) = (Class)OpusDecoder.init(destinationFormat:)(&mSampleRate);

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for SRAudioDecoder();
  return -[SRAudioDecoder init](&v9, "init");
}

- (id)decodeAudio:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  v7 = (void *)dispatch thunk of OpusDecoder.decode(audio:)(v5);

  return v7;
}

- (id)endWithError:(id *)a3
{
  v3 = self;
  v4 = (void *)dispatch thunk of OpusDecoder.end()();

  return v4;
}

+ (unint64_t)totalFrames:(id)a3
{
  id v3 = a3;
  unint64_t v4 = AudioData.sampleCount.getter();

  return v4;
}

- (SRAudioDecoder)init
{
  result = (SRAudioDecoder *)_swift_stdlib_reportUnimplementedInitializer( "speechmodeltrainingd.SRAudioDecoder",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end