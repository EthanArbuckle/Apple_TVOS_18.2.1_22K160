@interface RBSLegacyAttribute
+ (id)attributeWithReason:(unint64_t)a3 flags:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (RBSLegacyAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)reason;
- (unint64_t)requestedReason;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation RBSLegacyAttribute

+ (id)attributeWithReason:(unint64_t)a3 flags:(unint64_t)a4
{
  v6 = objc_alloc(&OBJC_CLASS___RBSLegacyAttribute);
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)&OBJC_CLASS___RBSLegacyAttribute;
    v6 = (RBSLegacyAttribute *)objc_msgSendSuper2(&v8, sel__init);
    if (v6)
    {
      v6->_requestedReason = a3;
      v6->_reason = a3;
      v6->_flags = a4;
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSLegacyAttribute;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_requestedReason == v4[2]
    && self->_reason == v4[1]
    && self->_flags == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return self->_reason ^ self->_requestedReason ^ self->_flags;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyReason(self->_requestedReason);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyReason(self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSLegacyFlags(self->_flags);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v8 = (void *)[v3 initWithFormat:@"<%@| requestedReason:%@ reason:%@ flags:%@>", v4, v5, v6, v7];

  return v8;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSLegacyAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[RBSLegacyAttribute requestedReason](self, "requestedReason", v5.receiver, v5.super_class),  @"requestedReason");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSLegacyAttribute reason](self, "reason"), @"reason");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSLegacyAttribute flags](self, "flags"), @"flags");
}

- (RBSLegacyAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSLegacyAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    v5->_requestedReason = [v4 decodeInt64ForKey:@"requestedReason"];
    -[RBSLegacyAttribute setReason:](v5, "setReason:", [v4 decodeInt64ForKey:@"reason"]);
    v5->_flags = [v4 decodeInt64ForKey:@"flags"];
  }

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)requestedReason
{
  return self->_requestedReason;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end