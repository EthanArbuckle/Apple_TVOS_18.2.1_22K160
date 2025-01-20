@interface DMDConfigurationRemoveOperation
- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4;
- (void)main;
- (void)removalOperationDidFinish:(id)a3 userInfo:(id)a4;
@end

@implementation DMDConfigurationRemoveOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100029BF0;
  v2[3] = &unk_10009E0E8;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)removalOperationDidFinish:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002A32C;
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

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  v11[0] = DMFDeclarationStatusFailedRemove;
  v10[0] = DMFDeclarationStateStatusKey;
  v10[1] = DMFDeclarationStateErrorChainKey;
  id v6 = a3;
  id v7 = DMDErrorChainFromError(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  -[DMDPayloadActionOperation addStatusEntriesFromDictionary:](self, "addStatusEntriesFromDictionary:", v9);

  [v6 setFailed:1];
  -[DMDPayloadActionOperation endOperationWithPayloadMetadata:](self, "endOperationWithPayloadMetadata:", v6);
}

@end