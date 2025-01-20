@interface PBSimpleRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)terminated;
- (BSSimpleAssertion)dismissalAssertion;
- (BSWatchdog)dismissalWatchdog;
- (PBSimpleRemoteViewControllerDelegate)delegate;
- (unint64_t)version;
- (void)_dismissViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 dismissalResult:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)dismissViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 completion:(id)a5;
- (void)dismissWithResult:(id)a3;
- (void)messageViewServiceWithMessage:(id)a3 reply:(id)a4;
- (void)prepareViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PBSimpleRemoteViewController

- (void)prepareViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unint64_t v9 = -[PBSimpleRemoteViewController version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  v11 = v10;
  if (v9 < 2)
  {
    [v10 viewServiceBeginPresentationWithOptions:v8];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100180C08;
    v15[3] = &unk_1003D0110;
    v12 = &v16;
    id v16 = v7;
    id v14 = v7;
    dispatch_async(&_dispatch_main_q, v15);
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100180BE4;
    v17[3] = &unk_1003D0110;
    v12 = &v18;
    id v18 = v7;
    id v13 = v7;
    [v11 viewServiceBeginPresentationWithOptions:v8 completion:v17];
  }
}

- (void)messageViewServiceWithMessage:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100180CD8;
  v10[3] = &unk_1003DA4B0;
  id v11 = v6;
  id v9 = v6;
  [v8 viewServiceHandleMessage:v7 reply:v10];
}

- (void)dismissViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  dismissalWatchdog = self->_dismissalWatchdog;
  if (dismissalWatchdog)
  {
    -[BSWatchdog invalidate](dismissalWatchdog, "invalidate");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289518((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController delegate](self, "delegate"));
    [v13 viewServiceDidTerminateWithError:v4];

    id v14 = -[PBSimpleRemoteViewController disconnect](self, "disconnect");
  }
}

- (void)dismissWithResult:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100180E28;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  BSDispatchMain(v4);
}

- (void)_dismissViewServiceAnimated:(BOOL)a3 withOptions:(id)a4 dismissalResult:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void (**)(void, void, void))v11;
  if (self->_dismissalWatchdog)
  {
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100289588((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
      }
      v12[2](v12, 1LL, 0LL);
    }
  }

  else
  {
    v20 = -[PBSAnimationWatchdogProvider initWithTimeout:]( objc_alloc(&OBJC_CLASS___PBSAnimationWatchdogProvider),  "initWithTimeout:",  2.0);
    v21 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100181174;
    v27[3] = &unk_1003D6708;
    v27[4] = self;
    v28 = v12;
    v22 = -[BSWatchdog initWithProvider:queue:completion:]( v21,  "initWithProvider:queue:completion:",  v20,  &_dispatch_main_q,  v27);
    objc_storeStrong((id *)&self->_dismissalWatchdog, v22);
    -[BSWatchdog start](self->_dismissalWatchdog, "start");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100181238;
    v25[3] = &unk_1003CFF08;
    v26 = v22;
    v24 = v22;
    [v23 viewServiceEndPresentationWithOptions:v9 completion:v25];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSimpleRemoteViewController;
  -[PBSimpleRemoteViewController dealloc](&v3, "dealloc");
}

+ (id)serviceViewControllerInterface
{
  if (qword_1004711E0 != -1) {
    dispatch_once(&qword_1004711E0, &stru_1003DA4D0);
  }
  return (id)qword_1004711D8;
}

+ (id)exportedInterface
{
  if (qword_1004711F0 != -1) {
    dispatch_once(&qword_1004711F0, &stru_1003DA4F0);
  }
  return (id)qword_1004711E8;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (PBSimpleRemoteViewControllerDelegate)delegate
{
  return (PBSimpleRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BSSimpleAssertion)dismissalAssertion
{
  return self->_dismissalAssertion;
}

- (BSWatchdog)dismissalWatchdog
{
  return self->_dismissalWatchdog;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void).cxx_destruct
{
}

@end