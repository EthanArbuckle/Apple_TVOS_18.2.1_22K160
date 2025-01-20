@interface ACDataclassOwnersManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ACDataclassOwnersManagerListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:kACDAllAccountsAccessEntitlement]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACDDataclassOwnersManagerInterface XPCInterface]( &OBJC_CLASS___ACDDataclassOwnersManagerInterface,  "XPCInterface"));
    [v4 setExportedInterface:v7];

    v8 = objc_alloc_init(&OBJC_CLASS___ACRemoteDataclassOwnersManager);
    [v4 setExportedObject:v8];

    [v4 resume];
  }

  return v6;
}

@end