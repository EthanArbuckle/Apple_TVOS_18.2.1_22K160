@interface AUHostingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation AUHostingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHostingService_AUXPC_Protocol));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 classesForSelector:"loadAudioUnitInRemoteHost:config:reply:" argumentIndex:1 ofReply:0]);
  id v7 = [v6 mutableCopy];

  [v7 addObject:objc_opt_class(NSXPCListenerEndpoint)];
  [v5 setClasses:v7 forSelector:"loadAudioUnitInRemoteHost:config:reply:" argumentIndex:1 ofReply:0];
  id v8 = (id)ConfigureAUAudioUnitXPCInterface(v5);

  [v4 setExportedInterface:v5];
  v9 = -[AUHostingService initWithConnection:](objc_alloc(&OBJC_CLASS___AUHostingService), "initWithConnection:", v4);
  [v4 setExportedObject:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUAudioUnitHostProtocol));
  SetAllowedClassesForAUAudioUnitHostXPCInterface();
  [v4 setRemoteObjectInterface:v10];

  [v4 resume];
  return 1;
}

@end