@interface NEIKEv2ChildSAProposal
+ (os_log_s)chooseChildSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:(char)a5 checkKEMethod:;
- (BOOL)isEqual:(id)a3;
- (NEIKEv2ChildSAProposal)init;
- (NSArray)encryptionProtocols;
- (NSArray)integrityProtocols;
- (NSArray)kemProtocols;
- (NSDictionary)additionalKEMProtocols;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)encryptionProtocol;
- (id)integrityProtocol;
- (os_log_s)copyFromRemote:(int)a3 preferRemoteProposal:(char)a4 checkKEMethod:;
- (uint64_t)isAValidResponse;
- (uint64_t)matchesLocalProposal:(int)a3 preferRemoteProposal:(int)a4 checkKEMethod:;
- (unint64_t)hash;
- (unint64_t)lifetimeSeconds;
- (unint64_t)protocol;
- (void)copyForRekey;
- (void)copyWithoutKEM;
- (void)setAdditionalKEMProtocols:(id)a3;
- (void)setEncryptionProtocols:(id)a3;
- (void)setIntegrityProtocols:(id)a3;
- (void)setKemProtocols:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setProtocol:(unint64_t)a3;
@end

@implementation NEIKEv2ChildSAProposal

- (NEIKEv2ChildSAProposal)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2ChildSAProposal;
  v2 = -[NEIKEv2ChildSAProposal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2ChildSAProposal setProtocol:](v2, "setProtocol:", 3LL);
    v3->_noESNTransformPresent = 1;
    v4 = v3;
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
    objc_msgSend( v8,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v9, 80, 1),  @"Local SPI",  v5,  a4);
    objc_msgSend( v8,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v10, 88, 1),  @"Remote SPI",  v5,  a4);
    id Property = objc_getProperty(self, v11, 96LL, 1);
  }

  else
  {
    [v7 appendPrettyInt:0 withName:@"Number" andIndent:v5 options:a4];
    [v8 appendPrettyObject:0 withName:@"Local SPI" andIndent:v5 options:a4];
    [v8 appendPrettyObject:0 withName:@"Remote SPI" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v8 appendPrettyObject:Property withName:@"Chosen Encryption" andIndent:v5 options:a4];
  v13 = -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  [v8 appendPrettyObject:v13 withName:@"Encryption" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v8,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v14, 104, 1),  @"Chosen Integrity",  v5,  a4);
    v15 = -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
    [v8 appendPrettyObject:v15 withName:@"Integrity" andIndent:v5 options:a4];

    id v17 = objc_getProperty(self, v16, 112LL, 1);
  }

  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen Integrity" andIndent:v5 options:a4];
    [0 integrityProtocols];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendPrettyObject:v24 withName:@"Integrity" andIndent:v5 options:a4];

    id v17 = 0LL;
  }

  [v8 appendPrettyObject:v17 withName:@"Chosen KE" andIndent:v5 options:a4];
  v18 = -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  [v8 appendPrettyObject:v18 withName:@"KE" andIndent:v5 options:a4];
  v19 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  [v8 appendPrettyObject:v19 withName:@"Chosen ADDKE" andIndent:v5 options:a4];
  v20 = -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  [v8 appendPrettyObject:v20 withName:@"ADDKE" andIndent:v5 options:a4];

  if (self) {
    id v22 = objc_getProperty(self, v21, 72LL, 1);
  }
  else {
    id v22 = 0LL;
  }
  [v8 appendPrettyObject:v22 withName:@"Unsupported Transform Types" andIndent:v5 options:a4];
  if (-[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds")) {
    objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  (int)-[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"),  @"Lifetime",  v5,  a4);
  }
  return v8;
}

- (id)description
{
  return -[NEIKEv2ChildSAProposal descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = -[NEIKEv2ChildSAProposal protocol](self, "protocol");
    if (v6 == [v5 protocol])
    {
      v7 = -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
      uint64_t v8 = [v5 encryptionProtocols];
      if (v7 == (void *)v8)
      {
      }

      else
      {
        SEL v9 = (void *)v8;
        -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
        SEL v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 encryptionProtocols];
        SEL v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_47;
        }
      }

      if (self) {
        id Property = objc_getProperty(self, v13, 96LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v16 = Property;
      id v18 = objc_getProperty(v5, v17, 96LL, 1);
      if (v16 == v18)
      {
      }

      else
      {
        v20 = v18;
        if (self) {
          id v21 = objc_getProperty(self, v19, 96LL, 1);
        }
        else {
          id v21 = 0LL;
        }
        id v22 = v21;
        int v24 = objc_msgSend(v22, "isEqual:", objc_getProperty(v5, v23, 96, 1));

        if (!v24) {
          goto LABEL_47;
        }
      }
      v25 = -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
      uint64_t v26 = [v5 integrityProtocols];
      if (v25 == (void *)v26)
      {
      }

      else
      {
        v27 = (void *)v26;
        v28 = -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
        [v5 integrityProtocols];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        int v30 = [v28 isEqual:v29];

        if (!v30) {
          goto LABEL_47;
        }
      }

      if (self) {
        id v32 = objc_getProperty(self, v31, 104LL, 1);
      }
      else {
        id v32 = 0LL;
      }
      id v33 = v32;
      id v35 = objc_getProperty(v5, v34, 104LL, 1);
      if (v33 == v35)
      {
      }

      else
      {
        v37 = v35;
        if (self) {
          id v38 = objc_getProperty(self, v36, 104LL, 1);
        }
        else {
          id v38 = 0LL;
        }
        id v39 = v38;
        int v41 = objc_msgSend(v39, "isEqual:", objc_getProperty(v5, v40, 104, 1));

        if (!v41) {
          goto LABEL_47;
        }
      }
      v42 = -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
      uint64_t v43 = [v5 kemProtocols];
      if (v42 == (void *)v43)
      {
      }

      else
      {
        v44 = (void *)v43;
        v45 = -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
        [v5 kemProtocols];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        int v47 = [v45 isEqual:v46];

        if (!v47) {
          goto LABEL_47;
        }
      }

      if (self) {
        id v49 = objc_getProperty(self, v48, 112LL, 1);
      }
      else {
        id v49 = 0LL;
      }
      id v50 = v49;
      id v52 = objc_getProperty(v5, v51, 112LL, 1);
      if (v50 == v52)
      {
      }

      else
      {
        v54 = v52;
        if (self) {
          id v55 = objc_getProperty(self, v53, 112LL, 1);
        }
        else {
          id v55 = 0LL;
        }
        id v56 = v55;
        int v58 = objc_msgSend(v56, "isEqual:", objc_getProperty(v5, v57, 112, 1));

        if (!v58) {
          goto LABEL_47;
        }
      }
      v59 = -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
      uint64_t v60 = [v5 additionalKEMProtocols];
      if (v59 == (void *)v60)
      {
      }

      else
      {
        v61 = (void *)v60;
        v62 = -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
        [v5 additionalKEMProtocols];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        int v64 = [v62 isEqual:v63];

        if (!v64) {
          goto LABEL_47;
        }
      }
      v65 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
      uint64_t v66 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
      if (v65 == (void *)v66)
      {
      }

      else
      {
        v67 = (void *)v66;
        v68 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
        v69 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
        int v70 = [v68 isEqual:v69];

        if (!v70) {
          goto LABEL_47;
        }
      }

      unint64_t v72 = -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds");
      BOOL v14 = v72 == [v5 lifetimeSeconds];
      goto LABEL_48;
    }

- (unint64_t)hash
{
  unint64_t v3 = -[NEIKEv2ChildSAProposal protocol](self, "protocol");
  -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 hash];

  if (self) {
    id Property = objc_getProperty(self, v6, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v8 = [Property hash];
  -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 hash];

  if (self) {
    id v12 = objc_getProperty(self, v11, 104LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  uint64_t v13 = [v12 hash];
  -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 hash];

  if (self) {
    id v17 = objc_getProperty(self, v16, 112LL, 1);
  }
  else {
    id v17 = 0LL;
  }
  uint64_t v18 = v5 ^ v3 ^ v8 ^ v10 ^ v13 ^ v15 ^ [v17 hash];
  v19 = -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  uint64_t v20 = [v19 hash];

  -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = v20 ^ [v21 hash];

  return v18 ^ v22 ^ -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProtocol:", -[NEIKEv2ChildSAProposal protocol](self, "protocol"));
  -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v6 = 0x189603000uLL;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x189603F18]);
    -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v9 = (void *)[v7 initWithArray:v8 copyItems:1];
    [v4 setEncryptionProtocols:v9];
  }

  -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x189603F18]);
    -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[v11 initWithArray:v12 copyItems:1];
    [v4 setIntegrityProtocols:v13];
  }

  -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x189603F18]);
    -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = (void *)[v15 initWithArray:v16 copyItems:1];
    [v4 setKemProtocols:v17];
  }

  if (!self)
  {
    [v4 setAdditionalKEMProtocols:0];
    v37 = 0LL;
LABEL_21:

    goto LABEL_22;
  }

  -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    int v64 = v4;
    id v19 = objc_alloc(MEMORY[0x189603FC8]);
    -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v67;
      do
      {
        for (uint64_t i = 0LL; i != v23; ++i)
        {
          if (*(void *)v67 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          unint64_t v27 = v6;
          id v28 = objc_alloc(*(Class *)(v6 + 3864));
          v29 = -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
          [v29 objectForKeyedSubscript:v26];
          int v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)[v28 initWithArray:v30 copyItems:1];
          [v21 setObject:v31 forKeyedSubscript:v26];

          unint64_t v6 = v27;
        }

        uint64_t v23 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
      }

      while (v23);
    }

    id v32 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v21];
    id v4 = v64;
  }

  else
  {
    id v32 = 0LL;
  }

  objc_msgSend(v4, "setAdditionalKEMProtocols:", v32, v64);

  if (objc_getProperty(self, v33, 72LL, 1))
  {
    id v34 = objc_alloc(MEMORY[0x189604010]);
    v37 = (void *)objc_msgSend(v34, "initWithSet:", objc_getProperty(self, v35, 72, 1));
    if (v4) {
      objc_setProperty_atomic(v4, v36, v37, 72LL);
    }
    goto LABEL_21;
  }

- (unint64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIntegrityProtocols:(id)a3
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

- (id)encryptionProtocol
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
    if (objc_getProperty(self, a2, 104LL, 1))
    {
      id v2 = objc_getProperty(v2, v3, 104LL, 1);
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

- (os_log_s)copyFromRemote:(int)a3 preferRemoteProposal:(char)a4 checkKEMethod:
{
  uint64_t v163 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a1)
  {
    v74 = 0LL;
    goto LABEL_165;
  }

  if (!v7)
  {
    ne_log_obj();
    SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v162 = "-[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:]";
      _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }

    goto LABEL_163;
  }

  SEL v9 = (os_log_s *)[a1 copy];
  if (!objc_getProperty(v8, v10, 80LL, 1))
  {
    ne_log_obj();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_162;
    }
    *(_WORD *)buf = 0;
    uint64_t v22 = "Remote proposal has invalid SPI";
LABEL_167:
    _os_log_error_impl(&dword_1876B1000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_162;
  }

  id Property = objc_getProperty(v8, v11, 80LL, 1);
  if (v9)
  {
    objc_setProperty_atomic(v9, v13, Property, 88LL);
    if (v8[8])
    {
      *((_BYTE *)v9 + 8) = v8[8];
      goto LABEL_7;
    }

- (void)copyForRekey
{
  if (!a1) {
    return 0LL;
  }
  v1 = (void *)[a1 copy];
  unint64_t v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0LL, 80LL);
    objc_setProperty_atomic(v3, v4, 0LL, 88LL);
    objc_setProperty_atomic(v3, v5, 0LL, 96LL);
    objc_setProperty_atomic(v3, v6, 0LL, 104LL);
    objc_setProperty_atomic(v3, v7, 0LL, 112LL);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0LL);
  }

  return v3;
}

- (void)copyWithoutKEM
{
  if (!a1) {
    return 0LL;
  }
  v1 = (void *)[a1 copy];
  unint64_t v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0LL, 112LL);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0LL);
  }

  [v3 setKemProtocols:0];
  [v3 setAdditionalKEMProtocols:0];
  return v3;
}

- (uint64_t)matchesLocalProposal:(int)a3 preferRemoteProposal:(int)a4 checkKEMethod:
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a1) {
    goto LABEL_51;
  }
  if (!v7)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    uint64_t v16 = "%s called with null localProposal";
    goto LABEL_12;
  }

  [(id)a1 encryptionProtocols];
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
      uint64_t v13 = "BACKTRACE %s called with null self.encryptionProtocols";
      BOOL v14 = v12;
      uint32_t v15 = 12;
LABEL_17:
      _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_49;
    }

    goto LABEL_49;
  }

  [v8 encryptionProtocols];
  SEL v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    __int128 v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    uint64_t v16 = "%s called with null localProposal.encryptionProtocols";
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v16, buf, 0xCu);
    goto LABEL_49;
  }

  if (objc_getProperty((id)a1, v11, 72LL, 1))
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Not matching proposal with unsupported transform type";
LABEL_16:
      BOOL v14 = v12;
      uint32_t v15 = 2;
      goto LABEL_17;
    }

    goto LABEL_49;
  }

  if ((*(_BYTE *)(a1 + 9) & 1) == 0)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Not matching proposal missing No ESN transform";
      goto LABEL_16;
    }

- (uint64_t)isAValidResponse
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (objc_getProperty(a1, a2, 72LL, 1)) {
    return 0LL;
  }
  if ((a1[9] & 1) == 0) {
    return 0LL;
  }
  if (!a1[8]) {
    return 0LL;
  }
  [a1 kemProtocols];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v3 count];

  if (v4 > 1) {
    return 0LL;
  }
  [a1 encryptionProtocols];
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (v6 != 1) {
    return 0LL;
  }
  [a1 encryptionProtocols];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 firstObject];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (unint64_t v9 = v8[2] - 18LL, v9 <= 0xD)) {
    uint64_t v10 = qword_187873190[v9];
  }
  else {
    uint64_t v10 = 1LL;
  }

  [a1 integrityProtocols];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 count];

  if (v12 != v10) {
    return 0LL;
  }
  [a1 additionalKEMProtocols];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    return 1LL;
  }
  [a1 kemProtocols];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 count];

  if (v15 != 1) {
    return 0LL;
  }
  [a1 additionalKEMProtocols];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v16, "count") + 1);
  [a1 kemProtocols];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 firstObject];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 addObject:v19];

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0LL; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(v20, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v25 count] != 1) {
          goto LABEL_31;
        }
        [v25 firstObject];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v17 containsObject:v26])
        {

LABEL_31:
          uint64_t v27 = 0LL;
          goto LABEL_32;
        }

        if ([v26 method]) {
          [v17 addObject:v26];
        }
      }

      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v27 = 1LL;
      if (v22) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v27 = 1LL;
  }

+ (os_log_s)chooseChildSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:(char)a5 checkKEMethod:
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  objc_opt_self();
  if (!v8)
  {
    ne_log_obj();
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    SEL v46 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    uint64_t v27 = "%s called with null localProposals";
LABEL_29:
    _os_log_fault_impl(&dword_1876B1000, obj, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_21;
  }

  if (!v9)
  {
    ne_log_obj();
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    SEL v46 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    uint64_t v27 = "%s called with null remoteProposals";
    goto LABEL_29;
  }

  if (!a4)
  {
    __int128 v34 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v33 = 0uLL;
    id obj = (os_log_s *)v8;
    uint64_t v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v43,  16LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v29[0] = MEMORY[0x1895F87A8];
          v29[1] = 3221225472LL;
          v29[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2;
          v29[3] = &unk_18A08C918;
          v29[4] = v22;
          char v30 = 0;
          char v31 = a5;
          uint64_t v23 = [v9 indexOfObjectPassingTest:v29];
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v9 objectAtIndexedSubscript:v23];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v22, v25, 0, a5);

            goto LABEL_24;
          }
        }

        uint64_t v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v43,  16LL);
        if (v19) {
          continue;
        }
        break;
      }
    }

    goto LABEL_21;
  }

  __int128 v41 = 0uLL;
  __int128 v42 = 0uLL;
  __int128 v39 = 0uLL;
  __int128 v40 = 0uLL;
  id obj = (os_log_s *)v9;
  uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
  if (!v10)
  {
LABEL_21:
    uint64_t v17 = 0LL;
    goto LABEL_24;
  }

  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v40;
  uint64_t v13 = MEMORY[0x1895F87A8];
  while (2)
  {
    for (uint64_t j = 0LL; j != v11; ++j)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * j);
      v36[0] = v13;
      v36[1] = 3221225472LL;
      v36[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke;
      v36[3] = &unk_18A08C918;
      v36[4] = v15;
      char v37 = a4;
      char v38 = a5;
      uint64_t v16 = [v8 indexOfObjectPassingTest:v36];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v8 objectAtIndexedSubscript:v16];
        int v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v24, v15, 1, a5);

        goto LABEL_24;
      }
    }

    uint64_t v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
    if (v11) {
      continue;
    }
    break;
  }

  uint64_t v17 = 0LL;
LABEL_24:

  return v17;
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke( uint64_t a1,  void *a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]( *(void *)(a1 + 32),  a2,  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41));
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]( a2,  *(void **)(a1 + 32),  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41));
}

@end