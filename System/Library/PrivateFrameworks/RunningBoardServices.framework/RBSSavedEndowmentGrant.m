@interface RBSSavedEndowmentGrant
+ (id)grantWithNamespace:(id)a3 key:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)endowmentNamespace;
- (NSString)key;
- (RBSSavedEndowmentGrant)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSSavedEndowmentGrant

+ (id)grantWithNamespace:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = [v7 copy];
    v12 = (void *)v8[2];
    v8[2] = v11;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBSSavedEndowmentGrant;
  if (!-[RBSAttribute isEqual:](&v13, sel_isEqual_, v4)) {
    goto LABEL_14;
  }
  endowmentNamespace = self->_endowmentNamespace;
  id v6 = (NSString *)v4[1];
  if (endowmentNamespace != v6)
  {
    BOOL v7 = !endowmentNamespace || v6 == 0LL;
    if (v7 || !-[NSString isEqualToString:](endowmentNamespace, "isEqualToString:")) {
      goto LABEL_14;
    }
  }

  key = self->_key;
  uint64_t v9 = (NSString *)v4[2];
  if (key == v9)
  {
    char v12 = 1;
    goto LABEL_15;
  }

  if (key && v9 != 0LL) {
    char v12 = -[NSString isEqualToString:](key, "isEqualToString:");
  }
  else {
LABEL_14:
  }
    char v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_endowmentNamespace, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v3 initWithFormat:@"<%@| namespace:%@ key:%@>", v4, self->_endowmentNamespace, self->_key];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSSavedEndowmentGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_endowmentNamespace,  @"_endowmentNamespace",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_key forKey:@"_key"];
}

- (RBSSavedEndowmentGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeStringForKey:@"_endowmentNamespace"];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 decodeStringForKey:@"_key"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___RBSSavedEndowmentGrant;
      BOOL v7 = -[RBSAttribute initWithRBSXPCCoder:](&v11, sel_initWithRBSXPCCoder_, v4);
      p_isa = (id *)&v7->super.super.super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_endowmentNamespace, v5);
        objc_storeStrong(p_isa + 2, v6);
      }

      self = p_isa;
      uint64_t v9 = self;
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end