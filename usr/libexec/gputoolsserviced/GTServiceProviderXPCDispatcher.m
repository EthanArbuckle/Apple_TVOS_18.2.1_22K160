@interface GTServiceProviderXPCDispatcher
- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)allServices:(id)a3 replyConnection:(id)a4;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)deregisterService_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4;
- (void)setConnections:(id)a3;
- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)waitForService_error_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTServiceProviderXPCDispatcher

- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  id v9 = [v8 mutableCopy];

  [v9 addObject:@"broadcastDisconnect"];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTServiceProviderXPCDispatcher;
  v10 = -[GTXPCDispatcher initWithProtocolMethods:](&v13, "initWithProtocolMethods:", v9);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_serviceProvider, a3);
  }

  return v11;
}

- (void)setConnections:(id)a3
{
}

- (void)allServices:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);
  if (([v7 isTrusted] & 1) == 0)
  {
    v11 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v8, 1LL);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v8 = v11;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v8);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v15),  "serviceProperties",  (void)v17));
          [v16 setDeviceUDID:0];

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v13);
    }
  }

  xpc_dictionary_set_nsobject(v10, "returnValue", (uint64_t)v8);
  [v7 sendMessage:v10];
}

- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___GTServiceProperties);
  nsobject = xpc_dictionary_get_nsobject(v6, "serviceProperties", v10);
  if (nsobject)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___GTProcessInfo);
    id v13 = xpc_dictionary_get_nsobject(v6, "processInfo", v12);
    if (!v13)
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTServiceProvider",  @"Invalid processInfo argument passed to registerService"));
      v23 = v19;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v20));

      xpc_dictionary_set_nserror(v9, "error", v21);
      [v7 sendMessage:v9];

      goto LABEL_7;
    }

    -[GTServiceProvider registerService:forProcess:]( self->_serviceProvider,  "registerService:forProcess:",  nsobject,  v13);
    registeredConnections = self->_registeredConnections;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [nsobject servicePort]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredConnections, "setObject:forKeyedSubscript:", v7, v15);

    id v16 = objc_claimAutoreleasedReturnValue([nsobject deviceUDID]);
    xpc_dictionary_set_string(v9, "deviceUDID", (const char *)[v16 UTF8String]);

    xpc_dictionary_set_uint64(v9, "servicePort", (uint64_t)[nsobject servicePort]);
  }

  else
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTServiceProvider",  @"Invalid serviceProperties argument passed to registerService"));
    v25 = v17;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v18));

    xpc_dictionary_set_nserror(v9, "error", v13);
  }

  [v7 sendMessage:v9];
LABEL_7:
}

- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = (char *)xpc_dictionary_get_string(v7, "protocolName");

  if (string) {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  serviceProvider = self->_serviceProvider;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000135FC;
  v14[3] = &unk_100030AD0;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  -[GTServiceProvider waitForService:completionHandler:]( serviceProvider,  "waitForService:completionHandler:",  string,  v14);
}

- (void)waitForService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = (char *)xpc_dictionary_get_string(v7, "protocolName");

  if (string) {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  serviceProvider = self->_serviceProvider;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100013730;
  v14[3] = &unk_100030AD0;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  -[GTServiceProvider waitForService:completionHandler:]( serviceProvider,  "waitForService:completionHandler:",  string,  v14);
}

- (void)deregisterService_:(id)a3 replyConnection:(id)a4
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "servicePort");
  -[GTServiceProvider deregisterService:](self->_serviceProvider, "deregisterService:", uint64);
  registeredConnections = self->_registeredConnections;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", uint64));
  -[NSMutableDictionary removeObjectForKey:](registeredConnections, "removeObjectForKey:", v7);
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = -[GTServiceObserver initWithMessage:notifyConnection:]( objc_alloc(&OBJC_CLASS___GTServiceProviderObserver),  "initWithMessage:notifyConnection:",  v7,  v6);
  uint64_t v8 = -[GTServiceProvider registerObserver:](self->_serviceProvider, "registerObserver:", v11);
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_uint64(v10, "observerId", v8);
  [v6 sendMessage:v10];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GTServiceProvider deregisterObserver:]( self->_serviceProvider,  "deregisterObserver:",  xpc_dictionary_get_uint64(v7, "observerId"));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue(reply);

  [v6 sendMessage:v9];
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_object_t array = xpc_dictionary_get_array(a3, "_pathHistory");
  id v8 = (id)objc_claimAutoreleasedReturnValue(array);
  -[GTServiceProvider deregisterObserversForConnection:path:]( self->_serviceProvider,  "deregisterObserversForConnection:path:",  v6,  v8);
}

- (void).cxx_destruct
{
}

@end