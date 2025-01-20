@interface ADDeviceSyncCommandPushGenerationsResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsResponse)init;
- (ADDeviceSyncCommandPushGenerationsResponse)initWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADDeviceSyncCommandPushGenerationsResponse

- (ADDeviceSyncCommandPushGenerationsResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsResponse;
  v5 = -[ADDeviceSyncCommandPushGenerationsResponse init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncCommandPushGenerationsResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPushGenerationsResponseMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    -[_ADDeviceSyncCommandPushGenerationsResponseMutation isDirty](v7, "isDirty");
  }

  return v6;
}

- (ADDeviceSyncCommandPushGenerationsResponse)init
{
  return -[ADDeviceSyncCommandPushGenerationsResponse initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (id)description
{
  return -[ADDeviceSyncCommandPushGenerationsResponse _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsResponse;
  id v3 = -[ADDeviceSyncCommandPushGenerationsResponse description](&v5, "description", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsResponse;
  return -[ADDeviceSyncCommandPushGenerationsResponse hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsResponse;
  return -[ADDeviceSyncCommandPushGenerationsResponse isEqual:](&v4, "isEqual:", a3);
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsResponseMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncCommandPushGenerationsResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncCommandPushGenerationsResponseMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncCommandPushGenerationsResponseMutation isDirty](v5, "isDirty")) {
      v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCommandPushGenerationsResponse);
    }
    else {
      v6 = (ADDeviceSyncCommandPushGenerationsResponse *)-[ADDeviceSyncCommandPushGenerationsResponse copy]( self,  "copy");
    }
    v7 = v6;
  }

  else
  {
    v7 = (ADDeviceSyncCommandPushGenerationsResponse *)-[ADDeviceSyncCommandPushGenerationsResponse copy](self, "copy");
  }

  return v7;
}

@end