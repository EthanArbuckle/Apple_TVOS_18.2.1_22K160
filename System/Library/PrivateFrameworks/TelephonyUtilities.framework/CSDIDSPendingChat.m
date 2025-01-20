@interface CSDIDSPendingChat
- (BOOL)isVideo;
- (CSDIDSPendingChat)init;
- (CSDIDSPendingChat)initWithUUID:(id)a3 isVideo:(BOOL)a4 handle:(id)a5;
- (NSUUID)uuid;
- (TUHandle)handle;
@end

@implementation CSDIDSPendingChat

- (NSUUID)uuid
{
  return (NSUUID *)sub_100274E24((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CSDIDSPendingChat_uuid);
}

- (BOOL)isVideo
{
  return sub_100274BB8() & 1;
}

- (TUHandle)handle
{
  return (TUHandle *)sub_100274BE8();
}

- (CSDIDSPendingChat)initWithUUID:(id)a3 isVideo:(BOOL)a4 handle:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_100274BF4((uint64_t)v10, a4, (uint64_t)a5);
  return result;
}

- (CSDIDSPendingChat)init
{
}

- (void).cxx_destruct
{
}

@end