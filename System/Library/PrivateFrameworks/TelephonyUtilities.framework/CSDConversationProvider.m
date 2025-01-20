@interface CSDConversationProvider
- (BOOL)supportsLinks;
- (BOOL)supportsSharePlay;
- (BOOL)supportsVideo;
- (CSDConversationProvider)initWithProvider:(id)a3;
- (CSDConversationProviderDelegate)delegate;
- (CSDIDSService)service;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)pseudonymFeatureID;
- (TUConversationProvider)tuProvider;
- (id)callerIDAccount;
- (id)tuConversationProvider;
- (void)generatePseudonymHandleForConversationWithExpiryDuration:(double)a3 URI:(id)a4 completionHandler:(id)a5;
- (void)isPseudonymHandleForProvider:(id)a3 completionHandler:(id)a4;
- (void)registerWithIDSWithCompletionHandler:(id)a3;
- (void)renewPseudonymHandle:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)revokePseudonymHandle:(id)a3 completionHandler:(id)a4;
- (void)setService:(id)a3;
@end

@implementation CSDConversationProvider

- (CSDConversationProvider)initWithProvider:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDConversationProvider;
  v5 = -[CSDConversationProvider init](&v18, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    v10 = (NSString *)[v9 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 pseudonymFeatureID]);
    v13 = (NSString *)[v12 copy];
    pseudonymFeatureID = v5->_pseudonymFeatureID;
    v5->_pseudonymFeatureID = v13;

    v5->_supportsLinks = [v4 supportsLinks];
    v5->_supportsSharePlay = [v4 supportsSharePlay];
    v5->_supportsVideo = [v4 supportsVideo];
    v15 = (TUConversationProvider *)[v4 copy];
    tuProvider = v5->_tuProvider;
    v5->_tuProvider = v15;
  }

  return v5;
}

- (id)tuConversationProvider
{
  id v3 = objc_alloc(&OBJC_CLASS___TUConversationProviderConfiguration);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider identifier](self, "identifier"));
  id v5 = [v3 initWithServiceName:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider bundleIdentifier](self, "bundleIdentifier"));
  id v7 = [v6 copy];
  [v5 setBundleID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider pseudonymFeatureID](self, "pseudonymFeatureID"));
  id v9 = [v8 copy];
  [v5 setPseudonymFeatureID:v9];

  v10 = -[TUConversationProvider initWithConfiguration:]( objc_alloc(&OBJC_CLASS___TUConversationProvider),  "initWithConfiguration:",  v5);
  return v10;
}

- (void)registerWithIDSWithCompletionHandler:(id)a3
{
  v8 = (void (**)(id, void))a3;
  id v4 = objc_alloc(&OBJC_CLASS___CSDIDSService);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider identifier](self, "identifier"));
  v6 = -[CSDIDSService initWithName:](v4, "initWithName:", v5);
  service = self->_service;
  self->_service = v6;

  v8[2](v8, 0LL);
}

- (id)callerIDAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 account]);

  return v3;
}

- (void)generatePseudonymHandleForConversationWithExpiryDuration:(double)a3 URI:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  v11 = -[TUHandle initWithType:value:](objc_alloc(&OBJC_CLASS___TUHandle), "initWithType:value:", 1LL, v9);

  pseudonymFeatureID = self->_pseudonymFeatureID;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v14));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100184570;
  v17[3] = &unk_1003DC110;
  id v18 = v8;
  id v16 = v8;
  [v10 provisionPseudonymForHandle:v11 featureID:pseudonymFeatureID scopeID:0 expiryDuration:v15 allowedServices:v17 completionHandler:a3];
}

- (void)renewPseudonymHandle:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100184728;
  v14[3] = &unk_1003DC138;
  id v15 = v8;
  id v13 = v8;
  [v11 renewPseudonymString:v12 expirationDate:v9 completionHandler:v14];
}

- (void)revokePseudonymHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);

  [v9 revokePseudonymString:v8 completionHandler:v6];
}

- (void)isPseudonymHandleForProvider:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationProvider service](self, "service"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);

  (*((void (**)(id, id))a4 + 2))(v7, [v10 checkValidityForSelfPseudonymString:v9]);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TUConversationProvider)tuProvider
{
  return self->_tuProvider;
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)pseudonymFeatureID
{
  return self->_pseudonymFeatureID;
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (CSDConversationProviderDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

@end