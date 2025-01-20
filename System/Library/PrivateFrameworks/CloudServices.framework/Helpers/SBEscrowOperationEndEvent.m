@interface SBEscrowOperationEndEvent
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (SBEscrowOperationEndEvent)initWithCoder:(id)a3;
- (SBEscrowOperationEndEvent)initWithStartEvent:(id)a3 results:(id)a4 error:(id)a5 context:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBEscrowOperationEndEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBEscrowOperationEndEvent)initWithStartEvent:(id)a3 results:(id)a4 error:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 operationId]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 activityId]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 activityLabel]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 recordId]);
  id v16 = [v11 type];

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SBEscrowOperationEndEvent;
  v17 = -[SBEscrowOperationEvent initWithOperationId:activityId:activityLabel:recordId:type:context:]( &v21,  "initWithOperationId:activityId:activityLabel:recordId:type:context:",  v12,  v13,  v14,  v15,  v16,  v10);

  if (v17)
  {
    v18 = (NSError *)[v9 copy];
    error = v17->_error;
    v17->_error = v18;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SBEscrowOperationEndEvent;
  id v4 = a3;
  -[SBEscrowOperationEvent encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, @"error", v5.receiver, v5.super_class);
}

- (SBEscrowOperationEndEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SBEscrowOperationEndEvent;
  v6 = -[SBEscrowOperationEvent initWithCoder:](&v14, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError, v5), @"error");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_opt_self(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    error = v6->_error;
    v6->_error = (NSError *)v10;

    v12 = v6;
  }

  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end