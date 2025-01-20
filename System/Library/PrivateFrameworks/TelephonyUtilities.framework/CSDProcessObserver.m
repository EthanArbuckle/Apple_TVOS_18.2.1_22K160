@interface CSDProcessObserver
- (CSDProcessObserver)init;
- (CSDProcessObserver)initWithBundleIdentifiers:(id)a3 queue:(id)a4;
- (CSDProcessObserver)initWithQueue:(id)a3;
- (id)fetchCurrentProcessStatesForBundleIdentifier:(id)a3;
- (id)processIdentifiersForBundleIdentifier:(id)a3;
- (id)processStateChanged;
- (id)processStateChangedWithBundleID;
- (id)processStatesForBundleIdentifier:(id)a3;
- (id)processStatesForCallSource:(id)a3;
- (int)currentProcessIdentifier;
- (void)fetchCurrentProcessStatesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)processStatesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)setProcessStateChanged:(id)a3;
- (void)setProcessStateChangedWithBundleID:(id)a3;
@end

@implementation CSDProcessObserver

- (CSDProcessObserver)initWithQueue:(id)a3
{
  return result;
}

- (CSDProcessObserver)initWithBundleIdentifiers:(id)a3 queue:(id)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  return (CSDProcessObserver *)sub_1001E4F88(v5, a4);
}

- (int)currentProcessIdentifier
{
  v2 = self;
  pid_t v3 = j__getpid();

  return v3;
}

- (id)processStateChanged
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_1001E68E0,  (uint64_t)sub_1001E6900,  (uint64_t)&unk_1003DFEB8);
}

- (void)setProcessStateChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003DFEA0, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001C9538;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDProcessObserver_processStateChanged, sub_1001D8ED8);
}

- (id)processStateChangedWithBundleID
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_1001E6A78,  (uint64_t)sub_1001E6A98,  (uint64_t)&unk_1003DFE68);
}

- (void)setProcessStateChangedWithBundleID:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003DFE50, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001E8F8C;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDProcessObserver_processStateChangedWithBundleID, sub_1001B5D3C);
}

- (id)processIdentifiersForBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8 = sub_1001E6BF8(v4, v6);

  swift_bridgeObjectRelease(v6);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)processStatesForBundleIdentifier:(id)a3
{
  return sub_1001E6F00(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1001E6DD0);
}

- (void)processStatesForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_1003DFDD8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  v11 = self;
  sub_1001E6F84( v7,  v9,  (uint64_t)sub_1001E8FE4,  v10,  (uint64_t)&unk_1003DFE00,  (uint64_t)sub_1001E8F60,  (uint64_t)&unk_1003DFE18);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (id)fetchCurrentProcessStatesForBundleIdentifier:(id)a3
{
  return sub_1001E6F00(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1001E6EEC);
}

- (void)fetchCurrentProcessStatesForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_1003DFD60, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  v11 = self;
  sub_1001E6F84( v7,  v9,  (uint64_t)sub_1001E8F14,  v10,  (uint64_t)&unk_1003DFD88,  (uint64_t)sub_1001E8F20,  (uint64_t)&unk_1003DFDA0);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (CSDProcessObserver)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDProcessObserver_processInfoByBundleIdentifier));

  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDProcessObserver_processStateChanged),  *(void *)&self->queue[OBJC_IVAR___CSDProcessObserver_processStateChanged]);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDProcessObserver_processStateChangedWithBundleID),  *(void *)&self->queue[OBJC_IVAR___CSDProcessObserver_processStateChangedWithBundleID]);
}

- (id)processStatesForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1001E72E8(v4);

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

@end