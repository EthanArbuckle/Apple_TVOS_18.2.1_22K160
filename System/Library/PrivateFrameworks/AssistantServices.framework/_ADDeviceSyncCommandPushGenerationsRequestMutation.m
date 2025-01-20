@interface _ADDeviceSyncCommandPushGenerationsRequestMutation
- (BOOL)isDirty;
- (_ADDeviceSyncCommandPushGenerationsRequestMutation)initWithBase:(id)a3;
- (id)getGenerationsByDataType;
- (void)setGenerationsByDataType:(id)a3;
@end

@implementation _ADDeviceSyncCommandPushGenerationsRequestMutation

- (_ADDeviceSyncCommandPushGenerationsRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncCommandPushGenerationsRequestMutation;
  v6 = -[_ADDeviceSyncCommandPushGenerationsRequestMutation init](&v9, "init");
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

- (id)getGenerationsByDataType
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_generationsByDataType;
  }
  else {
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncCommandPushGenerationsRequest generationsByDataType]( self->_base,  "generationsByDataType"));
  }
  return v2;
}

- (void)setGenerationsByDataType:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end