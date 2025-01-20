@interface _ADDeviceSyncCommandPullSnapshotRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullSnapshotRequestMutation)initWithBase:(id)a3;
- (id)getDataType;
- (void)setDataType:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullSnapshotRequestMutation

- (_ADDeviceSyncCommandPullSnapshotRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotRequestMutation;
  v6 = -[_ADDeviceSyncCommandPullSnapshotRequestMutation init](&v9, "init");
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

- (id)getDataType
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_dataType;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullSnapshotRequest dataType](self->_base, "dataType"));
  }
  return v2;
}

- (void)setDataType:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end