@interface RBSRunningReasonAttribute
+ (id)withReason:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSRunningReasonAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)runningReason;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSRunningReasonAttribute

+ (id)withReason:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___RBSRunningReasonAttribute);
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)&OBJC_CLASS___RBSRunningReasonAttribute;
    v4 = (RBSRunningReasonAttribute *)objc_msgSendSuper2(&v6, sel__init);
    if (v4) {
      v4->_runningReason = a3;
    }
  }

  return v4;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSRunningReasonAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_runningReason, @"_runningReason", v5.receiver, v5.super_class);
}

- (RBSRunningReasonAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSRunningReasonAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5) {
    v5->_runningReason = [v4 decodeUInt64ForKey:@"_runningReason"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSRunningReasonAttribute;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_runningReason == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_runningReason;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (void *)[v3 initWithFormat:@"<%@| runningReason:%llu>", v4, self->_runningReason];

  return v5;
}

- (unint64_t)runningReason
{
  return self->_runningReason;
}

@end