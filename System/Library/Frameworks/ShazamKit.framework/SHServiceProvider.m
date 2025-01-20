@interface SHServiceProvider
+ (id)availableServices;
- (NSString)machServiceName;
- (SHServiceProvider)initWithService:(Class)a3;
- (id)buildListener;
- (id)eventsServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)handleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)shazamKitServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)uiServiceHandlerForConnection:(id)a3 withClientCredentials:(id)a4;
@end

@implementation SHServiceProvider

+ (id)availableServices
{
  v7[0] = objc_opt_class(&OBJC_CLASS___SHShazamKitService, a2);
  v7[1] = objc_opt_class(&OBJC_CLASS____TtC12ShazamEvents19ShazamEventsService, v2);
  v7[2] = objc_opt_class(&OBJC_CLASS___SHUIService, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return v5;
}

- (SHServiceProvider)initWithService:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SHServiceProvider;
  v4 = -[SHServiceProvider init](&v8, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[objc_class machServiceName](a3, "machServiceName"));
    machServiceName = v4->_machServiceName;
    v4->_machServiceName = (NSString *)v5;
  }

  return v4;
}

- (id)buildListener
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceProvider machServiceName](self, "machServiceName"));
  uint64_t v5 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", v4);

  return v5;
}

- (id)handleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceProvider machServiceName](self, "machServiceName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SHShazamKitService machServiceName](&OBJC_CLASS___SHShazamKitService, "machServiceName"));
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SHServiceProvider shazamKitServiceHandleForConnection:withClientCredentials:]( self,  "shazamKitServiceHandleForConnection:withClientCredentials:",  v6,  v7));
LABEL_7:
    v18 = (void *)v11;

    return v18;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceProvider machServiceName](self, "machServiceName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_TtC12ShazamEvents19ShazamEventsService machServiceName]( &OBJC_CLASS____TtC12ShazamEvents19ShazamEventsService,  "machServiceName"));
  unsigned int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SHServiceProvider eventsServiceHandleForConnection:withClientCredentials:]( self,  "eventsServiceHandleForConnection:withClientCredentials:",  v6,  v7));
    goto LABEL_7;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceProvider machServiceName](self, "machServiceName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SHUIService machServiceName](&OBJC_CLASS___SHUIService, "machServiceName"));
  unsigned int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SHServiceProvider uiServiceHandlerForConnection:withClientCredentials:]( self,  "uiServiceHandlerForConnection:withClientCredentials:",  v6,  v7));
    goto LABEL_7;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceProvider machServiceName](self, "machServiceName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempted to start an unknown service: %@",  v20));
  id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v21,  0LL));

  objc_exception_throw(v22);
  return -[SHServiceProvider eventsServiceHandleForConnection:withClientCredentials:](v23, v24, v25, v26);
}

- (id)eventsServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___SHConnectionHandle);
  uint64_t v8 = SHShazamEventsServiceInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = SHShazamEventsClientInterface();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[SHConnectionHandle initWithConnection:exportedInterface:remoteInterface:]( v7,  "initWithConnection:exportedInterface:remoteInterface:",  v6,  v9,  v11);

  v13 = -[SHServiceStateHandler initWithClientCredentials:]( objc_alloc(&OBJC_CLASS___SHServiceStateHandler),  "initWithClientCredentials:",  v5);
  -[SHConnectionHandle setServiceStateHandler:](v12, "setServiceStateHandler:", v13);

  id v14 = objc_alloc_init(&OBJC_CLASS____TtC12ShazamEvents19ShazamEventsService);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle serviceStateHandler](v12, "serviceStateHandler"));
  [v14 setServiceDelegate:v15];

  -[SHConnectionHandle setExportedObject:](v12, "setExportedObject:", v14);
  return v12;
}

- (id)shazamKitServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___SHConnectionHandle);
  uint64_t v8 = SHShazamKitServiceInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = SHShazamKitClientInterface();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[SHConnectionHandle initWithConnection:exportedInterface:remoteInterface:]( v7,  "initWithConnection:exportedInterface:remoteInterface:",  v6,  v9,  v11);

  v13 = -[SHServiceStateHandler initWithClientCredentials:]( objc_alloc(&OBJC_CLASS___SHServiceStateHandler),  "initWithClientCredentials:",  v5);
  -[SHConnectionHandle setServiceStateHandler:](v12, "setServiceStateHandler:", v13);

  id v14 = -[SHShazamKitService initWithClientCredentials:]( objc_alloc(&OBJC_CLASS___SHShazamKitService),  "initWithClientCredentials:",  v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle remoteObject](v12, "remoteObject"));
  -[SHShazamKitService setDelegate:](v14, "setDelegate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle serviceStateHandler](v12, "serviceStateHandler"));
  -[SHShazamKitService setServiceDelegate:](v14, "setServiceDelegate:", v16);

  -[SHConnectionHandle setExportedObject:](v12, "setExportedObject:", v14);
  return v12;
}

- (id)uiServiceHandlerForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___SHConnectionHandle);
  uint64_t v8 = SHShazamKitUIServiceInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = SHShazamKitUIClientInterface();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[SHConnectionHandle initWithConnection:exportedInterface:remoteInterface:]( v7,  "initWithConnection:exportedInterface:remoteInterface:",  v6,  v9,  v11);

  v13 = -[SHServiceStateHandler initWithClientCredentials:]( objc_alloc(&OBJC_CLASS___SHServiceStateHandler),  "initWithClientCredentials:",  v5);
  -[SHConnectionHandle setServiceStateHandler:](v12, "setServiceStateHandler:", v13);

  id v14 = objc_alloc(&OBJC_CLASS___SHUIService);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 attribution]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
  id v17 = -[SHUIService initBundleIdentifier:](v14, "initBundleIdentifier:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle serviceStateHandler](v12, "serviceStateHandler"));
  [v17 setServiceDelegate:v18];

  -[SHConnectionHandle setExportedObject:](v12, "setExportedObject:", v17);
  return v12;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void).cxx_destruct
{
}

@end