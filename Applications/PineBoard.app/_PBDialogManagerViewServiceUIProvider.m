@interface _PBDialogManagerViewServiceUIProvider
- (NSString)className;
- (NSString)serviceName;
- (PBSimpleRemoteViewController)viewController;
- (_PBDialogManagerViewServiceUIProvider)initWithService:(id)a3 className:(id)a4;
- (_PBDialogManagerViewServiceUIProvider)initWithViewController:(id)a3;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
@end

@implementation _PBDialogManagerViewServiceUIProvider

- (_PBDialogManagerViewServiceUIProvider)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBDialogManagerViewServiceUIProvider;
  v6 = -[_PBDialogManagerViewServiceUIProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (_PBDialogManagerViewServiceUIProvider)initWithService:(id)a3 className:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PBDialogManagerViewServiceUIProvider;
  objc_super v9 = -[_PBDialogManagerViewServiceUIProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_className, a4);
  }

  return v10;
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  v4 = (void (**)(id, PBViewServiceContentPresentingViewController *, void))a3;
  if (self->_viewController)
  {
    id v5 = -[PBViewServiceContentPresentingViewController initWithRemoteViewController:supportsInterruption:]( objc_alloc(&OBJC_CLASS___PBViewServiceContentPresentingViewController),  "initWithRemoteViewController:supportsInterruption:",  self->_viewController,  1LL);
    v4[2](v4, v5, 0LL);
  }

  else
  {
    objc_initWeak(&location, self);
    serviceName = self->_serviceName;
    className = self->_className;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000AA098;
    v9[3] = &unk_1003D3048;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    id v8 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  className,  serviceName,  v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (PBSimpleRemoteViewController)viewController
{
  return self->_viewController;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)className
{
  return self->_className;
}

- (void).cxx_destruct
{
}

@end