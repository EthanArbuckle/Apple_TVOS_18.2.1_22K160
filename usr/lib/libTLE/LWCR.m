@interface LWCR
+ (id)withData:(id)a3 withError:(id *)a4;
+ (id)withVersion:(int64_t)a3 withConstraintCategory:(int64_t)a4 withRequirements:(id)a5 withError:(id *)a6;
- (BOOL)hasRequirements;
- (LWCR)init;
- (NSDictionary)dictionary;
- (id).cxx_construct;
- (id)externalRepresentation;
- (int64_t)constraintCategory;
- (int64_t)version;
- (void)dealloc;
@end

@implementation LWCR

- (LWCR)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LWCR;
  v2 = -[LWCR init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0LL;

    *((void *)v3 + 2) = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  if (*((void *)self + 2)) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LWCR;
  -[LWCR dealloc](&v3, sel_dealloc);
}

- (int64_t)version
{
  return *((void *)self + 4);
}

- (int64_t)constraintCategory
{
  return *((void *)self + 6);
}

- (BOOL)hasRequirements
{
  return der_vm_context_is_valid();
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)[*((id *)self + 3) copy];
}

- (id)externalRepresentation
{
  return *((id *)self + 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 89) = 0;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

+ (id)withData:(id)a3 withError:(id *)a4
{
  v25[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v23 = 0LL;
  char v22 = 1;
  uint64_t v7 = CEManagedContextFromCFDataWithOptions();
  v8 = (void *)MEMORY[0x1896135D8];
  if (v7 == *MEMORY[0x1896135D8])
  {
    v10 = objc_alloc_init(&OBJC_CLASS___LWCR);
    objc_storeStrong((id *)v10 + 1, a3);
    v11 = v23;
    *((void *)v10 + 2) = v23;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    TLE::LWCR::loadFromCE((TLE::LWCR *)((char *)v10 + 32), v11, (uint64_t)&v19);
    if ((_DWORD)v19)
    {
      if (a4)
      {
        v12 = (void *)MEMORY[0x189607870];
        v24[0] = *MEMORY[0x189607798];
        objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v13;
        v24[1] = *MEMORY[0x189607490];
        id v14 = objc_alloc(NSString);
        v15 = (void *)[v14 initWithBytes:v20 length:v21 encoding:4];
        v25[1] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 errorWithDomain:@"LWCRError" code:1 userInfo:v16];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      if (CEQueryContextToCFDictionary() == *v8)
      {
        v18 = (void *)*((void *)v10 + 3);
        *((void *)v10 + 3) = 0LL;

        v9 = v10;
        goto LABEL_8;
      }

      if (a4)
      {
        [MEMORY[0x189607870] errorWithDomain:@"LWCRError" code:2 userInfo:0];
        v9 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }

    v9 = 0LL;
LABEL_8:

    goto LABEL_10;
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"LWCRError" code:2 userInfo:0];
    v9 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

+ (id)withVersion:(int64_t)a3 withConstraintCategory:(int64_t)a4 withRequirements:(id)a5 withError:(id *)a6
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  v11 = (void *)MEMORY[0x189603FC8];
  v19[0] = @"vers";
  [MEMORY[0x189607968] numberWithLongLong:a3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = @"comp";
  [MEMORY[0x189607968] numberWithLongLong:a3 == 1];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = @"ccat";
  [MEMORY[0x189607968] numberWithLongLong:a4];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 dictionaryWithDictionary:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    [v16 setObject:v10 forKeyedSubscript:@"reqs"];
  }
  if (CESerializeCFDictionaryWithOptions() == *MEMORY[0x1896135D8])
  {
    [a1 withData:0 withError:a6];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a6)
  {
    [MEMORY[0x189607870] errorWithDomain:@"LWCRError" code:2 userInfo:0];
    v17 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

@end