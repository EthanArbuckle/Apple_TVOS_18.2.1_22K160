@interface _ADDeviceSyncCommandPullDeltaRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPullDeltaRequestMutation)initWithBase:(id)a3;
- (id)getDataType;
- (unint64_t)getGeneration;
- (unint64_t)getLimit;
- (void)setDataType:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation _ADDeviceSyncCommandPullDeltaRequestMutation

- (_ADDeviceSyncCommandPullDeltaRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPullDeltaRequestMutation;
  v6 = -[_ADDeviceSyncCommandPullDeltaRequestMutation init](&v9, "init");
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
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullDeltaRequest dataType](self->_base, "dataType"));
  }
  return v2;
}

- (void)setDataType:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneration
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    return self->_generation;
  }
  else {
    return -[ADDeviceSyncCommandPullDeltaRequest generation](self->_base, "generation");
  }
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getLimit
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    return self->_limit;
  }
  else {
    return -[ADDeviceSyncCommandPullDeltaRequest limit](self->_base, "limit");
  }
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
}

@end