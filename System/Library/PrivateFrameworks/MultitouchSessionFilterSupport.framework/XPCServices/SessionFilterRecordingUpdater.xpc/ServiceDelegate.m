@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SessionFilterRecordingUpdaterProtocol));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  v7 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSURL), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setClasses:v8 forSelector:"filesSortedByCreationDateInDirectory:withPathExtension:withReply:" argumentIndex:0 ofReply:1];
  [v4 setExportedInterface:v5];
  v9 = objc_opt_new(&OBJC_CLASS___SessionFilterRecordingUpdater);
  [v4 setExportedObject:v9];
  [v4 resume];

  return 1;
}

@end