@interface _ADRapportLinkConfigurationMutation
- (BOOL)isDirty;
- (_ADRapportLinkConfigurationMutation)initWithBase:(id)a3;
- (id)getConnectionOptions;
- (id)getDiscoveryOptions;
- (id)getTransportOptions;
- (int64_t)getEnablesProximityTracking;
- (void)setConnectionOptions:(id)a3;
- (void)setDiscoveryOptions:(id)a3;
- (void)setEnablesProximityTracking:(int64_t)a3;
- (void)setTransportOptions:(id)a3;
@end

@implementation _ADRapportLinkConfigurationMutation

- (_ADRapportLinkConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADRapportLinkConfigurationMutation;
  v6 = -[_ADRapportLinkConfigurationMutation init](&v9, "init");
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

- (id)getDiscoveryOptions
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_discoveryOptions;
  }
  else {
    v2 = (ADRapportLinkDiscoveryOptions *)objc_claimAutoreleasedReturnValue( -[ADRapportLinkConfiguration discoveryOptions]( self->_base,  "discoveryOptions"));
  }
  return v2;
}

- (void)setDiscoveryOptions:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getTransportOptions
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_transportOptions;
  }
  else {
    v2 = (ADRapportLinkTransportOptions *)objc_claimAutoreleasedReturnValue( -[ADRapportLinkConfiguration transportOptions]( self->_base,  "transportOptions"));
  }
  return v2;
}

- (void)setTransportOptions:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getConnectionOptions
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_connectionOptions;
  }
  else {
    v2 = (ADRapportLinkConnectionOptions *)objc_claimAutoreleasedReturnValue( -[ADRapportLinkConfiguration connectionOptions]( self->_base,  "connectionOptions"));
  }
  return v2;
}

- (void)setConnectionOptions:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getEnablesProximityTracking
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0) {
    return self->_enablesProximityTracking;
  }
  else {
    return -[ADRapportLinkConfiguration enablesProximityTracking](self->_base, "enablesProximityTracking");
  }
}

- (void)setEnablesProximityTracking:(int64_t)a3
{
  self->_enablesProximityTracking = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
}

@end