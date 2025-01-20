@interface LACSharedMode
+ (id)defaultSharedMode;
- (BOOL)isActive;
- (BOOL)isConfirmed;
- (BOOL)isEqual:(id)a3;
- (LACSharedMode)initWithActive:(BOOL)a3;
- (LACSharedMode)initWithActive:(BOOL)a3 confirmed:(BOOL)a4;
- (id)description;
@end

@implementation LACSharedMode

- (LACSharedMode)initWithActive:(BOOL)a3
{
  return -[LACSharedMode initWithActive:confirmed:](self, "initWithActive:confirmed:", a3, 1LL);
}

- (LACSharedMode)initWithActive:(BOOL)a3 confirmed:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LACSharedMode;
  result = -[LACSharedMode init](&v7, sel_init);
  if (result)
  {
    result->_active = a3;
    result->_confirmed = a4;
  }

  return result;
}

+ (id)defaultSharedMode
{
  return  -[LACSharedMode initWithActive:confirmed:]( objc_alloc(&OBJC_CLASS___LACSharedMode),  "initWithActive:confirmed:",  0LL,  0LL);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = -[LACSharedMode isActive](self, "isActive");
    if (v6 == [v5 isActive])
    {
      BOOL v8 = -[LACSharedMode isConfirmed](self, "isConfirmed");
      int v7 = v8 ^ [v5 isConfirmed] ^ 1;
    }

    else
    {
      LOBYTE(v7) = 0;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  v11[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v10[0] = @"isActive";
  if (-[LACSharedMode isActive](self, "isActive")) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v10[1] = @"isConfirmed";
  v11[0] = v5;
  if (-[LACSharedMode isConfirmed](self, "isConfirmed")) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  v11[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v7];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

@end