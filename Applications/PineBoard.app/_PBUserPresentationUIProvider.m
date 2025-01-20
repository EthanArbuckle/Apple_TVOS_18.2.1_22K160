@interface _PBUserPresentationUIProvider
- (NSString)className;
- (NSString)providerIdentifier;
- (NSString)serviceName;
- (_PBUserPresentationUIProvider)initWithServiceName:(id)a3 className:(id)a4 viewServicePrepareHandler:(id)a5;
- (id)prepareHandler;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
@end

@implementation _PBUserPresentationUIProvider

- (_PBUserPresentationUIProvider)initWithServiceName:(id)a3 className:(id)a4 viewServicePrepareHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____PBUserPresentationUIProvider;
  v11 = -[_PBUserPresentationUIProvider init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    serviceName = v11->_serviceName;
    v11->_serviceName = v12;

    v14 = (NSString *)[v9 copy];
    className = v11->_className;
    v11->_className = v14;

    id v16 = [v10 copy];
    id prepareHandler = v11->_prepareHandler;
    v11->_id prepareHandler = v16;
  }

  return v11;
}

- (NSString)providerIdentifier
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  self->_serviceName,  self->_className));
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serviceName = self->_serviceName;
  className = self->_className;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100144E4C;
  v9[3] = &unk_1003D3048;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  id v8 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  className,  serviceName,  v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)className
{
  return self->_className;
}

- (id)prepareHandler
{
  return self->_prepareHandler;
}

- (void).cxx_destruct
{
}

@end