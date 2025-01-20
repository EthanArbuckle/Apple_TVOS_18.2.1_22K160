@interface MRDIDSRemoteControlServiceDiscoveryChannel
- (MRDIDSServerClientConnection)client;
- (MRDIDSTransportConnection)transport;
- (id)debugDescription;
- (void)setClient:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSRemoteControlServiceDiscoveryChannel

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(self->_client);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  client = %@\n", v5);

  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(self->_transport);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  transport = %@\n", v7);

  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  return v3;
}

- (MRDIDSTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (MRDIDSServerClientConnection)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end