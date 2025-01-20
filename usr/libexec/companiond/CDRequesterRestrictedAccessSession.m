@interface CDRequesterRestrictedAccessSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_presentViewService;
@end

@implementation CDRequesterRestrictedAccessSession

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005F9C;
  v6[3] = &unk_100030898;
  v6[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetAuthInfo",  0,  -[CDRequesterRestrictedAccessSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000631C;
  v5[3] = &unk_100030898;
  v5[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidFinishAuth",  0,  -[CDRequesterRestrictedAccessSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v5);
}

- (void)_presentViewService
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v4 = (CDRequesterViewService *)objc_claimAutoreleasedReturnValue( +[CDRequesterViewService restrictedAccessViewServiceWithRequest:]( &OBJC_CLASS___CDRequesterViewService,  "restrictedAccessViewServiceWithRequest:",  v3));
  viewService = self->_viewService;
  self->_viewService = v4;

  v6 = self->_viewService;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession dispatchQueue](self, "dispatchQueue"));
  -[CDRequesterViewService setDispatchQueue:](v6, "setDispatchQueue:", v7);

  v8 = self->_viewService;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006660;
  v9[3] = &unk_1000308C0;
  v9[4] = self;
  -[CDRequesterViewService setDismissedHandler:](v8, "setDismissedHandler:", v9);
  -[CDRequesterViewService activate](self->_viewService, "activate");
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterRestrictedAccessSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v5, "_notifyDeviceAcceptedNotification:", v4);
  -[CDRequesterViewService deviceTappedNotification:]( self->_viewService,  "deviceTappedNotification:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterRestrictedAccessSession;
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
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterRestrictedAccessSession;
  -[CDRequesterSession _invalidated](&v5, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 approversAppleAccountAltDSIDs]);
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 approversAppleAccountAltDSIDs]);

  if (v4)
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request", 0LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 approversAppleAccountAltDSIDs]);

    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_appleAccountWithAltDSID:", v12));

          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
          if (v15) {
            -[NSMutableArray addObject:](v5, "addObject:", v15);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v9);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 userProfilesSnapshot]);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 primaryUserProfile]);
    if (v18)
    {
      id v19 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v18];
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 iCloudAccount]);
    }

    else
    {
      v20 = 0LL;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v20 username]);
    if (v7)
    {
      v27 = v7;
      objc_super v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v27,  1LL));
    }

    else
    {
      objc_super v5 = 0LL;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end