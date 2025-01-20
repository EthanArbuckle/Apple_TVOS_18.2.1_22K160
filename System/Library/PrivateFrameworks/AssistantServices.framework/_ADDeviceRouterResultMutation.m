@interface _ADDeviceRouterResultMutation
- (BOOL)isDirty;
- (_ADDeviceRouterResultMutation)initWithBase:(id)a3;
- (id)getCommandRelayProxyIdentifier;
- (id)getContextIdentifier;
- (id)getError;
- (id)getPeerInfo;
- (int64_t)getProximity;
- (void)setCommandRelayProxyIdentifier:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setPeerInfo:(id)a3;
- (void)setProximity:(int64_t)a3;
@end

@implementation _ADDeviceRouterResultMutation

- (_ADDeviceRouterResultMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceRouterResultMutation;
  v6 = -[_ADDeviceRouterResultMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getPeerInfo
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_peerInfo;
  }
  else {
    v2 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult peerInfo](self->_base, "peerInfo"));
  }
  return v2;
}

- (void)setPeerInfo:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getContextIdentifier
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_contextIdentifier;
  }
  else {
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult contextIdentifier](self->_base, "contextIdentifier"));
  }
  return v2;
}

- (void)setContextIdentifier:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getProximity
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    return self->_proximity;
  }
  else {
    return -[ADDeviceRouterResult proximity](self->_base, "proximity");
  }
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getCommandRelayProxyIdentifier
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0) {
    v2 = self->_commandRelayProxyIdentifier;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult commandRelayProxyIdentifier](self->_base, "commandRelayProxyIdentifier"));
  }
  return v2;
}

- (void)setCommandRelayProxyIdentifier:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getError
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0) {
    v2 = self->_error;
  }
  else {
    v2 = (NSError *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult error](self->_base, "error"));
  }
  return v2;
}

- (void)setError:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
}

@end