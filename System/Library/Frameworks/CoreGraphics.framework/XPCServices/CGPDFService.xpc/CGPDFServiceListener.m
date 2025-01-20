@interface CGPDFServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CGPDFServiceListener)init;
- (CGPDFServiceListener)initWithListener:(id)a3;
- (NSXPCListener)listener;
- (id)initForLoopback;
- (id)initForXPCService;
- (void)run;
@end

@implementation CGPDFServiceListener

- (CGPDFServiceListener)init
{
  return -[CGPDFServiceListener initWithListener:](v2, v3, v4);
}

- (CGPDFServiceListener)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CGPDFServiceListener;
  v6 = -[CGPDFServiceListener init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
  }

  return v7;
}

- (id)initForXPCService
{
  SEL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  id v4 = -[CGPDFServiceListener initWithListener:](self, "initWithListener:", v3);

  return v4;
}

- (id)initForLoopback
{
  SEL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  id v4 = -[CGPDFServiceListener initWithListener:](self, "initWithListener:", v3);

  return v4;
}

- (void)run
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CGPDFServiceListener listener](self, "listener"));
  [v2 resume];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CGRemotePDFServiceProxy interface](&OBJC_CLASS___CGRemotePDFServiceProxy, "interface"));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___CGPDFService);
  [v4 setExportedObject:v6];
  [v4 resume];

  return 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end