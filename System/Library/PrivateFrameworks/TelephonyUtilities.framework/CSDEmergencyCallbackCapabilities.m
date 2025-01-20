@interface CSDEmergencyCallbackCapabilities
- (BOOL)emergencyCallbackPossible;
- (CSDEmergencyCallbackCapabilities)init;
- (CSDEmergencyCallbackCapabilities)initWithQueue:(id)a3;
- (id)emergencyCallbackCapabilitiesDidChange;
- (void)setEmergencyCallbackCapabilitiesDidChange:(id)a3;
@end

@implementation CSDEmergencyCallbackCapabilities

- (BOOL)emergencyCallbackPossible
{
  v2 = self;
  char v3 = sub_1001B4CD8();

  return v3 & 1;
}

- (id)emergencyCallbackCapabilitiesDidChange
{
  uint64_t v2 = sub_1001B4E18();
  if (!v2) {
    return 0LL;
  }
  v6[4] = v2;
  uint64_t v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_1002356BC;
  v6[3] = &unk_1003DE0F0;
  v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setEmergencyCallbackCapabilitiesDidChange:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003DE0D8, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001B5D68;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001B4EDC((uint64_t)v4, v5);
}

- (CSDEmergencyCallbackCapabilities)initWithQueue:(id)a3
{
  return (CSDEmergencyCallbackCapabilities *)sub_1001B4EFC(a3);
}

- (CSDEmergencyCallbackCapabilities)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDEmergencyCallbackCapabilities_callCenterObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___CSDEmergencyCallbackCapabilities_preventDetachAfterEmergencyCallTimeoutWorkItem));
}

@end