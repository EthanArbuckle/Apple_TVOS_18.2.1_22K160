@interface PBRemoteBulletinViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)isUserInteractionEnabled;
- (PBRemoteBulletinViewControllerDelegate)delegate;
- (id)clientPresentationCompletion;
- (void)_callClientCompletionWithSuccess:(BOOL)a3;
- (void)didReceiveBulletinResponse:(id)a3;
- (void)dismissViewServiceWithReason:(unint64_t)a3 completion:(id)a4;
- (void)handleMenuButtonWithCompletion:(id)a3;
- (void)prepareViewServiceWithBulletin:(id)a3;
- (void)setClientPresentationCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)toggleBulletinSize;
- (void)updateViewServiceWithBulletin:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PBRemoteBulletinViewController

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector(v5, "remoteBulletinViewController:didReceiveBulletinResponse:");

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (void)handleMenuButtonWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  [v5 handleMenuButtonWithCompletion:v4];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_BOOL userInteractionEnabled = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
    BOOL userInteractionEnabled = self->_userInteractionEnabled;
    id v6 = sub_100082754();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (userInteractionEnabled)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412546;
        v11 = self;
        __int16 v12 = 2112;
        v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling proxy %@ to begin user interaction",  buf,  0x16u);
      }

      [v4 bulletinServiceBeginUserInteraction];
    }

    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412546;
        v11 = self;
        __int16 v12 = 2112;
        v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling proxy %@ to end user interaction",  buf,  0x16u);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000F53F0;
      v9[3] = &unk_1003CFEE0;
      v9[4] = self;
      [v4 bulletinServiceEndUserInteractionWithCompletion:v9];
    }
  }

- (void)toggleBulletinSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  [v2 bulletinServiceToggleSize];
}

- (void)prepareViewServiceWithBulletin:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  id v6 = sub_100082754();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling proxy %@ begin presentation with bulletin %@",  (uint8_t *)&v8,  0x20u);
  }

  [v5 bulletinServiceBeginPresentationWithBulletin:v4];
}

- (void)updateViewServiceWithBulletin:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  id v6 = sub_100082754();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling proxy %@ update with bulletin %@",  (uint8_t *)&v8,  0x20u);
  }

  [v5 bulletinServiceUpdateWithBulletin:v4];
}

- (void)dismissViewServiceWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_1000F594C;
  v34 = sub_1000F595C;
  dispatch_source_t v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
  int v8 = (dispatch_source_s *)v31[5];
  dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  __int16 v10 = (dispatch_source_s *)v31[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000F5974;
  handler[3] = &unk_1003D0AD8;
  v29 = &v30;
  handler[4] = self;
  v11 = v7;
  v28 = v11;
  dispatch_source_set_event_handler(v10, handler);
  __int16 v12 = (dispatch_source_s *)v31[5];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000F59CC;
  v24[3] = &unk_1003D0AD8;
  v26 = &v30;
  v24[4] = self;
  id v13 = v11;
  v25 = v13;
  dispatch_source_set_cancel_handler(v12, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  id v15 = sub_100082754();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412802;
    v37 = self;
    __int16 v38 = 2112;
    v39 = v14;
    __int16 v40 = 2112;
    v41 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling proxy %@ dismiss with reason %@",  buf,  0x20u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000F5A34;
  v23[3] = &unk_1003D0790;
  v23[4] = &v30;
  [v14 bulletinServiceEndPresentationWithReason:a3 completion:v23];
  -[PBRemoteBulletinViewController _callClientCompletionWithSuccess:](self, "_callClientCompletionWithSuccess:", 0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000F5A58;
  v21[3] = &unk_1003D0110;
  id v20 = v6;
  id v22 = v20;
  dispatch_group_notify(v13, v19, v21);

  dispatch_resume((dispatch_object_t)v31[5]);
  if (!v14) {
    dispatch_source_cancel((dispatch_source_t)v31[5]);
  }

  _Block_object_dispose(&v30, 8);
}

- (void)didReceiveBulletinResponse:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBRemoteBulletinViewController delegate](self, "delegate"));
    [v5 remoteBulletinViewController:self didReceiveBulletinResponse:v4];
  }

+ (id)serviceViewControllerInterface
{
  uint64_t v2 = PBSBulletinPresenterXPCInterface(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)exportedInterface
{
  uint64_t v2 = PBSBulletinPresenterHostXPCInterface(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRemoteBulletinViewController;
  -[PBRemoteBulletinViewController viewServiceDidTerminateWithError:](&v7, "viewServiceDidTerminateWithError:", v4);
  id v5 = sub_100082754();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    dispatch_time_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ viewService terminated with error %@",  buf,  0x16u);
  }

  +[PBBulletinService applicationTerminateBulletinViewController:]( &OBJC_CLASS___PBBulletinService,  "applicationTerminateBulletinViewController:",  self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBRemoteBulletinViewController;
  -[PBRemoteBulletinViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PBRemoteBulletinViewController _callClientCompletionWithSuccess:](self, "_callClientCompletionWithSuccess:", 1LL);
}

- (void)_callClientCompletionWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082754();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = @"NO";
    if (v3) {
      objc_super v7 = @"YES";
    }
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "bulletinViewController %@ calling client completion. Success? %@",  (uint8_t *)&v10,  0x16u);
  }

  int v8 = self;
  objc_sync_enter(v8);
  dispatch_time_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBRemoteBulletinViewController clientPresentationCompletion]( v8,  "clientPresentationCompletion"));
  -[PBRemoteBulletinViewController setClientPresentationCompletion:](v8, "setClientPresentationCompletion:", 0LL);
  objc_sync_exit(v8);

  if (v9) {
    v9[2](v9, v3);
  }
}

- (PBRemoteBulletinViewControllerDelegate)delegate
{
  return (PBRemoteBulletinViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (id)clientPresentationCompletion
{
  return self->_clientPresentationCompletion;
}

- (void)setClientPresentationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end