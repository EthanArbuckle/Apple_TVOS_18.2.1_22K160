@interface DMDCommandExecuteOperation
- (void)main;
- (void)operationDidFinish:(id)a3 userInfo:(id)a4;
@end

@implementation DMDCommandExecuteOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100020460;
  v2[3] = &unk_10009E0E8;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)operationDidFinish:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100020AC4;
  v11[3] = &unk_10009E180;
  v11[4] = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v6 error]);
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = v12;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v11);
}

@end