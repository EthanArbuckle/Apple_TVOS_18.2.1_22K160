@interface DriverKitDaemonXPCRequestDelegate
- (void)dumpStateWithReplyBlock:(id)a3;
- (void)enqueueApprovalStateUpdateWithEntry:(id)a3 replyBlock:(id)a4;
- (void)getApprovalStateForSettingsWithReplyBlock:(id)a3;
- (void)launchDriverWithBundleID:(id)a3 userServerName:(id)a4 tag:(id)a5 replyBlock:(id)a6;
@end

@implementation DriverKitDaemonXPCRequestDelegate

- (void)dumpStateWithReplyBlock:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10014A088, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  swift_retain(self);
  sub_100081C30((uint64_t)sub_100086118, v5);
  swift_release(self);
  swift_release(v5);
}

- (void)getApprovalStateForSettingsWithReplyBlock:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = swift_retain(self);
  sub_100084864(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_release(self);
}

- (void)enqueueApprovalStateUpdateWithEntry:(id)a3 replyBlock:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain(self);
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_100084D3C(v8, v10, (uint64_t)self, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_10001226C(v8, v10);
  swift_release(self);
}

- (void)launchDriverWithBundleID:(id)a3 userServerName:(id)a4 tag:(id)a5 replyBlock:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  if (a5)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v18;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  _Block_copy(v10);
  swift_retain(self);
  sub_10008507C(v11, v13, v14, v16, v17, (unint64_t)a5, (uint64_t)self, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_release(self);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(a5);
}

@end