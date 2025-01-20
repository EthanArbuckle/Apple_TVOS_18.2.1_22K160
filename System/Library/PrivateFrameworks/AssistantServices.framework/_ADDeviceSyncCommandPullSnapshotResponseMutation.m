@interface _ADDeviceSyncCommandPullSnapshotResponseMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullSnapshotResponseMutation)initWithBase:(id)a3;
- (id)getSnapshot;
- (void)setSnapshot:(id)a3;
@end

@implementation _ADDeviceSyncCommandPullSnapshotResponseMutation

- (_ADDeviceSyncCommandPullSnapshotResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotResponseMutation;
  v6 = -[_ADDeviceSyncCommandPullSnapshotResponseMutation init](&v9, "init");
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

- (id)getSnapshot
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_snapshot;
  }
  else {
    v2 = (ADDeviceSyncSnapshot *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullSnapshotResponse snapshot](self->_base, "snapshot"));
  }
  return v2;
}

- (void)setSnapshot:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end