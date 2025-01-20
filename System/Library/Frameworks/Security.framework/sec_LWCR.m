@interface sec_LWCR
+ (id)withData:(id)a3 withError:(id *)a4;
- (BOOL)hasRequirements;
- (NSDictionary)dictionary;
- (id).cxx_construct;
- (int64_t)constraintCategory;
- (int64_t)version;
- (sec_LWCR)init;
- (void)dealloc;
@end

@implementation sec_LWCR

- (sec_LWCR)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___sec_LWCR;
  v2 = -[sec_LWCR init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    backingStorage = v2->backingStorage;
    v2->backingStorage = 0LL;

    v3->backingContext = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  if (self->backingContext) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___sec_LWCR;
  -[sec_LWCR dealloc](&v3, sel_dealloc);
}

- (int64_t)version
{
  return self->lwcr._version;
}

- (int64_t)constraintCategory
{
  return self->lwcr._constraintCat;
}

- (BOOL)hasRequirements
{
  return der_vm_context_is_valid();
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 112LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 104) = 0;
  *((_BYTE *)self + 81) = 0;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

+ (id)withData:(id)a3 withError:(id *)a4
{
  v27[2] = *MEMORY[0x1895F89C0];
  objc_super v6 = (const __CFData *)a3;
  *(void *)&__int128 v23 = 0LL;
  CFDataGetBytePtr(v6);
  CFDataGetLength(v6);
  uint64_t v7 = CEValidateWithOptions();
  v8 = (uint64_t *)MEMORY[0x1896135D8];
  uint64_t v9 = *MEMORY[0x1896135D8];
  if (v7 == *MEMORY[0x1896135D8])
  {
    uint64_t v7 = CEAcquireManagedContext();
    uint64_t v9 = *v8;
  }

  if (v7 == v9)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___sec_LWCR);
    objc_storeStrong((id *)&v11->backingStorage, a3);
    v11->backingContext = 0LL;
    uint64_t v12 = MEMORY[0];
    if (der_vm_select_int_for_key() && (der_vm_select_int_for_key() & 1) != 0)
    {
      if (v11->lwcr._compatVersion <= 1)
      {
        p_constraintCat = &v11->lwcr._constraintCat;
        if (der_vm_select_int_for_key() && *p_constraintCat < 0)
        {
          v13 = "LWCRs constraint category cannot be less that zero";
          uint64_t v14 = 7LL;
          uint64_t v15 = 50LL;
        }

        else
        {
          der_vm_execute_nocopy();
          if (der_vm_context_is_valid() && der_vm_CEType_from_context() != 1)
          {
            v13 = "LWCRs 'requirements' field is not a dictionary";
            uint64_t v15 = 46LL;
          }

          else
          {
            if (*p_constraintCat || der_vm_context_is_valid())
            {
              if (der_vm_context_is_valid())
              {
                CEConjureContextFromDER();
                *(_OWORD *)&v11->lwcr.ctx.der_context.runtime = 0uLL;
                *(_OWORD *)&v11->lwcr.ctx.der_context.lookup.index_count = v23;
                *(_OWORD *)&v11->lwcr.ctx.der_context.sorted = v24;
                *(_OWORD *)&v11->lwcr.ctx.der_context.var0.state.der_end = v25;
              }

              v10 = v11;
              v11 = 0LL;
              goto LABEL_16;
            }

            v13 = "LWCRs do not specify a constraint category or explicit requirements";
            uint64_t v15 = 67LL;
          }

          uint64_t v14 = 7LL;
        }
      }

      else
      {
        v13 = "This LWCR is not compatible with this runtime";
        uint64_t v14 = 6LL;
        uint64_t v15 = 45LL;
      }
    }

    else
    {
      v16 = *(void (**)(uint64_t, const char *, ...))(v12 + 24);
      if (v16) {
        v16(v12, "[%s]: %s\n", "loadFromCE", "LWCR: invalid version / compatible version fields");
      }
      v13 = "LWCRs are not encoded correctly";
      uint64_t v14 = 7LL;
      uint64_t v15 = 31LL;
    }

    if (a4)
    {
      v17 = (void *)MEMORY[0x189607870];
      v26[0] = *MEMORY[0x189607798];
      [MEMORY[0x189607968] numberWithInt:v14];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v18;
      v26[1] = *MEMORY[0x189607490];
      v19 = (void *)[objc_alloc(NSString) initWithBytes:v13 length:v15 encoding:4];
      v27[1] = v19;
      [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:@"LWCRError" code:1 userInfo:v20];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v10 = 0LL;
LABEL_16:

    goto LABEL_18;
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"LWCRError" code:2 userInfo:0];
    v10 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = 0LL;
  }

@end