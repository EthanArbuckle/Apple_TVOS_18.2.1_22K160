@interface DMDConfigurationSourceAssetResolveOperation
- (BOOL)isAsynchronous;
- (DMDRemoteAssetResolutionContext)context;
- (void)main;
- (void)setContext:(id)a3;
@end

@implementation DMDConfigurationSourceAssetResolveOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002B1C8;
  v3[3] = &unk_10009E6E8;
  v4 = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceAssetResolveOperation context](self, "context"));
  id v2 = v5;
  -[DMDConfigurationSourceTaskOperation fetchRemoteProxy:](v4, "fetchRemoteProxy:", v3);
}

- (DMDRemoteAssetResolutionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end