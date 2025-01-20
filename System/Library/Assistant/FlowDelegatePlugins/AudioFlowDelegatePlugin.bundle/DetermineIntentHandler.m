@interface DetermineIntentHandler
- (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler)init;
- (void)confirmDetermine:(id)a3 completion:(id)a4;
- (void)handleDetermine:(id)a3 completion:(id)a4;
- (void)resolveNowPlayingIntentInfoForDetermine:(id)a3 withCompletion:(id)a4;
@end

@implementation DetermineIntentHandler

- (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler)init
{
  return (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler *)DetermineIntentHandler.init()();
}

- (void)resolveNowPlayingIntentInfoForDetermine:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_26F998, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  DetermineIntentHandler.resolveNowPlayingIntentInfo(for:with:)(v8, (uint64_t)sub_FBC6C, v7);

  swift_release(v7);
}

- (void)confirmDetermine:(id)a3 completion:(id)a4
{
}

- (void)handleDetermine:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  sub_6C3C((Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC23AudioFlowDelegatePlugin22DetermineIntentHandler_nowPlayingProvider));
  sub_6C3C((Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC23AudioFlowDelegatePlugin22DetermineIntentHandler_siriKitTaskLoggingProvider));
}

@end