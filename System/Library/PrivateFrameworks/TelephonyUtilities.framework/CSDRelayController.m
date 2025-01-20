@interface CSDRelayController
- (CSDCallController)callController;
- (CSDCallStateController)callStateController;
- (CSDRelayMessagingController)relayMessagingController;
- (NSArray)allCalls;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDRelayController

- (CSDRelayMessagingController)relayMessagingController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 relayMessagingController]);

  return (CSDRelayMessagingController *)v3;
}

- (CSDCallController)callController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callController]);

  return (CSDCallController *)v3;
}

- (NSArray)allCalls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _allCalls]);

  return (NSArray *)v3;
}

- (CSDCallStateController)callStateController
{
  return self->_callStateController;
}

- (void)setCallStateController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end