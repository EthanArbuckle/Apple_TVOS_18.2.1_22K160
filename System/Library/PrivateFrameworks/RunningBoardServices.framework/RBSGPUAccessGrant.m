@interface RBSGPUAccessGrant
+ (id)grant;
+ (id)grantWithRole:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSGPUAccessGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithRole:(unsigned __int8)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSGPUAccessGrant

+ (id)grant
{
  return (id)[objc_alloc((Class)a1) _initWithRole:2];
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  return (id)[objc_alloc((Class)a1) _initWithRole:a3];
}

- (id)_initWithRole:(unsigned __int8)a3
{
  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"RBSGPUAccessGrant.m" lineNumber:29 description:@"initialized with invalid role"];
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSGPUAccessGrant;
  id result = -[RBSAttribute _init](&v8, sel__init);
  if (result) {
    *((_BYTE *)result + 8) = a3;
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSGPUAccessGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
}

- (RBSGPUAccessGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSGPUAccessGrant;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v8, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeInt64ForKey:@"role"];
    if (v6 < 5u)
    {
      if (v6) {
        v5->_role = v6;
      }
      else {
        v5->_role = 1;
      }
    }

    else
    {
      v5->_role = 4;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSGPUAccessGrant;
  if (-[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)) {
    BOOL v5 = self->_role == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_role;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSGPURole(self->_role);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v6 = (void *)[v3 initWithFormat:@"<%@| role:%@>", v4, v5];

  return v6;
}

- (unsigned)role
{
  return self->_role;
}

@end