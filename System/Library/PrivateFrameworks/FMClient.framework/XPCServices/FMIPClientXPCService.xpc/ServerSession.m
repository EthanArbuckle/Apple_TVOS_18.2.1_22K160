@interface ServerSession
- (_TtC20FMIPClientXPCService13ServerSession)init;
- (void)clientConfigurationWithUpdateConfiguration:(id)a3 completion:(id)a4;
- (void)credentialDidFail:(id)a3 error:(id)a4 completion:(id)a5;
- (void)credentialWithCompletion:(id)a3;
- (void)deviceSearch:(id)a3 completion:(id)a4;
- (void)discoverNearbyDevicesWithCompletion:(id)a3;
- (void)invalidateCacheWithType:(int64_t)a3 completion:(id)a4;
- (void)playSound:(id)a3 completion:(id)a4;
- (void)voiceAssistantSyncWithCompletion:(id)a3;
@end

@implementation ServerSession

- (_TtC20FMIPClientXPCService13ServerSession)init
{
  result = (_TtC20FMIPClientXPCService13ServerSession *)_swift_stdlib_reportUnimplementedInitializer( "FMIPClientXPCService.ServerSession",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_voiceAssistantCacheQueue));
  v3 = (char *)self + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_clientProxyInstance));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_activeScanSerialQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_activeDeviceScans));
  sub_10000D20C( (uint64_t)self + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_clientConfigurationCache,  &qword_100077248);
  sub_100007A28((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession_deviceInformationProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20FMIPClientXPCService13ServerSession____lazy_storage___serverInteractionController));
}

- (void)clientConfigurationWithUpdateConfiguration:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10006B510, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100015734(a3, (uint64_t)sub_10001A1EC, v7);

  swift_release(v7);
}

- (void)voiceAssistantSyncWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10006B358, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100015A8C((uint64_t)sub_100019C30, v5);

  swift_release(v5);
}

- (void)invalidateCacheWithType:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10006B2E0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  sub_100016FC0(a3, (uint64_t)sub_10001A1F0, v7);

  swift_release(v7);
}

- (void)discoverNearbyDevicesWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10001980C((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)playSound:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for PlaySoundDevice(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_10006B128, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  v10 = self;
  sub_100017DAC(v8, (uint64_t)sub_100018EC8, v9);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)deviceSearch:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10006AFC0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_100018260(v8, (uint64_t)sub_100018D60, v7);

  swift_release(v7);
}

- (void)credentialWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10006DFB0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  uint64_t v7 = (void *)sub_100018C14();
  uint64_t v8 = swift_allocObject(&unk_10006DFD8, 32LL, 7LL);
  *(void *)(v8 + 16) = sub_100019C30;
  *(void *)(v8 + 24) = v5;
  v11[4] = sub_10003A000;
  uint64_t v12 = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_100013B84;
  v11[3] = &unk_10006DFF0;
  uint64_t v9 = _Block_copy(v11);
  uint64_t v10 = v12;
  swift_unknownObjectRetain(v7);
  swift_retain(v5);
  swift_release(v10);
  [v7 credential:v9];
  _Block_release(v9);

  swift_release(v5);
  swift_unknownObjectRelease(v7);
}

- (void)credentialDidFail:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_10006DF38, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_100039CB4((uint64_t)v10, (uint64_t)v11, (uint64_t)sub_100018EC8, v9);

  swift_release(v9);
}

@end