@interface _ADDeviceSyncCommandPullGenerationsRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullGenerationsRequestMutation)initWithBase:(id)a3;
- (id)getDataTypes;
- (void)setDataTypes:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullGenerationsRequestMutation

- (_ADDeviceSyncCommandPullGenerationsRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPullGenerationsRequestMutation;
  v6 = -[_ADDeviceSyncCommandPullGenerationsRequestMutation init](&v9, "init");
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

- (id)getDataTypes
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_dataTypes;
  }
  else {
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullGenerationsRequest dataTypes](self->_base, "dataTypes"));
  }
  return v2;
}

- (void)setDataTypes:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end