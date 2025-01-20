@interface CDRequesterSystemAuthenticationSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (unint64_t)_authFlags;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_presentViewService;
@end

@implementation CDRequesterSystemAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
}

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F0E4;
  v6[3] = &unk_100030898;
  v6[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetAuthInfo",  0,  -[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F3B0;
  v5[3] = &unk_100030898;
  v5[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidFinishAuth",  0,  -[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v5);
}

- (void)_presentViewService
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v4 = (CDRequesterViewService *)objc_claimAutoreleasedReturnValue( +[CDRequesterViewService systemAuthenticationViewServiceWithSystemAuthenticationRequest:]( &OBJC_CLASS___CDRequesterViewService,  "systemAuthenticationViewServiceWithSystemAuthenticationRequest:",  v3));
  viewService = self->_viewService;
  self->_viewService = v4;

  v6 = self->_viewService;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession dispatchQueue](self, "dispatchQueue"));
  -[CDRequesterViewService setDispatchQueue:](v6, "setDispatchQueue:", v7);

  v8 = self->_viewService;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000F790;
  v9[3] = &unk_1000308C0;
  v9[4] = self;
  -[CDRequesterViewService setDismissedHandler:](v8, "setDismissedHandler:", v9);
  -[CDRequesterViewService activate](self->_viewService, "activate");
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSystemAuthenticationSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v5, "_notifyDeviceAcceptedNotification:", v4);
  -[CDRequesterViewService deviceTappedNotification:]( self->_viewService,  "deviceTappedNotification:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSystemAuthenticationSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceStartedAuthentication:](&v5, "_notifyDeviceStartedAuthentication:", v4);
  -[CDRequesterViewService deviceStartedAuthentication:]( self->_viewService,  "deviceStartedAuthentication:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_invalidated
{
  viewService = self->_viewService;
  self->_viewService = 0LL;

  -[BSContinuousMachTimer invalidate](self->_sessionFinishedTimer, "invalidate");
  sessionFinishedTimer = self->_sessionFinishedTimer;
  self->_sessionFinishedTimer = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSystemAuthenticationSession;
  -[CDRequesterSession _invalidated](&v5, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appleAccountAltDSID]);
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appleAccountAltDSID]);

  if (v3)
  {
    id v4 = v3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userProfilesSnapshot]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryUserProfile]);
    if (v11)
    {
      id v12 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v11];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAccount]);
    }

    else
    {
      v13 = 0LL;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([v13 username]);
    if (v6)
    {
      v15 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    }

    else
    {
      v8 = 0LL;
    }
  }

  return v8;
}

- (unint64_t)_authFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v3 = [v2 options];

  return (unint64_t)v3;
}

- (void).cxx_destruct
{
}

@end