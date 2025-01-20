@interface ADDeviceSyncCommandPullSnapshotResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)init;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithSnapshot:(id)a3;
- (ADDeviceSyncSnapshot)snapshot;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullSnapshotResponse

- (ADDeviceSyncCommandPullSnapshotResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotResponse;
  v5 = -[ADDeviceSyncCommandPullSnapshotResponse init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPullSnapshotResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotResponseMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPullSnapshotResponseMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullSnapshotResponseMutation getSnapshot](v7, "getSnapshot"));
      v9 = (ADDeviceSyncSnapshot *)[v8 copy];
      snapshot = v6->_snapshot;
      v6->_snapshot = v9;
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPullSnapshotResponse)init
{
  return -[ADDeviceSyncCommandPullSnapshotResponse initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPullSnapshotResponse)initWithSnapshot:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100275420;
  v7[3] = &unk_1004F8C38;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADDeviceSyncCommandPullSnapshotResponse initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (id)description
{
  return -[ADDeviceSyncCommandPullSnapshotResponse _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotResponse;
  id v5 = -[ADDeviceSyncCommandPullSnapshotResponse description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@ {snapshot = %@}", v6, self->_snapshot);

  return v7;
}

- (unint64_t)hash
{
  return -[ADDeviceSyncSnapshot hash](self->_snapshot, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullSnapshotResponse *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotResponse);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (ADDeviceSyncSnapshot *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullSnapshotResponse snapshot](v4, "snapshot"));
      snapshot = self->_snapshot;
      BOOL v8 = snapshot == v6 || -[ADDeviceSyncSnapshot isEqual:](snapshot, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADDeviceSyncCommandPullSnapshotResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ADDeviceSyncSnapshot) forKey:@"ADDeviceSyncCommandPullSnapshotResponse::snapshot"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ADDeviceSyncCommandPullSnapshotResponse initWithSnapshot:](self, "initWithSnapshot:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncSnapshot)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotResponseMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPullSnapshotResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotResponseMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPullSnapshotResponseMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotResponse);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullSnapshotResponseMutation getSnapshot](v5, "getSnapshot"));
      BOOL v8 = (ADDeviceSyncSnapshot *)[v7 copy];
      snapshot = v6->_snapshot;
      v6->_snapshot = v8;
    }

    else
    {
      v6 = (ADDeviceSyncCommandPullSnapshotResponse *)-[ADDeviceSyncCommandPullSnapshotResponse copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADDeviceSyncCommandPullSnapshotResponse *)-[ADDeviceSyncCommandPullSnapshotResponse copy](self, "copy");
  }

  return v6;
}

@end