@interface DMDDeclarationActionOperation
- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4;
@end

@implementation DMDDeclarationActionOperation

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  v11[0] = DMFDeclarationStatusFailed;
  v10[0] = DMFDeclarationStateStatusKey;
  v10[1] = DMFDeclarationStateErrorChainKey;
  id v6 = a3;
  id v7 = DMDErrorChainFromError(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  -[DMDPayloadActionOperation addStatusEntriesFromDictionary:](self, "addStatusEntriesFromDictionary:", v9);

  [v6 setFailed:1];
  -[DMDPayloadActionOperation endOperationWithPayloadMetadata:](self, "endOperationWithPayloadMetadata:", v6);
}

@end