@interface _LSQueryContext
+ (BOOL)simulateLimitedMappingForXCTests;
+ (id)defaultContext;
+ (void)setSimulateLimitedMappingForXCTests:(BOOL)a3;
- (_LSQueryContext)init;
- (_LSQueryResolving)_resolver;
- (id)_init;
- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)debugDescription;
- (id)resolveQueries:(id)a3 error:(id *)a4;
- (void)enumerateResolvedResultsOfQuery:(id)a3 withBlock:(id)a4;
@end

@implementation _LSQueryContext

+ (BOOL)simulateLimitedMappingForXCTests
{
  LODWORD(v2) = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
  if ((_DWORD)v2)
  {
    v2 = getenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS");
    if (v2) {
      LOBYTE(v2) = atoi(v2) != 0;
    }
  }

  return (char)v2;
}

+ (id)defaultContext
{
  if (+[_LSQueryContext defaultContext]::once != -1) {
    dispatch_once(&+[_LSQueryContext defaultContext]::once, &__block_literal_global_57);
  }
  return (id)+[_LSQueryContext defaultContext]::result;
}

- (_LSQueryContext)init
{
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = @"no";
  if ((isKindOfClass & 1) != 0) {
    v5 = @"yes";
  }
  v6 = v5;

  v7 = (void *)NSString;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"<%@ %p> { XPC: %@ }", v9, self, v6];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
}

- (void)enumerateResolvedResultsOfQuery:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 87, @"Invalid parameter not satisfying: %@", @"query != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 88, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  v10 = -[_LSQueryContext _resolver](self, "_resolver");
  v11 = v10;
  if (v10)
  {
    [v10 _enumerateResolvedResultsOfQuery:v7 XPCConnection:0 withBlock:v9];
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:91 description:@"Could not get query resolver"];

    char v16 = 0;
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSQueryContext(QueryResolution) enumerateResolvedResultsOfQuery:withBlock:]",  99LL,  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *, char *))v9)[2](v9, 0LL, v15, &v16);
  }
}

- (id)resolveQueries:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSQueryContext.mm", 108, @"Invalid parameter not satisfying: %@", @"queries != nil" object file lineNumber description];
  }

  id v13 = 0LL;
  -[_LSQueryContext _resolveQueries:XPCConnection:error:](self, "_resolveQueries:XPCConnection:error:", v7, 0LL, &v13);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  v10 = v9;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSQueryContext;
  v2 = -[_LSQueryContext init](&v6, sel_init);
  if (v2)
  {
    else {
      v3 = objc_alloc_init(&OBJC_CLASS____LSXPCQueryResolver);
    }
    id resolver = v2->_resolver;
    v2->_id resolver = v3;
  }

  return v2;
}

- (_LSQueryResolving)_resolver
{
  return (_LSQueryResolving *)self->_resolver;
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v11 = -[_LSQueryContext _resolver](self, "_resolver");
  if (v11)
  {
    if (!v9) {
      goto LABEL_7;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:160 description:@"Could not get query resolver"];

    if (!v9)
    {
LABEL_7:
      uint64_t v18 = *MEMORY[0x189607490];
      v19[0] = @"invalid input parameters";
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSQueryContext(Internal) _resolveQueries:XPCConnection:error:]",  168LL,  v15);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0LL;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }

  if (![v9 count]) {
    goto LABEL_7;
  }
  id v17 = 0LL;
  [v11 _resolveQueries:v9 XPCConnection:v10 error:&v17];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v17;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v12) {
    *a5 = v13;
  }
LABEL_10:

  return v12;
}

+ (void)setSimulateLimitedMappingForXCTests:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v3) {
      v4 = "1";
    }
    else {
      v4 = "0";
    }
    setenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS", v4, 1);
  }

@end