@interface TBPersistenceRemoteStoreServer
- (NSDictionary)serverOptions;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (NSXPCStoreServer)xpcStoreServer;
- (TBPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5;
- (void)setModelURL:(id)a3;
- (void)setServerOptions:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setXpcStoreServer:(id)a3;
- (void)startListening;
@end

@implementation TBPersistenceRemoteStoreServer

- (TBPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TBPersistenceRemoteStoreServer;
  v12 = -[TBPersistenceRemoteStoreServer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeURL, a3);
    objc_storeStrong((id *)&v13->_modelURL, a4);
    objc_storeStrong((id *)&v13->_serverOptions, a5);
  }

  return v13;
}

- (void)startListening
{
  v3 = (void *)MEMORY[0x1895BA820](self, a2);
  v4 = (void *)objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1896025A0]);
  v6 = -[TBPersistenceRemoteStoreServer storeURL](self, "storeURL");
  v7 = -[TBPersistenceRemoteStoreServer modelURL](self, "modelURL");
  v8 = -[TBPersistenceRemoteStoreServer serverOptions](self, "serverOptions");
  id v9 = (void *)[v5 initForStoreWithURL:v6 usingModelAtURL:v7 options:v8 policy:v4];
  -[TBPersistenceRemoteStoreServer setXpcStoreServer:](self, "setXpcStoreServer:", v9);

  -[TBPersistenceRemoteStoreServer serverOptions](self, "serverOptions");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"%s: started listening with options: %@", "-[TBPersistenceRemoteStoreServer startListening]", v10);

  objc_autoreleasePoolPop(v3);
  -[TBPersistenceRemoteStoreServer xpcStoreServer](self, "xpcStoreServer");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 startListening];
}

- (NSXPCStoreServer)xpcStoreServer
{
  return self->_xpcStoreServer;
}

- (void)setXpcStoreServer:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)serverOptions
{
  return self->_serverOptions;
}

- (void)setServerOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end