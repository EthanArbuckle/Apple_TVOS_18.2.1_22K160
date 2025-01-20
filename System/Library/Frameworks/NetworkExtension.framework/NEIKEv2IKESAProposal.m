@interface NEIKEv2IKESAProposal
+ (os_log_s)chooseSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:;
- (NEIKEv2IKESAProposal)init;
- (NSArray)eapProtocols;
- (NSArray)encryptionProtocols;
- (NSArray)integrityProtocols;
- (NSArray)kemProtocols;
- (NSArray)prfProtocols;
- (NSDictionary)additionalKEMProtocols;
- (char)softLifetimeSecondsForInitiator:(char *)result;
- (id)chosenAdditionalKEMProtocols;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)encryptionProtocol;
- (id)integrityProtocol;
- (id)kemProtocol;
- (id)prfProtocol;
- (os_log_s)copyFromRemote:(int)a3 preferRemoteProposal:;
- (uint64_t)hasEAPMethods;
- (uint64_t)isAValidResponse;
- (unint64_t)lifetimeSeconds;
- (void)matchesLocalProposal:(int)a3 preferRemoteProposal:;
- (void)setAdditionalKEMProtocols:(id)a3;
- (void)setChosenAdditionalKEMProtocols:(void *)a1;
- (void)setEapProtocols:(id)a3;
- (void)setEncryptionProtocols:(id)a3;
- (void)setIntegrityProtocols:(id)a3;
- (void)setKemProtocols:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setPrfProtocols:(id)a3;
@end

@implementation NEIKEv2IKESAProposal

- (NEIKEv2IKESAProposal)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2IKESAProposal;
  v2 = -[NEIKEv2IKESAProposal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  objc_super v8 = v7;
  if (self)
  {
    [v7 appendPrettyInt:self->_proposalNumber withName:@"Number" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v9, 88LL, 1);
  }

  else
  {
    [v7 appendPrettyInt:0 withName:@"Number" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v8 appendPrettyObject:Property withName:@"Chosen Encryption" andIndent:v5 options:a4];
  v11 = -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
  [v8 appendPrettyObject:v11 withName:@"Encryption" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v8,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v12, 96, 1),  @"Chosen Integrity",  v5,  a4);
    v13 = -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
    [v8 appendPrettyObject:v13 withName:@"Integrity" andIndent:v5 options:a4];

    id v15 = objc_getProperty(self, v14, 104LL, 1);
  }

  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen Integrity" andIndent:v5 options:a4];
    [0 integrityProtocols];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendPrettyObject:v26 withName:@"Integrity" andIndent:v5 options:a4];

    id v15 = 0LL;
  }

  [v8 appendPrettyObject:v15 withName:@"Chosen PRF" andIndent:v5 options:a4];
  v16 = -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
  [v8 appendPrettyObject:v16 withName:@"PRF" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v8,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v17, 112, 1),  @"Chosen KE",  v5,  a4);
    v18 = -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
    [v8 appendPrettyObject:v18 withName:@"KE" andIndent:v5 options:a4];
    v19 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    [v8 appendPrettyObject:v19 withName:@"Chosen ADDKE" andIndent:v5 options:a4];
    v20 = -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    [v8 appendPrettyObject:v20 withName:@"ADDKE" andIndent:v5 options:a4];

    id v22 = objc_getProperty(self, v21, 80LL, 1);
  }

  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen KE" andIndent:v5 options:a4];
    [0 kemProtocols];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendPrettyObject:v27 withName:@"KE" andIndent:v5 options:a4];
    v28 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](0LL);
    [v8 appendPrettyObject:v28 withName:@"Chosen ADDKE" andIndent:v5 options:a4];

    [0 additionalKEMProtocols];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendPrettyObject:v29 withName:@"ADDKE" andIndent:v5 options:a4];

    id v22 = 0LL;
  }

  [v8 appendPrettyObject:v22 withName:@"Unsupported Transform Types" andIndent:v5 options:a4];
  v23 = -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
  [v8 appendPrettyObject:v23 withName:@"EAP" andIndent:v5 options:a4];

  if (-[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds")) {
    objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  (int)-[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"),  @"Lifetime",  v5,  a4);
  }
  if (self) {
    authenticationProtocol = self->_authenticationProtocol;
  }
  else {
    authenticationProtocol = 0LL;
  }
  [v8 appendPrettyObject:authenticationProtocol withName:@"Authentication" andIndent:v5 options:a4];
  return v8;
}

- (id)description
{
  return -[NEIKEv2IKESAProposal descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    v7 = -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
    objc_super v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setEncryptionProtocols:v8];
  }

  -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x189603F18]);
    v11 = -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
    v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setIntegrityProtocols:v12];
  }
  v13 = -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x189603F18]);
    -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setPrfProtocols:v16];
  }
  v17 = -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x189603F18]);
    v19 = -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
    v20 = (void *)[v18 initWithArray:v19 copyItems:1];
    [v4 setKemProtocols:v20];
  }

  if (self
    && (-[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols"),
        SEL v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    v69 = v4;
    id v22 = objc_alloc(MEMORY[0x189603FC8]);
    v23 = -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    v24 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v72;
      do
      {
        for (uint64_t i = 0LL; i != v26; ++i)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          id v30 = objc_alloc(MEMORY[0x189603F18]);
          -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
          v31 = self;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 objectForKeyedSubscript:v29];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)[v30 initWithArray:v33 copyItems:1];
          [v24 setObject:v34 forKeyedSubscript:v29];

          self = v31;
        }

        uint64_t v26 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      }

      while (v26);
    }

    v35 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v24];
    v4 = v69;
  }

  else
  {
    v35 = 0LL;
  }

  objc_msgSend(v4, "setAdditionalKEMProtocols:", v35, v69);
  v36 = -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
  if (v36)
  {
    id v38 = objc_alloc(MEMORY[0x189603F18]);
    v39 = -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
    v40 = (void *)[v38 initWithArray:v39 copyItems:1];
    [v4 setEapProtocols:v40];
  }

  if (self)
  {
    if (objc_getProperty(self, v37, 80LL, 1))
    {
      id v41 = objc_alloc(MEMORY[0x189604010]);
      v44 = (void *)objc_msgSend(v41, "initWithSet:", objc_getProperty(self, v42, 80, 1));
      if (v4) {
        objc_setProperty_atomic(v4, v43, v44, 80LL);
      }
    }

    objc_msgSend(v4, "setLifetimeSeconds:", -[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"));
    unsigned __int8 proposalNumber = self->_proposalNumber;
    if (v4) {
      goto LABEL_28;
    }
  }

  else
  {
    objc_msgSend(v4, "setLifetimeSeconds:", objc_msgSend(0, "lifetimeSeconds"));
    unsigned __int8 proposalNumber = 0;
    if (v4) {
LABEL_28:
    }
      v4[8] = proposalNumber;
  }

  if (self) {
    id Property = objc_getProperty(self, v45, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v49 = (void *)[Property copy];
  if (v4) {
    objc_setProperty_atomic(v4, v48, v49, 88LL);
  }

  if (self) {
    id v51 = objc_getProperty(self, v50, 96LL, 1);
  }
  else {
    id v51 = 0LL;
  }
  v53 = (void *)[v51 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v52, v53, 96LL);
  }

  if (self) {
    id v55 = objc_getProperty(self, v54, 104LL, 1);
  }
  else {
    id v55 = 0LL;
  }
  v57 = (void *)[v55 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v56, v57, 104LL);
  }

  if (self) {
    id v59 = objc_getProperty(self, v58, 112LL, 1);
  }
  else {
    id v59 = 0LL;
  }
  v61 = (void *)[v59 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v60, v61, 112LL);
  }
  v62 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  if (v62)
  {
    id v63 = objc_alloc(MEMORY[0x189603F68]);
    v64 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v65 = (void *)[v63 initWithDictionary:v64 copyItems:1];
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v4, v65);
  }

  if (self) {
    authenticationProtocol = self->_authenticationProtocol;
  }
  else {
    authenticationProtocol = 0LL;
  }
  v67 = (void *)-[NEIKEv2AuthenticationProtocol copy](authenticationProtocol, "copy");
  -[NEConfigurationManager setAppGroupMap:]((uint64_t)v4, v67);

  return v4;
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIntegrityProtocols:(id)a3
{
}

- (NSArray)prfProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPrfProtocols:(id)a3
{
}

- (NSArray)kemProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setKemProtocols:(id)a3
{
}

- (NSDictionary)additionalKEMProtocols
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAdditionalKEMProtocols:(id)a3
{
}

- (NSArray)eapProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEapProtocols:(id)a3
{
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (void).cxx_destruct
{
}

- (id)chosenAdditionalKEMProtocols
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    id v2 = v1[2];
    objc_sync_exit(v1);
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

- (void)setChosenAdditionalKEMProtocols:(void *)a1
{
  id v2 = a2;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    if ([v4 count])
    {
      id v18 = v2;
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            [v7 objectForKeyedSubscript:v12];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = [v13 method];

            if (v14) {
              [v6 addObject:v12];
            }
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v9);
      }

      if ([v6 count])
      {
        uint64_t v15 = [v6 sortedArrayUsingSelector:sel_compare_];
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      id v2 = v18;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    v16 = a1;
    objc_sync_enter(v16);
    objc_storeStrong(v16 + 2, v2);
    id v17 = v16[15];
    v16[15] = (id)v15;

    objc_sync_exit(v16);
  }
}

- (id)encryptionProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 88LL, 1))
    {
      id v2 = objc_getProperty(v2, v3, 88LL, 1);
    }

    else
    {
      [v2 encryptionProtocols];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 firstObject];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (id)integrityProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 96LL, 1))
    {
      id v2 = objc_getProperty(v2, v3, 96LL, 1);
    }

    else
    {
      [v2 integrityProtocols];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 firstObject];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (id)prfProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 104LL, 1))
    {
      id v2 = objc_getProperty(v2, v3, 104LL, 1);
    }

    else
    {
      [v2 prfProtocols];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 firstObject];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (id)kemProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 112LL, 1))
    {
      id v2 = objc_getProperty(v2, v3, 112LL, 1);
    }

    else
    {
      [v2 kemProtocols];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 firstObject];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (uint64_t)hasEAPMethods
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  objc_msgSend(a1, "eapProtocols", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) method])
        {
          uint64_t v2 = 1LL;
          goto LABEL_12;
        }
      }

      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

- (os_log_s)copyFromRemote:(int)a3 preferRemoteProposal:
{
  uint64_t v188 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a2;
  __int128 v6 = v5;
  if (!a1)
  {
    v126 = 0LL;
    goto LABEL_159;
  }

  if (!v5)
  {
    ne_log_obj();
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v187 = "-[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:]";
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }

    v126 = 0LL;
    goto LABEL_158;
  }

  __int128 v7 = (os_log_s *)[a1 copy];
  __int128 v8 = v7;
  if (!v6[8])
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_156;
    }
    *(_WORD *)buf = 0;
    id v18 = "Remote proposal has invalid proposal number 0";
LABEL_106:
    _os_log_error_impl(&dword_1876B1000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_156;
  }

  if (v7) {
    *((_BYTE *)v7 + 8) = v6[8];
  }
  if (a3)
  {
    __int128 v174 = 0uLL;
    __int128 v175 = 0uLL;
    __int128 v172 = 0uLL;
    __int128 v173 = 0uLL;
    [v6 encryptionProtocols];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v172 objects:v185 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v173;
LABEL_9:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v173 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v172 + 1) + 8 * v13);
        -[os_log_s encryptionProtocols](v8, "encryptionProtocols");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 indexOfObject:v14];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v172 objects:v185 count:16];
          if (v11) {
            goto LABEL_9;
          }
          goto LABEL_26;
        }
      }
      v28 = -[os_log_s encryptionProtocols](v8, "encryptionProtocols");
      [v28 objectAtIndexedSubscript:v16];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v29;
      if (!v8)
      {

        goto LABEL_176;
      }

      objc_setProperty_atomic(v8, v30, v29, 88LL);

      v33 = objc_getProperty(v8, v32, 88LL, 1);
      if (!v33 || (unint64_t v34 = v33[2], v34 > 0x1F) || ((1LL << v34) & 0xD01C0000LL) == 0)
      {
LABEL_177:
        char v27 = 0;
        goto LABEL_39;
      }

- (void)matchesLocalProposal:(int)a3 preferRemoteProposal:
{
  uint64_t v153 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  __int128 v6 = v5;
  if (!a1) {
    goto LABEL_30;
  }
  if (!v5)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal";
    goto LABEL_27;
  }

  [a1 encryptionProtocols];
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    uint64_t v15 = "BACKTRACE %s called with null self.encryptionProtocols";
LABEL_23:
    uint64_t v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_24;
  }

  [v6 encryptionProtocols];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.encryptionProtocols";
LABEL_27:
    _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_28;
  }

  [a1 prfProtocols];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    uint64_t v15 = "BACKTRACE %s called with null self.prfProtocols";
    goto LABEL_23;
  }

  [v6 prfProtocols];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.prfProtocols";
    goto LABEL_27;
  }

  [a1 kemProtocols];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    uint64_t v15 = "BACKTRACE %s called with null self.kemProtocols";
    goto LABEL_23;
  }

  [v6 kemProtocols];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.kemProtocols";
    goto LABEL_27;
  }

  if (objc_getProperty(a1, v13, 80LL, 1))
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v15 = "Not matching proposal with unsupported transform type";
LABEL_12:
      uint64_t v16 = v14;
      uint32_t v17 = 2;
LABEL_24:
      _os_log_error_impl(&dword_1876B1000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }

- (char)softLifetimeSecondsForInitiator:(char *)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = [result lifetimeSeconds];
    uint64_t v5 = [v3 lifetimeSeconds];
    unint64_t v6 = v5;
    if (v4 < 0xB)
    {
      result = (char *)[v3 lifetimeSeconds];
      uint64_t v8 = -2LL;
      if (!a2) {
        uint64_t v8 = -1LL;
      }
      __int128 v9 = &result[v8];
      if (v6 >= 2) {
        return v9;
      }
    }

    else
    {
      uint64_t v7 = 8LL;
      if (!a2) {
        uint64_t v7 = 9LL;
      }
      return (char *)(v5 * v7 / 0xAuLL);
    }
  }

  return result;
}

- (uint64_t)isAValidResponse
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (objc_getProperty(a1, a2, 80LL, 1)) {
    return 0LL;
  }
  if (!a1[8]) {
    return 0LL;
  }
  [a1 kemProtocols];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (v6 != 1) {
    return 0LL;
  }
  [a1 prfProtocols];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  if (v8 != 1) {
    return 0LL;
  }
  [a1 encryptionProtocols];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  if (v10 != 1) {
    return 0LL;
  }
  [a1 encryptionProtocols];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 firstObject];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_11;
  }

  unint64_t v13 = v12[2] - 29LL;

  if (v13 < 3) {
    return 0LL;
  }
LABEL_11:
  [a1 encryptionProtocols];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 firstObject];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (unint64_t v16 = v15[2] - 18LL, v16 <= 0xD)) {
    uint64_t v17 = qword_187873120[v16];
  }
  else {
    uint64_t v17 = 1LL;
  }

  [a1 integrityProtocols];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 count];

  if (v19 != v17) {
    return 0LL;
  }
  [a1 additionalKEMProtocols];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20) {
    return 1LL;
  }
  [a1 additionalKEMProtocols];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v21, "count") + 1);
  [a1 kemProtocols];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 firstObject];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 addObject:v24];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(v25, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v30 count] != 1) {
          goto LABEL_32;
        }
        [v30 firstObject];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v22 containsObject:v31])
        {

LABEL_32:
          uint64_t v3 = 0LL;
          goto LABEL_33;
        }

        if ([v31 method]) {
          [v22 addObject:v31];
        }
      }

      uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v3 = 1LL;
      if (v27) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

+ (os_log_s)chooseSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_opt_self();
  uint64_t v26 = v6;
  if (!v6)
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
LABEL_29:
      __int128 v9 = 0LL;
      goto LABEL_25;
    }

    *(_DWORD *)buf = 136315138;
    uint64_t v40 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    id v25 = "%s called with null localProposals";
LABEL_31:
    _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_29;
  }

  if (!v7)
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v40 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    id v25 = "%s called with null remoteProposals";
    goto LABEL_31;
  }

  if (a4)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v8 = (os_log_s *)v7;
    __int128 v9 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v34;
      uint64_t v11 = MEMORY[0x1895F87A8];
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (os_log_s *)((char *)i + 1))
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v32[0] = v11;
          v32[1] = 3221225472LL;
          v32[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke;
          v32[3] = &unk_18A08C8F0;
          v32[4] = v13;
          uint64_t v14 = objc_msgSend(v26, "indexOfObjectPassingTest:", v32, v26);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v26 objectAtIndexedSubscript:v14];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v21 = v20;
            uint64_t v22 = v13;
            int v23 = 1;
            goto LABEL_24;
          }
        }

        __int128 v9 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v8 = (os_log_s *)v6;
    __int128 v9 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v28,  v37,  16LL);
    if (v9)
    {
      uint64_t v15 = *(void *)v29;
      uint64_t v16 = MEMORY[0x1895F87A8];
      while (2)
      {
        for (uint64_t j = 0LL; j != v9; uint64_t j = (os_log_s *)((char *)j + 1))
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v8);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
          v27[0] = v16;
          v27[1] = 3221225472LL;
          v27[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2;
          v27[3] = &unk_18A08C8F0;
          v27[4] = v18;
          uint64_t v19 = objc_msgSend(v7, "indexOfObjectPassingTest:", v27, v26);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v7 objectAtIndexedSubscript:v19];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = v18;
            uint64_t v22 = v21;
            int v23 = 0;
LABEL_24:
            __int128 v9 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v20, v22, v23);

            goto LABEL_25;
          }
        }

        __int128 v9 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v28,  v37,  16LL);
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke( uint64_t a1,  void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](*(void **)(a1 + 32), a2, 1);
}

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2( uint64_t a1,  void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](a2, *(void **)(a1 + 32), 0);
}

@end