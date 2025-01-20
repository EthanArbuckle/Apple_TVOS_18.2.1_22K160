@interface AKAuthorizationRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (AKAuthorizationTTSUViewController)ttsuViewController;
- (AKAuthorizationTVServicePresenter)presenter;
- (id)_imageIORepresentationWithImage:(id)a3 type:(id)a4 options:(id)a5;
- (void)_handleFetchAppIconMessage:(id)a3 reply:(id)a4;
- (void)authorizationTTSUViewControllerDidDismiss:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setTtsuViewController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation AKAuthorizationRemoteViewController

- (void)authorizationTTSUViewControllerDidDismiss:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  [v3 dismissWithResult:0];
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationTVServicePresenter);
  presenter = self->_presenter;
  self->_presenter = v5;

  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKAuthorizationTVServicePresenterOptionsKeyBundleID]);
  v7 = -[AKAuthorizationTTSUViewController initWithAppBundleID:]( objc_alloc(&OBJC_CLASS___AKAuthorizationTTSUViewController),  "initWithAppBundleID:",  v9);
  ttsuViewController = self->_ttsuViewController;
  self->_ttsuViewController = v7;

  -[AKAuthorizationTTSUViewController setDelegate:](self->_ttsuViewController, "setDelegate:", self);
  -[AKAuthorizationRemoteViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_ttsuViewController,  1LL,  0LL);
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[AKAuthorizationTVServicePresenter typeOfMessage:](self->_presenter, "typeOfMessage:", v6);
  if (v8 == (id)3) {
    goto LABEL_6;
  }
  uint64_t v9 = (uint64_t)v8;
  if (v8 == (id)2)
  {
    -[AKAuthorizationTTSUViewController authorizationInProgress](self->_ttsuViewController, "authorizationInProgress");
LABEL_6:
    -[AKAuthorizationRemoteViewController _handleFetchAppIconMessage:reply:]( self,  "_handleFetchAppIconMessage:reply:",  v6,  v7);
    goto LABEL_10;
  }

  if (v8 == (id)1)
  {
    -[AKAuthorizationTTSUViewController userInteractedWithEndorsingDevice]( self->_ttsuViewController,  "userInteractedWithEndorsingDevice");
  }

  else
  {
    uint64_t v10 = _AKLogSystem();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100001A4C((uint64_t)v6, v9, v11);
    }
  }

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v2 setClasses:v10 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v10 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v10 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:1];
  [v2 setClasses:v10 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface));
  uint64_t v3 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setClasses:v4 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)_handleFetchAppIconMessage:(id)a3 reply:(id)a4
{
  ttsuViewController = self->_ttsuViewController;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationTTSUViewController appIconImage](ttsuViewController, "appIconImage"));
  -[AKAuthorizationTTSUViewController appIconCornerRadius](self->_ttsuViewController, "appIconCornerRadius");
  uint64_t v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIGraphicsImageRendererFormat preferredFormat]( &OBJC_CLASS___UIGraphicsImageRendererFormat,  "preferredFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v11 scale];
  objc_msgSend(v10, "setScale:");

  v12 = objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer);
  [v7 size];
  v13 = -[UIGraphicsImageRenderer initWithSize:format:](v12, "initWithSize:format:", v10);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100001788;
  v47[3] = &unk_100004218;
  id v14 = v7;
  id v48 = v14;
  uint64_t v49 = v9;
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v13, "imageWithActions:", v47));
  CFStringRef v52 = kCGImageDestinationLossyCompressionQuality;
  v53 = &off_1000042A8;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationRemoteViewController _imageIORepresentationWithImage:type:options:]( self,  "_imageIORepresentationWithImage:type:options:",  v15,  AVFileTypeHEIC,  v16));

  if (!v17)
  {
    id v18 = [v10 scale];
    double v20 = v19;
    uint64_t v21 = _AKLogSystem(v18);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v20 == 1.0)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Encoding app icon data as HEIC failed. Falling back to ATX.",  v46,  2u);
      }
    }

    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      sub_100001B04(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    v50[0] = kCGImagePropertyASTCBlockSize;
    v50[1] = kCGImagePropertyEncoder;
    v51[0] = &off_1000042B8;
    v51[1] = kCGImagePropertyASTCEncoder;
    v50[2] = kCGImagePropertyASTCUseLZFSE;
    v51[2] = &__kCFBooleanTrue;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationRemoteViewController _imageIORepresentationWithImage:type:options:]( self,  "_imageIORepresentationWithImage:type:options:",  v15,  @"com.apple.atx",  v31));

    if (!v17)
    {
      uint64_t v33 = _AKLogSystem(v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100001AD0(v34, v35, v36, v37, v38, v39, v40, v41);
      }

      v42 = UIImagePNGRepresentation(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v42);
    }
  }

  presenter = self->_presenter;
  [v10 scale];
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v45 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationTVServicePresenter buildFetchAppIconReplyWithImageData:imageScale:]( presenter,  "buildFetchAppIconReplyWithImageData:imageScale:",  v17,  v44));

  v6[2](v6, v45, 0LL);
}

- (id)_imageIORepresentationWithImage:(id)a3 type:(id)a4 options:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (const __CFDictionary *)a5;
  uint64_t v9 = (__CFString *)a4;
  uint64_t v10 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v11 = CGImageDestinationCreateWithData(v10, v9, 1uLL, 0LL);

  if (v11)
  {
    CGImageDestinationAddImage(v11, (CGImageRef)[v7 CGImage], v8);
    BOOL v12 = CGImageDestinationFinalize(v11);
    CFRelease(v11);
    if (v12) {
      v11 = (CGImageDestination *)-[__CFData copy](v10, "copy");
    }
    else {
      v11 = 0LL;
    }
  }

  return v11;
}

- (AKAuthorizationTVServicePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (AKAuthorizationTTSUViewController)ttsuViewController
{
  return self->_ttsuViewController;
}

- (void)setTtsuViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end