@interface LSMIResultRegistrantTrueDatabaseContext
- (BOOL)fullBundleExistsForIdentifier:(id)a3 matchingNode:(id)a4;
- (LSMIResultRegistrantTrueDatabaseContext)initWithDatabase:(id)a3;
- (id).cxx_construct;
- (id)findContainerizedRecordForBundleUnit:(unsigned int)a3 error:(id *)a4;
- (id)unregisterApplicationWithBundleIdentifier:(id)a3 type:(unsigned int)a4 error:(id *)a5;
- (unsigned)findOrRegisterContainerizedNodeReinitializingContext:(id)a3 installDictionary:(id)a4 personasWithAttributes:(id)a5 error:(id *)a6;
@end

@implementation LSMIResultRegistrantTrueDatabaseContext

- (LSMIResultRegistrantTrueDatabaseContext)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSMIResultRegistrantTrueDatabaseContext;
  v6 = -[LSMIResultRegistrantTrueDatabaseContext init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context.db, a3);
  }

  return v7;
}

- (BOOL)fullBundleExistsForIdentifier:(id)a3 matchingNode:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  unsigned int v11 = 0;
  p_context = &self->_context;
  memset(v12, 0, sizeof(v12));
  if (_LSBundleFindWithInfoAndNo_IOFilter(p_context, 0LL, a3, 0, v12, 2, 128, 0LL, 0LL, &v11, 0LL, 0LL))
  {
    if (v6)
    {
      id v10 = 0LL;
      else {
        char v8 = [v10 isEqual:v6];
      }
    }

    else
    {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unsigned)findOrRegisterContainerizedNodeReinitializingContext:(id)a3 installDictionary:(id)a4 personasWithAttributes:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  unsigned int v11 = (FSNode *)a4;
  id v12 = a5;
  unsigned int v20 = 0;
  uint64_t v13 = (void *)-[FSNode mutableCopy](v11, "mutableCopy");
  v14 = v13;
  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:@"LSPersonaUniqueStrings"];
  }
  int v15 = _LSFindOrRegisterBundleNode(&self->_context, v10, 0LL, 0x2000001u, v11, &v20, 0LL);
  if (v15)
  {
    uint64_t v21 = *MEMORY[0x189607490];
    v22[0] = @"could not register full bundle unit while registering parallel placeholder";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v15,  (uint64_t)"-[LSMIResultRegistrantTrueDatabaseContext findOrRegisterContainerizedNodeReinitializingContext:installDic tionary:personasWithAttributes:error:]",  546LL,  v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = 0LL;
  }

  unsigned int v18 = v20;
  if (a6 && !v20)
  {
    *a6 = v17;
    unsigned int v18 = v20;
  }

  return v18;
}

- (id)findContainerizedRecordForBundleUnit:(unsigned int)a3 error:(id *)a4
{
  return  -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  &self->_context,  *(void *)&a3,  0LL,  a4);
}

- (id)unregisterApplicationWithBundleIdentifier:(id)a3 type:(unsigned int)a4 error:(id *)a5
{
  char v6 = a4;
  id v12 = a3;
  int v21 = 0;
  if ((v6 & 4) != 0) {
    unsigned int v13 = v6 & 2 | 5;
  }
  else {
    unsigned int v13 = v6 & 3;
  }
  int v14 = _LSUnregisterAppWithBundleID(&self->_context, v12, v13, &v21, v8, v9, v10, v11);
  if (v14)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v14,  (uint64_t)"-[LSMIResultRegistrantTrueDatabaseContext unregisterApplicationWithBundleIdentifier:type:error:]",  611LL,  0LL);
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
  }

  else
  {
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __96__LSMIResultRegistrantTrueDatabaseContext_unregisterApplicationWithBundleIdentifier_type_error___block_invoke;
    v19[3] = &__block_descriptor_36_e8_v16__0_8l;
    int v20 = v21;
    v16 = (void *)[v19 copy];
    int v15 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
  }

  if (!v16) {
    *a5 = v15;
  }
LABEL_10:
  v17 = (void *)MEMORY[0x186E2A7B8](v16);

  return v17;
}

void __96__LSMIResultRegistrantTrueDatabaseContext_unregisterApplicationWithBundleIdentifier_type_error___block_invoke( uint64_t a1,  void *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer]) {
    goto LABEL_11;
  }
  id v4 = v3;
  [v4 applicationType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"System"];

  if (v6)
  {
    int v7 = *(_DWORD *)(a1 + 32);
    if ((v7 - 8) < 2)
    {
      [v4 bundleIdentifier];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSNoteSystemAppInstallOrUninstall((uint64_t)v8, 0);
LABEL_7:

      goto LABEL_8;
    }

    if (v7 == 10)
    {
      [v4 bundleIdentifier];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSNoteSystemAppInstallOrUninstall((uint64_t)v8, 1u);
      goto LABEL_7;
    }
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end