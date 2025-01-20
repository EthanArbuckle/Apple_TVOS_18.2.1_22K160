@interface NEIKEv2Server
- (id)getNextViableServerAddressForPath:(void *)a1;
- (id)getViableServerAddressForPath:(void *)a1;
- (void)dealloc;
- (void)resetPathProxyState;
- (void)setServerResolvedAddress:(void *)a3 path:;
- (void)startRedirectTimer;
- (void)stopRedirectTimer;
@end

@implementation NEIKEv2Server

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2Server;
  -[NEIKEv2Server dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)stopRedirectTimer
{
  if (a1)
  {
    v2 = *(dispatch_source_s **)(a1 + 72);
    if (v2)
    {
      source = v2;
      if (dispatch_source_testcancel(v2))
      {
        objc_super v3 = source;
      }

      else
      {
        dispatch_source_cancel(source);
        objc_super v3 = *(dispatch_source_s **)(a1 + 72);
      }

      *(void *)(a1 + 72) = 0LL;
    }
  }

- (void)setServerResolvedAddress:(void *)a3 path:
{
  *(void *)&v27[5] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    v7 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]( (uint64_t)&OBJC_CLASS___NEIKEv2AddressList,  v5,  a3);
    if (!v7)
    {
      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v26 = 136315138;
        *(void *)v27 = "-[NEIKEv2Server setServerResolvedAddress:path:]";
        _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null normalizedAddress",  (uint8_t *)&v26,  0xCu);
      }

      goto LABEL_20;
    }

    if (!objc_getProperty(a1, v6, 24LL, 1))
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NEIKEv2AddressList);
      objc_setProperty_atomic(a1, v10, v9, 24LL);
    }

    id Property = objc_getProperty(a1, v8, 24LL, 1);
    v12 = (const __CFString *)v5;
    v13 = (os_log_s *)v12;
    if (!Property)
    {
LABEL_20:

      goto LABEL_21;
    }

    if (!v12)
    {
      ne_log_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        int v26 = 136315138;
        *(void *)v27 = "-[NEIKEv2AddressList addAddressToList:]";
        _os_log_fault_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null address",  (uint8_t *)&v26,  0xCu);
      }

      goto LABEL_19;
    }

    unsigned int v14 = NEGetAddressFamilyFromString(v12);
    if (v14 == 30)
    {
      ptrdiff_t v16 = 8LL;
      if (objc_getProperty(Property, v15, 8LL, 1)) {
        goto LABEL_14;
      }
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      ptrdiff_t v16 = 8LL;
      v20 = Property;
      v21 = v19;
      ptrdiff_t v22 = 8LL;
    }

    else
    {
      if (v14 != 2)
      {
        unsigned int v24 = v14;
        ne_log_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v26 = 67109378;
          v27[0] = v24;
          LOWORD(v27[1]) = 2112;
          *(void *)((char *)&v27[1] + 2) = v13;
          _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Bad address family %d for address %@",  (uint8_t *)&v26,  0x12u);
        }

        v23 = 0LL;
        goto LABEL_19;
      }

      ptrdiff_t v16 = 16LL;
      if (objc_getProperty(Property, v15, 16LL, 1))
      {
LABEL_14:
        v23 = (os_log_s *)objc_getProperty(Property, v17, v16, 1);
        if ((-[os_log_s containsObject:](v23, "containsObject:", v13) & 1) == 0) {
          -[os_log_s addObject:](v23, "addObject:", v13);
        }
LABEL_19:

        goto LABEL_20;
      }

      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      ptrdiff_t v16 = 16LL;
      v20 = Property;
      v21 = v19;
      ptrdiff_t v22 = 16LL;
    }

    objc_setProperty_atomic(v20, v18, v21, v22);

    goto LABEL_14;
  }

- (void)startRedirectTimer
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    -[NEIKEv2Server stopRedirectTimer]((uint64_t)a1);
    if (objc_getProperty(a1, v2, 32LL, 1))
    {
      ne_log_obj();
      objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "-[NEIKEv2Server startRedirectTimer]";
        _os_log_error_impl(&dword_1876B1000, v3, OS_LOG_TYPE_ERROR, "%s: Starting timer\n", buf, 0xCu);
      }

      dispatch_time_t v4 = dispatch_time(0LL, 300000000000LL);
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __35__NEIKEv2Server_startRedirectTimer__block_invoke;
      v7[3] = &unk_18A090390;
      v7[4] = a1;
      uint64_t v5 = NERepeatingEventCreate(MEMORY[0x1895F8AE0], v4, 0LL, 300000LL, 150000LL, 0, v7, 0LL);
      v6 = (void *)a1[9];
      a1[9] = v5;
    }
  }

void __35__NEIKEv2Server_startRedirectTimer__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  SEL v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NEIKEv2Server startRedirectTimer]_block_invoke";
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "%s: timeout\n", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(_DWORD *)(v3 + 12) = 0;
  }
}

- (void)resetPathProxyState
{
  if (a1)
  {
    a1[8] = 0;
    objc_setProperty_atomic(a1, a2, 0LL, 56LL);
    objc_setProperty_atomic(a1, v3, 0LL, 64LL);
  }

- (id)getNextViableServerAddressForPath:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v3 = a2;
    id Property = objc_getProperty(a1, v4, 24LL, 1);
    id v6 = v3;
    v7 = v6;
    if (Property)
    {
      if ([v6 supportsIPv6])
      {
        unint64_t v9 = Property[3];
        if (v9 < objc_msgSend(objc_getProperty(Property, v8, 8, 1), "count"))
        {
          objc_msgSend(objc_getProperty(Property, v10, 8, 1), "objectAtIndex:", Property[3]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ++Property[3];
LABEL_21:

          unsigned int v24 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]( (uint64_t)&OBJC_CLASS___NEIKEv2AddressList,  v11,  v7);
          objc_setProperty_atomic(a1, v25, v24, 16LL);

          return v11;
        }
      }

      if ([v7 supportsIPv4])
      {
        unint64_t v13 = Property[4];
        if (v13 < objc_msgSend(objc_getProperty(Property, v12, 16, 1), "count"))
        {
          objc_msgSend(objc_getProperty(Property, v14, 16, 1), "objectAtIndex:", Property[4]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ++Property[4];
          goto LABEL_21;
        }
      }

      if ([v7 supportsIPv6])
      {
        unint64_t v16 = Property[4];
        if (v16 < objc_msgSend(objc_getProperty(Property, v15, 16, 1), "count"))
        {
          *(void *)buf = 0LL;
          [v7 scopedInterface];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [v7 scopedInterface];
          }
          else {
            [v7 interface];
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 interfaceIndex];

          int v19 = nw_nat64_copy_prefixes();
          if (v19)
          {
            int v21 = v19;
            objc_msgSend(objc_getProperty(Property, v20, 16, 1), "objectAtIndex:", Property[4]);
            ptrdiff_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            ++Property[4];
            v11 = +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]( (uint64_t)&OBJC_CLASS___NEIKEv2AddressList,  v22,  *(uint64_t *)buf,  v21);
            if (*(void *)buf) {
              free(*(void **)buf);
            }

            goto LABEL_21;
          }
        }
      }

      ne_log_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        else {
          v27 = "no";
        }
        else {
          v28 = "no";
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v30 = 2080;
        v31 = v28;
        _os_log_error_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to find suitable address, path supports IPv4 %s IPv6 %s",  buf,  0x16u);
      }
    }

    v11 = 0LL;
    goto LABEL_21;
  }

  return 0LL;
}

- (id)getViableServerAddressForPath:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    if (objc_getProperty(a1, v3, 56LL, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "hostname");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      a1 = v6;
      goto LABEL_15;
    }

    id Property = objc_getProperty(a1, v5, 16LL, 1);
    if (objc_getProperty(a1, v8, 16LL, 1))
    {
      v11 = (const __CFString *)objc_getProperty(a1, v10, 16LL, 1);
      unsigned int v12 = NEGetAddressFamilyFromString(v11);
      if ([v4 supportsIPv4] && (objc_msgSend(v4, "supportsIPv6") & 1) != 0
        || [v4 supportsIPv4] && v12 == 2
        || [v4 supportsIPv6] && v12 == 30)
      {
        id v6 = objc_getProperty(a1, v13, 16LL, 1);
        goto LABEL_14;
      }

      if ([v4 supportsIPv4] && objc_getProperty(a1, v16, 40, 1))
      {
        v18 = a1;
        ptrdiff_t v19 = 40LL;
LABEL_26:
        objc_msgSend(objc_getProperty(v18, v17, v19, 1), "objectAtIndexedSubscript:", 0);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }

      if ([v4 supportsIPv6])
      {
        if (objc_getProperty(a1, v20, 48LL, 1))
        {
          v18 = a1;
          ptrdiff_t v19 = 48LL;
          goto LABEL_26;
        }

        *(void *)buf = 0LL;
        [v4 scopedInterface];
        int v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          [v4 scopedInterface];
        }
        else {
          [v4 interface];
        }
        ptrdiff_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 interfaceIndex];

        int v23 = nw_nat64_copy_prefixes();
        if (v23)
        {
          int v25 = v23;
          id v26 = objc_getProperty(a1, v24, 16LL, 1);
          a1 = +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]( (uint64_t)&OBJC_CLASS___NEIKEv2AddressList,  v26,  *(uint64_t *)buf,  v25);
          goto LABEL_15;
        }
      }
    }

    else
    {
      ne_log_obj();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, "failed to find viable server", buf, 2u);
      }
    }

    a1 = 0LL;
  }

@end