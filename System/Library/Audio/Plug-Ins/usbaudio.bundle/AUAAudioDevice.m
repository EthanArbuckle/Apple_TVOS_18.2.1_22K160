@interface AUAAudioDevice
- (AUAAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (BOOL)changeClientDescription:(id)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (int)performStartIO;
- (int)performStopIO;
- (void)requestConfigurationChange:(id)a3;
@end

@implementation AUAAudioDevice

- (void)requestConfigurationChange:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_100103650, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1000179AC;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  AUAAudioDevice.requestConfigurationChangeWithTrace(function:file:line:_:)( 0xD00000000000001ELL,  0x80000001000CCEB0LL,  0xD00000000000001BLL,  0x80000001000CCED0LL,  724LL,  (uint64_t)v4,  v5);
  sub_100017978((uint64_t)v4, v5);
}

- (int)performStartIO
{
  v2 = self;
  Swift::Int32 started = AUAAudioDevice.performStartIO()();

  return started;
}

- (int)performStopIO
{
  v2 = self;
  Swift::Int32 v3 = AUAAudioDevice.performStopIO()();

  return v3;
}

- (BOOL)changeSamplingRate:(double)a3
{
  uint64_t v5 = swift_allocObject(&unk_100103628, 32LL, 7LL);
  *(void *)(v5 + 16) = self;
  *(double *)(v5 + 24) = a3;
  v6 = self;
  AUAAudioDevice.requestConfigurationChangeWithTrace(function:file:line:_:)( 0xD000000000000016LL,  0x80000001000CCF50LL,  0xD00000000000001BLL,  0x80000001000CCED0LL,  848LL,  (uint64_t)sub_100017B34,  v5);

  swift_release(v5);
  return 1;
}

- (BOOL)changeClientDescription:(id)a3
{
  if (a3) {
    v4 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    v4 = 0LL;
  }
  uint64_t v5 = self;
  v8.value._rawValue = v4;
  Swift::Bool v6 = AUAAudioDevice.changeClientDescription(_:)(v8);

  swift_bridgeObjectRelease(v4);
  return v6;
}

- (AUAAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v4 = a4;
  result = (AUAAudioDevice *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAAudioDevice",  24LL,  "init(deviceUID:with:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(void *)&self->ASDAudioDevice_opaque[OBJC_IVAR___AUAAudioDevice_timeCorrelaterSession]);
  swift_release(*(void *)&self->ASDAudioDevice_opaque[OBJC_IVAR___AUAAudioDevice_configChangedHandlers]);
  id v4 = &self->ASDAudioDevice_opaque[OBJC_IVAR___AUAAudioDevice_signpostID];
  uint64_t v5 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

@end