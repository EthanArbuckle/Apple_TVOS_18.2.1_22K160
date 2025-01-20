@interface DASListenerDelegate
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation DASListenerDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  if ([v6 hasEntitlement:@"com.apple.backboard.display.archive"])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DASClientToServiceProtocol));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v7 setClasses:v11 forSelector:"nameAndDumpAllWithCompletion:" argumentIndex:0 ofReply:1];

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v7 setClasses:v15 forSelector:"dumpAllWithCompletion:" argumentIndex:0 ofReply:1];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 extractNSXPCConnectionWithConfigurator:&stru_100010360]);
    [v16 setExportedInterface:v7];
    v17 = objc_opt_new(&OBJC_CLASS___DASProcessor);
    [v16 setExportedObject:v17];

    v18 = (void *)BSDispatchQueueCreateWithFixedPriority("DASProcessor", 0LL, 48LL);
    [v16 _setQueue:v18];

    [v16 activate];
  }

  else
  {
    id v19 = sub_10000661C();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "rejecting unauthorized access from %@",  buf,  0xCu);
    }

    [v5 invalidate];
  }
}

@end