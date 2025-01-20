@interface RPWirelessPairingSession_Internal
- (BOOL)invalidated;
- (RPWirelessPairingSession_Internal)init;
- (void)dealloc;
- (void)endSession;
- (void)registerInvalidationHandlerWithInvokingOnQueue:(id)a3 handler:(id)a4;
@end

@implementation RPWirelessPairingSession_Internal

- (BOOL)invalidated
{
  v2 = self;
  BOOL v3 = sub_18842CF78((uint64_t)v2);

  return v3;
}

- (void)endSession
{
  v2 = self;
  sub_18842D0E0();
}

- (void)registerInvalidationHandlerWithInvokingOnQueue:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_18842D190(v8, (uint64_t)sub_1884294D8, v7);

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  WirelessPairingSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_18842CFFC(*(id *)((char *)&self->super.isa + OBJC_IVAR___RPWirelessPairingSession_Internal__state));
}

- (RPWirelessPairingSession_Internal)init
{
}

@end