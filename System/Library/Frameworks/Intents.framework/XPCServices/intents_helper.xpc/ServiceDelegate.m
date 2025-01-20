@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___INHServing));
  [v5 setClass:objc_opt_class(INImage) forSelector:"loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:" argumentIndex:0 ofReply:0];
  [v5 setClass:objc_opt_class(INImage) forSelector:"loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:" argumentIndex:0 ofReply:1];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
  v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___INPortableImageLoader),  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setClasses:v8 forSelector:"loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:" argumentIndex:1 ofReply:0];

  [v5 setClass:objc_opt_class(NSUUID) forSelector:"fetchShareExtensionIntentForExtensionContextUUID:completion:" argumentIndex:0 ofReply:0];
  [v5 setClass:objc_opt_class(INIntent) forSelector:"fetchShareExtensionIntentForExtensionContextUUID:completion:" argumentIndex:0 ofReply:1];
  [v5 setClass:objc_opt_class(INUserContext) forSelector:"storeUserContext:forBundleIdentifier:" argumentIndex:0 ofReply:0];
  [v5 setClass:objc_opt_class(INImage) forSelector:"filePathForImage:usingPortableImageLoader:completion:" argumentIndex:0 ofReply:0];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
  v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___INPortableImageLoader),  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v5 setClasses:v11 forSelector:"filePathForImage:usingPortableImageLoader:completion:" argumentIndex:1 ofReply:0];

  [v4 setExportedInterface:v5];
  v12 = -[INHService initWithServingConnection:](objc_alloc(&OBJC_CLASS___INHService), "initWithServingConnection:", v4);
  [v4 setExportedObject:v12];
  [v4 resume];

  return 1;
}

@end