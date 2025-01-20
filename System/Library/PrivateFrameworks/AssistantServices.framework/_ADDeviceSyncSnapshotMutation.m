@interface _ADDeviceSyncSnapshotMutation
- (BOOL)isDirty;
- (_ADDeviceSyncSnapshotMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getItems;
- (unint64_t)getGeneration;
- (void)setDate:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setItems:(id)a3;
@end

@implementation _ADDeviceSyncSnapshotMutation

- (_ADDeviceSyncSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceSyncSnapshotMutation;
  v6 = -[_ADDeviceSyncSnapshotMutation init](&v9, "init");
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
    return -[ADDeviceSyncSnapshot generation](self->_base, "generation");
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
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncSnapshot date](self->_base, "date"));
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getItems
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_items;
  }
  else {
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncSnapshot items](self->_base, "items"));
  }
  return v2;
}

- (void)setItems:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
}

@end