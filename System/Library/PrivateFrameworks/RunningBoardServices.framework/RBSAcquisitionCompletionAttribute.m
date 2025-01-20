@interface RBSAcquisitionCompletionAttribute
+ (id)attributeWithCompletionPolicy:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSAcquisitionCompletionAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)policy;
- (void)_initWithCompletionPolicy:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAcquisitionCompletionAttribute

+ (id)attributeWithCompletionPolicy:(unint64_t)a3
{
  return  -[RBSAcquisitionCompletionAttribute _initWithCompletionPolicy:]( objc_alloc(&OBJC_CLASS___RBSAcquisitionCompletionAttribute),  a3);
}

- (void)_initWithCompletionPolicy:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_CLASS___RBSAcquisitionCompletionAttribute;
  v3 = objc_msgSendSuper2(&v6, sel__init);
  if (v3)
  {
    if (RBSAcquisitionCompletionPolicyIsValid(a2)) {
      unint64_t v4 = a2;
    }
    else {
      unint64_t v4 = 0LL;
    }
    v3[1] = v4;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSAcquisitionCompletionAttribute;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4) && self->_policy == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_policy;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSAcquisitionCompletionPolicy(self->_policy);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = (void *)[v3 initWithFormat:@"<%@| policy:%@>", v4, v5];

  return v6;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSAcquisitionCompletionAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_policy, @"_policy", v5.receiver, v5.super_class);
}

- (RBSAcquisitionCompletionAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSAcquisitionCompletionAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v9, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    unint64_t v6 = [v4 decodeUInt64ForKey:@"_policy"];
    if (RBSAcquisitionCompletionPolicyIsValid(v6)) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0LL;
    }
    v5->_policy = v7;
  }

  return v5;
}

- (unint64_t)policy
{
  return self->_policy;
}

@end