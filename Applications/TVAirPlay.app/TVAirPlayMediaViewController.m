@interface TVAirPlayMediaViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)dismissing;
- (BSInvalidatable)stateCaptureHandle;
- (TVAirPlayAPRKVideoSession)APRKVideoSession;
- (TVAirPlayAPRKViewController)aprkViewController;
- (TVAirPlayInfoSession)dialogInfoSession;
- (TVAirPlayMediaViewController)init;
- (TVAirPlayMediaViewControllerDelegate)delegate;
- (TVAirPlayPinSession)pinSession;
- (TVAirPlayPresentationSession)presentationSession;
- (TVAirPlayPresentationViewController)presentationViewController;
- (TVAirPlayURLSession)videoPlaybackSession;
- (UIAlertController)dialogViewController;
- (UISceneSession)sceneSession;
- (UIViewController)pinViewController;
- (_TVAirPlayVideoPlayerViewController)videoPlayerViewController;
- (id)_stateDump;
- (id)preferredFocusEnvironments;
- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)setAPRKVideoSession:(id)a3;
- (void)setAprkViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialogInfoSession:(id)a3;
- (void)setDialogViewController:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setPinSession:(id)a3;
- (void)setPinViewController:(id)a3;
- (void)setPresentationSession:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSceneSession:(id)a3;
- (void)setVideoPlaybackSession:(id)a3;
- (void)setVideoPlayerViewController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVAirPlayMediaViewController

- (TVAirPlayMediaViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVAirPlayMediaViewController;
  v2 = -[TVAirPlayMediaViewController init](&v11, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = &_dispatch_main_q;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000196B4;
    v8[3] = &unk_1000311E8;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( &_dispatch_main_q,  @"TVAirPlay - Media View Controller",  v8);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVAirPlayMediaViewController;
  -[TVAirPlayMediaViewController dealloc](&v3, "dealloc");
}

- (id)preferredFocusEnvironments
{
  dialogViewController = self->_dialogViewController;
  if (dialogViewController) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController preferredFocusEnvironments](dialogViewController, "preferredFocusEnvironments"));
  }
  else {
    uint64_t v4 = 0LL;
  }
  pinViewController = self->_pinViewController;
  if (pinViewController
    || (pinViewController = self->_videoPlayerViewController) != 0LL
    || (pinViewController = self->_presentationViewController) != 0LL
    || (pinViewController = self->_aprkViewController) != 0LL)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([pinViewController preferredFocusEnvironments]);

    uint64_t v4 = (void *)v6;
  }

  if ([v4 count])
  {
    id v7 = v4;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController view](self, "view"));
    v10 = v8;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  return v7;
}

- (void)setPinSession:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_pinSession] & 1) == 0)
  {
    if (v5)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___TVAirPlayPINViewController);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 titleString]);
      -[TVAirPlayPINViewController setTitle:](v6, "setTitle:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 promptString]);
      -[TVAirPlayPINViewController setClientName:](v6, "setClientName:", v8);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 messageString]);
      -[TVAirPlayPINViewController setPinCode:](v6, "setPinCode:", v9);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000199C8;
      v13[3] = &unk_100030CA8;
      id v14 = v5;
      -[TVAirPlayPINViewController setDismissHandler:](v6, "setDismissHandler:", v13);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    pinViewController = self->_pinViewController;
    self->_pinViewController = &v6->super;
    objc_super v11 = v6;
    v12 = pinViewController;

    objc_storeStrong((id *)&self->_pinSession, a3);
    -[TVAirPlayMediaViewController _transitionFromViewController:toViewController:]( self,  "_transitionFromViewController:toViewController:",  v12,  v11);
  }
}

- (void)setDialogInfoSession:(id)a3
{
  id v5 = a3;
  p_dialogInfoSession = &self->_dialogInfoSession;
  if (([v5 isEqual:self->_dialogInfoSession] & 1) == 0)
  {
    dialogViewController = self->_dialogViewController;
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 titleString]);
      if (dialogViewController)
      {
        -[UIAlertController setTitle:](dialogViewController, "setTitle:", v8);

        id v9 = self->_dialogViewController;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 messageString]);
        -[UIAlertController setMessage:](v9, "setMessage:", v10);

        dialogViewController = self->_dialogViewController;
      }

      else
      {
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v5 messageString]);
        dialogViewController = (UIAlertController *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v11,  1LL));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"TVAirPlayOK" value:&stru_1000325D8 table:0]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100019BF0;
        v17[3] = &unk_100031210;
        id v18 = v5;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  v17));

        -[UIAlertController addAction:](dialogViewController, "addAction:", v14);
        -[TVAirPlayMediaViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  dialogViewController,  1LL,  0LL);
      }
    }

    else if (dialogViewController)
    {
      -[TVAirPlayMediaViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
      dialogViewController = 0LL;
    }

    v15 = self->_dialogViewController;
    self->_dialogViewController = dialogViewController;
    v16 = dialogViewController;

    objc_storeStrong((id *)p_dialogInfoSession, a3);
  }
}

- (void)setPresentationSession:(id)a3
{
  id v9 = (TVAirPlayPresentationViewController *)a3;
  if ((-[TVAirPlayPresentationViewController isEqual:](v9, "isEqual:", self->_presentationSession) & 1) == 0)
  {
    id v5 = v9;
    if (v9) {
      id v5 = -[TVAirPlayPresentationViewController initWithSession:]( objc_alloc(&OBJC_CLASS___TVAirPlayPresentationViewController),  "initWithSession:",  v9);
    }
    presentationViewController = self->_presentationViewController;
    self->_presentationViewController = v5;
    id v7 = v5;
    v8 = presentationViewController;

    objc_storeStrong((id *)&self->_presentationSession, a3);
    -[TVAirPlayMediaViewController _transitionFromViewController:toViewController:]( self,  "_transitionFromViewController:toViewController:",  v8,  v7);
  }
}

- (void)setVideoPlaybackSession:(id)a3
{
  id v11 = a3;
  if (([v11 isEqual:self->_videoPlaybackSession] & 1) == 0)
  {
    if (v11)
    {
      id v5 = objc_alloc(&OBJC_CLASS____TVAirPlayVideoPlayerViewController);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v11 player]);
      id v7 = -[_TVAirPlayVideoPlayerViewController initWithPlayer:invalidateWhenDone:]( v5,  "initWithPlayer:invalidateWhenDone:",  v6,  1LL);

      -[_TVAirPlayVideoPlayerViewController setSuppressErrorAlerts:](v7, "setSuppressErrorAlerts:", 1LL);
      -[_TVAirPlayVideoPlayerViewController setVideoSession:](v7, "setVideoSession:", v11);
    }

    else
    {
      id v7 = 0LL;
    }

    videoPlayerViewController = self->_videoPlayerViewController;
    self->_videoPlayerViewController = v7;
    id v9 = v7;
    v10 = videoPlayerViewController;

    objc_storeStrong((id *)&self->_videoPlaybackSession, a3);
    -[TVAirPlayMediaViewController _transitionFromViewController:toViewController:]( self,  "_transitionFromViewController:toViewController:",  v10,  v9);
  }
}

- (void)setAPRKVideoSession:(id)a3
{
  id v9 = (TVAirPlayAPRKViewController *)a3;
  if ((-[TVAirPlayAPRKViewController isEqual:](v9, "isEqual:", self->_APRKVideoSession) & 1) == 0)
  {
    id v5 = v9;
    if (v9) {
      id v5 = -[TVAirPlayAPRKViewController initWithVideoSession:]( objc_alloc(&OBJC_CLASS___TVAirPlayAPRKViewController),  "initWithVideoSession:",  v9);
    }
    aprkViewController = self->_aprkViewController;
    self->_aprkViewController = v5;
    id v7 = v5;
    v8 = aprkViewController;

    objc_storeStrong((id *)&self->_APRKVideoSession, a3);
    -[TVAirPlayMediaViewController _transitionFromViewController:toViewController:]( self,  "_transitionFromViewController:toViewController:",  v8,  v7);
  }
}

- (void)dismiss
{
  id v3 = sub_100004250();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No more active sessions, dismiss.", v12, 2u);
  }

  if (!-[TVAirPlayMediaViewController dismissing](self, "dismissing"))
  {
    -[TVAirPlayMediaViewController setDismissing:](self, "setDismissing:", 1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController viewIfLoaded](self, "viewIfLoaded"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 windowScene]);
    v8 = (UISceneSession *)objc_claimAutoreleasedReturnValue([v7 session]);
    sceneSession = v8;
    if (!v8) {
      sceneSession = self->_sceneSession;
    }
    v10 = sceneSession;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v11 requestSceneSessionDestruction:v10 options:0 errorHandler:&stru_100031250];
  }

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = sub_100004250();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Media View Controller ready for display %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  -[TVAirPlayMediaViewController setDelegate:](self, "setDelegate:", v6);
  [v6 mediaViewControllerDidBecomeReady:self];
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004250();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "End presentation for session with options: %{public}@",  buf,  0xCu);
  }

  if (!-[TVAirPlayMediaViewController dismissing](self, "dismissing"))
  {
    id v10 = sub_100004250();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Forced to exit AirPlay", buf, 2u);
    }

    -[TVAirPlayPinSession userStop](self->_pinSession, "userStop");
    -[TVAirPlayInfoSession userStop](self->_dialogInfoSession, "userStop");
    -[TVAirPlayPresentationSession userStop](self->_presentationSession, "userStop");
    -[TVAirPlayURLSession userStop](self->_videoPlaybackSession, "userStop");
    -[TVAirPlayAPRKVideoSession userStop](self->_APRKVideoSession, "userStop");
  }

  dispatch_time_t v12 = dispatch_time(0LL, 300000000LL);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001A288;
  v14[3] = &unk_100031278;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_after(v12, &_dispatch_main_q, v14);
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v2 setClasses:v6 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v6 = (TVAirPlayPresentationViewController *)a3;
  id v7 = (TVAirPlayPresentationViewController *)a4;
  id v8 = sub_100004250();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Transitioning from %@ to %@", buf, 0x16u);
  }

  if (v6 != v7)
  {
    id v10 = "i40@0:8@NSString16@24^@32" + 3;
    if (!v7) {
      goto LABEL_18;
    }
    -[TVAirPlayMediaViewController addChildViewController:](self, "addChildViewController:", v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](v7, "view"));
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController view](self, "view"));
    [v12 bounds];
    objc_msgSend(v11, "setFrame:");

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](v7, "view"));
    [v13 setAlpha:0.0];

    if (self->_presentationViewController == v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController view](self, "view"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](v7, "view"));
      [v16 insertSubview:v17 atIndex:0];

LABEL_17:
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10001A784;
      v27[3] = &unk_100030CA8;
      v20 = v7;
      v28 = v20;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10001A7B8;
      v26[3] = &unk_1000312A0;
      v26[4] = self;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v27,  v26,  *((double *)v10 + 310));
      -[TVAirPlayPresentationViewController didMoveToParentViewController:](v20, "didMoveToParentViewController:", self);

LABEL_18:
      if (v6)
      {
        -[TVAirPlayPresentationViewController willMoveToParentViewController:]( v6,  "willMoveToParentViewController:",  0LL);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_10001A7C0;
        v24[3] = &unk_100030CA8;
        v25 = v6;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10001A7F4;
        v21[3] = &unk_1000312C8;
        v22 = v25;
        v23 = self;
        +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v24,  v21,  *((double *)v10 + 310));
      }

      goto LABEL_20;
    }

    pinViewController = self->_pinViewController;
    if (pinViewController == (UIViewController *)v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController view](self, "view"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](v7, "view"));
    }

    else
    {
      if ((TVAirPlayPresentationViewController *)self->_videoPlayerViewController != v7
        && (TVAirPlayPresentationViewController *)self->_aprkViewController != v7)
      {
        id v15 = sub_100004250();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v10 = "i40@0:8@NSString16@24^@32" + 3;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Unexpected view controller in hierarchy",  buf,  2u);
        }

        goto LABEL_17;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayMediaViewController view](self, "view"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](v7, "view"));
      if (pinViewController)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_pinViewController, "view"));
        [v16 insertSubview:v18 belowSubview:v19];

LABEL_16:
        id v10 = "@0:8@NSString16@24^@32";
        goto LABEL_17;
      }
    }

    [v16 addSubview:v18];
    goto LABEL_16;
  }

- (id)_stateDump
{
  id v17 = @"pinViewController";
  pinViewController = self->_pinViewController;
  uint64_t v4 = (uint64_t)pinViewController;
  if (!pinViewController) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v15 = v4;
  v22[0] = v4;
  id v18 = @"dialogViewController";
  dialogViewController = self->_dialogViewController;
  id v6 = dialogViewController;
  if (!dialogViewController) {
    id v6 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v4, v17, v18));
  }
  v22[1] = v6;
  v19 = @"videoPlayerViewController";
  videoPlayerViewController = self->_videoPlayerViewController;
  id v8 = videoPlayerViewController;
  if (!videoPlayerViewController) {
    id v8 = (_TVAirPlayVideoPlayerViewController *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v22[2] = v8;
  v20 = @"presentationViewController";
  presentationViewController = self->_presentationViewController;
  id v10 = presentationViewController;
  if (!presentationViewController) {
    id v10 = (TVAirPlayPresentationViewController *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v22[3] = v10;
  v21 = @"aprkViewController";
  aprkViewController = self->_aprkViewController;
  dispatch_time_t v12 = aprkViewController;
  if (!aprkViewController) {
    dispatch_time_t v12 = (TVAirPlayAPRKViewController *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v22[4] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  &v17,  5LL,  v15));
  if (aprkViewController)
  {
    if (presentationViewController) {
      goto LABEL_13;
    }
  }

  else
  {

    if (presentationViewController)
    {
LABEL_13:
      if (videoPlayerViewController) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }

  if (videoPlayerViewController)
  {
LABEL_14:
    if (dialogViewController) {
      goto LABEL_15;
    }
LABEL_20:

    if (pinViewController) {
      return v13;
    }
LABEL_21:

    return v13;
  }

- (UISceneSession)sceneSession
{
  return self->_sceneSession;
}

- (void)setSceneSession:(id)a3
{
}

- (TVAirPlayPinSession)pinSession
{
  return self->_pinSession;
}

- (TVAirPlayInfoSession)dialogInfoSession
{
  return self->_dialogInfoSession;
}

- (TVAirPlayPresentationSession)presentationSession
{
  return self->_presentationSession;
}

- (TVAirPlayURLSession)videoPlaybackSession
{
  return self->_videoPlaybackSession;
}

- (TVAirPlayAPRKVideoSession)APRKVideoSession
{
  return self->_APRKVideoSession;
}

- (TVAirPlayMediaViewControllerDelegate)delegate
{
  return (TVAirPlayMediaViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)dismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (UIViewController)pinViewController
{
  return self->_pinViewController;
}

- (void)setPinViewController:(id)a3
{
}

- (UIAlertController)dialogViewController
{
  return self->_dialogViewController;
}

- (void)setDialogViewController:(id)a3
{
}

- (_TVAirPlayVideoPlayerViewController)videoPlayerViewController
{
  return self->_videoPlayerViewController;
}

- (void)setVideoPlayerViewController:(id)a3
{
}

- (TVAirPlayPresentationViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (TVAirPlayAPRKViewController)aprkViewController
{
  return self->_aprkViewController;
}

- (void)setAprkViewController:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
}

@end