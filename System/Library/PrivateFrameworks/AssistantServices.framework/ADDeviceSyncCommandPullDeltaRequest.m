@interface ADDeviceSyncCommandPullDeltaRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)init;
- (ADDeviceSyncCommandPullDeltaRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)initWithDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)dataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullDeltaRequest

- (ADDeviceSyncCommandPullDeltaRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullDeltaRequest;
  v5 = -[ADDeviceSyncCommandPullDeltaRequest init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPullDeltaRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullDeltaRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPullDeltaRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullDeltaRequestMutation getDataType](v7, "getDataType"));
      v9 = (NSString *)[v8 copy];
      dataType = v6->_dataType;
      v6->_dataType = v9;

      v6->_generation = -[_ADDeviceSyncCommandPullDeltaRequestMutation getGeneration](v7, "getGeneration");
      v6->_limit = -[_ADDeviceSyncCommandPullDeltaRequestMutation getLimit](v7, "getLimit");
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPullDeltaRequest)init
{
  return -[ADDeviceSyncCommandPullDeltaRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPullDeltaRequest)initWithDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10034DAF0;
  v11[3] = &unk_1004FD8A8;
  id v12 = a3;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v8 = v12;
  v9 = -[ADDeviceSyncCommandPullDeltaRequest initWithBuilder:](self, "initWithBuilder:", v11);

  return v9;
}

- (id)description
{
  return -[ADDeviceSyncCommandPullDeltaRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullDeltaRequest;
  id v5 = -[ADDeviceSyncCommandPullDeltaRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {dataType = %@, generation = %llu, limit = %llu}",  v6,  self->_dataType,  self->_generation,  self->_limit);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_dataType, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_generation));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_limit));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADDeviceSyncCommandPullDeltaRequest *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPullDeltaRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      id generation = (id)self->_generation;
      if (generation == (id)-[ADDeviceSyncCommandPullDeltaRequest generation](v6, "generation")
        && (id limit = (id)self->_limit, limit == (id)-[ADDeviceSyncCommandPullDeltaRequest limit](v6, "limit")))
      {
        objc_super v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullDeltaRequest dataType](v6, "dataType"));
        dataType = self->_dataType;
        BOOL v11 = dataType == v9 || -[NSString isEqual:](dataType, "isEqual:", v9);
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (ADDeviceSyncCommandPullDeltaRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceSyncCommandPullDeltaRequest::dataType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncCommandPullDeltaRequest::generation"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 unsignedLongLongValue];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncCommandPullDeltaRequest::limit"];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = [v11 unsignedLongLongValue];
  unint64_t v13 = -[ADDeviceSyncCommandPullDeltaRequest initWithDataType:generation:limit:]( self,  "initWithDataType:generation:limit:",  v6,  v9,  v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  dataType = self->_dataType;
  id v5 = a3;
  [v5 encodeObject:dataType forKey:@"ADDeviceSyncCommandPullDeltaRequest::dataType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_generation));
  [v5 encodeObject:v6 forKey:@"ADDeviceSyncCommandPullDeltaRequest::generation"];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_limit));
  [v5 encodeObject:v7 forKey:@"ADDeviceSyncCommandPullDeltaRequest::limit"];
}

- (NSString)dataType
{
  return self->_dataType;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (unint64_t)limit
{
  return self->_limit;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPullDeltaRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullDeltaRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPullDeltaRequestMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPullDeltaRequest);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullDeltaRequestMutation getDataType](v5, "getDataType"));
      id v8 = (NSString *)[v7 copy];
      dataType = v6->_dataType;
      v6->_dataType = v8;

      v6->_id generation = -[_ADDeviceSyncCommandPullDeltaRequestMutation getGeneration](v5, "getGeneration");
      v6->_id limit = -[_ADDeviceSyncCommandPullDeltaRequestMutation getLimit](v5, "getLimit");
    }

    else
    {
      v6 = (ADDeviceSyncCommandPullDeltaRequest *)-[ADDeviceSyncCommandPullDeltaRequest copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADDeviceSyncCommandPullDeltaRequest *)-[ADDeviceSyncCommandPullDeltaRequest copy](self, "copy");
  }

  return v6;
}

@end