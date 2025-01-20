@interface _ADDeviceSyncItemMutation
- (BOOL)isDirty;
- (_ADDeviceSyncItemMutation)initWithBase:(id)a3;
- (id)getProperties;
- (id)getUUID;
- (void)setProperties:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation _ADDeviceSyncItemMutation

- (_ADDeviceSyncItemMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncItemMutation;
  v6 = -[_ADDeviceSyncItemMutation init](&v9, "init");
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

- (id)getUUID
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_UUID;
  }
  else {
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncItem UUID](self->_base, "UUID"));
  }
  return v2;
}

- (void)setUUID:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getProperties
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_properties;
  }
  else {
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncItem properties](self->_base, "properties"));
  }
  return v2;
}

- (void)setProperties:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
}

@end