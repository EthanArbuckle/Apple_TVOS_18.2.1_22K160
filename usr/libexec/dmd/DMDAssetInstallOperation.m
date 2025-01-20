@interface DMDAssetInstallOperation
- (DMDRemoteAssetResolver)assetResolver;
- (void)installOperationDidFinish:(id)a3 asset:(id)a4;
- (void)main;
- (void)setAssetResolver:(id)a3;
@end

@implementation DMDAssetInstallOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001F274;
  v2[3] = &unk_10009E0E8;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)installOperationDidFinish:(id)a3 asset:(id)a4
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001F6FC;
  v8[3] = &unk_10009E110;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 error]);
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v8);
}

- (DMDRemoteAssetResolver)assetResolver
{
  return (DMDRemoteAssetResolver *)objc_loadWeakRetained((id *)&self->_assetResolver);
}

- (void)setAssetResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end