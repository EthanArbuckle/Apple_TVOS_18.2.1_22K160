@interface ADDeviceSyncCommandPullDeltaResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)init;
- (ADDeviceSyncCommandPullDeltaResponse)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)initWithIncrementalChanges:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)incrementalChanges;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullDeltaResponse

- (ADDeviceSyncCommandPullDeltaResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullDeltaResponse;
  v5 = -[ADDeviceSyncCommandPullDeltaResponse init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPullDeltaResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullDeltaResponseMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncCommandPullDeltaResponseMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullDeltaResponseMutation getIncrementalChanges](v7, "getIncrementalChanges"));
      v9 = (NSArray *)[v8 copy];
      incrementalChanges = v6->_incrementalChanges;
      v6->_incrementalChanges = v9;
    }
  }

  return v6;
}

- (ADDeviceSyncCommandPullDeltaResponse)init
{
  return -[ADDeviceSyncCommandPullDeltaResponse initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncCommandPullDeltaResponse)initWithIncrementalChanges:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B5C90;
  v7[3] = &unk_1004F0048;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADDeviceSyncCommandPullDeltaResponse initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (id)description
{
  return -[ADDeviceSyncCommandPullDeltaResponse _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPullDeltaResponse;
  id v5 = -[ADDeviceSyncCommandPullDeltaResponse description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {incrementalChanges = %@}",  v6,  self->_incrementalChanges);

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSArray hash](self->_incrementalChanges, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullDeltaResponse *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncCommandPullDeltaResponse);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncCommandPullDeltaResponse incrementalChanges](v4, "incrementalChanges"));
      incrementalChanges = self->_incrementalChanges;
      BOOL v8 = incrementalChanges == v6 || -[NSArray isEqual:](incrementalChanges, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADDeviceSyncCommandPullDeltaResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  objc_opt_class(&OBJC_CLASS___ADDeviceSyncIncrementalChange),  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v7 forKey:@"ADDeviceSyncCommandPullDeltaResponse::incrementalChanges"]);

  objc_super v9 = -[ADDeviceSyncCommandPullDeltaResponse initWithIncrementalChanges:](self, "initWithIncrementalChanges:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)incrementalChanges
{
  return self->_incrementalChanges;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaResponseMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPullDeltaResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPullDeltaResponseMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPullDeltaResponseMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPullDeltaResponse);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncCommandPullDeltaResponseMutation getIncrementalChanges](v5, "getIncrementalChanges"));
      BOOL v8 = (NSArray *)[v7 copy];
      incrementalChanges = v6->_incrementalChanges;
      v6->_incrementalChanges = v8;
    }

    else
    {
      v6 = (ADDeviceSyncCommandPullDeltaResponse *)-[ADDeviceSyncCommandPullDeltaResponse copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADDeviceSyncCommandPullDeltaResponse *)-[ADDeviceSyncCommandPullDeltaResponse copy](self, "copy");
  }

  return v6;
}

@end