@interface RBSLaunchRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)execute:(id *)a3;
- (BOOL)execute:(id *)a3 assertion:(id *)a4 error:(id *)a5;
- (BOOL)execute:(id *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSLaunchContext)context;
- (RBSLaunchRequest)initWithContext:(id)a3;
- (RBSLaunchRequest)initWithRBSXPCCoder:(id)a3;
- (id)executeRequest;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSLaunchRequest

- (RBSLaunchRequest)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSLaunchRequest;
  v5 = -[RBSRequest _init](&v9, sel__init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;
  }

  return v5;
}

- (id)executeRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 executeLaunchRequest:self];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)execute:(id *)a3 assertion:(id *)a4 error:(id *)a5
{
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];

  if (!a4 && v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2 object:self file:@"RBSLaunchRequest.m" lineNumber:39 description:@"Cannot attempt to create an assertion during launch if the client will not retain the assertion"];
  }
  v13 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  [v13 executeLaunchRequest:self];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  [v14 process];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a3) {
    *a3 = v15;
  }
  [v14 assertion];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!a4)
  {
    [v17 invalidate];
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  *a4 = v17;
  if (a5)
  {
LABEL_8:
    [v14 error];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)execute:(id *)a3 error:(id *)a4
{
  return -[RBSLaunchRequest execute:assertion:error:](self, "execute:assertion:error:", a3, 0LL, a4);
}

- (BOOL)execute:(id *)a3
{
  return -[RBSLaunchRequest execute:assertion:error:](self, "execute:assertion:error:", 0LL, 0LL, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSLaunchRequest *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()
      || (context = self->_context, context != v4->_context) && !-[RBSLaunchContext isEqual:](context, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[RBSLaunchContext identity](self->_context, "identity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext explanation](self->_context, "explanation");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@| %@; %@>", v4, v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSLaunchRequest)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSLaunchRequest;
  uint64_t v5 = -[RBSRequest _init](&v9, sel__init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;
  }

  return v5;
}

- (RBSLaunchContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end