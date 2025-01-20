@interface RBSTagAttribute
+ (id)attributeWithTag:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)tag;
- (RBSTagAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithTag:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSTagAttribute

+ (id)attributeWithTag:(id)a3
{
  id v3 = a3;
  v4 = -[RBSTagAttribute _initWithTag:](objc_alloc(&OBJC_CLASS___RBSTagAttribute), v3);

  return v4;
}

- (void)_initWithTag:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___RBSTagAttribute;
    a1 = objc_msgSendSuper2(&v7, sel__init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSTagAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, @"tag", v5.receiver, v5.super_class);
}

- (RBSTagAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBSTagAttribute;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v10, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copy];
    tag = v5->_tag;
    v5->_tag = (NSString *)v7;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSTagAttribute;
  BOOL v6 = 0;
  if (-[RBSAttribute isEqual:](&v8, sel_isEqual_, v4))
  {
    tag = self->_tag;
    if (tag == (NSString *)v4[1] || -[NSString isEqualToString:](tag, "isEqualToString:")) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_tag, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v5 = (void *)[v3 initWithFormat:@"<%@| tag:%@>", v4, self->_tag];

  return v5;
}

- (NSString)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
}

@end