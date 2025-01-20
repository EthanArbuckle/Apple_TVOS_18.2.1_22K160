@interface SAListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation SAListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.spaceattribution.private"]);
  v6 = v5;
  if (v5 && (id v5 = [v5 BOOLValue], (_DWORD)v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SpaceAttribProtocol));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SAReplyProtocol));
    [v7 setInterface:v8 forSelector:"addAppSizerHandler:reply:" argumentIndex:0 ofReply:0];
    [v7 setInterface:v8 forSelector:"addURLSizerHandler:withURLs:reply:" argumentIndex:0 ofReply:0];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___SAPathInfo),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v7 setClasses:v11 forSelector:"registerPaths:reply:" argumentIndex:0 ofReply:0];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___SAPathInfo),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v7 setClasses:v14 forSelector:"unregisterPaths:reply:" argumentIndex:0 ofReply:0];
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v7 setClasses:v17 forSelector:"addURLSizerHandler:withURLs:reply:" argumentIndex:1 ofReply:0];
    [v4 setExportedInterface:v7];
    v18 = objc_opt_new(&OBJC_CLASS___SAHelper);
    [v4 setExportedObject:v18];

    uint64_t v19 = SALog([v4 resume]);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100033378();
    }

    BOOL v21 = 1;
  }

  else
  {
    uint64_t v22 = SALog(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
      sub_10003334C();
    }
    BOOL v21 = 0;
  }

  return v21;
}

@end