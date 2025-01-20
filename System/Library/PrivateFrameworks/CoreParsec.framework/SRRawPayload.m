@interface SRRawPayload
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (SRRawPayload)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation SRRawPayload

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;

  swift_getObjCClassMetadata(a1);
  static RawPayload.event(with:dataVersion:)(v7, v9);
  v11 = v10;
  sub_100010A30(v7, v9);
  return v11;
}

- (id)serialize
{
  uint64_t v2 = RawPayload.data.getter();
  if (v3 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100010A1C(v5, v6);
  }

  return isa;
}

- (SRRawPayload)init
{
}

- (void).cxx_destruct
{
}

@end