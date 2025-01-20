@interface _ADDeviceSyncIncrementalChangeMutation
- (BOOL)isDirty;
- (_ADDeviceSyncIncrementalChangeMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getDeletedItemUUIDs;
- (id)getInsertedOrUpdatedItems;
- (unint64_t)getGeneration;
- (void)setDate:(id)a3;
- (void)setDeletedItemUUIDs:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setInsertedOrUpdatedItems:(id)a3;
@end

@implementation _ADDeviceSyncIncrementalChangeMutation

- (_ADDeviceSyncIncrementalChangeMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncIncrementalChangeMutation;
  v6 = -[_ADDeviceSyncIncrementalChangeMutation init](&v9, "init");
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

- (unint64_t)getGeneration
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_generation;
  }
  else {
    return -[ADDeviceSyncIncrementalChange generation](self->_base, "generation");
  }
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getDate
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_date;
  }
  else {
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange date](self->_base, "date"));
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getInsertedOrUpdatedItems
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_insertedOrUpdatedItems;
  }
  else {
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange insertedOrUpdatedItems](self->_base, "insertedOrUpdatedItems"));
  }
  return v2;
}

- (void)setInsertedOrUpdatedItems:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getDeletedItemUUIDs
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0) {
    v2 = self->_deletedItemUUIDs;
  }
  else {
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange deletedItemUUIDs](self->_base, "deletedItemUUIDs"));
  }
  return v2;
}

- (void)setDeletedItemUUIDs:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
}

@end