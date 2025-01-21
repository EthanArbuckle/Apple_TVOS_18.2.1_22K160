@interface UAPresenceManager
- (NSMutableDictionary)authRecords;
- (SKPresence)presence;
- (UAPresenceManager)initWithQueue:(id)a3;
- (void)addQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4;
- (void)assertPresence;
- (void)removeQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4;
- (void)setAuthRecords:(id)a3;
- (void)setPresence:(id)a3;
- (void)updatePresenseData;
@end

@implementation UAPresenceManager

- (UAPresenceManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UAPresenceManager;
  v5 = -[UAPresenceManager init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = [+[NSMutableDictionary dictionary] autorelease];
    authRecords = v5->_authRecords;
    v5->_authRecords = (NSMutableDictionary *)v6;

    v8 = -[SKPresence initWithPresenceIdentifier:isPersonal:]( objc_alloc(&OBJC_CLASS___SKPresence),  "initWithPresenceIdentifier:isPersonal:",  @"com.apple.mDNSResponder",  1LL);
    presence = v5->_presence;
    v5->_presence = v8;

    -[SKPresence addDelegate:queue:](v5->_presence, "addDelegate:queue:", v5, v4);
    id v10 = _unicast_assist_cache_log();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = v5->_presence;
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "unicast assist StatusKit init: _presence %{public}@",  buf,  0xCu);
    }

    v12 = v5;
  }

  return v5;
}

- (void)addQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4 = a4;
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = -[UAPresenceManager authRecords];
  v8 = (void *)[v7 objectForKey:v6];

  if (!v8)
  {
    v8 = [NSMutableArray array];
    v9 = [self authRecords];
    [v9 setObject:v8 forKey:v6];
  }

  if (([v8 containsObject:v10] & 1) == 0)
  {
    [v8 addObject:v10];
    -[UAPresenceManager assertPresence](self, "assertPresence");
  }
}

- (void)removeQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4 = a4;
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = -[UAPresenceManager authRecords];
  v8 = (void *)[v7 objectForKey:v6];

  if (v8 && [v8 containsObject:v10])
  {
    [v8 removeObject:v10];
    if (![v8 count])
    {
      v9 = -[UAPresenceManager authRecords];
      [v9 removeObjectForKey:v6];
    }

    -[UAPresenceManager assertPresence](self, "assertPresence");
  }
}

- (void)assertPresence
{
  context = objc_autoreleasePoolPush();
  v52 = [NSMutableArray array];
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  v47 = self;
  v3 = -[UAPresenceManager authRecords];
  unsigned int v4 = (void *)[v3 allKeys];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v58 objects:v71 count:16];
  p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
  id v48 = v5;
  if (v5)
  {
    uint64_t v46 = *(void *)v59;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v7);
        v9 = -[UAPresenceManager authRecords];
        id v10 = [v9 objectForKey:v8];

        if ([v10 count])
        {
          id v11 = [v8 unsignedIntegerValue];
          v12 = [NSMutableArray array];
          uint64_t v13 = *(void *)mDNSStorage[0];
          for (i = v7; v13; uint64_t v13 = *(void *)(v13 + 6384))
          {
            v14 = (unsigned __int8 *)(v13 + 6268);
            if (!*(_BYTE *)(v13 + 6400) || !*(_BYTE *)(v13 + 6375)) {
              continue;
            }
            if (!v11 || *(id *)(v13 + 6256) == v11)
            {
              unsigned int v62 = 0;
              int v15 = *(_DWORD *)(v13 + 6264);
              if (v15 == 6)
              {
                if (*v14 != 254 || (*(_BYTE *)(v13 + 6269) & 0xC0) != 0x80)
                {
LABEL_27:
                  v17 = 0LL;
LABEL_28:

                  continue;
                }

                uint64_t v16 = 16LL;
              }

              else
              {
                if (v15 != 4) {
                  goto LABEL_27;
                }
                v14 = (unsigned __int8 *)(v13 + 6268);
                uint64_t v16 = 4LL;
              }

              v17 = [NSData dataWithBytes:v14 length:v16];
              if (!v17
                || _unicast_assist_hash_for_interface( *(void *)(v13 + 6256),  *(_DWORD *)(v13 + 6264),  &v62))
              {
                goto LABEL_28;
              }

              v72[0] = @"ifhash";
              v18 = [NSNumber numberWithUnsignedInt:v62];
              v72[1] = @"addr";
              *(void *)buf = v18;
              *(void *)&buf[8] = v17;
              v19 = [NSDictionary dictionaryWithObjects:forKeys:count:buf, v72, 2];
              [v12 addObject:v19];

              if (!v11) {
                continue;
              }
            }
          }

          if ([v12 count]) {
            id v20 = v12;
          }
          else {
            id v20 = 0LL;
          }
          p_base_prots = &OS_mdns_trust__metaData.base_prots;

          if ([v20 count])
          {
            char v21 = 0;
            uint64_t v22 = 16LL;
            id v50 = v20;
            do
            {
              char v51 = v21;
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472LL;
              v57[2] = __35__UAPresenceManager_assertPresence__block_invoke;
              v57[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
              v57[4] = v22;
              v23 = [v20 filterObjectsUsingBlock:v57];
              v24 = v23;
              if (v23)
              {
                __int128 v55 = 0u;
                __int128 v56 = 0u;
                __int128 v53 = 0u;
                __int128 v54 = 0u;
                id v25 = [v23 countByEnumeratingWithState:&v53 objects:v70 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v54;
                  do
                  {
                    for (j = 0LL; j != v26; j = (char *)j + 1)
                    {
                      if (*(void *)v54 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      v29 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
                      v30 = [v29 objectForKeyedSubscript:@"ifhash"];
                      v31 = [v29 objectForKeyedSubscript:@"addr"];
                      v68[0] = @"qhashes";
                      v68[1] = @"ifhash";
                      v69[0] = v10;
                      v69[1] = v30;
                      v68[2] = @"addr";
                      v69[2] = v31;
                      v32 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_prot_list dictionaryWithObjects:forKeys:count:]( p_base_prots[181],  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  3LL));
                      [v52 addObject:v32];

                      id v33 = _unicast_assist_cache_log();
                      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                      {
                        v35 = [v10 describeQHashes];
                        v36 = [v31 describeAddr];
                        unsigned int v37 = [v30 unsignedIntValue];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v35;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v36;
                        __int16 v66 = 1024;
                        unsigned int v67 = v37;
                        _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "unicast assist assertPresence qhashes %@ addr %@ ifhash %x",  buf,  0x1Cu);

                        p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
                      }
                    }

                    id v26 = [v24 countByEnumeratingWithState:&v53 objects:v70 count:16];
                  }

                  while (v26);
                }
              }

              char v21 = 1;
              uint64_t v22 = 4LL;
              id v20 = v50;
            }

            while ((v51 & 1) == 0);
          }

          v7 = i;
        }

        v7 = (char *)v7 + 1;
      }

      while (v7 != v48);
      id v38 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
      id v48 = v38;
    }

    while (v38);
  }

  id v39 = objc_alloc(&OBJC_CLASS___SKPresencePayload);
  v63 = @"auth_records";
  v64 = v52;
  v40 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_prot_list dictionaryWithObjects:forKeys:count:]( p_base_prots[181],  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
  id v41 = [v39 initWithDictionary:v40];

  v42 = [v47 presence];
  [v42 assertPresenceWithPresencePayload:v41 completion:&__block_literal_global_4429];

  v43 = [v47 presence];
  [v43 retainTransientSubscriptionAssertionWithCompletion:&__block_literal_global_35_4430];

  objc_autoreleasePoolPop(context);
}

- (void)updatePresenseData
{
  v2 = [self presence];
  v3 = [v2 presentDevices];
  unsigned int v4 = (void *)[v3 filterObjectsUsingBlock:&__block_literal_global_37_4387];

  if ([v4 count])
  {
    uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
    *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v5, v6, v7, v8, v9, v10, v11, v12);
    mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"-[UAPresenceManager updatePresenseData]", 713);
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id obj = v4;
    id v48 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v66;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v66 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v65 + 1) + 8 * v13) presencePayload]);
          int v15 = (void *)[v14 payloadDictionary];

          v49 = v15;
          uint64_t v16 = (void *)[v15 objectForKey:@"auth_records"];
          id v17 = _unicast_assist_cache_log();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v16 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "unicast assist updatePresenseData: next authRecords.count %lu",  buf,  0xCu);
          }

          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v51 = v16;
          id v53 = [v51 countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v62;
            do
            {
              uint64_t v20 = 0LL;
              do
              {
                if (*(void *)v62 != v52) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v54 = v20;
                char v21 = *(void **)(*((void *)&v61 + 1) + 8 * v20);
                uint64_t v22 = (void *)[v21 objectForKey:@"ifhash"];
                unsigned int v56 = [v22 unsignedIntValue];

                v23 = [v21 objectForKey:@"qhashes"];
                v24 = [v21 objectForKey:@"addr"];
                id v25 = _unicast_assist_cache_log();
                id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  uint64_t v27 = (void *)[v23 describeQHashes];
                  v28 = [v24 describeAddr];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v27;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v28;
                  __int16 v75 = 1024;
                  unsigned int v76 = v56;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "unicast assist updatePresenseData: next qhashes %@ addr %@ ifhash %x",  buf,  0x1Cu);
                }

                __int128 v59 = 0u;
                __int128 v60 = 0u;
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                id v55 = v23;
                id v29 = [v55 countByEnumeratingWithState:&v57 objects:v73 count:16];
                if (v29)
                {
                  id v30 = v29;
                  uint64_t v31 = *(void *)v58;
                  do
                  {
                    for (i = 0LL; i != v30; i = (char *)i + 1)
                    {
                      if (*(void *)v58 != v31) {
                        objc_enumerationMutation(v55);
                      }
                      id v33 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
                      memset(buf, 0, 20);
                      if (!_unicast_assist_data_to_addr(v24, (int *)buf))
                      {
                        for (uint64_t j = *(void *)mDNSStorage[0]; j; uint64_t j = *(void *)(j + 6384))
                        {
                          if (!*(_BYTE *)(j + 6400)) {
                            continue;
                          }
                          if (!*(_BYTE *)(j + 6375)) {
                            continue;
                          }
                          *(_DWORD *)v69 = 0;
                          if (_unicast_assist_hash_for_interface(*(void *)(j + 6256), *(int *)buf, v69)
                            || *(_DWORD *)v69 != v56)
                          {
                            continue;
                          }

                          if (*(_DWORD *)buf == 4)
                          {
                            if (*(_DWORD *)(j + 6264) != 4) {
                              continue;
                            }
                            int v35 = *(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 6268);
                            int v36 = *(_DWORD *)(j + 6288);
                          }

                          else
                          {
                            if (*(_DWORD *)buf != 6
                              || *(_DWORD *)(j + 6264) != 6
                              || *(unsigned __int8 *)(j + 6268) != 254
                              || (*(_BYTE *)(j + 6269) & 0xC0) != 0x80
                              || ((*(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 6268)) & *(_DWORD *)(j + 6288)) != 0
                              || ((*(void *)&buf[8] ^ *(void *)(j + 6272)) & *(void *)(j + 6292)) != 0LL)
                            {
                              continue;
                            }

                            int v35 = *(_DWORD *)&buf[16] ^ *(_DWORD *)(j + 6280);
                            int v36 = *(_DWORD *)(j + 6300);
                          }

                          if ((v35 & v36) == 0)
                          {
                            unicast_assist_addr_add( "\x05qname",  (int)[v33 unsignedIntValue],  12,  8,  (int *)buf,  *(void *)(j + 6256));
                            goto LABEL_45;
                          }
                        }

                        id v37 = _unicast_assist_cache_log();
                        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v69 = 68289026;
                          int v70 = 20;
                          __int16 v71 = 2098;
                          v72 = buf;
                          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "unicast assist updatePresenseData: no subnet for addr %{public, mdnsresponder:ip_addr}.20P",  v69,  0x12u);
                        }
                      }

- (SKPresence)presence
{
  return self->_presence;
}

- (void)setPresence:(id)a3
{
}

- (NSMutableDictionary)authRecords
{
  return self->_authRecords;
}

- (void)setAuthRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

BOOL __39__UAPresenceManager_updatePresenseData__block_invoke(id a1, SKPresentDevice *a2)
{
  return -[SKPresentDevice isSelfDevice](a2, "isSelfDevice") ^ 1;
}

BOOL __35__UAPresenceManager_assertPresence__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"addr"];
  BOOL v4 = [v3 length] == *(id *)(a1 + 32);

  return v4;
}

void __35__UAPresenceManager_assertPresence__block_invoke_34(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = _unicast_assist_cache_log();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (void *)[v2 description];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "unicast assist StatusKit retainTransientSubscriptionAssertionWithCompletion: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void __35__UAPresenceManager_assertPresence__block_invoke_32(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = _unicast_assist_cache_log();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (void *)[v2 description];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "unicast assist StatusKit assertPresenceWithCompletion: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

@end