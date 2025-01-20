@interface W5PeerDiscoveryRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerDiscoveryRequest:(id)a3;
- (NSUUID)uuid;
- (W5PeerDiscoveryConfiguration)configuration;
- (W5PeerDiscoveryRequest)initWithConfiguration:(id)a3 uuid:(id)a4 handler:(id)a5;
- (id)description;
- (id)handler;
- (unint64_t)hash;
- (void)setConfiguration:(id)a3;
- (void)setHandler:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5PeerDiscoveryRequest

- (W5PeerDiscoveryRequest)initWithConfiguration:(id)a3 uuid:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___W5PeerDiscoveryRequest;
  v12 = -[W5PeerDiscoveryRequest init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_uuid, a4);
    id v14 = objc_retainBlock(v11);
    id handler = v13->_handler;
    v13->_id handler = v14;
  }

  return v13;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendFormat:@"<%@ : %p ", v7, self];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  [v3 appendFormat:@"UUID='%@' ", v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest configuration](self, "configuration"));
  [v3 appendFormat:@"configuration='%@'", v10];

  [v3 appendString:@">"];
  id v11 = [v3 copy];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (W5PeerDiscoveryRequest *)a3;
  v6 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[W5PeerDiscoveryRequest isEqualToPeerDiscoveryRequest:](self, "isEqualToPeerDiscoveryRequest:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToPeerDiscoveryRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (W5PeerDiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end