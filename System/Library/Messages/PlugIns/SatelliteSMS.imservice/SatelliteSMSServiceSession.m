@interface SatelliteSMSServiceSession
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (SatelliteSMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
@end

@implementation SatelliteSMSServiceSession

- (SatelliteSMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (SatelliteSMSServiceSession *)SatelliteSMSServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = self;
  SatelliteSMSServiceSession.calculateReachability(with:responseHandler:)(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 1;
}

- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  uint64_t v9 = v8;
  v10 = (void *)objc_opt_self(&OBJC_CLASS___IMCTSMSUtilities);
  v11 = self;
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  LODWORD(v10) = [v10 IMMMSMaxRecipientsForPhoneNumber:v12 simID:v13];

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);

  return (int)v10;
}

@end