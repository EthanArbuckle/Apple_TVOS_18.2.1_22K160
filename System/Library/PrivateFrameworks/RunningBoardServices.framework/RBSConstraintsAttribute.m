@interface RBSConstraintsAttribute
+ (id)attributeWithConstraints:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSConstraintsAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)constraints;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSConstraintsAttribute

+ (id)attributeWithConstraints:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___RBSConstraintsAttribute);
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)&OBJC_CLASS___RBSConstraintsAttribute;
    v4 = (RBSConstraintsAttribute *)objc_msgSendSuper2(&v6, sel__init);
    if (v4) {
      v4->_constraints = a3;
    }
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSConstraintsAttribute;
  BOOL v6 = 0;
  if (-[RBSAttribute isEqual:](&v8, sel_isEqual_, v4))
  {
    unint64_t v5 = -[RBSConstraintsAttribute constraints](self, "constraints");
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_constraints;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = (void *)[v3 initWithFormat:@"<%@| constraints:%x>", v4, self->_constraints];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSConstraintsAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_constraints, @"_constraints", v5.receiver, v5.super_class);
}

- (RBSConstraintsAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSConstraintsAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5) {
    v5->_constraints = [v4 decodeUInt64ForKey:@"_constraints"];
  }

  return v5;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

@end