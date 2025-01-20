@interface _ADRapportLinkDiscoveryOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkDiscoveryOptionsMutation)initWithBase:(id)a3;
- (int64_t)getIncludesFamily;
- (int64_t)getIncludesHome;
- (int64_t)getIncludesRemoraDevices;
- (void)setIncludesFamily:(int64_t)a3;
- (void)setIncludesHome:(int64_t)a3;
- (void)setIncludesRemoraDevices:(int64_t)a3;
@end

@implementation _ADRapportLinkDiscoveryOptionsMutation

- (_ADRapportLinkDiscoveryOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADRapportLinkDiscoveryOptionsMutation;
  v6 = -[_ADRapportLinkDiscoveryOptionsMutation init](&v9, "init");
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

- (int64_t)getIncludesFamily
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_includesFamily;
  }
  else {
    return -[ADRapportLinkDiscoveryOptions includesFamily](self->_base, "includesFamily");
  }
}

- (void)setIncludesFamily:(int64_t)a3
{
  self->_includesFamily = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getIncludesHome
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    return self->_includesHome;
  }
  else {
    return -[ADRapportLinkDiscoveryOptions includesHome](self->_base, "includesHome");
  }
}

- (void)setIncludesHome:(int64_t)a3
{
  self->_includesHome = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getIncludesRemoraDevices
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    return self->_includesRemoraDevices;
  }
  else {
    return -[ADRapportLinkDiscoveryOptions includesRemoraDevices](self->_base, "includesRemoraDevices");
  }
}

- (void)setIncludesRemoraDevices:(int64_t)a3
{
  self->_includesRemoraDevices = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
}

@end