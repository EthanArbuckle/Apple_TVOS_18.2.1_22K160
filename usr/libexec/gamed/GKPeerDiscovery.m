@interface GKPeerDiscovery
- (GKPeerDiscovery)init;
- (GKPeerDiscovery)initWithDelegate:(id)a3 localPlayerID:(id)a4 localPushToken:(id)a5;
- (void)sendDataToParticipant:(NSString *)a3 deviceID:(NSString *)a4 data:(NSData *)a5 completionHandler:(id)a6;
- (void)startBrowsingWithCompletionHandler:(id)a3;
- (void)startListening:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)stopBrowsingWithCompletionHandler:(id)a3;
- (void)stopListeningWithCompletionHandler:(id)a3;
@end

@implementation GKPeerDiscovery

- (GKPeerDiscovery)initWithDelegate:(id)a3 localPlayerID:(id)a4 localPushToken:(id)a5
{
  id v7 = a5;
  static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);

  return (GKPeerDiscovery *)PeerDiscovery.init(delegate:localPlayerID:localPushToken:)();
}

- (void)startBrowsingWithCompletionHandler:(id)a3
{
}

- (void)stopBrowsingWithCompletionHandler:(id)a3
{
}

- (void)startListening:(NSDictionary *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject(&unk_100273E60, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B85A8, (uint64_t)v7);
}

- (void)stopListeningWithCompletionHandler:(id)a3
{
}

- (void)sendDataToParticipant:(NSString *)a3 deviceID:(NSString *)a4 data:(NSData *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject(&unk_100273E10, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B8588, (uint64_t)v11);
}

- (GKPeerDiscovery)init
{
}

@end