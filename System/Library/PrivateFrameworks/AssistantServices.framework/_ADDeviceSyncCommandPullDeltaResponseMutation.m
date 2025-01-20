@interface _ADDeviceSyncCommandPullDeltaResponseMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullDeltaResponseMutation)initWithBase:(id)a3;
- (id)getIncrementalChanges;
- (void)setIncrementalChanges:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullDeltaResponseMutation

- (_ADDeviceSyncCommandPullDeltaResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPullDeltaResponseMutation;
  v6 = -[_ADDeviceSyncCommandPullDeltaResponseMutation init](&v9, "init");
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

- (id)getIncrementalChanges
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_incrementalChanges;
  }
  else {
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullDeltaResponse incrementalChanges](self->_base, "incrementalChanges"));
  }
  return v2;
}

- (void)setIncrementalChanges:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end