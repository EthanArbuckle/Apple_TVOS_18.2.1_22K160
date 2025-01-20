@interface ADSessionRemoteServerFull
- (BOOL)sessionRequiresServerConnection;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10;
@end

@implementation ADSessionRemoteServerFull

- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServerFull;
  id v10 = -[ADSessionRemoteServer initOnQueue:withAccount:hubAccount:languageCode:connectionMode:sharedUserIdentifier:loggingSharedUserIdentifier:instanceContext:]( &v17,  "initOnQueue:withAccount:hubAccount:languageCode:connectionMode:sharedUserIdentifier:loggingSharedUserIdentifie r:instanceContext:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
  v11 = v10;
  if (v10)
  {
    [v10 setSessionType:0];
    v12 = objc_alloc(&OBJC_CLASS___NSString);
    v13 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[NSString initWithFormat:](v12, "initWithFormat:", @"%@.%@", &off_1005131F8, v14);
    [v11 _setSessionId:v15];
  }

  return v11;
}

- (BOOL)sessionRequiresServerConnection
{
  return 1;
}

@end