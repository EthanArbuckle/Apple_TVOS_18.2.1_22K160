@interface CSDXPCClient
- (BOOL)isEntitledForCapability:(id)a3;
- (BOOL)isRemote;
- (BOOL)supportsClientAssertions;
- (CSDXPCClient)initWithConnection:(id)a3 queue:(id)a4;
- (NSSet)entitledCapabilities;
- (TUFeatureFlags)featureFlags;
- (id)acquireAssertionIfNecessary;
- (id)objectForBlock;
- (id)processBundleIdentifier;
- (id)processName;
- (id)propertiesDescription;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)dealloc;
- (void)invalidate;
- (void)performBlockAfterCoalescing:(id)a3;
- (void)setSupportsClientAssertions:(BOOL)a3;
@end

@implementation CSDXPCClient

- (CSDXPCClient)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CSDXPCClient;
  v8 = -[CSDClient initWithObject:queue:](&v32, "initWithObject:queue:", v7, a4);
  if (v8)
  {
    unsigned int v9 = [v7 processIdentifier];
    if (v9 == getpid())
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"callservicesd is attempting to create an XPC client for itself."));
      NSLog(@"** TUAssertion failure: %@", v10);

      if (_TUAssertShouldCrashApplication())
      {
        unsigned int v11 = [v7 processIdentifier];
        if (v11 == getpid())
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          [v31 handleFailureInMethod:a2 object:v8 file:@"CSDXPCClient.m" lineNumber:48 description:@"callservicesd is attempting to create an XPC client for itself."];
        }
      }
    }

    v8->_processIdentifier = [v7 processIdentifier];
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 processName]);
    processName = v8->_processName;
    v8->_processName = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 processBundleIdentifier]);
    processBundleIdentifier = v8->_processBundleIdentifier;
    v8->_processBundleIdentifier = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    entitledCapabilities = v8->_entitledCapabilities;
    v8->_entitledCapabilities = (NSSet *)v16;

    v18 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = v18;

    uint64_t v20 = TUBundleIdentifierCallServicesDaemon;
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDXPCClient valueForEntitlement:]( v8,  "valueForEntitlement:",  TUBundleIdentifierCallServicesDaemon));
    if (v22)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));
        v25 = (os_log_s *)v8->_entitledCapabilities;
        v8->_entitledCapabilities = (NSSet *)v24;
      }

      else
      {
        id v26 = sub_1001704C4();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = objc_opt_class(v22, v27);
          v30 = v8->_processName;
          *(_DWORD *)buf = 138413058;
          uint64_t v34 = v20;
          __int16 v35 = 2112;
          uint64_t v36 = v29;
          __int16 v37 = 2112;
          v38 = v22;
          __int16 v39 = 2112;
          v40 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Entitlement for key '%@' is non-nil but is of class %@ rather than an NSArray (%@), so assuming process %@ h as no entitlements",  buf,  0x2Au);
        }
      }
    }
  }

  return v8;
}

- (id)propertiesDescription
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDXPCClient;
  v3 = -[CSDClient propertiesDescription](&v8, "propertiesDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient entitledCapabilities](self, "entitledCapabilities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ entitlementCapabilities=%@",  v4,  v5));

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDXPCClient;
  -[CSDXPCClient dealloc](&v3, "dealloc");
}

- (BOOL)isRemote
{
  return 1;
}

- (id)objectForBlock
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient connection](self, "connection"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxy]);

  return v3;
}

- (id)acquireAssertionIfNecessary
{
  return 0LL;
}

- (void)performBlockAfterCoalescing:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009E0E0;
  v9[3] = &unk_1003D82B0;
  v9[4] = self;
  id v10 = a3;
  v4 = objc_retainBlock(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient acquireAssertionIfNecessary](self, "acquireAssertionIfNecessary"));
  if (v5)
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002B470C(self, (uint64_t)v5, v7);
    }
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient connection](self, "connection"));
  [v8 addBarrierBlock:v4];
}

- (BOOL)isEntitledForCapability:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient entitledCapabilities](self, "entitledCapabilities"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDXPCClient connection](self, "connection"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v4]);

  return v6;
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDXPCClient connection](self, "connection"));
  [v2 invalidate];
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (id)processName
{
  return self->_processName;
}

- (id)processBundleIdentifier
{
  return self->_processBundleIdentifier;
}

- (BOOL)supportsClientAssertions
{
  return self->_supportsClientAssertions;
}

- (void)setSupportsClientAssertions:(BOOL)a3
{
  self->_supportsClientAssertions = a3;
}

- (NSSet)entitledCapabilities
{
  return self->_entitledCapabilities;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

@end