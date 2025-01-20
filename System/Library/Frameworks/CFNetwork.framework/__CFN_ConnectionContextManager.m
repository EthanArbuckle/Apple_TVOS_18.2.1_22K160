@interface __CFN_ConnectionContextManager
- (uint64_t)keyForSession:(id *)a1;
- (void)registerSession:(uint64_t)a3;
- (void)unregisterSession:(uint64_t)a1;
@end

@implementation __CFN_ConnectionContextManager

- (void)registerSession:(uint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    v5 = (void *)-[__CFN_ConnectionContextManager keyForSession:]((id *)a3);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (![(id)_registeredSessions objectForKeyedSubscript:v5])
    {
      [v5 UTF8String];
      uint64_t v6 = nw_context_create();
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v23 = __50____CFN_ConnectionContextManager_registerSession___block_invoke_2;
      v24 = &unk_189C1A548;
      uint64_t v25 = v6;
      nw_context_set_isolate_protocol_cache();
      if (a3) {
        v7 = *(void **)(a3 + 112);
      }
      else {
        v7 = 0LL;
      }
      [v7 _loggingPrivacyLevel];
      nw_context_set_privacy_level();
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      if (a3) {
        v8 = *(void **)(a3 + 112);
      }
      else {
        v8 = 0LL;
      }
      v9 = (void *)objc_msgSend(v8, "_proxyConfigurations", v18);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            nw_context_add_proxy();
          }

          uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }

        while (v10);
      }

      nw_context_activate();
      [(id)_nwContexts setObject:v6 forKeyedSubscript:v5];
      uint64_t v13 = [MEMORY[0x189603FE0] set];
      [(id)_registeredSessions setObject:v13 forKeyedSubscript:v5];
      v23((uint64_t)v22);
    }

    v14 = (void *)[(id)_registeredSessions objectForKeyedSubscript:v5];
    if (a3) {
      uint64_t v15 = *(void *)(a3 + 128);
    }
    else {
      uint64_t v15 = 0LL;
    }
    [v14 addObject:v15];
    id v16 = (id)[(id)_nwContexts objectForKeyedSubscript:v5];
    *a1 = v16;
    v17 = operator new(0x20uLL);
    void *v17 = off_189C13C68;
    v17[1] = 0LL;
    v17[2] = 0LL;
    v17[3] = v16;
    a1[1] = v17;
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }

  else
  {
    *a1 = 0LL;
    a1[1] = 0LL;
  }

- (uint64_t)keyForSession:(id *)a1
{
  v2 = (void *)NSString;
  uint64_t v3 = [a1 _tlsSessionCachePrefix];
  if (a1)
  {
    uint64_t v4 = [a1[14] _tlsTrustPinningPolicyName];
    else {
      uint64_t v5 = 78LL;
    }
    uint64_t v6 = [a1[14] _loggingPrivacyLevel];
    id v7 = a1[14];
  }

  else
  {
    uint64_t v4 = [0 _tlsTrustPinningPolicyName];
    else {
      uint64_t v5 = 78LL;
    }
    uint64_t v6 = [0 _loggingPrivacyLevel];
    id v7 = 0LL;
  }

  return [v2 stringWithFormat:@"com.apple.CFNetwork.NSURLSession.{%@}{%@}{%c}{%d}{%p}", v3, v4, v5, v6, objc_msgSend(v7, "_proxyConfigurations")];
}

- (void)unregisterSession:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = -[__CFN_ConnectionContextManager keyForSession:]((id *)a2);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if ([(id)_registeredSessions objectForKeyedSubscript:v3])
    {
      uint64_t v4 = (void *)[(id)_registeredSessions objectForKeyedSubscript:v3];
      if (a2) {
        uint64_t v5 = *(void *)(a2 + 128);
      }
      else {
        uint64_t v5 = 0LL;
      }
      [v4 removeObject:v5];
      if (!objc_msgSend((id)objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v3), "count"))
      {
        [(id)_nwContexts removeObjectForKey:v3];
        [(id)_registeredSessions removeObjectForKey:v3];
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }

@end