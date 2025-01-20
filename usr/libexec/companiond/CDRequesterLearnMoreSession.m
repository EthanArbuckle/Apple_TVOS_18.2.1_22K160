@interface CDRequesterLearnMoreSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_presentViewService;
@end

@implementation CDRequesterLearnMoreSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v8 = (void (**)(id, void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);

  if (v5)
  {
    v8[2](v8, 0LL);
  }

  else
  {
    uint64_t v6 = CPSErrorMake(205LL, @"Missing URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    ((void (**)(id, void *))v8)[2](v8, v7);
  }
}

- (void)_configureRapportClient:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000054CC;
  v6[3] = &unk_100030898;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000056F4;
  v5[3] = &unk_100030898;
  v5[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidFinishAuth",  0,  -[CDRequesterLearnMoreSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v5);
}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (void)_presentViewService
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v4 = (CDRequesterViewService *)objc_claimAutoreleasedReturnValue( +[CDRequesterViewService learnMoreViewServiceWithRequest:]( &OBJC_CLASS___CDRequesterViewService,  "learnMoreViewServiceWithRequest:",  v3));
  viewService = self->_viewService;
  self->_viewService = v4;

  uint64_t v6 = self->_viewService;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession dispatchQueue](self, "dispatchQueue"));
  -[CDRequesterViewService setDispatchQueue:](v6, "setDispatchQueue:", v7);

  v8 = self->_viewService;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000059E4;
  v9[3] = &unk_1000308C0;
  v9[4] = self;
  -[CDRequesterViewService setDismissedHandler:](v8, "setDismissedHandler:", v9);
  -[CDRequesterViewService activate](self->_viewService, "activate");
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterLearnMoreSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v5, "_notifyDeviceAcceptedNotification:", v4);
  -[CDRequesterViewService deviceTappedNotification:]( self->_viewService,  "deviceTappedNotification:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterLearnMoreSession;
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
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterLearnMoreSession;
  -[CDRequesterSession _invalidated](&v5, "_invalidated");
}

- (id)_idsMessageRecipientUsernames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedUserProfile]);
  if (v4)
  {
    id v5 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v4];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAccount]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  if (v7)
  {
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end