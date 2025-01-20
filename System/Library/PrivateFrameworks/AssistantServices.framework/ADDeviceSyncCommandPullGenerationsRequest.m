@interface ADDeviceSyncCommandPullGenerationsRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)init;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithDataTypes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)dataTypes;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullGenerationsRequest

- (ADDeviceSyncCommandPullGenerationsRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPullGenerationsRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullGenerationsRequest;
  v5 = -[ADDeviceSyncCommandPullGenerationsRequest init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPullGenerationsRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullGenerationsRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPullGenerationsRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullGenerationsRequestMutation getDataTypes](v7, "getDataTypes"));
      v9 = (NSArray *)[v8 copy];
      dataTypes = v6->_dataTypes;
      v6->_dataTypes = v9;
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPullGenerationsRequest)init
{
  return -[ADDeviceSyncCommandPullGenerationsRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPullGenerationsRequest)initWithDataTypes:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000ACEA4;
  v7[3] = &unk_1004EFEF0;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADDeviceSyncCommandPullGenerationsRequest initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (id)description
{
  return -[ADDeviceSyncCommandPullGenerationsRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullGenerationsRequest;
  id v5 = -[ADDeviceSyncCommandPullGenerationsRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@ {dataTypes = %@}", v6, self->_dataTypes);

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSArray hash](self->_dataTypes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullGenerationsRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPullGenerationsRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullGenerationsRequest dataTypes](v4, "dataTypes"));
      dataTypes = self->_dataTypes;
      BOOL v8 = dataTypes == v6 || -[NSArray isEqual:](dataTypes, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADDeviceSyncCommandPullGenerationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v7 forKey:@"ADDeviceSyncCommandPullGenerationsRequest::dataTypes"]);

  objc_super v9 = -[ADDeviceSyncCommandPullGenerationsRequest initWithDataTypes:](self, "initWithDataTypes:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)dataTypes
{
  return self->_dataTypes;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullGenerationsRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPullGenerationsRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullGenerationsRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPullGenerationsRequestMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPullGenerationsRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullGenerationsRequestMutation getDataTypes](v5, "getDataTypes"));
      BOOL v8 = (NSArray *)[v7 copy];
      dataTypes = v6->_dataTypes;
      v6->_dataTypes = v8;
    }

    else
    {
      v6 = (ADDeviceSyncCommandPullGenerationsRequest *)-[ADDeviceSyncCommandPullGenerationsRequest copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADDeviceSyncCommandPullGenerationsRequest *)-[ADDeviceSyncCommandPullGenerationsRequest copy](self, "copy");
  }

  return v6;
}

@end