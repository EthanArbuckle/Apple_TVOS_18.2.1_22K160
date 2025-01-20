@interface AUAStream
- (AUAStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)deviceChangedToSamplingRate:(double)a3;
- (id)channelCategoryForChannelIndex:(unsigned int)a3;
- (id)channelNameForChannelIndex:(unsigned int)a3;
- (id)channelNumberForChannelIndex:(unsigned int)a3;
- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4;
- (void)startStream;
- (void)stopStream;
@end

@implementation AUAStream

- (void)startStream
{
  v2 = self;
  AUAStream.start()();
}

- (void)stopStream
{
  v2 = self;
  AUAStream.stop()();
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  v4 = self;
  Swift::Bool v5 = AUAStream.deviceChanged(toSamplingRate:)(a3);

  return v5;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = AUAStream.changePhysicalFormat(_:)(v3);

  return v3 & 1;
}

- (id)channelNameForChannelIndex:(unsigned int)a3
{
  v4 = self;
  object = AUAStream.channelName(forChannelIndex:)(a3).value._object;

  if (object)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }

  else
  {
    NSString v6 = 0LL;
  }

  return v6;
}

- (id)channelCategoryForChannelIndex:(unsigned int)a3
{
  id v3 = self;
  sub_100029840( 0xD00000000000001ELL,  0x80000001000D0B70LL,  0xD000000000000021LL,  (void *)0x80000001000D0B90LL,  0xD000000000000016LL,  0x80000001000D0AD0LL,  680LL);

  return 0LL;
}

- (id)channelNumberForChannelIndex:(unsigned int)a3
{
  id v3 = self;
  sub_100029840( 0xD00000000000001CLL,  0x80000001000D0BC0LL,  0xD00000000000001FLL,  (void *)0x80000001000D0BE0LL,  0xD000000000000016LL,  0x80000001000D0AD0LL,  686LL);

  return 0LL;
}

- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4
{
  NSString v6 = self;
  AUAStream.preferredChannelDescription(_:forChannelIndex:)((uint64_t)a3, a4);
}

- (AUAStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  id v4 = a4;
  result = (AUAStream *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAStream",  19LL,  "init(direction:with:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = &self->ASDStream_opaque[OBJC_IVAR___AUAStream_signpostID];
  uint64_t v4 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = *(void *)&self->ASDStream_opaque[OBJC_IVAR___AUAStream_path];
  uint64_t v6 = *(void *)&self->streamingEndpoint[OBJC_IVAR___AUAStream_path];
  swift_bridgeObjectRelease(*(void *)&self->transferManager[OBJC_IVAR___AUAStream_path]);
  swift_release(v6);
  swift_release(v5);
  sub_100017A40(&self->ASDStream_opaque[OBJC_IVAR___AUAStream_streamingTerminal]);
  sub_100017A40(&self->ASDStream_opaque[OBJC_IVAR___AUAStream_otherTerminal]);
}

@end