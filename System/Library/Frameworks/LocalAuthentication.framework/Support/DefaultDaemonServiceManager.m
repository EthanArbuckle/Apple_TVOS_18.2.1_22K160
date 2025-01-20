@interface DefaultDaemonServiceManager
- (BOOL)allowsMultipleClientsForServiceType:(id)a3;
- (id)queue;
- (void)bootstrapServiceWithType:(id)a3 clientConnection:(id)a4 completionHandler:(id)a5;
@end

@implementation DefaultDaemonServiceManager

- (id)queue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils sharedInstance](&OBJC_CLASS___DaemonUtils, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serverQueue]);

  return v3;
}

- (void)bootstrapServiceWithType:(id)a3 clientConnection:(id)a4 completionHandler:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([&off_100031ED0 objectForKeyedSubscript:v22]);
  if (v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:v10]),
        unsigned __int8 v12 = [v11 BOOLValue],
        v11,
        (v12 & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  v10));
    v9[2](v9, 0LL, v14);
  }

  else
  {
    if ([v22 isEqualToString:@"kLAServiceTypeSecureStorage"])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SecureStorageProvider sharedInstance](&OBJC_CLASS___SecureStorageProvider, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 secureStorage]);

      v15 = &OBJC_PROTOCOL___LASecureStorageService;
    }

    else
    {
      if (![v22 isEqualToString:@"kLAServiceTypeEnvironment"])
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid serviceType: %@",  v22));
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v14));
        v9[2](v9, 0LL, v21);

        goto LABEL_10;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonServiceLocator sharedInstance](&OBJC_CLASS___DaemonServiceLocator, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 environment]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v17 xpcController]);

      v15 = &OBJC_PROTOCOL___LACEnvironmentServiceXPC;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  v15));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultDaemonServiceManager queue](self, "queue"));
    id v20 = [[LAServiceAdapter alloc] initWithExportedInterface:v18 exportedObject:v14 queue:v19];
    ((void (**)(id, id, void *))v9)[2](v9, v20, 0LL);
  }

- (BOOL)allowsMultipleClientsForServiceType:(id)a3
{
  return 1;
}

@end