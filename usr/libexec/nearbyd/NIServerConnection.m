@interface NIServerConnection
+ (BOOL)_internalBuildShouldDenyConnection;
+ (id)createOneShotConnectionAndResume:(BOOL)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection;
- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6;
- (NSUUID)sessionID;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxy;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation NIServerConnection

- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2, self, @"NIServerConnection.m", 25, @"Invalid parameter not satisfying: %@", @"sessionID" object file lineNumber description];
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___NIServerConnection;
  v15 = -[NIServerConnection init](&v35, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_options = a6;
    os_log_t v17 = os_log_create("com.apple.NearbyInteraction", "NIServerConnection");
    log = v16->_log;
    v16->_log = v17;

    if (+[NIServerConnection _internalBuildShouldDenyConnection]( &OBJC_CLASS___NIServerConnection,  "_internalBuildShouldDenyConnection"))
    {
      if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
      {
        v19 = v16->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 processName]);
          *(_DWORD *)buf = 138412290;
          v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deny connection: %@", buf, 0xCu);
        }
      }
    }

    else
    {
      v23 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
      if ((a6 & 1) != 0) {
        v24 = @"com.apple.nearbyd.xpc.nearbyinteraction.observer";
      }
      else {
        v24 = @"com.apple.nearbyd.xpc.nearbyinteraction";
      }
      v25 = -[NSXPCConnection initWithMachServiceName:options:](v23, "initWithMachServiceName:options:", v24, 4096LL);
      connection = v16->_connection;
      v16->_connection = v25;

      v27 = v16->_connection;
      id v28 = sub_100294100();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[NSXPCConnection setExportedInterface:](v27, "setExportedInterface:", v29);

      if (v14) {
        -[NSXPCConnection setExportedObject:](v16->_connection, "setExportedObject:", v14);
      }
      v30 = v16->_connection;
      id v31 = sub_1002932F0();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      -[NSXPCConnection setRemoteObjectInterface:](v30, "setRemoteObjectInterface:", v32);

      -[NSXPCConnection _setQueue:](v16->_connection, "_setQueue:", v13);
    }
  }

  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIServerConnection;
  -[NIServerConnection dealloc](&v3, "dealloc");
}

- (id)remoteObjectProxy
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100285FF0;
  v4[3] = &unk_1007BA680;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v4));
}

- (id)synchronousRemoteObjectProxy
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002860AC;
  v4[3] = &unk_1007BA680;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v4));
}

- (id)interruptionHandler
{
  return -[NSXPCConnection interruptionHandler](self->_connection, "interruptionHandler");
}

- (id)invalidationHandler
{
  return -[NSXPCConnection invalidationHandler](self->_connection, "invalidationHandler");
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)resume
{
}

- (void)invalidate
{
  connection = self->_connection;
  self->_connection = 0LL;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

+ (id)createOneShotConnectionAndResume:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.NearbyInteraction", v5);
  v7 = objc_alloc(&OBJC_CLASS___NIServerConnection);
  v8 = objc_opt_new(&OBJC_CLASS___NSUUID);
  v9 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:]( v7,  "initWithSessionID:queue:exportedObject:options:",  v8,  v6,  0LL,  0LL);

  if (v3) {
    -[NIServerConnection resume](v9, "resume");
  }

  return v9;
}

+ (BOOL)_internalBuildShouldDenyConnection
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @".GlobalPreferences");
    dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( v2,  "objectForKey:",  @"com.apple.NearbyInteraction.ConnectionAllowList"));
    if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    {
      dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 processName]);
      unsigned int v8 = [v4 containsObject:v7] ^ 1;
    }

    else
    {
      dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( v2,  "objectForKey:",  @"com.apple.NearbyInteraction.ConnectionDenyList"));
      if (!v6 || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9), (objc_opt_isKindOfClass(v6, v10) & 1) == 0))
      {
        LOBYTE(v8) = 0;
        goto LABEL_11;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 processName]);
      LOBYTE(v8) = [v6 containsObject:v11];
    }

LABEL_11:
    return v8;
  }

  LOBYTE(v8) = 0;
  return v8;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (id)exportedObject
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExportedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end