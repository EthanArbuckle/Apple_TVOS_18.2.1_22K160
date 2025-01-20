@interface APSDefaultConnectionRetryStateManager
- (APSDefaultConnectionRetryStateManager)init;
- (BOOL)shouldDelayNextReconnect;
- (double)currentDelay;
- (void)noteConnectionAttemptFailed;
- (void)noteConnectionAttemptStart;
- (void)noteConnectionEstablished;
- (void)notePresenceFailure;
- (void)notePresenceSuccess;
@end

@implementation APSDefaultConnectionRetryStateManager

- (double)currentDelay
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  double v4 = COERCE_DOUBLE(v2());
  double v6 = v5;
  char v8 = v7;
  int v9 = ~v7;

  if (!v9) {
    return 0.0;
  }
  if ((v8 & 1) != 0) {
    return v4;
  }
  return v6;
}

- (BOOL)shouldDelayNextReconnect
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  *(double *)&uint64_t v4 = COERCE_DOUBLE(v2());
  if (v6 == -1)
  {
    sub_1000AC284();
    v12 = (void *)static OS_os_log.default.getter();
    uint64_t v13 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)( "Unexpectedly found no current phase!",  36LL,  2LL,  &_mh_execute_header,  v12,  v13,  &_swiftEmptyArrayStorage);

    return 0;
  }

  else
  {
    double v7 = *(double *)&v4;
    double v8 = v5;
    char v9 = v6;

    if ((v9 & 1) != 0) {
      double v10 = v7;
    }
    else {
      double v10 = v8;
    }
    return v10 > 0.0;
  }

- (APSDefaultConnectionRetryStateManager)init
{
  uint64_t ObjectType = swift_getObjectType(self);
  type metadata accessor for DefaultsDebugOverrides();
  id v4 = sub_1000ACAF0();
  double v5 = (APSDefaultConnectionRetryStateManager *)(*(uint64_t (**)(id))(ObjectType + 296))(v4);
  swift_deallocPartialClassInstance(self, ObjectType, 104LL, 7LL);
  return v5;
}

- (void)noteConnectionAttemptStart
{
  v3 = self;
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  (*(void (**)(__uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0x108))(v2);
}

- (void)noteConnectionEstablished
{
  __uint64_t v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x108);
  v3 = self;
  v2(0LL);
}

- (void)noteConnectionAttemptFailed
{
  __uint64_t v2 = self;
  sub_1000AE314();
}

- (void)notePresenceSuccess
{
  __uint64_t v2 = self;
  sub_1000AE438();
}

- (void)notePresenceFailure
{
  __uint64_t v2 = self;
  sub_1000AE54C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___APSDefaultConnectionRetryStateManager_retryPhases));
}

@end