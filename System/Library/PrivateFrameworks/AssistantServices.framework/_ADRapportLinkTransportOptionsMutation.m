@interface _ADRapportLinkTransportOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkTransportOptionsMutation)initWithBase:(id)a3;
- (int64_t)getAllowsAWDL;
- (int64_t)getAllowsBLE;
- (int64_t)getAllowsBTPipe;
- (int64_t)getAllowsForceAWDL;
- (int64_t)getAllowsForceBLE;
- (int64_t)getAllowsInfraWiFi;
- (int64_t)getNoL2Cap;
- (void)setAllowsAWDL:(int64_t)a3;
- (void)setAllowsBLE:(int64_t)a3;
- (void)setAllowsBTPipe:(int64_t)a3;
- (void)setAllowsForceAWDL:(int64_t)a3;
- (void)setAllowsForceBLE:(int64_t)a3;
- (void)setAllowsInfraWiFi:(int64_t)a3;
- (void)setNoL2Cap:(int64_t)a3;
@end

@implementation _ADRapportLinkTransportOptionsMutation

- (_ADRapportLinkTransportOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADRapportLinkTransportOptionsMutation;
  v6 = -[_ADRapportLinkTransportOptionsMutation init](&v9, "init");
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

- (int64_t)getAllowsAWDL
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_allowsAWDL;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsAWDL](self->_base, "allowsAWDL");
  }
}

- (void)setAllowsAWDL:(int64_t)a3
{
  self->_allowsAWDL = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getAllowsBLE
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    return self->_allowsBLE;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsBLE](self->_base, "allowsBLE");
  }
}

- (void)setAllowsBLE:(int64_t)a3
{
  self->_allowsBLE = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getAllowsInfraWiFi
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    return self->_allowsInfraWiFi;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsInfraWiFi](self->_base, "allowsInfraWiFi");
  }
}

- (void)setAllowsInfraWiFi:(int64_t)a3
{
  self->_allowsInfraWiFi = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getAllowsBTPipe
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0) {
    return self->_allowsBTPipe;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsBTPipe](self->_base, "allowsBTPipe");
  }
}

- (void)setAllowsBTPipe:(int64_t)a3
{
  self->_allowsBTPipe = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getAllowsForceBLE
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0) {
    return self->_allowsForceBLE;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsForceBLE](self->_base, "allowsForceBLE");
  }
}

- (void)setAllowsForceBLE:(int64_t)a3
{
  self->_allowsForceBLE = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (int64_t)getAllowsForceAWDL
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0) {
    return self->_allowsForceAWDL;
  }
  else {
    return -[ADRapportLinkTransportOptions allowsForceAWDL](self->_base, "allowsForceAWDL");
  }
}

- (void)setAllowsForceAWDL:(int64_t)a3
{
  self->_allowsForceAWDL = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (int64_t)getNoL2Cap
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x80000000) != 0) {
    return self->_noL2Cap;
  }
  else {
    return -[ADRapportLinkTransportOptions noL2Cap](self->_base, "noL2Cap");
  }
}

- (void)setNoL2Cap:(int64_t)a3
{
  self->_noL2Cap = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (void).cxx_destruct
{
}

@end