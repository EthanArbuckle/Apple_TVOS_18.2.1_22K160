@interface RBSCoalitionLevelGrant
+ (id)grantWithCoalitionLevel:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSCoalitionLevelGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithCoalitionLevel:(id)result;
- (id)description;
- (unint64_t)coalitionLevel;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSCoalitionLevelGrant

+ (id)grantWithCoalitionLevel:(unint64_t)a3
{
  return -[RBSCoalitionLevelGrant _initWithCoalitionLevel:](objc_alloc(&OBJC_CLASS___RBSCoalitionLevelGrant), a3);
}

- (id)_initWithCoalitionLevel:(id)result
{
  if (result)
  {
    v3 = result;
    if (a2)
    {
      if (a2 < 0x65) {
        goto LABEL_4;
      }
      [MEMORY[0x1896077D8] currentHandler];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = @"initialized with invalid level";
      v7 = v3;
      uint64_t v8 = 74LL;
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = @"initialized with unknown level";
      v7 = v3;
      uint64_t v8 = 73LL;
    }

    [v4 handleFailureInMethod:sel__initWithCoalitionLevel_ object:v7 file:@"RBSCoalitionLevelGrant.m" lineNumber:v8 description:v6];

LABEL_4:
    v9.receiver = v3;
    v9.super_class = (Class)&OBJC_CLASS___RBSCoalitionLevelGrant;
    result = objc_msgSendSuper2(&v9, sel__init);
    if (result) {
      *((void *)result + 1) = a2;
    }
  }

  return result;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v3 initWithFormat:@"<%@| level:%llu>", v4, self->_coalitionLevel];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSCoalitionLevelGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_coalitionLevel, @"level", v5.receiver, v5.super_class);
}

- (RBSCoalitionLevelGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSCoalitionLevelGrant;
  objc_super v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5) {
    v5->_coalitionLevel = [v4 decodeUInt64ForKey:@"level"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSCoalitionLevelGrant *)a3;
  objc_super v5 = v4;
  if (self == v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4
  }
      && (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())
      && -[RBSCoalitionLevelGrant coalitionLevel](v5, "coalitionLevel") == self->_coalitionLevel;

  return v7;
}

- (unint64_t)hash
{
  return self->_coalitionLevel;
}

- (unint64_t)coalitionLevel
{
  return self->_coalitionLevel;
}

@end