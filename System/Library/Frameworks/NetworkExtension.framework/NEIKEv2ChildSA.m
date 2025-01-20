@interface NEIKEv2ChildSA
- (BOOL)isRekeying;
- (_BYTE)configuredInitiatorTrafficSelectors;
- (_BYTE)configuredResponderTrafficSelectors;
- (_BYTE)initiatorTrafficSelectors;
- (_BYTE)responderTrafficSelectors;
- (id)configProposalsWithoutKEM;
- (id)description;
- (id)ikeSA;
- (id)initWithConfiguration:(int)a3 childID:(void *)a4 ikeSA:;
- (id)preferredKEMProtocol;
- (uint64_t)generateAllValues;
- (uint64_t)generateInitialValues;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1;
- (uint64_t)processCurrentKeyExchange;
- (uint64_t)processPrimaryKeyExchange;
- (uint64_t)shouldGenerateNewDHKeys;
- (void)dealloc;
- (void)reset;
- (void)setConfigProposalsWithoutKEM:(id)self;
- (void)setInitiatorTrafficSelectors:(_BYTE *)a1;
- (void)setResponderTrafficSelectors:(_BYTE *)a1;
- (void)setState:(void *)a3 error:;
@end

@implementation NEIKEv2ChildSA

- (id)description
{
  id v4 = objc_alloc(NSString);
  if (self)
  {
    uint64_t childID = self->_childID;
    id Property = objc_getProperty(self, v3, 56LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 80LL, 1);
    }
    id v8 = Property;
    id v10 = objc_getProperty(self, v9, 56LL, 1);
    if (v10) {
      id v10 = objc_getProperty(v10, v11, 88LL, 1);
    }
  }

  else
  {
    uint64_t childID = 0LL;
    id v8 = 0LL;
    id v10 = 0LL;
  }

  id v12 = v10;
  v13 = (void *)[v4 initWithFormat:@"ChildSA[%u, %@-%@]", childID, v8, v12];

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2ChildSA;
  -[NEIKEv2ChildSA dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)reset
{
  if (a1)
  {
    a1[9] = 1;
    objc_setProperty_atomic(a1, a2, 0LL, 56LL);
    objc_setProperty_atomic(a1, v3, 0LL, 208LL);
    a1[8] = 1;
    objc_setProperty_atomic(a1, v4, 0LL, 64LL);
    objc_setProperty_atomic(a1, v5, 0LL, 72LL);
    objc_setProperty_atomic(a1, v6, 0LL, 80LL);
    objc_setProperty_atomic(a1, v7, 0LL, 88LL);
    objc_setProperty_atomic(a1, v8, 0LL, 104LL);
    objc_setProperty_atomic(a1, v9, 0LL, 112LL);
    objc_setProperty_atomic(a1, v10, 0LL, 120LL);
    objc_setProperty_atomic(a1, v11, 0LL, 128LL);
    objc_setProperty_atomic(a1, v12, 0LL, 136LL);
    objc_setProperty_atomic(a1, v13, 0LL, 144LL);
    objc_setProperty_atomic(a1, v14, 0LL, 152LL);
    objc_setProperty_atomic(a1, v15, 0LL, 160LL);
    objc_setProperty_atomic(a1, v16, 0LL, 168LL);
  }

- (id)initWithConfiguration:(int)a3 childID:(void *)a4 ikeSA:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  if (!a1)
  {
    id v11 = 0LL;
    goto LABEL_15;
  }

  if (v7)
  {
    v26.receiver = a1;
    v26.super_class = (Class)&OBJC_CLASS___NEIKEv2ChildSA;
    id v9 = objc_msgSendSuper2(&v26, sel_init);
    if (v9)
    {
      id v11 = v9;
      objc_setProperty_atomic(v9, v10, v7, 48LL);
      *((_BYTE *)v11 + 9) = 1;
      objc_setProperty_atomic(v11, v12, 0LL, 56LL);
      *((_DWORD *)v11 + 4) = a3;
      *((void *)v11 + 4) = 3LL;
      objc_setProperty_atomic(v11, v13, 0LL, 40LL);
      *((_BYTE *)v11 + 8) = 0;
      objc_opt_self();
      __int16 v14 = nextDatabaseReqID_nextReqid;
      else {
        __int16 v15 = nextDatabaseReqID_nextReqid + 1;
      }
      nextDatabaseReqID_nextReqid = v15;
      *((_WORD *)v11 + 6) = v14;
      objc_opt_self();
      __int16 v16 = nextDatabaseReqID_nextReqid;
      else {
        __int16 v17 = nextDatabaseReqID_nextReqid + 1;
      }
      nextDatabaseReqID_nextReqid = v17;
      *((_WORD *)v11 + 7) = v16;
      objc_storeWeak((id *)v11 + 3, v8);
      ne_log_large_obj();
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_INFO))
      {
        int v19 = *((_DWORD *)v11 + 4);
        if (v8) {
          id Property = objc_getProperty(v8, v18, 32LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v21 = Property;
        id v23 = objc_getProperty(v11, v22, 48LL, 1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = v19;
        *(_WORD *)&v28[4] = 2112;
        *(void *)&v28[6] = v21;
        __int16 v29 = 2112;
        id v30 = v23;
        _os_log_impl( &dword_1876B1000,  (os_log_t)a1,  OS_LOG_TYPE_INFO,  "Created Child SA %u (off of %@) with configuration %@",  buf,  0x1Cu);
      }

      goto LABEL_14;
    }

    ne_log_obj();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v28 = "-[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:]";
      _os_log_fault_impl(&dword_1876B1000, v25, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }
  }

  id v11 = 0LL;
LABEL_14:

LABEL_15:
  return v11;
}

- (void)setState:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unint64_t v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = (v6 | (unint64_t)objc_getProperty((id)a1, v5, 40LL, 1)) != 0;
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == a2)
    {
      if (v8)
      {
        if (v10)
        {
          SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
          int v23 = 138413058;
          uint64_t v24 = a1;
          __int16 v25 = 2112;
          objc_super v26 = SessionStateString;
          __int16 v27 = 2112;
          id Property = objc_getProperty((id)a1, v12, 40LL, 1);
          __int16 v29 = 2112;
          unint64_t v30 = v6;
          SEL v13 = "%@ not changing state %@ nor error %@ -> %@";
          __int16 v14 = v9;
          uint32_t v15 = 42;
LABEL_11:
          _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);
        }
      }

      else if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
        int v23 = 138412546;
        uint64_t v24 = a1;
        __int16 v25 = 2112;
        objc_super v26 = SessionStateString;
        SEL v13 = "%@ not changing state %@ nor error";
        __int16 v14 = v9;
        uint32_t v15 = 22;
        goto LABEL_11;
      }

      goto LABEL_17;
    }

    if (v8)
    {
      if (v10)
      {
        __int16 v16 = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
        __int16 v17 = NEIKEv2CreateSessionStateString(a2);
        int v23 = 138413314;
        uint64_t v24 = a1;
        __int16 v25 = 2112;
        objc_super v26 = v16;
        __int16 v27 = 2112;
        id Property = v17;
        __int16 v29 = 2112;
        unint64_t v30 = (unint64_t)objc_getProperty((id)a1, v18, 40LL, 1);
        __int16 v31 = 2112;
        unint64_t v32 = v6;
        int v19 = "%@ state %@ -> %@ error %@ -> %@";
        v20 = v9;
        uint32_t v21 = 52;
LABEL_15:
        _os_log_impl(&dword_1876B1000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
      }
    }

    else if (v10)
    {
      __int16 v16 = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
      __int16 v17 = NEIKEv2CreateSessionStateString(a2);
      int v23 = 138412802;
      uint64_t v24 = a1;
      __int16 v25 = 2112;
      objc_super v26 = v16;
      __int16 v27 = 2112;
      id Property = v17;
      int v19 = "%@ state %@ -> %@";
      v20 = v9;
      uint32_t v21 = 32;
      goto LABEL_15;
    }

    *(void *)(a1 + 32) = a2;
    objc_setProperty_atomic((id)a1, v22, (id)v6, 40LL);
    *(_BYTE *)(a1 + 8) = 1;
  }

- (void)setConfigProposalsWithoutKEM:(id)self
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0LL, 208LL);
  }
}

- (id)configProposalsWithoutKEM
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 208LL, 1))
    {
LABEL_20:
      a1 = objc_getProperty(v2, v3, 208LL, 1);
      return a1;
    }

    objc_msgSend(objc_getProperty(v2, v3, 48, 1), "proposals");
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 count] == 1)
    {
      [v4 objectAtIndexedSubscript:0];
      SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v5);

      if (v6) {
        v6[8] = 1;
      }
      v24[0] = v6;
      [MEMORY[0x189603F18] arrayWithObjects:v24 count:1];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v2, v8, v7, 208LL);
    }

    else
    {
      unint64_t v6 = objc_alloc_init(MEMORY[0x189603FD0]);
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = -[NEIKEv2ChildSAProposal copyWithoutKEM](*(void **)(*((void *)&v19 + 1) + 8 * i));
            char v15 = objc_msgSend(v6, "count", (void)v19);
            if (v14) {
              v14[8] = v15 + 1;
            }
            [v6 addObject:v14];
          }

          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v11);
      }

      if (![v6 count]) {
        goto LABEL_19;
      }
      [v6 array];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = (void *)[v7 copy];
      objc_setProperty_atomic(v2, v17, v16, 208LL);
    }

LABEL_19:
    goto LABEL_20;
  }

  return a1;
}

- (uint64_t)shouldGenerateNewDHKeys
{
  uint64_t v2 = (uint64_t)self;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 184LL, 1);
    if (v4) {
      goto LABEL_3;
    }
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v4 = objc_getProperty((id)v2, v3, 176LL, 1);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v4);
          }
          -[NEIKEv2IKESAProposal kemProtocol](*(id *)(*((void *)&v16 + 1) + 8 * v10), v7);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v12 = objc_msgSend(v11, "method", (void)v16);

          if (v12)
          {
            uint64_t v2 = 1LL;
            goto LABEL_18;
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v4 = objc_getProperty((id)v2, v13, 56LL, 1);
    if (v4
      || (objc_msgSend(objc_getProperty((id)v2, v3, 48, 1), "proposals"),
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(),
          [v14 firstObject],
          id v4 = (id)objc_claimAutoreleasedReturnValue(),
          v14,
          v4))
    {
LABEL_3:
      -[NEIKEv2IKESAProposal kemProtocol](v4, v3);
      SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v2 = [v5 method] != 0;
    }

    else
    {
      ne_log_obj();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v21 = "-[NEIKEv2ChildSA shouldGenerateNewDHKeys]";
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v4, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
      }

      uint64_t v2 = 0LL;
    }

- (BOOL)isRekeying
{
  uint64_t v3 = 1LL;
  if (!objc_getProperty(a1, a2, 176LL, 1)) {
    return objc_getProperty(a1, v4, 184LL, 1) != 0LL;
  }
  return v3;
}

- (_BYTE)configuredInitiatorTrafficSelectors
{
  if (a1)
  {
    char v2 = a1[9];
    id Property = objc_getProperty(a1, a2, 48LL, 1);
    if ((v2 & 1) != 0) {
      [Property localTrafficSelectors];
    }
    else {
      [Property remoteTrafficSelectors];
    }
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)configuredResponderTrafficSelectors
{
  if (a1)
  {
    char v2 = a1[9];
    id Property = objc_getProperty(a1, a2, 48LL, 1);
    if ((v2 & 1) != 0) {
      [Property remoteTrafficSelectors];
    }
    else {
      [Property localTrafficSelectors];
    }
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)setInitiatorTrafficSelectors:(_BYTE *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v4 = 64LL;
    }
    else {
      ptrdiff_t v4 = 72LL;
    }
    SEL v5 = v3;
    objc_setProperty_atomic(a1, v3, v3, v4);
    uint64_t v3 = v5;
  }
}

- (_BYTE)initiatorTrafficSelectors
{
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v2 = 64LL;
    }
    else {
      ptrdiff_t v2 = 72LL;
    }
    a1 = objc_getProperty(a1, a2, v2, 1);
  }

  return a1;
}

- (void)setResponderTrafficSelectors:(_BYTE *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v4 = 72LL;
    }
    else {
      ptrdiff_t v4 = 64LL;
    }
    SEL v5 = v3;
    objc_setProperty_atomic(a1, v3, v3, v4);
    uint64_t v3 = v5;
  }
}

- (_BYTE)responderTrafficSelectors
{
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v2 = 72LL;
    }
    else {
      ptrdiff_t v2 = 64LL;
    }
    a1 = objc_getProperty(a1, a2, v2, 1);
  }

  return a1;
}

- (id)preferredKEMProtocol
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (objc_getProperty(a1, a2, 96LL, 1)) {
    return objc_getProperty(a1, v3, 96LL, 1);
  }
  id v6 = objc_getProperty(a1, v3, 184LL, 1);
  if (v6) {
    goto LABEL_4;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = objc_getProperty(a1, v5, 176LL, 1);
  uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        -[NEIKEv2IKESAProposal kemProtocol](v12, v5);
        SEL v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = objc_msgSend(v13, "method", (void)v18);

        if (v14)
        {
          uint64_t v7 = v12;
          goto LABEL_19;
        }
      }

      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v6 = objc_getProperty(a1, v15, 56LL, 1);
  if (v6
    || (objc_msgSend(objc_getProperty(a1, v5, 48, 1), "proposals"),
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(),
        [v16 firstObject],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v6))
  {
LABEL_4:
    uint64_t v7 = v6;
LABEL_19:
    -[NEIKEv2IKESAProposal kemProtocol](v7, v5);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    ne_log_obj();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[NEIKEv2ChildSA preferredKEMProtocol]";
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
    }

    __int128 v17 = 0LL;
  }

  return v17;
}

- (id)ikeSA
{
  if (WeakRetained) {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  }
  return WeakRetained;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty(a1, v3, 112LL, 1);

    if (v5)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[NEIKEv2ChildSA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null !self.currentKEHandler",  (uint8_t *)&v13,  0xCu);
      }
    }

    else
    {
      uint64_t v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]( (uint64_t)NEIKEv2KeyExchangeHandler,  [v4 method]);
      objc_setProperty_atomic(a1, v9, v8, 112LL);

      uint64_t v7 = 1LL;
      id v11 = objc_getProperty(a1, v10, 112LL, 1);

      if (v11) {
        goto LABEL_8;
      }
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        uint64_t v14 = (const char *)v4;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to get handler for KE method %@",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

  uint64_t v7 = 0LL;
LABEL_8:

  return v7;
}

- (uint64_t)generateInitialValues
{
  v1 = a1;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    id v4 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = objc_getProperty(WeakRetained, v3, 80LL, 1);
    }
    id v5 = WeakRetained;
    unsigned int v6 = [v5 nonceSize];

    if (v6 <= 0xF)
    {
      ne_log_obj();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 67109120;
        LODWORD(v16) = v6;
        _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "Invalid nonce size %u", (uint8_t *)&v15, 8u);
      }
    }

    else
    {
      uint64_t v7 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v6);
      objc_setProperty_atomic(v1, v8, v7, 80LL);

      -[NEIKEv2ChildSA preferredKEMProtocol](v1, v10);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v11;
      if (v11 && -[os_log_s method](v11, "method") != 36 && -[os_log_s method](v12, "method") != 37)
      {
        v1 = (void *)-[NEIKEv2ChildSA generateLocalValuesForKEMProtocol:](v1, v12);
LABEL_13:

        return (uint64_t)v1;
      }

      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412290;
        __int128 v16 = v12;
        _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "KE method %@ is not Diffie-Hellman",  (uint8_t *)&v15,  0xCu);
      }
    }

    v1 = 0LL;
    goto LABEL_13;
  }

  return (uint64_t)v1;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2 = self;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (self) {
    self = objc_getProperty(self, a2, 112LL, 1);
  }
  id v3 = self;

  if (!v3)
  {
    ne_log_obj();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0LL;
    }

    int v16 = 136315138;
    uint64_t v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    int v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }

  objc_getProperty(v2, v4, 104LL, 1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ne_log_obj();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    int v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }

  objc_getProperty(v2, v6, 104LL, 1);
  SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0LL, 104LL);
    id Property = objc_getProperty(v2, v9, 112LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  id v11 = Property;
  uint64_t v12 = [v11 processPeerPayload:v8];

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  if (result)
  {
    id v2 = (void *)result;
    result = -[NEIKEv2ChildSA processCurrentKeyExchange]((id)result, a2);
    if ((_DWORD)result)
    {
      id v4 = objc_getProperty(v2, v3, 112LL, 1);
      unsigned int v6 = v4;
      if (v4) {
        uint64_t v7 = (void *)*((void *)v4 + 3);
      }
      else {
        uint64_t v7 = 0LL;
      }
      objc_setProperty_atomic(v2, v5, v7, 120LL);

      objc_setProperty_atomic(v2, v8, 0LL, 112LL);
      return 1LL;
    }
  }

  return result;
}

- (uint64_t)generateAllValues
{
  uint64_t v129 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    ne_log_obj();
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v128, 0xCu);
    }

    uint64_t v97 = 0LL;
    goto LABEL_97;
  }

  unsigned int v6 = (os_log_s *)objc_getProperty(WeakRetained, v3, 96LL, 1);
  if (!v6)
  {
    ne_log_obj();
    SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "%s called with null ikeProposal", v128, 0xCu);
    }

    goto LABEL_110;
  }

  uint64_t v7 = (os_log_s *)objc_getProperty((id)a1, v5, 56LL, 1);
  if (!v7)
  {
    ne_log_obj();
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_1876B1000, v100, OS_LOG_TYPE_FAULT, "%s called with null childProposal", v128, 0xCu);
    }

    SEL v9 = 0LL;
LABEL_110:
    uint64_t v97 = 0LL;
    goto LABEL_96;
  }

  SEL v9 = v7;
  if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
    ptrdiff_t v10 = 80LL;
  }
  else {
    ptrdiff_t v10 = 88LL;
  }
  id v12 = objc_getProperty((id)a1, v8, v10, 1);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
    ptrdiff_t v13 = 88LL;
  }
  else {
    ptrdiff_t v13 = 80LL;
  }
  id v14 = objc_getProperty((id)a1, v11, v13, 1);
  int v16 = v14;
  if (v12 && v14)
  {
    uint64_t v17 = v12;
  }

  else
  {
    -[NEIKEv2IKESA initiatorNonce](v4, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEIKEv2IKESA initiatorNonce](v4, v18);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      ne_log_obj();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA.initiatorNonce",  v128,  0xCu);
      }

      unsigned __int8 v123 = 0;
      goto LABEL_95;
    }

    uint64_t v21 = -[NEIKEv2IKESA responderNonce](v4, v20);

    -[NEIKEv2IKESA responderNonce](v4, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      ne_log_obj();
      v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl( &dword_1876B1000,  v95,  OS_LOG_TYPE_FAULT,  "%s called with null ikeSA.responderNonce",  v128,  0xCu);
      }

      unsigned __int8 v123 = 0;
      int v16 = (void *)v21;
      goto LABEL_95;
    }

    int v16 = (void *)v21;
  }

  objc_getProperty((id)a1, v15, 120LL, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v17;
  v111 = v4;
  if (v112)
  {
    uint64_t v25 = v16;
    objc_super v26 = v9;
    objc_setProperty_atomic((id)a1, v24, 0LL, 120LL);
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    id v28 = objc_getProperty((id)a1, v27, 136LL, 1);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v119 objects:v127 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = 0LL;
      uint64_t v32 = *(void *)v120;
      do
      {
        for (uint64_t i = 0LL; i != v30; ++i)
        {
          if (*(void *)v120 != v32) {
            objc_enumerationMutation(v28);
          }
          v31 += [*(id *)(*((void *)&v119 + 1) + 8 * i) length];
        }

        uint64_t v30 = [v28 countByEnumeratingWithState:&v119 objects:v127 count:16];
      }

      while (v30);
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    v34 = v6;

    SEL v9 = v26;
    uint64_t v17 = v114;
    int v16 = v25;
  }

  else
  {
    v34 = v6;
    uint64_t v31 = 0LL;
  }

  uint64_t v36 = [v17 length];
  v37 = v16;
  uint64_t v38 = [v16 length];
  CFIndex v39 = v36 + [v112 length] + v31 + v38;
  CFMutableDataRef v40 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v39);
  if (!v40)
  {
    ne_log_obj();
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unsigned int v6 = v34;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 134217984;
      *(void *)&v128[4] = v39;
      _os_log_fault_impl( &dword_1876B1000,  v101,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed",  v128,  0xCu);
    }

    CFMutableDataRef v41 = 0LL;
    unsigned __int8 v123 = 0;
    int v16 = v37;
    id v4 = v111;
    v92 = v112;
    goto LABEL_94;
  }

  CFMutableDataRef v41 = v40;
  -[__CFData appendData:](v40, "appendData:", v112);
  -[__CFData appendData:](v41, "appendData:", v17);
  v110 = v37;
  -[__CFData appendData:](v41, "appendData:", v37);
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  id v43 = objc_getProperty((id)a1, v42, 136LL, 1);
  uint64_t v44 = [v43 countByEnumeratingWithState:&v115 objects:v126 count:16];
  unsigned int v6 = v34;
  id v4 = v111;
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v116;
    do
    {
      for (uint64_t j = 0LL; j != v45; ++j)
      {
        if (*(void *)v116 != v46) {
          objc_enumerationMutation(v43);
        }
        -[__CFData appendData:](v41, "appendData:", *(void *)(*((void *)&v115 + 1) + 8 * j));
      }

      uint64_t v45 = [v43 countByEnumeratingWithState:&v115 objects:v126 count:16];
    }

    while (v45);
  }

  objc_setProperty_atomic((id)a1, v48, 0LL, 136LL);
  *(void *)v128 = 0LL;
  -[__CFData bytes](v41, "bytes");
  -[__CFData length](v41, "length");
  unsigned int Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    unsigned int v102 = Hkdf;
    ne_log_obj();
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v114;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v102;
      _os_log_fault_impl(&dword_1876B1000, v103, OS_LOG_TYPE_FAULT, "CCKDFParametersCreateHkdf failed %d", buf, 8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    v92 = v112;
    goto LABEL_94;
  }
  v52 = -[NEIKEv2ChildSAProposal integrityProtocol](v9, v50);
  uint64_t v17 = v114;
  if (v52)
  {
    v53 = -[NEIKEv2ChildSAProposal integrityProtocol](v9, v51);
    unsigned int v54 = -[NEIKEv2IntegrityProtocol keyLength]((uint64_t)v53);
  }

  else
  {
    unsigned int v54 = 0;
  }
  v56 = -[NEIKEv2ChildSAProposal encryptionProtocol](v9, v55);
  unsigned int v57 = -[NEIKEv2EncryptionProtocol keyLength]((uint64_t)v56);

  unsigned int v107 = v54;
  uint64_t v58 = v57 + v54;
  v60 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], (2 * v58));
  if (!v60)
  {
    ne_log_obj();
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = 2 * v58;
      _os_log_fault_impl( &dword_1876B1000,  v104,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed",  buf,  8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    v92 = v112;
    goto LABEL_93;
  }

  uint64_t v106 = v58;
  unsigned int v108 = v57;
  v109 = v9;
  id v61 = objc_getProperty(v111, v59, 216LL, 1);
  v63 = -[NEIKEv2IKESAProposal prfProtocol](v6, v62);
  -[NEIKEv2PRFProtocol ccDigest](v63);
  [v61 bytes];
  [v61 length];
  -[__CFData mutableBytes](v60, "mutableBytes");
  -[__CFData length](v60, "length");
  unsigned int v64 = CCHKDFExpand();

  CCKDFParametersDestroy();
  *(void *)v128 = 0LL;
  if (v64)
  {
    ne_log_obj();
    v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v92 = v112;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v64;
      _os_log_fault_impl(&dword_1876B1000, v105, OS_LOG_TYPE_FAULT, "CCHKDFExpand failed %d", buf, 8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    id v4 = v111;
    goto LABEL_92;
  }

  v113 = v60;
  v65 = (const UInt8 *)-[__CFData bytes](v60, "bytes");
  v67 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x189603F48], v65, v108);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
    ptrdiff_t v68 = 160LL;
  }
  else {
    ptrdiff_t v68 = 144LL;
  }
  objc_setProperty_atomic((id)a1, v66, v67, v68);

  if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
    ptrdiff_t v70 = 160LL;
  }
  else {
    ptrdiff_t v70 = 144LL;
  }
  id v71 = objc_getProperty((id)a1, v69, v70, 1);

  if (!v71)
  {
    ne_log_obj();
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v108;
      _os_log_fault_impl( &dword_1876B1000,  v93,  OS_LOG_TYPE_FAULT,  "[NESensitiveData sensitiveDataWithBytes:length:%u] failed",  buf,  8u);
    }

    goto LABEL_90;
  }

  uint64_t v72 = v108;
  unsigned int v73 = v108;
  if (v107)
  {
    v75 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x189603F48], &v65[v108], v107);
    if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
      ptrdiff_t v76 = 168LL;
    }
    else {
      ptrdiff_t v76 = 152LL;
    }
    objc_setProperty_atomic((id)a1, v74, v75, v76);

    if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
      ptrdiff_t v78 = 168LL;
    }
    else {
      ptrdiff_t v78 = 152LL;
    }
    id v79 = objc_getProperty((id)a1, v77, v78, 1);

    if (v79)
    {
      uint64_t v72 = v106;
      unsigned int v73 = v106;
      goto LABEL_62;
    }

    ne_log_obj();
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v107;
      _os_log_fault_impl( &dword_1876B1000,  v96,  OS_LOG_TYPE_FAULT,  "[NESensitiveData sensitiveDataWithBytes:length:%u] failed",  buf,  8u);
    }

LABEL_90:
    id v61 = 0LL;
    CFMutableDataRef v41 = 0LL;
    v92 = 0LL;
    unsigned __int8 v123 = 0;
    id v4 = v111;
    goto LABEL_91;
  }

@end