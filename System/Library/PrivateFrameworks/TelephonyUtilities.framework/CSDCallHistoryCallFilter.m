@interface CSDCallHistoryCallFilter
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (CSDCallHistoryCallFilter)init;
- (CSDCallHistoryCallFilter)initWithChManager:(id)a3;
@end

@implementation CSDCallHistoryCallFilter

- (CSDCallHistoryCallFilter)initWithChManager:(id)a3
{
  return (CSDCallHistoryCallFilter *)sub_1002A0164((uint64_t)a3);
}

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1002A01E4(v4);

  return self & 1;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v14 = v13;
  v15 = self;
  char v16 = sub_1002A0524(v8, v10, v11, a4);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(a4);
  return v16 & 1;
}

- (CSDCallHistoryCallFilter)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR___CSDCallHistoryCallFilter_callHistoryManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR___CSDCallHistoryCallFilter_usTollFreePrefixes));
}

@end