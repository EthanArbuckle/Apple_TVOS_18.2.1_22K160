@interface ADDeviceSyncCommandPushGenerationsRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)init;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithGenerationsByDataType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)generationsByDataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPushGenerationsRequest

- (ADDeviceSyncCommandPushGenerationsRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsRequest;
  v5 = -[ADDeviceSyncCommandPushGenerationsRequest init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPushGenerationsRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPushGenerationsRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPushGenerationsRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncCommandPushGenerationsRequestMutation getGenerationsByDataType]( v7,  "getGenerationsByDataType"));
      v9 = (NSDictionary *)[v8 copy];
      generationsByDataType = v6->_generationsByDataType;
      v6->_generationsByDataType = v9;
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPushGenerationsRequest)init
{
  return -[ADDeviceSyncCommandPushGenerationsRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPushGenerationsRequest)initWithGenerationsByDataType:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001FEEB4;
  v7[3] = &unk_1004F64B8;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADDeviceSyncCommandPushGenerationsRequest initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (id)description
{
  return -[ADDeviceSyncCommandPushGenerationsRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsRequest;
  id v5 = -[ADDeviceSyncCommandPushGenerationsRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {generationsByDataType = %@}",  v6,  self->_generationsByDataType);

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSDictionary hash](self->_generationsByDataType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPushGenerationsRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncCommandPushGenerationsRequest generationsByDataType]( v4,  "generationsByDataType"));
      generationsByDataType = self->_generationsByDataType;
      BOOL v8 = generationsByDataType == v6 || -[NSDictionary isEqual:](generationsByDataType, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADDeviceSyncCommandPushGenerationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v6,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v8 forKey:@"ADDeviceSyncCommandPushGenerationsRequest::generationsByDataType"]);

  v10 = -[ADDeviceSyncCommandPushGenerationsRequest initWithGenerationsByDataType:]( self,  "initWithGenerationsByDataType:",  v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)generationsByDataType
{
  return self->_generationsByDataType;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPushGenerationsRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPushGenerationsRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPushGenerationsRequestMutation isDirty](v5, "isDirty"))
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncCommandPushGenerationsRequestMutation getGenerationsByDataType]( v5,  "getGenerationsByDataType"));
      BOOL v8 = (NSDictionary *)[v7 copy];
      generationsByDataType = v6->_generationsByDataType;
      v6->_generationsByDataType = v8;
    }

    else
    {
      uint64_t v6 = (ADDeviceSyncCommandPushGenerationsRequest *)-[ADDeviceSyncCommandPushGenerationsRequest copy](self, "copy");
    }
  }

  else
  {
    uint64_t v6 = (ADDeviceSyncCommandPushGenerationsRequest *)-[ADDeviceSyncCommandPushGenerationsRequest copy](self, "copy");
  }

  return v6;
}

@end