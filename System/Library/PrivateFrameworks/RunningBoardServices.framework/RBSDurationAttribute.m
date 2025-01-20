@interface RBSDurationAttribute
+ (id)attributeWithDuration:(double)a3 warningDuration:(double)a4 startPolicy:(unint64_t)a5 endPolicy:(unint64_t)a6;
+ (id)invalidateAfterInterval:(double)a3;
+ (id)terminateAfterInterval:(double)a3;
- (BOOL)isEqual:(id)a3;
- (RBSDurationAttribute)initWithRBSXPCCoder:(id)a3;
- (double)invalidationDuration;
- (double)warningDuration;
- (id)_initWithInvalidationDuration:(unint64_t)a3 warningDuration:(double)a4 startPolicy:(double)a5 endPolicy:;
- (id)description;
- (unint64_t)endPolicy;
- (unint64_t)hash;
- (unint64_t)startPolicy;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setEndPolicy:(unint64_t)a3;
- (void)setInvalidationDuration:(double)a3;
- (void)setStartPolicy:(unint64_t)a3;
- (void)setWarningDuration:(double)a3;
@end

@implementation RBSDurationAttribute

+ (id)terminateAfterInterval:(double)a3
{
  return (id)[a1 attributeWithDuration:1 warningDuration:2 startPolicy:a3 endPolicy:0.0];
}

+ (id)invalidateAfterInterval:(double)a3
{
  return (id)[a1 attributeWithDuration:1 warningDuration:1 startPolicy:a3 endPolicy:0.0];
}

+ (id)attributeWithDuration:(double)a3 warningDuration:(double)a4 startPolicy:(unint64_t)a5 endPolicy:(unint64_t)a6
{
  return  -[RBSDurationAttribute _initWithInvalidationDuration:warningDuration:startPolicy:endPolicy:]( objc_alloc(&OBJC_CLASS___RBSDurationAttribute),  a5,  a6,  a3,  a4);
}

- (id)_initWithInvalidationDuration:(unint64_t)a3 warningDuration:(double)a4 startPolicy:(double)a5 endPolicy:
{
  if (result)
  {
    v9 = result;
    if (a4 < 0.0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:121 description:@"Initialized with invalid invalidationDuration"];
    }

    if (a5 < 0.0 || a5 >= a4)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:122 description:@"Initialized with invalid warningDuration"];
    }

    if ((unint64_t)(a2 - 104) <= 0xFFFFFFFFFFFFFF98LL)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:123 description:@"Initialized with invalid startPolicy"];
    }

    if (a3 >= 3)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:124 description:@"Initialized with invalid endPolicy"];
    }

    v15.receiver = v9;
    v15.super_class = (Class)&OBJC_CLASS___RBSDurationAttribute;
    result = objc_msgSendSuper2(&v15, sel__init);
    if (result)
    {
      *((double *)result + 1) = a4;
      *((double *)result + 2) = a5;
      *((void *)result + 3) = a2;
      *((void *)result + 4) = a3;
    }
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSDurationAttribute;
  BOOL v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && self->_startPolicy == *((void *)v4 + 3)
    && self->_endPolicy == *((void *)v4 + 4)
    && vabdd_f64(self->_invalidationDuration, *((double *)v4 + 1)) < 0.00000011920929
    && vabdd_f64(self->_warningDuration, *((double *)v4 + 2)) < 0.00000011920929;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_endPolicy ^ self->_startPolicy;
  [MEMORY[0x189607968] numberWithDouble:self->_invalidationDuration];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v3 ^ [v4 hash];
  [MEMORY[0x189607968] numberWithDouble:self->_warningDuration];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  double invalidationDuration = self->_invalidationDuration;
  double warningDuration = self->_warningDuration;
  NSStringFromRBSDurationStartPolicy(self->_startPolicy);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSDurationEndPolicy(self->_endPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v3 initWithFormat:@"<%@| invalidationDuration:%.2f warningDuration:%.2f startPolicy:%@ endPolicy:%@>", v4, *(void *)&invalidationDuration, *(void *)&warningDuration, v7, v8];

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSDurationAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  -[RBSDurationAttribute invalidationDuration](self, "invalidationDuration", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", @"invalidationDuration");
  -[RBSDurationAttribute warningDuration](self, "warningDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", @"warningDuration");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[RBSDurationAttribute startPolicy](self, "startPolicy"),  @"startPolicy");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSDurationAttribute endPolicy](self, "endPolicy"), @"endPolicy");
}

- (RBSDurationAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSDurationAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    [v4 decodeDoubleForKey:@"invalidationDuration"];
    -[RBSDurationAttribute setInvalidationDuration:](v5, "setInvalidationDuration:");
    [v4 decodeDoubleForKey:@"warningDuration"];
    -[RBSDurationAttribute setWarningDuration:](v5, "setWarningDuration:");
    -[RBSDurationAttribute setStartPolicy:]( v5,  "setStartPolicy:",  [v4 decodeInt64ForKey:@"startPolicy"]);
    -[RBSDurationAttribute setEndPolicy:]( v5,  "setEndPolicy:",  [v4 decodeInt64ForKey:@"endPolicy"]);
  }

  return v5;
}

- (double)invalidationDuration
{
  return self->_invalidationDuration;
}

- (void)setInvalidationDuration:(double)a3
{
  self->_double invalidationDuration = a3;
}

- (double)warningDuration
{
  return self->_warningDuration;
}

- (void)setWarningDuration:(double)a3
{
  self->_double warningDuration = a3;
}

- (unint64_t)startPolicy
{
  return self->_startPolicy;
}

- (void)setStartPolicy:(unint64_t)a3
{
  self->_startPolicy = a3;
}

- (unint64_t)endPolicy
{
  return self->_endPolicy;
}

- (void)setEndPolicy:(unint64_t)a3
{
  self->_endPolicy = a3;
}

@end