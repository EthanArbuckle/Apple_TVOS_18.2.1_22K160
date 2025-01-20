@interface DaemonXPCHandler
- (_TtC13SiriTTSDaemon16DaemonXPCHandler)init;
- (void)adjustVolumeWithAccessoryId:(id)a3 volume:(float)a4 rampTime:(double)a5 didFinish:(id)a6;
- (void)cancelWithRequest:(id)a3;
- (void)clearDeviceCacheWithDidFinish:(id)a3;
- (void)downloadedVoicesMatching:(id)a3 reply:(id)a4;
- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4;
- (void)forwardWithStreamObject:(id)a3;
- (void)getAudioPowerWithAccessoryId:(id)a3 reply:(id)a4;
- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4;
- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4;
- (void)isSpeakingWithAccessoryId:(id)a3 reply:(id)a4;
- (void)keepActive:(BOOL)a3 reply:(id)a4;
- (void)killDaemon;
- (void)prewarmWithRequest:(id)a3 reply:(id)a4;
- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4;
- (void)signalWithInlineStreaming:(id)a3;
- (void)speakWithAudioRequest:(id)a3 reply:(id)a4;
- (void)speakWithPreviewRequest:(id)a3 reply:(id)a4;
- (void)speakWithSpeechRequest:(id)a3 reply:(id)a4;
- (void)subscribeWithVoices:(id)a3 clientId:(id)a4 accessoryId:(id)a5 reply:(id)a6;
- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4;
- (void)synthesizeWithRequest:(id)a3 reply:(id)a4;
- (void)textToPhonemeWithRequest:(id)a3 reply:(id)a4;
@end

@implementation DaemonXPCHandler

- (void)keepActive:(BOOL)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_10001D048(a3, (char *)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)prewarmWithRequest:(id)a3 reply:(id)a4
{
}

- (void)speakWithPreviewRequest:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100031F80, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100017648(v8, (uint64_t)sub_100025CD4, v7);

  swift_release(v7);
}

- (void)speakWithAudioRequest:(id)a3 reply:(id)a4
{
}

- (void)speakWithSpeechRequest:(id)a3 reply:(id)a4
{
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000209B4(v4);
}

- (void)synthesizeWithRequest:(id)a3 reply:(id)a4
{
}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
}

- (void)textToPhonemeWithRequest:(id)a3 reply:(id)a4
{
}

- (void)signalWithInlineStreaming:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100023624( v4,  "Received inline streaming signal %@",  (void (*)(void))&dispatch thunk of InlineStreamingStorage.add(signal:));
}

- (void)forwardWithStreamObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100023624( v4,  "Received inline stream object %@",  (void (*)(void))&dispatch thunk of InlineStreamingStorage.enqueue(streamObject:));
}

- (void)subscribeWithVoices:(id)a3 clientId:(id)a4 accessoryId:(id)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = type metadata accessor for SynthesisVoice(0LL);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v15 = v14;
  if (a5)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v17;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  _Block_copy(v10);
  v18 = self;
  sub_100023808(v12, v13, v15, v16, (unint64_t)a5, (uint64_t)v18, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(a5);
}

- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v9 = swift_allocObject(&unk_100031C60, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  v10 = self;
  sub_10000F85C(v7, (uint64_t)a3, (uint64_t)sub_1000252E8, v9);

  swift_release(v9);
  swift_bridgeObjectRelease(a3);
}

- (void)downloadedVoicesMatching:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void *, Class))_Block_copy(a4);
  id v7 = a3;
  uint64_t v13 = self;
  uint64_t v8 = dispatch thunk of TrialAssetProvider.listVoices(_:)(a3);
  uint64_t v9 = type metadata accessor for PreinstalledVoiceProvider(0LL);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  uint64_t v10 = PreinstalledVoiceProvider.init()();
  uint64_t v11 = dispatch thunk of PreinstalledVoiceProvider.listVoices(_:)(a3);
  swift_release(v10);
  sub_1000079D0(v11);
  type metadata accessor for SynthesisVoice(0LL);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v6[2](v6, isa);
  swift_bridgeObjectRelease(v8);

  _Block_release(v6);
}

- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
}

- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4
{
}

- (void)isSpeakingWithAccessoryId:(id)a3 reply:(id)a4
{
}

- (void)getAudioPowerWithAccessoryId:(id)a3 reply:(id)a4
{
}

- (void)adjustVolumeWithAccessoryId:(id)a3 volume:(float)a4 rampTime:(double)a5 didFinish:(id)a6
{
  uint64_t v11 = sub_100002728(&qword_100035B28);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v14 = _Block_copy(a6);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v15 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v13, 0LL, 1LL, v15);
  }

  else
  {
    uint64_t v16 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  }

  _Block_copy(v14);
  v17 = self;
  sub_100024600((uint64_t)v13, (uint64_t)v14, a4, a5);
  _Block_release(v14);
  _Block_release(v14);

  sub_10000A508((uint64_t)v13, &qword_100035B28);
}

- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4
{
}

- (void)clearDeviceCacheWithDidFinish:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100024FCC((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC13SiriTTSDaemon16DaemonXPCHandler)init
{
  result = (_TtC13SiriTTSDaemon16DaemonXPCHandler *)_swift_stdlib_reportUnimplementedInitializer( "SiriTTSDaemon.DaemonXPCHandler",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_remoteDelegate));
  v3 = (char *)self + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_entitlements;
  uint64_t v4 = type metadata accessor for Entitlements(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_preferences));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_trialAssetProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_subscriptionService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_activeSession));
}

- (void)killDaemon
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = static Logger.service.getter(v2);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Receive command to kill daemon.", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  exit(0);
}

@end