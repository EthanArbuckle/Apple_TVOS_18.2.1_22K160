@interface AUAStreamFormat
- (AUAStreamFormat)init;
- (AUAStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (AUAStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3;
- (AUAStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6;
- (BOOL)isCompatible:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(void *)a3;
@end

@implementation AUAStreamFormat

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  -[AUAStreamFormat audioStreamBasicDescription](v3, "audioStreamBasicDescription");
  double v4 = v11;
  uint64_t v5 = *(void *)&v3->ASDStreamFormat_opaque[OBJC_IVAR___AUAStreamFormat_altSetting];
  unint64_t v6 = *(void *)&v3->ASDStreamFormat_opaque[OBJC_IVAR___AUAStreamFormat_rateRange];
  unint64_t v7 = *(void *)&v3->altSetting[OBJC_IVAR___AUAStreamFormat_rateRange];
  unint64_t v8 = *(void *)&v3->rateRange[OBJC_IVAR___AUAStreamFormat_rateRange];
  objc_allocWithZone((Class)type metadata accessor for AUAStreamFormat());
  swift_retain(v5);
  id v9 = sub_100032EB8((uint64_t)&v11, v5, v6, v7, v8);
  [v9 setSampleRate:v4];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v6);
    swift_unknownObjectRelease(a3, v7);
  }

  else
  {
    memset(v11, 0, sizeof(v11));
    unint64_t v8 = self;
  }

  BOOL v9 = sub_1000330D0((uint64_t)v11);

  sub_10003355C((uint64_t)v11);
  return v9;
}

- (BOOL)isCompatible:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v5 = a3;
  uint64_t v6 = self;
  LOBYTE(v3) = sub_100033388(v3);

  return v3 & 1;
}

- (AUAStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAStreamFormat",  25LL,  "init(sampleRate:numChannels:commonPCMFormat:isInterleaved:)",  59LL,  0LL);
  __break(1u);
  return result;
}

- (AUAStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAStreamFormat",  25LL,  "init(audioStreamBasicDescription:)",  34LL,  0LL);
  __break(1u);
  return result;
}

- (AUAStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAStreamFormat",  25LL,  "init(audioStreamRangedDescription:)",  35LL,  0LL);
  __break(1u);
  return result;
}

- (AUAStreamFormat)init
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAStreamFormat",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end