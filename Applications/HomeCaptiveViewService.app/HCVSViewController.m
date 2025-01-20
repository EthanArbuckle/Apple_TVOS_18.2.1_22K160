@interface HCVSViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_TtC22HomeCaptiveViewService16SetupCoordinator)setupCoordinator;
- (void)setSetupCoordinator:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation HCVSViewController

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  if (qword_10001AB58 != -1) {
    dispatch_once(&qword_10001AB58, &stru_1000145F0);
  }
  v5 = (os_log_s *)qword_10001AB60;
  if (os_log_type_enabled((os_log_t)qword_10001AB60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting HomeCaptiveViewService", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCVSViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v7 = -[SetupCoordinator initWithHostViewController:remoteViewControllerProxy:]( objc_alloc(&OBJC_CLASS____TtC22HomeCaptiveViewService16SetupCoordinator),  "initWithHostViewController:remoteViewControllerProxy:",  self,  v6);
  -[HCVSViewController setSetupCoordinator:](self, "setSetupCoordinator:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HCVSViewController setupCoordinator](self, "setupCoordinator"));
  [v8 start];
}

+ (id)_exportedInterface
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError);
  v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v2,  v3,  v4,  v5,  v6,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v9 setClasses:v8 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v9 setClasses:v8 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v9 setClasses:v8 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];

  return v9;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (qword_10001AB58 != -1) {
    dispatch_once(&qword_10001AB58, &stru_1000145F0);
  }
  v8 = (os_log_s *)qword_10001AB60;
  if (os_log_type_enabled((os_log_t)qword_10001AB60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ending HomeCaptiveViewService", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HCVSViewController setupCoordinator](self, "setupCoordinator"));
  [v9 stop];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HCVSViewController presentedViewController](self, "presentedViewController"));
  if (v10)
  {
    if (qword_10001AB58 == -1)
    {
      v11 = (os_log_s *)qword_10001AB60;
      if (!os_log_type_enabled((os_log_t)qword_10001AB60, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        -[HCVSViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v7);
        goto LABEL_12;
      }
    }

    else
    {
      dispatch_once(&qword_10001AB58, &stru_1000145F0);
      v11 = (os_log_s *)qword_10001AB60;
      if (!os_log_type_enabled((os_log_t)qword_10001AB60, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
    }

    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dismissing View Controller", v12, 2u);
    goto LABEL_9;
  }

  if (v7) {
    v7[2](v7);
  }
LABEL_12:
}

- (_TtC22HomeCaptiveViewService16SetupCoordinator)setupCoordinator
{
  return self->_setupCoordinator;
}

- (void)setSetupCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end