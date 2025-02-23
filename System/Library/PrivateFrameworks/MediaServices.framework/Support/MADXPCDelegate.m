@interface MADXPCDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MADArtworkServer)artworkService;
- (MADXPCDelegate)init;
- (void)setArtworkService:(id)a3;
@end

@implementation MADXPCDelegate

- (MADXPCDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MADXPCDelegate;
  v2 = -[MADXPCDelegate init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MADArtworkServer);
    -[MADXPCDelegate setArtworkService:](v2, "setArtworkService:", v3);
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSVArtworkServiceInterface));
  [v5 setExportedInterface:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADXPCDelegate artworkService](self, "artworkService"));
  [v5 setExportedObject:v7];

  LODWORD(v7) = [v5 processIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002578;
  v11[3] = &unk_100004228;
  int v12 = (int)v7;
  [v5 setInterruptionHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100002620;
  v9[3] = &unk_100004228;
  int v10 = (int)v7;
  [v5 setInvalidationHandler:v9];
  [v5 resume];

  return 1;
}

- (MADArtworkServer)artworkService
{
  return self->_artworkService;
}

- (void)setArtworkService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end