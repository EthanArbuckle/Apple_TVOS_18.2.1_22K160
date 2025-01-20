@interface IDSServer
- (FTMessageDelivery)messageDelivery;
- (IDSServer)initWithQueue:(id)a3;
- (IDSServer)initWithQueue:(id)a3 messageDelivery:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_DSAuthIDForPushToken:(id)a3;
- (id)_authenticateMessageForRequest:(id)a3;
- (id)_stringRepresentationForRealm:(int64_t)a3;
- (id)authenticatePhoneUserWithRequest:(id)a3;
@end

@implementation IDSServer

- (IDSServer)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "HTTPMessageDeliveryClass"));
  [v5 setUserAgent:@"com.apple.invitation-registration"];
  [v5 setRetryInAirplaneMode:1];
  [v5 setLogToRegistration:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  [v5 addRequestObserver:v6];

  v7 = -[IDSServer initWithQueue:messageDelivery:](self, "initWithQueue:messageDelivery:", v4, v5);
  return v7;
}

- (IDSServer)initWithQueue:(id)a3 messageDelivery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSServer;
  v9 = -[IDSServer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_messageDelivery, a4);
  }

  return v10;
}

- (id)authenticatePhoneUserWithRequest:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSServer queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc(&OBJC_CLASS___CUTPromiseSeal);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServer queue](self, "queue"));
  id v7 = -[CUTPromiseSeal initWithQueue:](v5, "initWithQueue:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUTPromiseSeal promise](v7, "promise"));
  return v8;
}

- (id)_stringRepresentationForRealm:(int64_t)a3
{
  else {
    return off_1009049C8[a3];
  }
}

- (id)_DSAuthIDForPushToken:(id)a3
{
  id v3 = a3;
  id v4 = sub_10012F01C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (![v5 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 SHA1HexString]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uppercaseString]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"t:%@", v7));

    id v5 = (void *)v8;
  }

  return v5;
}

- (id)_authenticateMessageForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___IDSAuthenticateMessage);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 user]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 realmPrefixedIdentifier]);
  -[IDSAuthenticateMessage setUserID:](v5, "setUserID:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 user]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSServer _stringRepresentationForRealm:]( self,  "_stringRepresentationForRealm:",  [v8 realm]));
  -[IDSAuthenticateMessage setRealm:](v5, "setRealm:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 certificateSigningRequest]);
  -[IDSAuthenticateMessage setCsr:](v5, "setCsr:", v10);

  v19[0] = @"push-token";
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
  v19[1] = @"sigs";
  v20[0] = v11;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneSignature]);
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v20[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  -[IDSAuthenticateMessage setAuthenticationInfo:](v5, "setAuthenticationInfo:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServer _DSAuthIDForPushToken:](self, "_DSAuthIDForPushToken:", v15));
  -[IDSAuthenticateMessage setDSAuthID:](v5, "setDSAuthID:", v16);

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void).cxx_destruct
{
}

@end