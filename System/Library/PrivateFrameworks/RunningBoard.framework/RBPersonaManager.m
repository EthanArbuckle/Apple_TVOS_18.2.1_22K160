@interface RBPersonaManager
- (BOOL)isConcretePersona:(id)a3;
- (BOOL)personaForIdentity:(id)a3 context:(id)a4 personaUID:(unsigned int *)a5 personaUniqueString:(id *)a6;
- (BOOL)personaRequiredForExtensionContext:(id)a3 serviceDict:(id)a4;
- (BOOL)personasAreSupported;
- (RBPersonaManager)init;
- (id)personalPersonaUniqueString;
@end

@implementation RBPersonaManager

- (RBPersonaManager)init
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RBPersonaManager;
  v2 = -[RBPersonaManager init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_personasSupported = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    personalPersonaUniqueString = v2->_personalPersonaUniqueString;
    v2->_personalPersonaUniqueString = 0LL;

    if (objc_opt_class())
    {
      [MEMORY[0x189612BD0] personaAttributesForPersonaType:3];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189612BD0] personaAttributesForPersonaType:0];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5) {
        BOOL v8 = v6 == 0LL;
      }
      else {
        BOOL v8 = 1;
      }
      char v9 = !v8;
      v3->_personasSupported = v9;
      if (!v8)
      {
        v3->_personalPersonaUID = objc_msgSend(v6, "userPersona_id");
        uint64_t v10 = [v7 userPersonaUniqueString];
        v11 = v3->_personalPersonaUniqueString;
        v3->_personalPersonaUniqueString = (NSString *)v10;
      }

      [MEMORY[0x189612BC0] sharedManager];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 isSharedIPad];

      if (v13) {
        v14 = "YES";
      }
      else {
        v14 = "NO";
      }
    }

    else
    {
      v14 = "NO";
    }

    rbs_job_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_personasSupported) {
        v16 = "YES";
      }
      else {
        v16 = "NO";
      }
      *(_DWORD *)buf = 136315394;
      v20 = v16;
      __int16 v21 = 2080;
      v22 = v14;
      _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "Personas are supported: %s; isSharedIPad: %s",
        buf,
        0x16u);
    }
  }

  return v3;
}

- (BOOL)personaForIdentity:(id)a3 context:(id)a4 personaUID:(unsigned int *)a5 personaUniqueString:(id *)a6
{
  v34[2] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  if (!-[RBPersonaManager personasAreSupported](self, "personasAreSupported"))
  {
    BOOL v21 = 0;
    goto LABEL_24;
  }

  v28 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  v34[0] = [v10 personaString];
  uint64_t v13 = [v11 managedPersona];
  id v14 = 0LL;
  char v15 = 0;
  uint64_t v16 = 0LL;
  v34[1] = v13;
  unsigned int personalPersonaUID = -1;
  do
  {
    objc_super v18 = (void *)v34[v16];
    if (v18)
    {
      *(void *)buf = 1LL;
      [v18 UTF8String];
      kpersona_find();
    }

    char v19 = v15;
    char v15 = 1;
    uint64_t v16 = 1LL;
  }

  while ((v19 & 1) == 0);
  if ([v11 lsPersona])
  {
    uint64_t v33 = 0LL;
    memset(v32, 0, sizeof(v32));
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    memset(&buf[4], 0, 48);
    *(_DWORD *)buf = 2;
    v20 = v28;
    if (!kpersona_info())
    {
      unsigned int personalPersonaUID = *(_DWORD *)&buf[4];
      uint64_t v23 = [NSString stringWithUTF8String:(char *)v32 + 4];

      id v14 = (id)v23;
      if (!v28)
      {
LABEL_16:
        if (a6)
        {
          id v14 = v14;
          *a6 = v14;
        }

        BOOL v21 = 1;
        goto LABEL_19;
      }

- (BOOL)personasAreSupported
{
  return self->_personasSupported;
}

- (id)personalPersonaUniqueString
{
  if (-[RBPersonaManager personasAreSupported](self, "personasAreSupported")) {
    v3 = self->_personalPersonaUniqueString;
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

- (BOOL)isConcretePersona:(id)a3
{
  id v4 = a3;
  if (-[RBPersonaManager personasAreSupported](self, "personasAreSupported"))
  {
    [v4 UTF8String];
    kpersona_find();
  }

  return 0;
}

- (BOOL)personaRequiredForExtensionContext:(id)a3 serviceDict:(id)a4
{
  id v5 = a4;
  [a3 identity];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 personaString];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    xpc_dictionary_get_value(v5, "PersonaEnterprise");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8 == 0LL;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end