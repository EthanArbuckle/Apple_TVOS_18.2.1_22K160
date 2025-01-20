@interface GKService
+ (Class)interfaceClass;
+ (id)serviceForBundleID:(id)a3 localPlayer:(id)a4;
+ (id)serviceFromService:(id)a3;
+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 credential:(id)a5;
+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (GKClientProxy)clientProxy;
- (GKDataTransport)transport;
- (GKPlayerCredential)credential;
- (GKPlayerInternal)localPlayer;
- (GKService)initWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6;
- (GKService)initWithoutCredentialWithTransport:(id)a3 forClient:(id)a4;
- (id)transactionGroupBypassingMultiUser;
- (id)transactionGroupWithName:(id)a3;
- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4;
- (id)transportBypassingMultiUser;
- (void)_coreInitWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6;
- (void)setClientProxy:(id)a3;
- (void)setCredential:(id)a3;
- (void)setLocalPlayer:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation GKService

- (void)_coreInitWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  v10 = (GKDataTransport *)a3;
  id v20 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_storeStrong((id *)&self->_clientProxy, a4);
  objc_storeStrong((id *)&self->_localPlayer, a5);
  p_credential = &self->_credential;
  objc_storeStrong((id *)&self->_credential, a6);
  if (!v10) {
    v10 = (GKDataTransport *)objc_claimAutoreleasedReturnValue([v20 transportWithCredential:v12]);
  }
  v14 = *p_credential;
  if (*p_credential)
  {
    v15 = (GKPlayerCredential *)objc_claimAutoreleasedReturnValue(-[GKDataTransport credential](v10, "credential"));

    if (v14 != v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport storeBag](v10, "storeBag"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport clientProxy](v10, "clientProxy"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[GKDataTransport transportWithBag:clientProxy:credential:]( &OBJC_CLASS___GKDataTransport,  "transportWithBag:clientProxy:credential:",  v16,  v17,  *p_credential));

      v10 = (GKDataTransport *)v18;
    }
  }

  transport = self->_transport;
  self->_transport = v10;
}

- (GKService)initWithoutCredentialWithTransport:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKService;
  v8 = -[GKService init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[GKService _coreInitWithTransport:forClient:localPlayer:credential:]( v8,  "_coreInitWithTransport:forClient:localPlayer:credential:",  v6,  v7,  0LL,  0LL);
  }

  return v9;
}

- (GKService)initWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GKService;
  v14 = -[GKService init](&v25, "init");
  if (v14)
  {
    if (!v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 accountName]);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 accountName]);
        id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "credentialForUsername:environment:", v17, objc_msgSend(v11, "environment")));

        if (!v12) {
          goto LABEL_9;
        }
        goto LABEL_10;
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 credential]);

      if (!v18)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
        id v21 = [v11 environment];
        v22 = (void *)objc_claimAutoreleasedReturnValue([v11 currentGame]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
        id v13 = (id)objc_claimAutoreleasedReturnValue([v20 primaryCredentialForEnvironment:v21 gameID:v23]);

        uint64_t v24 = objc_claimAutoreleasedReturnValue([v13 playerInternal]);
        id v12 = (id)v24;
        if (v24) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue([v10 credential]);
    }

    if (!v12) {
LABEL_9:
    }
      id v12 = (id)objc_claimAutoreleasedReturnValue([v13 playerInternal]);
LABEL_10:
    -[GKService _coreInitWithTransport:forClient:localPlayer:credential:]( v14,  "_coreInitWithTransport:forClient:localPlayer:credential:",  v10,  v11,  v12,  v13);
  }

  return v14;
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 credential:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_alloc((Class)objc_opt_class(a1, v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 playerInternal]);
  id v14 = [v12 initWithTransport:v10 forClient:v9 localPlayer:v13 credential:v8];

  return v14;
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v11)),  "initWithTransport:forClient:localPlayer:credential:",  v10,  v9,  v8,  0);

  return v12;
}

+ (id)serviceFromService:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc((Class)objc_opt_class(a1, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 transport]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProxy]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 localPlayer]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 credential]);

  id v11 = [v6 initWithTransport:v7 forClient:v8 localPlayer:v9 credential:v10];
  return v11;
}

+ (id)serviceForBundleID:(id)a3 localPlayer:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceWithTransport:0 forClient:v7 localPlayer:v6]);

  return v8;
}

+ (unint64_t)requiredEntitlements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses must override +requiredEntitlements."));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v2,  "+[GKService requiredEntitlements]",  [v4 UTF8String],  111));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v5);
  return 0LL;
}

+ (Class)interfaceClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses must override +interfaceClass."));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v2,  "+[GKService interfaceClass]",  [v4 UTF8String],  117));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v5);
  return 0LL;
}

- (BOOL)requiresAuthentication
{
  return 1;
}

- (id)transactionGroupBypassingMultiUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "primaryCredentialForEnvironment:conformsToMultiUserRestrictions:gameID:",  objc_msgSend(v4, "environment"),  0,  0));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerInternal]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKService.m",  136LL,  "-[GKService transactionGroupBypassingMultiUser]"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v7,  v8));

  return v9;
}

- (id)transportBypassingMultiUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "primaryCredentialForEnvironment:conformsToMultiUserRestrictions:gameID:",  objc_msgSend(v4, "environment"),  0,  0));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transportWithCredential:v5]);

  return v7;
}

- (id)transactionGroupWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v4,  v6));

  return v7;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionGroupWithName:v7 forPlayerID:v6]);

  return v9;
}

- (GKClientProxy)clientProxy
{
  return (GKClientProxy *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setClientProxy:(id)a3
{
}

- (GKDataTransport)transport
{
  return (GKDataTransport *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTransport:(id)a3
{
}

- (GKPlayerInternal)localPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalPlayer:(id)a3
{
}

- (GKPlayerCredential)credential
{
  return (GKPlayerCredential *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCredential:(id)a3
{
}

- (void).cxx_destruct
{
}

@end