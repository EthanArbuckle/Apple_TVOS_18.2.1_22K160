@interface CDRequesterAppSignInSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (id)_notifyDeviceIDSIdentifier;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (unint64_t)_authFlags;
- (unsigned)_deviceActionType;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_presentViewService;
- (void)_sessionActivated;
@end

@implementation CDRequesterAppSignInSession

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  unsigned int v6 = [v5 isAppleIDOnlyRequest];

  if (v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000144A8;
    v19[3] = &unk_100030898;
    v19[4] = self;
    objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.AuthKit.StartAuthorization",  0,  1,  v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000147FC;
    v18[3] = &unk_100030898;
    v18[4] = self;
    v7 = @"com.apple.AuthKit.AuthorizationDidFinish";
    v8 = (void ***)v18;
    v9 = v4;
    uint64_t v10 = 1LL;
  }

  else
  {
    BOOL v11 = -[CDRequesterAppSignInSession _requireOwnerDevice](self, "_requireOwnerDevice");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100014A5C;
    v17[3] = &unk_100030898;
    v17[4] = self;
    objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetAuthInfo",  0,  v11,  v17);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_100014F3C;
    v15 = &unk_100030898;
    v16 = self;
    v7 = @"com.apple.CompanionAuthentication.DidFinishAuth";
    v8 = &v12;
    v9 = v4;
    uint64_t v10 = v11;
  }

  objc_msgSend( v9,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  v7,  0,  v10,  v8,  v12,  v13,  v14,  v15,  v16);
}

- (unsigned)_deviceActionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  unsigned int v3 = [v2 isAppleIDOnlyRequest];

  if (v3) {
    return 28;
  }
  else {
    return 34;
  }
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterAppSignInSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v5, "_notifyDeviceAcceptedNotification:", v4);
  -[CDRequesterViewService deviceTappedNotification:]( self->_viewService,  "deviceTappedNotification:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterAppSignInSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v5, "_notifyDeviceStartedAuthentication:", v4);
  -[CDRequesterViewService deviceStartedAuthentication:]( self->_viewService,  "deviceStartedAuthentication:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_presentViewService
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDAuthInfoProviding bundleIdentifier](self->_authInfo, "bundleIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleIDRequest]);
  if (v5) {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDCredentialRequestBuilder authKitAccount](self->_credentialRequestBuilder, "authKitAccount"));
  }
  else {
    unsigned int v6 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v8 = (CDRequesterViewService *)objc_claimAutoreleasedReturnValue( +[CDRequesterViewService appSignInViewServiceWithRequest:applicationBundleIdentifier:authKitAccount:]( &OBJC_CLASS___CDRequesterViewService,  "appSignInViewServiceWithRequest:applicationBundleIdentifier:authKitAccount:",  v7,  v3,  v6));
  viewService = self->_viewService;
  self->_viewService = v8;

  uint64_t v10 = self->_viewService;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession dispatchQueue](self, "dispatchQueue"));
  -[CDRequesterViewService setDispatchQueue:](v10, "setDispatchQueue:", v11);

  v12 = self->_viewService;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000156A8;
  v13[3] = &unk_1000308C0;
  v13[4] = self;
  -[CDRequesterViewService setDismissedHandler:](v12, "setDismissedHandler:", v13);
  -[CDRequesterViewService activate](self->_viewService, "activate");
}

- (void)_invalidated
{
  viewService = self->_viewService;
  self->_viewService = 0LL;

  -[BSContinuousMachTimer invalidate](self->_sessionFinishedTimer, "invalidate");
  sessionFinishedTimer = self->_sessionFinishedTimer;
  self->_sessionFinishedTimer = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterAppSignInSession;
  -[CDRequesterSession _invalidated](&v5, "_invalidated");
}

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  unsigned int v6 = [v5 isEmpty];

  if (v6)
  {
    uint64_t v7 = CPSErrorDomain;
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    v23 = @"Missing authorization requests";
    v8 = &v23;
    v9 = &v22;
LABEL_6:
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v9,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  205LL,  v13));
    v4[2](v4, v14);

    goto LABEL_11;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  if ([v10 isPasskeyRegistrationRequest])
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
    unsigned int v12 = [v11 hasAnyNonPasskeyRegistrationRequest];

    if (v12)
    {
      uint64_t v7 = CPSErrorDomain;
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      v21 = @"Passkey registrations may not be used with other authorization request types";
      v8 = &v21;
      v9 = &v20;
      goto LABEL_6;
    }
  }

  else
  {
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession client](self, "client"));
  id v19 = 0LL;
  v17 = (CDAuthInfoProviding *)objc_claimAutoreleasedReturnValue( +[CDAuthInfoProvider createWithRequest:client:error:]( &OBJC_CLASS___CDAuthInfoProvider,  "createWithRequest:client:error:",  v15,  v16,  &v19));
  id v13 = v19;
  authInfo = self->_authInfo;
  self->_authInfo = v17;

  if (v13) {
    v4[2](v4, v13);
  }
  else {
    sub_100015A4C((id *)&self->super.super.isa, v4);
  }
LABEL_11:
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___CDGetNotifInfoResponse);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDAuthInfoProviding localizedName](self->_authInfo, "localizedName"));
  -[CDGetNotifInfoResponse setAppName:](v4, "setAppName:", v5);

  return v4;
}

- (BOOL)_requireOwnerDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appleIDRequest]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_sessionActivated
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  +[CDAppSignInUtilities sendSessionActivatedMetricsWithRequest:approvedAssociatedDomains:]( &OBJC_CLASS___CDAppSignInUtilities,  "sendSessionActivatedMetricsWithRequest:approvedAssociatedDomains:",  v3,  self->_associatedDomains);
}

- (unint64_t)_authFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 platformKeyCredentialRegistrationOptions]);

  return v3 != 0LL;
}

- (id)_notifyDeviceIDSIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = [v3 BOOLForKey:@"appSignInNotifyMeDeviceOnly"];

  if (v4) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self->_meDevice, "idsDeviceIdentifier"));
  }
  else {
    objc_super v5 = 0LL;
  }
  return v5;
}

- (id)_idsMessageRecipientUsernames
{
  unsigned int v2 = -[CDRequesterAppSignInSession _requireOwnerDevice](self, "_requireOwnerDevice");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);

  if (v2) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 primaryUserProfile]);
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 selectedUserProfile]);
  }
  unsigned int v6 = (void *)v5;
  if (v5)
  {
    id v7 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v5];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAccount]);
  }

  else
  {
    v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
  if ([v9 length])
  {
    unsigned int v12 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end