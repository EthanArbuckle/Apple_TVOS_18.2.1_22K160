@interface PBPictureInPictureService
- (BSAuditToken)auditToken;
- (NSString)clientBundleIdentifier;
- (PBPictureInPictureService)initWithClientBundleIdentifier:(id)a3 auditToken:(id)a4;
- (PBSPictureInPictureServiceClientInterface)serviceClient;
- (void)cancelPictureInPictureFromPlayerInterface:(id)a3;
- (void)dealloc;
- (void)expandPictureInPicture;
- (void)fetchCurrentPictureInPictureStateWithReply:(id)a3;
- (void)invalidate;
- (void)movePictureInPicture;
- (void)pictureInPictureManager:(id)a3 didSendPlaybackCommand:(unint64_t)a4;
- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4;
- (void)setServiceClient:(id)a3;
@end

@implementation PBPictureInPictureService

- (PBPictureInPictureService)initWithClientBundleIdentifier:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBPictureInPictureService;
  v8 = -[PBPictureInPictureService init](&v13, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    clientBundleIdentifier = v8->_clientBundleIdentifier;
    v8->_clientBundleIdentifier = v9;

    objc_storeStrong((id *)&v8->_auditToken, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    [v11 addObserver:v8];
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBPictureInPictureService;
  -[PBPictureInPictureService dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  id v3 = sub_100083780();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "pictureInPictureService invalidated %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)fetchCurrentPictureInPictureStateWithReply:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100172228;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)cancelPictureInPictureFromPlayerInterface:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001722F4;
  v3[3] = &unk_1003D05A8;
  v3[4] = self;
  v3[5] = [a3 unsignedIntegerValue];
  dispatch_async(&_dispatch_main_q, v3);
}

- (void)movePictureInPicture
{
}

- (void)expandPictureInPicture
{
  if (-[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.appletv.pbs.picture-in-picture-service-access")) {
    dispatch_async(&_dispatch_main_q, &stru_1003DA080);
  }
}

- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureService serviceClient](self, "serviceClient"));
  [v6 pictureInPictureServiceDidUpdateState:v5];
}

- (void)pictureInPictureManager:(id)a3 didSendPlaybackCommand:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPictureInPictureService serviceClient](self, "serviceClient", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v5 pictureInPictureServiceDidSendPlaybackCommand:v6];
}

- (PBSPictureInPictureServiceClientInterface)serviceClient
{
  return (PBSPictureInPictureServiceClientInterface *)objc_loadWeakRetained((id *)&self->_serviceClient);
}

- (void)setServiceClient:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
}

@end