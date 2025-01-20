@interface TKTokenDriverHostContext
+ (id)_allowedItemPayloadClasses;
- (NSError)error;
- (TKHostTokenDriver)driver;
- (TKHostTokenRegistry)registry;
- (TKTokenDriverProtocol)tokenDriverProtocol;
- (void)getTokenConfigurationEndpointWithReply:(id)a3;
- (void)setDriver:(id)a3;
- (void)setError:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation TKTokenDriverHostContext

+ (id)_allowedItemPayloadClasses
{
  if (qword_100024090 != -1) {
    dispatch_once(&qword_100024090, &stru_10001C9A0);
  }
  return (id)qword_100024088;
}

- (void)getTokenConfigurationEndpointWithReply:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenDriverHostContext registry](self, "registry"));
  id v10 = v6;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"TKHostTokenDriver.m" lineNumber:38 description:@"Driver context does not have registry set"];

    v6 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 listener]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
  v5[2](v5, v8);
}

- (TKTokenDriverProtocol)tokenDriverProtocol
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenDriverHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000DF64;
  v6[3] = &unk_10001C890;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 synchronousRemoteObjectProxyWithErrorHandler:v6]);

  return (TKTokenDriverProtocol *)v4;
}

- (TKHostTokenDriver)driver
{
  return (TKHostTokenDriver *)objc_loadWeakRetained((id *)&self->_driver);
}

- (void)setDriver:(id)a3
{
}

- (TKHostTokenRegistry)registry
{
  return (TKHostTokenRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (void)setRegistry:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end