@interface GTDeviceCapabilitiesXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)daemonDeviceCapabilities;
- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3;
- (id)gpuToolsVersionQuery;
- (id)inferiorEnvironment:(id)a3;
@end

@implementation GTDeviceCapabilitiesXPCProxy

- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GTDeviceCapabilitiesXPCProxy;
  v8 = -[GTDeviceCapabilitiesXPCProxy init](&v20, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTDeviceCapabilities;
    v10 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    v12 = -[GTServiceConnection initWithConnection:device:port:]( v10,  "initWithConnection:device:port:",  v6,  v11,  [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v9));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
    id v16 = newSetWithArrayMinusArray(v14, v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v17;
  }

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v7))
  {
    BOOL v8 = 0;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___GTDeviceCapabilitiesXPCProxy;
    BOOL v8 = -[GTDeviceCapabilitiesXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)daemonDeviceCapabilities
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___DYGTMTLDeviceProfile);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v12 = -[NSSet initWithObjects:]( v7,  "initWithObjects:",  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v6, "returnValue", v12);
  }

  else
  {
    nsobject_classes = 0LL;
  }

  return nsobject_classes;
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "heapDescriptors", (uint64_t)v5);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v8)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
    v14 = -[NSSet initWithObjects:]( v9,  "initWithObjects:",  v10,  v11,  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "returnValue", v14);
  }

  else
  {
    nsobject_classes = 0LL;
  }

  return nsobject_classes;
}

- (id)gpuToolsVersionQuery
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  id v7 = v6;
  if (v6) {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v6, "returnValue");
  }
  else {
    id nsdictionary_any = 0LL;
  }

  return nsdictionary_any;
}

- (id)inferiorEnvironment:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "launchDictionary", (uint64_t)v5);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    nsdictionary = (void *)xpc_dictionary_get_nsdictionary(v8, "environment", v9, v10);
  }

  else
  {
    nsdictionary = 0LL;
  }

  return nsdictionary;
}

- (void).cxx_destruct
{
}

@end