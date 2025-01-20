@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DataDetectorsSourceAccessProtocol));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  v7 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setClasses:v8 forSelector:"filesForSourceRead:resourceType:withReply:" argumentIndex:0 ofReply:0];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSFileHandle);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v10,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  [v5 setClasses:v12 forSelector:"filesForSourceRead:resourceType:withReply:" argumentIndex:0 ofReply:1];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v13,  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  [v5 setClasses:v17 forSelector:"writeSourceFromRawData:source:signature:withReply:" argumentIndex:0 ofReply:0];
  [v4 setExportedInterface:v5];
  v18 = (void *)objc_opt_new(&OBJC_CLASS___DataDetectorsSourceAccess);
  if (v4)
  {
    [v4 auditToken];
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
  }

  v20[0] = v21;
  v20[1] = v22;
  [v18 setAuditToken:v20];
  objc_msgSend(v18, "setProcessIdentifier:", objc_msgSend(v4, "processIdentifier"));
  objc_msgSend(v18, "setUserIdentifier:", objc_msgSend(v4, "effectiveUserIdentifier"));
  [v4 setExportedObject:v18];
  [v4 resume];

  return 1;
}

@end