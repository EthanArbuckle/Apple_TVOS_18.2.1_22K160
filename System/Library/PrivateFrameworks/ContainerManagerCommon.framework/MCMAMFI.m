@interface MCMAMFI
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:(id)a3 teamID:(id)a4;
- (Class)lwcrClass;
- (MCMAMFI)initWithAuditToken:(id *)a3;
- (id)_encodeRequirement:(id)a3 name:(id)a4;
- (id)_encodedQueriesWithContainerConfig:(id)a3 teamID:(id)a4;
- (id)_requirementForProfileValidatedEntitlements;
- (id)_requirementForTeamID:(id)a3;
- (id)_requirementForValidationCategory:(id)a3;
- (id)_requirementForiOSPlatform;
- (void)setLWCRClass:(Class)a3;
@end

@implementation MCMAMFI

- (MCMAMFI)initWithAuditToken:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMAMFI;
  v4 = -[MCMAMFI init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    __int128 v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    v4->_lwcrClass = (Class)objc_opt_class();
  }

  return v5;
}

- (BOOL)signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:(id)a3 teamID:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[MCMAMFI auditToken](self, "auditToken");
  int pid = container_audit_token_get_pid();
  objc_super v8 = (void *)MEMORY[0x1895CE3A8]();
  if (-[MCMAMFI lwcrClass](self, "lwcrClass"))
  {
    -[MCMAMFI _encodedQueriesWithContainerConfig:teamID:](self, "_encodedQueriesWithContainerConfig:teamID:", v6, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      context = v8;
      id v26 = v7;
      id v27 = v6;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            bzero(v39, 0x404uLL);
            -[MCMAMFI auditToken](self, "auditToken");
            id v16 = [v15 encodedQuery];
            [v16 bytes];
            [v15 encodedQuery];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 length];
            int v18 = amfi_launch_constraint_matches_process();

            container_log_handle_for_category();
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              if (v18) {
                v20 = "passed";
              }
              else {
                v20 = "insufficient for";
              }
              [v15 loggingName];
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v30 = v20;
              __int16 v31 = 2112;
              v32 = v21;
              __int16 v33 = 1024;
              int v34 = pid;
              __int16 v35 = 1024;
              int v36 = *(_DWORD *)v39;
              __int16 v37 = 2080;
              v38 = &v40;
              _os_log_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEFAULT,  "Signature %s strict scrutiny; test = %@, int pid = %d, error = (%d) %s",
                buf,
                0x2Cu);
            }

            if ((v18 & 1) != 0)
            {

              objc_autoreleasePoolPop(context);
              BOOL v23 = 1;
              id v7 = v26;
              id v6 = v27;
              goto LABEL_21;
            }
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v7 = v26;
      id v6 = v27;
      objc_super v8 = context;
    }
  }

  objc_autoreleasePoolPop(v8);
  container_log_handle_for_category();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v39 = 67109120;
    int v40 = pid;
    _os_log_impl( &dword_188846000,  v22,  OS_LOG_TYPE_DEFAULT,  "Requestor's signature did not pass strict scrutiny; int pid = %d",
      v39,
      8u);
  }

  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (id)_requirementForTeamID:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  id v9 = a3;
  id v10 = @"$optional";
  objc_super v8 = @"team-identifier";
  v3 = (void *)MEMORY[0x189603F68];
  id v4 = a3;
  [v3 dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_requirementForValidationCategory:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v7 = @"validation-category";
  v8[0] = a3;
  v3 = (void *)MEMORY[0x189603F68];
  id v4 = a3;
  [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_requirementForiOSPlatform
{
  return &unk_18A2BD360;
}

- (id)_requirementForProfileValidatedEntitlements
{
  return &unk_18A2BD3B0;
}

- (id)_encodeRequirement:(id)a3 name:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0LL;
  -[objc_class withVersion:withConstraintCategory:withRequirements:withError:]( -[MCMAMFI lwcrClass](self, "lwcrClass"),  "withVersion:withConstraintCategory:withRequirements:withError:",  1LL,  0LL,  v6,  &v15);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v15;
  if (v8)
  {
    [v8 externalRepresentation];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[MCMAMFIEncodedQuery initWithLoggingName:encodedQuery:]( objc_alloc(&OBJC_CLASS___MCMAMFIEncodedQuery),  "initWithLoggingName:encodedQuery:",  v7,  v10);
  }

  else
  {
    container_log_handle_for_category();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Could not construct LWCR for requirement %@; error = %@",
        buf,
        0x16u);
    }

    id v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v13 = v11;

  return v13;
}

- (id)_encodedQueriesWithContainerConfig:(id)a3 teamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FA8] array];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 honorGroupContainerEntitlementForAppStoreSigned])
  {
    -[MCMAMFI _requirementForValidationCategory:](self, "_requirementForValidationCategory:", &unk_18A2BD480);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"MAS");
    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v11 = (void *)v10;
    [v8 addObject:v10];
  }

  if ([v6 honorGroupContainerEntitlementForPlatformBinary])
  {
    -[MCMAMFI _requirementForValidationCategory:](self, "_requirementForValidationCategory:", &unk_18A2BD498);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"platform binary");
    if (!v12) {
      goto LABEL_23;
    }
    uint64_t v13 = (void *)v12;
    [v8 addObject:v12];
  }

  if ([v6 honorGroupContainerEntitlementForProfileValidatedEntitlements])
  {
    -[MCMAMFI _requirementForProfileValidatedEntitlements](self, "_requirementForProfileValidatedEntitlements");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"profile validated entitlements");
    if (!v14) {
      goto LABEL_23;
    }
    id v15 = (void *)v14;
    [v8 addObject:v14];
  }

  if ([v6 honorGroupContainerEntitlementForMatchingTeamIDPrefix])
  {
    -[MCMAMFI _requirementForTeamID:](self, "_requirementForTeamID:", v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v16 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"team ID prefix");
      if (!v16) {
        goto LABEL_23;
      }
      id v17 = (void *)v16;
      [v8 addObject:v16];
    }
  }

  if ([v6 honorGroupContainerEntitlementForiPadAppsOnMac])
  {
    -[MCMAMFI _requirementForiOSPlatform](self, "_requirementForiOSPlatform");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"iPad app");
    if (!v18) {
      goto LABEL_23;
    }
    id v19 = (void *)v18;
    [v8 addObject:v18];
  }

  -[MCMAMFI _requirementForValidationCategory:](self, "_requirementForValidationCategory:", &unk_18A2BD450);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, @"TestFlight");
  if (!v20)
  {
LABEL_23:

    objc_super v8 = v9;
LABEL_24:

    objc_super v8 = 0LL;
    goto LABEL_25;
  }

  v21 = (void *)v20;
  [v8 addObject:v20];

LABEL_21:
  if (![v8 count]) {
    goto LABEL_24;
  }
LABEL_25:

  return v8;
}

- (Class)lwcrClass
{
  return self->_lwcrClass;
}

- (void)setLWCRClass:(Class)a3
{
  self->_lwcrClass = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

@end