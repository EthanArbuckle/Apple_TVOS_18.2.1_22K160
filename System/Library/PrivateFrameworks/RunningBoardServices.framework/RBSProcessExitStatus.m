@interface RBSProcessExitStatus
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (RBSProcessExitStatus)statusWithDomain:(unsigned int)a3 code:(unint64_t)a4;
+ (__CFString)_nameForDomain:(int)a3 includeNumber:;
+ (__CFString)_nameForDomain:(uint64_t)a3 code:(int)a4 includeNumber:;
- (BOOL)_isVoluntary;
- (BOOL)isCrash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFairPlayFailure;
- (BOOL)isJetsam;
- (BOOL)isSignal;
- (BOOL)isValid;
- (NSString)description;
- (RBSProcessExitStatus)initWithCoder:(id)a3;
- (RBSProcessExitStatus)initWithRBSXPCCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithDictionaryRepresentation:(id)a3;
- (id)error;
- (unint64_t)code;
- (unint64_t)hash;
- (unsigned)domain;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessExitStatus

+ (RBSProcessExitStatus)statusWithDomain:(unsigned int)a3 code:(unint64_t)a4
{
  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((void *)v6 + 2) = a4;
  return (RBSProcessExitStatus *)v6;
}

- (BOOL)isValid
{
  return self->_domain - 1 < 0x2A;
}

- (BOOL)isJetsam
{
  return self->_domain == 1;
}

- (BOOL)isSignal
{
  return self->_domain == 2;
}

- (BOOL)isCrash
{
  BOOL v3 = -[RBSProcessExitStatus isSignal](self, "isSignal");
  if (v3)
  {
    unint64_t code = self->_code;
    BOOL v5 = code > 0xC;
    unsigned int v6 = (0x1D70u >> code) & 1;
    if (v5) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = v6;
    }
  }

  return v3;
}

- (BOOL)isFairPlayFailure
{
  return self->_domain == 9 && self->_code == 10;
}

- (id)error
{
  v11[1] = *MEMORY[0x1895F89C0];
  BOOL v3 = (void *)MEMORY[0x189607870];
  v4 = +[RBSProcessExitStatus _nameForDomain:includeNumber:]((uint64_t)&OBJC_CLASS___RBSProcessExitStatus, self->_domain, 0);
  unint64_t code = self->_code;
  uint64_t v10 = *MEMORY[0x1896075F0];
  +[RBSProcessExitStatus _nameForDomain:code:includeNumber:]( (uint64_t)&OBJC_CLASS___RBSProcessExitStatus,  self->_domain,  code,  1);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 errorWithDomain:v4 code:code userInfo:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (__CFString)_nameForDomain:(int)a3 includeNumber:
{
  if (a2 > 0x28)
  {
    if (!a3)
    {
      BOOL v5 = @"(unknown)";
      return v5;
    }

    objc_msgSend(NSString, "stringWithFormat:", @"(unknown(%u))", a2, v7);
    goto LABEL_6;
  }

  BOOL v5 = off_189DE0408[(int)a2];
  if (a3)
  {
    [NSString stringWithFormat:@"%@(%u)", off_189DE0408[(int)a2], a2];
LABEL_6:
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (__CFString)_nameForDomain:(uint64_t)a3 code:(int)a4 includeNumber:
{
  uint64_t v7 = 0LL;
  char v8 = 1;
  switch(a2)
  {
    case 1:
      uint64_t v9 = a3 - 1;
      uint64_t v10 = off_189DE05C0;
      goto LABEL_24;
    case 2:
      uint64_t v9 = a3 - 1;
      uint64_t v10 = off_189DE0628;
      goto LABEL_24;
    case 3:
      uint64_t v9 = a3 - 1;
      uint64_t v10 = off_189DE0720;
      goto LABEL_24;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_27;
    case 9:
      uint64_t v9 = a3 - 1;
      uint64_t v10 = off_189DE0550;
      goto LABEL_24;
    case 10:
      uint64_t v7 = 0LL;
      if (a3 <= 3221229822LL)
      {
        if (a3 == 732775916)
        {
          uint64_t v7 = @"security-violation";
        }

        else
        {
          if (a3 != 2343432205LL) {
            goto LABEL_27;
          }
          uint64_t v7 = @"watchdog";
        }
      }

      else
      {
        switch(a3)
        {
          case 3221229823LL:
            uint64_t v7 = @"thermal-pressure";
            break;
          case 3735943697LL:
            uint64_t v7 = @"user-quit";
            break;
          case 4227595259LL:
            uint64_t v7 = @"force-quit";
            break;
          default:
            goto LABEL_27;
        }
      }

      goto LABEL_25;
    default:
      if (a2 != 23) {
        goto LABEL_27;
      }
      uint64_t v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 3)
      {
LABEL_14:
        uint64_t v7 = 0LL;
      }

      else
      {
        uint64_t v10 = off_189DE0740;
LABEL_24:
        uint64_t v7 = v10[v9];
LABEL_25:
        if (!a4)
        {
          v12 = 0LL;
          goto LABEL_36;
        }

        char v8 = 0;
      }

- (BOOL)_isVoluntary
{
  return self->_domain == 0;
}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessExitStatus;
  BOOL v5 = -[RBSProcessExitStatus init](&v9, sel_init);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"_domain"];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_domain = [v6 unsignedIntValue];

    [v4 objectForKeyedSubscript:@"_code"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t code = [v7 unsignedLongLongValue];
  }

  return v5;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_domain];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"_domain"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_code];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:@"_code"];

  unsigned int v6 = (void *)[v3 copy];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessExitStatus *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_domain == v4->_domain && self->_code == v4->_code;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = 0xBF58476D1CE4E5B9LL * (self->_domain ^ ((unint64_t)self->_domain >> 30));
  unint64_t v3 = self->_code ^ (self->_code >> 30);
  unint64_t v4 = (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9LL * v3) ^ ((0xBF58476D1CE4E5B9LL * v3) >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27)));
  return v4 ^ (v4 >> 31);
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessExitStatus _nameForDomain:includeNumber:]((uint64_t)&OBJC_CLASS___RBSProcessExitStatus, self->_domain, 1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessExitStatus _nameForDomain:code:includeNumber:]( (uint64_t)&OBJC_CLASS___RBSProcessExitStatus,  self->_domain,  self->_code,  1);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@| domain:%@ code:%@>", v4, v5, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t domain = self->_domain;
  id v5 = a3;
  [v5 encodeInt64:domain forKey:@"_domain"];
  [v5 encodeInt64:self->_code forKey:@"_code"];
}

- (RBSProcessExitStatus)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSProcessExitStatus;
  id v5 = -[RBSProcessExitStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_uint64_t domain = [v4 decodeInt64ForKey:@"_domain"];
    v5->_unint64_t code = [v4 decodeInt64ForKey:@"_code"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t domain = self->_domain;
  id v5 = a3;
  [v5 encodeInt32:domain forKey:@"_domain"];
  [v5 encodeInt64:self->_code forKey:@"_code"];
}

- (RBSProcessExitStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSProcessExitStatus;
  id v5 = -[RBSProcessExitStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_uint64_t domain = [v4 decodeInt32ForKey:@"_domain"];
    v5->_unint64_t code = [v4 decodeInt64ForKey:@"_code"];
  }

  return v5;
}

- (unsigned)domain
{
  return self->_domain;
}

- (unint64_t)code
{
  return self->_code;
}

@end