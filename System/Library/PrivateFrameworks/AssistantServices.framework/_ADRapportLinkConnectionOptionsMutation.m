@interface _ADRapportLinkConnectionOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkConnectionOptionsMutation)initWithBase:(id)a3;
- (int64_t)getUsesOnDemandConnection;
- (void)setUsesOnDemandConnection:(int64_t)a3;
@end

@implementation _ADRapportLinkConnectionOptionsMutation

- (_ADRapportLinkConnectionOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADRapportLinkConnectionOptionsMutation;
  v6 = -[_ADRapportLinkConnectionOptionsMutation init](&v9, "init");
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

- (int64_t)getUsesOnDemandConnection
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_usesOnDemandConnection;
  }
  else {
    return -[ADRapportLinkConnectionOptions usesOnDemandConnection](self->_base, "usesOnDemandConnection");
  }
}

- (void)setUsesOnDemandConnection:(int64_t)a3
{
  self->_usesOnDemandConnection = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end