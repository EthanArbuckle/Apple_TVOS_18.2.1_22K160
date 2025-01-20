@interface ADDeviceSyncCommandPullSnapshotRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)init;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithDataType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)dataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullSnapshotRequest

- (ADDeviceSyncCommandPullSnapshotRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotRequest;
  v5 = -[ADDeviceSyncCommandPullSnapshotRequest init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPullSnapshotRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPullSnapshotRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullSnapshotRequestMutation getDataType](v7, "getDataType"));
      v9 = (NSString *)[v8 copy];
      dataType = v6->_dataType;
      v6->_dataType = v9;
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPullSnapshotRequest)init
{
  return -[ADDeviceSyncCommandPullSnapshotRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPullSnapshotRequest)initWithDataType:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006AEE8;
  v7[3] = &unk_1004EEEE8;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADDeviceSyncCommandPullSnapshotRequest initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (id)description
{
  return -[ADDeviceSyncCommandPullSnapshotRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotRequest;
  id v5 = -[ADDeviceSyncCommandPullSnapshotRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@ {dataType = %@}", v6, self->_dataType);

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_dataType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullSnapshotRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullSnapshotRequest dataType](v4, "dataType"));
      dataType = self->_dataType;
      BOOL v8 = dataType == v6 || -[NSString isEqual:](dataType, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADDeviceSyncCommandPullSnapshotRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceSyncCommandPullSnapshotRequest::dataType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ADDeviceSyncCommandPullSnapshotRequest initWithDataType:](self, "initWithDataType:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)dataType
{
  return self->_dataType;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPullSnapshotRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullSnapshotRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPullSnapshotRequestMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPullSnapshotRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullSnapshotRequestMutation getDataType](v5, "getDataType"));
      BOOL v8 = (NSString *)[v7 copy];
      dataType = v6->_dataType;
      v6->_dataType = v8;
    }

    else
    {
      v6 = (ADDeviceSyncCommandPullSnapshotRequest *)-[ADDeviceSyncCommandPullSnapshotRequest copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADDeviceSyncCommandPullSnapshotRequest *)-[ADDeviceSyncCommandPullSnapshotRequest copy](self, "copy");
  }

  return v6;
}

@end