@interface CDRequesterSharingSession
- (BOOL)_requireOwnerDevice;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_presentViewService;
@end

@implementation CDRequesterSharingSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
}

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000072E4;
  v6[3] = &unk_100030898;
  v6[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetAuthInfo",  0,  -[CDRequesterSharingSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000750C;
  v5[3] = &unk_100030898;
  v5[4] = self;
  objc_msgSend( v4,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidFinishAuth",  0,  -[CDRequesterSharingSession _requireOwnerDevice](self, "_requireOwnerDevice"),  v5);
}

- (void)_presentViewService
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  id v4 = (CDRequesterViewService *)objc_claimAutoreleasedReturnValue( +[CDRequesterViewService sharingViewServiceWithRequest:]( &OBJC_CLASS___CDRequesterViewService,  "sharingViewServiceWithRequest:",  v3));
  viewService = self->_viewService;
  self->_viewService = v4;

  v6 = self->_viewService;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession dispatchQueue](self, "dispatchQueue"));
  -[CDRequesterViewService setDispatchQueue:](v6, "setDispatchQueue:", v7);

  v8 = self->_viewService;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000077B8;
  v9[3] = &unk_1000308C0;
  v9[4] = self;
  -[CDRequesterViewService setDismissedHandler:](v8, "setDismissedHandler:", v9);
  -[CDRequesterViewService activate](self->_viewService, "activate");
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSharingSession;
  id v4 = a3;
  -[CDRequesterSession _notifyDeviceAcceptedNotification:](&v5, "_notifyDeviceAcceptedNotification:", v4);
  -[CDRequesterViewService deviceTappedNotification:]( self->_viewService,  "deviceTappedNotification:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSharingSession;
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
  v5.super_class = (Class)&OBJC_CLASS___CDRequesterSharingSession;
  -[CDRequesterSession _invalidated](&v5, "_invalidated");
}

- (BOOL)_requireOwnerDevice
{
  return 1;
}

- (void).cxx_destruct
{
}

@end