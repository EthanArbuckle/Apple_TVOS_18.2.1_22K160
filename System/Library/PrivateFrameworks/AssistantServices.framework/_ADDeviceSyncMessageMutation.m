@interface _ADDeviceSyncMessageMutation
- (BOOL)isDirty;
- (_ADDeviceSyncMessageMutation)initWithBase:(id)a3;
- (id)getCommandPullDeltaRequest;
- (id)getCommandPullDeltaResponse;
- (id)getCommandPullGenerationsRequest;
- (id)getCommandPullGenerationsResponse;
- (id)getCommandPullSnapshotRequest;
- (id)getCommandPullSnapshotResponse;
- (id)getCommandPushGenerationsRequest;
- (id)getCommandPushGenerationsResponse;
- (int64_t)getType;
- (unint64_t)getSequence;
- (void)setCommandPullDeltaRequest:(id)a3;
- (void)setCommandPullDeltaResponse:(id)a3;
- (void)setCommandPullGenerationsRequest:(id)a3;
- (void)setCommandPullGenerationsResponse:(id)a3;
- (void)setCommandPullSnapshotRequest:(id)a3;
- (void)setCommandPullSnapshotResponse:(id)a3;
- (void)setCommandPushGenerationsRequest:(id)a3;
- (void)setCommandPushGenerationsResponse:(id)a3;
- (void)setSequence:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _ADDeviceSyncMessageMutation

- (_ADDeviceSyncMessageMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncMessageMutation;
  v6 = -[_ADDeviceSyncMessageMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (unint64_t)getSequence
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_sequence;
  }
  else {
    return -[ADDeviceSyncMessage sequence](self->_base, "sequence");
  }
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_type;
  }
  else {
    return -[ADDeviceSyncMessage type](self->_base, "type");
  }
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getCommandPushGenerationsRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_commandPushGenerationsRequest;
  }
  else {
    v2 = (ADDeviceSyncCommandPushGenerationsRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPushGenerationsRequest]( self->_base,  "commandPushGenerationsRequest"));
  }
  return v2;
}

- (void)setCommandPushGenerationsRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getCommandPushGenerationsResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    v2 = self->_commandPushGenerationsResponse;
  }
  else {
    v2 = (ADDeviceSyncCommandPushGenerationsResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPushGenerationsResponse]( self->_base,  "commandPushGenerationsResponse"));
  }
  return v2;
}

- (void)setCommandPushGenerationsResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getCommandPullGenerationsRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    v2 = self->_commandPullGenerationsRequest;
  }
  else {
    v2 = (ADDeviceSyncCommandPullGenerationsRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullGenerationsRequest]( self->_base,  "commandPullGenerationsRequest"));
  }
  return v2;
}

- (void)setCommandPullGenerationsRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getCommandPullGenerationsResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    v2 = self->_commandPullGenerationsResponse;
  }
  else {
    v2 = (ADDeviceSyncCommandPullGenerationsResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullGenerationsResponse]( self->_base,  "commandPullGenerationsResponse"));
  }
  return v2;
}

- (void)setCommandPullGenerationsResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getCommandPullDeltaRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    v2 = self->_commandPullDeltaRequest;
  }
  else {
    v2 = (ADDeviceSyncCommandPullDeltaRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullDeltaRequest]( self->_base,  "commandPullDeltaRequest"));
  }
  return v2;
}

- (void)setCommandPullDeltaRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getCommandPullDeltaResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    v2 = self->_commandPullDeltaResponse;
  }
  else {
    v2 = (ADDeviceSyncCommandPullDeltaResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullDeltaResponse]( self->_base,  "commandPullDeltaResponse"));
  }
  return v2;
}

- (void)setCommandPullDeltaResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getCommandPullSnapshotRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    v2 = self->_commandPullSnapshotRequest;
  }
  else {
    v2 = (ADDeviceSyncCommandPullSnapshotRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullSnapshotRequest]( self->_base,  "commandPullSnapshotRequest"));
  }
  return v2;
}

- (void)setCommandPullSnapshotRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getCommandPullSnapshotResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0) {
    v2 = self->_commandPullSnapshotResponse;
  }
  else {
    v2 = (ADDeviceSyncCommandPullSnapshotResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullSnapshotResponse]( self->_base,  "commandPullSnapshotResponse"));
  }
  return v2;
}

- (void)setCommandPullSnapshotResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void).cxx_destruct
{
}

@end