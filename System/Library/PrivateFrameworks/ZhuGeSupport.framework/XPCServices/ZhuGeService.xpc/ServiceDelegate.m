@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ZhuGeServiceProtocol));
  [v4 setExportedInterface:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeService, "sharedInstance"));
  [v4 setExportedObject:v6];

  if (isZhuGeInRestoreOS())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ZhuGeRestoreLogProtocol));
    [v4 setRemoteObjectInterface:v7];
  }

  [v4 activate];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
  [v8 setXpcConnection:v4];

  uint64_t v12 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeSupportAssistant getSharedInstanceByName:withError:]( &OBJC_CLASS___ZhuGeSupportAssistant,  "getSharedInstanceByName:withError:",  @"OBJC_CLASS_$_ZhuGeLockerArmory",  &v12));
  v10 = v9;
  if (v9) {
    [v9 setXpcConnection:v4];
  }

  return 1;
}

@end