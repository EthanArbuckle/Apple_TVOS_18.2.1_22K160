@interface DMDAssetRemoveOperation
- (void)main;
- (void)removeOperationDidFinish:(id)a3 asset:(id)a4;
@end

@implementation DMDAssetRemoveOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001F9A8;
  v2[3] = &unk_10009E0E8;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)removeOperationDidFinish:(id)a3 asset:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001FE04;
  v5[3] = &unk_10009E138;
  v6 = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 error]);
  id v4 = v7;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](v6, "performBackgroundContextBlock:", v5);
}

@end