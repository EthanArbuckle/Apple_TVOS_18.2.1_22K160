@interface RBSProcessExitContext
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)exitContextForNamespace:(unsigned int)a3 code:(unint64_t)a4 wait4Status:(int)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessExitContext)initWithCoder:(id)a3;
- (RBSProcessExitContext)initWithRBSXPCCoder:(id)a3;
- (RBSProcessExitStatus)status;
- (RBSTerminateContext)terminationContext;
- (id)_initWithNamespace:(uint64_t)a3 code:(int)a4 wait4Status:;
- (id)_initWithStatus:(int)a3 legacyCode:(void *)a4 timestamp:(void *)a5 context:;
- (id)copyWithStatus:(id)a3;
- (id)copyWithTerminationContext:(id)a3;
- (id)copyWithTimestamp:(id)a3;
- (int)legacyCode;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessExitContext

- (id)_initWithStatus:(int)a3 legacyCode:(void *)a4 timestamp:(void *)a5 context:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___RBSProcessExitContext;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      if (![v9 domain])
      {
        uint64_t v13 = [v9 code];
        if (a3)
        {
          if (!v13 && (a3 & 0x7F) != 0 && (a3 & 0x7F) != 0x7F)
          {
            rbs_process_log();
            v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v19 = a3;
              _os_log_impl( &dword_185F67000,  v14,  OS_LOG_TYPE_DEFAULT,  "Modern status reporting system failed (signal detected), translating $d into 2,%d",  buf,  8u);
            }

            uint64_t v15 = +[RBSProcessExitStatus statusWithDomain:code:]( &OBJC_CLASS___RBSProcessExitStatus,  "statusWithDomain:code:",  2LL,  a3 & 0x7F);

            id v9 = (id)v15;
          }
        }
      }

      objc_storeStrong(a1 + 4, v9);
      if ([a1[4] isValid])
      {
        uint64_t v12 = 2LL;
      }

      else
      {
        if (![a1[4] _isVoluntary])
        {
          a1[3] = 0LL;
          goto LABEL_17;
        }

        uint64_t v12 = 1LL;
      }

      a1[3] = (id)v12;
LABEL_17:
      *((_DWORD *)a1 + 2) = a3;
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 5, a5);
    }
  }

  return a1;
}

- (RBSProcessExitStatus)status
{
  if (-[RBSProcessExitStatus isValid](self->_status, "isValid")) {
    status = self->_status;
  }
  else {
    status = 0LL;
  }
  return status;
}

- (id)copyWithStatus:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]( (id *)objc_alloc(&OBJC_CLASS___RBSProcessExitContext),  v4,  0,  self->_timestamp,  self->_terminationContext);

  return v5;
}

- (id)copyWithTimestamp:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]( (id *)objc_alloc(&OBJC_CLASS___RBSProcessExitContext),  self->_status,  self->_legacyCode,  v4,  self->_terminationContext);

  return v5;
}

- (id)copyWithTerminationContext:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]( (id *)objc_alloc(&OBJC_CLASS___RBSProcessExitContext),  self->_status,  self->_legacyCode,  self->_timestamp,  v4);

  return v5;
}

- (id)_initWithNamespace:(uint64_t)a3 code:(int)a4 wait4Status:
{
  if (!a1) {
    return 0LL;
  }
  v6 = +[RBSProcessExitStatus statusWithDomain:code:](&OBJC_CLASS___RBSProcessExitStatus, "statusWithDomain:code:", a2, a3);
  [MEMORY[0x189603F50] date];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:](a1, v6, a4, v7, 0LL);

  return v8;
}

+ (id)exitContextForNamespace:(unsigned int)a3 code:(unint64_t)a4 wait4Status:(int)a5
{
  return  -[RBSProcessExitContext _initWithNamespace:code:wait4Status:]( (id *)objc_alloc(&OBJC_CLASS___RBSProcessExitContext),  *(uint64_t *)&a3,  a4,  a5);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessExitContext *)a3;
  if (self == v4) {
    goto LABEL_15;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_legacyCode != v4->_legacyCode || self->_type != v4->_type) {
    goto LABEL_14;
  }
  status = self->_status;
  v7 = v4->_status;
  if (status != v7)
  {
    char v8 = 0;
    if (!status || !v7) {
      goto LABEL_16;
    }
    if (!-[RBSProcessExitStatus isEqual:](status, "isEqual:")) {
      goto LABEL_14;
    }
  }

  if (!RBSXPCEqualDates(self->_timestamp, v4->_timestamp))
  {
LABEL_14:
    char v8 = 0;
    goto LABEL_16;
  }

  terminationContext = self->_terminationContext;
  id v10 = v4->_terminationContext;
  if (terminationContext == v10)
  {
LABEL_15:
    char v8 = 1;
    goto LABEL_16;
  }

  char v8 = 0;
  if (terminationContext && v10) {
    char v8 = -[RBSTerminateContext isEqual:](terminationContext, "isEqual:");
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  return -[RBSProcessExitStatus hash](self->_status, "hash");
}

- (NSString)description
{
  int64_t type = self->_type;
  if (type == 1)
  {
    id v8 = objc_alloc(NSString);
    [(id)objc_opt_class() description];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 initWithFormat:@"<%@| voluntary>", v5];
LABEL_6:
    v7 = (void *)v9;
    goto LABEL_7;
  }

  if (type != 2)
  {
    id v10 = objc_alloc(NSString);
    [(id)objc_opt_class() description];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v10 initWithFormat:@"<%@| unknown>", v5];
    goto LABEL_6;
  }

  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBSProcessExitStatus description](self->_status, "description");
  v7 = (void *)[v4 initWithFormat:@"<%@| specific, status:%@>", v5, v6];

LABEL_7:
  return (NSString *)v7;
}

- (NSString)debugDescription
{
  int64_t type = self->_type;
  if (type == 1)
  {
    id v11 = objc_alloc(NSString);
    uint64_t v12 = [(id)objc_opt_class() description];
    uint64_t v5 = (void *)v12;
    uint64_t v13 = @", terminationContext";
    terminationContext = self->_terminationContext;
    if (!terminationContext)
    {
      uint64_t v13 = &stru_189DE1D08;
      terminationContext = (RBSTerminateContext *)&stru_189DE1D08;
    }

    uint64_t v15 = [v11 initWithFormat:@"<%@| voluntary%@%@>", v12, v13, terminationContext];
    goto LABEL_12;
  }

  if (type != 2)
  {
    id v16 = objc_alloc(NSString);
    uint64_t v17 = [(id)objc_opt_class() description];
    uint64_t v5 = (void *)v17;
    v18 = @", terminationContext";
    int v19 = self->_terminationContext;
    if (!v19)
    {
      v18 = &stru_189DE1D08;
      int v19 = (RBSTerminateContext *)&stru_189DE1D08;
    }

    uint64_t v15 = [v16 initWithFormat:@"<%@| unknown%@%@>", v17, v18, v19];
LABEL_12:
    id v10 = (void *)v15;
    goto LABEL_13;
  }

  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[RBSProcessExitStatus description](self->_status, "description");
  v7 = (void *)v6;
  id v8 = @" terminationContext";
  uint64_t v9 = self->_terminationContext;
  if (!v9)
  {
    id v8 = &stru_189DE1D08;
    uint64_t v9 = (RBSTerminateContext *)&stru_189DE1D08;
  }

  id v10 = (void *)[v4 initWithFormat:@"<%@| specific, status:%@%@%@>", v5, v6, v8, v9];

LABEL_13:
  return (NSString *)v10;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"_type"];
  [v5 encodeObject:self->_status forKey:@"_status"];
  [v5 encodeObject:self->_timestamp forKey:@"_timestamp"];
  [v5 encodeObject:self->_terminationContext forKey:@"_terminationContext"];
  [v5 encodeInt64:self->_legacyCode forKey:@"_legacyCode"];
}

- (RBSProcessExitContext)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBSProcessExitContext;
  id v5 = -[RBSProcessExitContext init](&v13, sel_init);
  if (v5)
  {
    v5->_int64_t type = [v4 decodeInt64ForKey:@"_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    status = v5->_status;
    v5->_status = (RBSProcessExitStatus *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_terminationContext"];
    terminationContext = v5->_terminationContext;
    v5->_terminationContext = (RBSTerminateContext *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    v5->_legacyCode = [v4 decodeInt64ForKey:@"_legacyCode"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"_type"];
  [v5 encodeObject:self->_timestamp forKey:@"_timestamp"];
  [v5 encodeObject:self->_status forKey:@"_status"];
  [v5 encodeInt32:self->_legacyCode forKey:@"_legacyCode"];
}

- (RBSProcessExitContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessExitContext;
  id v5 = -[RBSProcessExitContext init](&v11, sel_init);
  if (v5)
  {
    v5->_int64_t type = [v4 decodeInt64ForKey:@"_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    status = v5->_status;
    v5->_status = (RBSProcessExitStatus *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    v5->_legacyCode = [v4 decodeInt32ForKey:@"_legacyCode"];
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)type
{
  return self->_type;
}

- (int)legacyCode
{
  return self->_legacyCode;
}

- (RBSTerminateContext)terminationContext
{
  return self->_terminationContext;
}

- (void).cxx_destruct
{
}

@end