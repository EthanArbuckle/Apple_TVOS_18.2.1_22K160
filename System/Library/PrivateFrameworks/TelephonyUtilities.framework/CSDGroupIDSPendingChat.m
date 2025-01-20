@interface CSDGroupIDSPendingChat
- (CSDGroupIDSPendingChat)init;
- (CSDGroupIDSPendingChat)initWithUUID:(id)a3 handle:(id)a4;
- (NSUUID)uuid;
- (TUHandle)handle;
@end

@implementation CSDGroupIDSPendingChat

- (NSUUID)uuid
{
  return (NSUUID *)sub_100274E24((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CSDGroupIDSPendingChat_uuid);
}

- (TUHandle)handle
{
  return (TUHandle *)sub_100274F14();
}

- (CSDGroupIDSPendingChat)initWithUUID:(id)a3 handle:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_100274F20((uint64_t)v8, (uint64_t)a4);
  return result;
}

- (CSDGroupIDSPendingChat)init
{
}

- (void).cxx_destruct
{
}

@end