@interface CSDRelayIDSService
+ (id)sharedInstance;
- (void)_handlePairedDeviceChangedFrom:(id)a3 to:(id)a4;
- (void)handleActiveAccountsChanged:(id)a3;
@end

@implementation CSDRelayIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004359C;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044CEC8 != -1) {
    dispatch_once(&qword_10044CEC8, block);
  }
  return (id)qword_10044CEC0;
}

- (void)handleActiveAccountsChanged:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDRelayIDSService;
  -[CSDIDSService handleActiveAccountsChanged:](&v5, "handleActiveAccountsChanged:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"CSDRelayIDSActiveAccountsChanged" object:self];
}

- (void)_handlePairedDeviceChangedFrom:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v10 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v8 = v7;
    v9 = @"CSDRelayPairedDeviceConnectedNotification";
LABEL_7:
    [v7 postNotificationName:v9 object:self];

    goto LABEL_8;
  }

  if (v10 && !v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v8 = v7;
    v9 = @"CSDRelayPairedDeviceDisconnectedNotification";
    goto LABEL_7;
  }

@end