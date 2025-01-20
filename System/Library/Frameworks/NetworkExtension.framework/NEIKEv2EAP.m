@interface NEIKEv2EAP
+ (uint64_t)codeForPayload:(uint64_t)a1;
+ (uint64_t)loadModuleForType:(uint64_t)a1;
+ (uint64_t)typeForPayload:(uint64_t)a1;
- (CFDataRef)sessionKey;
- (NEIKEv2EAP)init;
- (id)createPayloadResponseForRequest:(void *)a1 type:(char)a2 typeData:(void *)a3 typeString:(void *)a4;
- (id)createPayloadResponseForRequest:(void *)a3 ikeSA:(BOOL *)a4 success:(BOOL *)a5 reportEAPError:;
- (void)dealloc;
@end

@implementation NEIKEv2EAP

- (void)dealloc
{
  if (self && self->_module)
  {
    EAPClientModulePluginFree();
    self->_module = 0LL;
  }

  properties = self->_pluginData.properties;
  if (properties)
  {
    CFRelease(properties);
    self->_pluginData.properties = 0LL;
  }

  sec_identity = self->_pluginData.sec_identity;
  if (sec_identity)
  {
    CFRelease(sec_identity);
    self->_pluginData.sec_identity = 0LL;
  }

  encryptedEAPIdentity = self->_pluginData.encryptedEAPIdentity;
  if (encryptedEAPIdentity)
  {
    CFRelease(encryptedEAPIdentity);
    self->_pluginData.encryptedEAPIdentity = 0LL;
  }

  username = self->_pluginData.username;
  if (username)
  {
    free(username);
    self->_pluginData.username = 0LL;
  }

  password = self->_pluginData.password;
  if (password)
  {
    memset_s(password, self->_pluginData.password_length, 0, self->_pluginData.password_length);
    free(self->_pluginData.password);
    self->_pluginData.password = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2EAP;
  -[NEIKEv2EAP dealloc](&v8, sel_dealloc);
}

- (NEIKEv2EAP)init
{
  if (MEMORY[0x18960F310])
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NEIKEv2EAP;
    v3 = -[NEIKEv2EAP init](&v7, sel_init);
    if (v3)
    {
      *((void *)v3 + 19) = 0LL;
      *(_OWORD *)(v3 + 136) = 0u;
      *(_OWORD *)(v3 + 120) = 0u;
      *(_OWORD *)(v3 + 104) = 0u;
      *(_OWORD *)(v3 + 88) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 24) = 0u;
      *(_OWORD *)(v3 + 8) = 0u;
      self = v3;
      v2 = self;
      goto LABEL_5;
    }

    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, "[super init] failed", v6, 2u);
    }

    self = 0LL;
  }

  v2 = 0LL;
LABEL_5:

  return v2;
}

- (void).cxx_destruct
{
}

uint64_t __26__NEIKEv2EAP_getAKAModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getSIMModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __31__NEIKEv2EAP_getMSCHAPv2Module__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getGTCModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __26__NEIKEv2EAP_getTLSModule__block_invoke()
{
  return EAPClientModuleAddBuiltinModule();
}

uint64_t __27__NEIKEv2EAP_getPEAPModule__block_invoke()
{
  uint64_t result = EAPClientModuleAddBuiltinModule();
  if (!(_DWORD)result) {
    return EAPClientModuleAddBuiltinModule();
  }
  return result;
}

+ (uint64_t)codeForPayload:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if ((unint64_t)[v2 length] <= 3)
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      objc_super v7 = "+[NEIKEv2EAP codeForPayload:]";
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "%s called with null (payload.length >= sizeof(EAPPacket))",  (uint8_t *)&v6,  0xCu);
    }

    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = *(unsigned __int8 *)[v2 bytes];
  }

  return v3;
}

+ (uint64_t)typeForPayload:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    if ((unint64_t)[v2 length] >= 5
      && +[NEIKEv2EAP codeForPayload:]((uint64_t)&OBJC_CLASS___NEIKEv2EAP, v2) - 3 >= 0xFFFFFFFE)
    {
      uint64_t v3 = *(unsigned __int8 *)([v2 bytes] + 4);
      goto LABEL_6;
    }
  }

  else
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      objc_super v7 = "+[NEIKEv2EAP typeForPayload:]";
      _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, "%s called with null payload", (uint8_t *)&v6, 0xCu);
    }
  }

  uint64_t v3 = 0LL;
LABEL_6:

  return v3;
}

- (id)createPayloadResponseForRequest:(void *)a1 type:(char)a2 typeData:(void *)a3 typeString:(void *)a4
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 bytes];
  if (!v8 && v9)
  {
    [v9 dataUsingEncoding:4];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13[0] = 2;
  __int16 v14 = bswap32([v8 length] + 5) >> 16;
  v13[1] = *(_BYTE *)(v10 + 1);
  char v15 = a2;
  id v11 = objc_alloc_init(MEMORY[0x189603FB8]);
  [v11 appendBytes:v13 length:5];
  if ([v8 length]) {
    [v11 appendData:v8];
  }

  return v11;
}

+ (uint64_t)loadModuleForType:(uint64_t)a1
{
  switch(a2)
  {
    case 18:
      objc_opt_self();
      if (!MEMORY[0x18960F350]) {
        return 0LL;
      }
      if (getSIMModule_onceToken == -1) {
        return EAPClientModuleLookup();
      }
      v5 = &getSIMModule_onceToken;
      int v6 = &__block_literal_global_1;
      goto LABEL_32;
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
      return 0LL;
    case 23:
      objc_opt_self();
      if (!MEMORY[0x18960F338]) {
        return 0LL;
      }
      if (getAKAModule_onceToken == -1) {
        return EAPClientModuleLookup();
      }
      v5 = &getAKAModule_onceToken;
      int v6 = &__block_literal_global_8550;
      goto LABEL_32;
    case 25:
      objc_opt_self();
      if (MEMORY[0x18960F360]) {
        BOOL v3 = MEMORY[0x18960F348] == 0LL;
      }
      else {
        BOOL v3 = 1;
      }
      if (v3) {
        return 0LL;
      }
      if (getPEAPModule_onceToken == -1) {
        return EAPClientModuleLookup();
      }
      v5 = &getPEAPModule_onceToken;
      int v6 = &__block_literal_global_5;
      goto LABEL_32;
    case 26:
      objc_opt_self();
      if (!MEMORY[0x18960F348]) {
        return 0LL;
      }
      if (getMSCHAPv2Module_onceToken == -1) {
        return EAPClientModuleLookup();
      }
      v5 = &getMSCHAPv2Module_onceToken;
      int v6 = &__block_literal_global_2;
      goto LABEL_32;
    default:
      if (a2 != 6)
      {
        if (a2 == 13)
        {
          objc_opt_self();
          if (MEMORY[0x18960F358])
          {
            if (getTLSModule_onceToken == -1) {
              return EAPClientModuleLookup();
            }
            v5 = &getTLSModule_onceToken;
            int v6 = &__block_literal_global_4;
            goto LABEL_32;
          }
        }

        return 0LL;
      }

      objc_opt_self();
      if (!MEMORY[0x18960F340]) {
        return 0LL;
      }
      if (getGTCModule_onceToken != -1)
      {
        v5 = &getGTCModule_onceToken;
        int v6 = &__block_literal_global_3;
LABEL_32:
        dispatch_once(v5, v6);
      }

      return EAPClientModuleLookup();
  }

- (id)createPayloadResponseForRequest:(void *)a3 ikeSA:(BOOL *)a4 success:(BOOL *)a5 reportEAPError:
{
  uint64_t v214 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  uint64_t v10 = a3;
  if (!a1) {
    goto LABEL_184;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!v9)
  {
    ne_log_obj();
    v172 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[NEIKEv2EAP createPayloadResponseForRequest:ikeSA:success:reportEAPError:]";
      _os_log_fault_impl(&dword_1876B1000, v172, OS_LOG_TYPE_FAULT, "%s called with null request", buf, 0xCu);
    }

    goto LABEL_184;
  }

  if (*(void *)(a1 + 168))
  {
    id v11 = 0LL;
    goto LABEL_7;
  }

  id v27 = v9;
  v28 = v10;
  self = v28;
  if (v28)
  {
    id v29 = v28;
    int v205 = 0;
    int v30 = +[NEIKEv2EAP codeForPayload:]((uint64_t)&OBJC_CLASS___NEIKEv2EAP, v27);
    if (v30 != 1)
    {
      int v51 = v30;
      ne_log_obj();
      log = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v51;
        _os_log_error_impl(&dword_1876B1000, log, OS_LOG_TYPE_ERROR, "error: received EAP packet with code %u", buf, 8u);
      }

      id v11 = (void *)MEMORY[0x189604A58];
      goto LABEL_179;
    }

    v193 = a4;
    int v31 = +[NEIKEv2EAP typeForPayload:]((uint64_t)&OBJC_CLASS___NEIKEv2EAP, v27);
    v32 = v29;
    int v33 = v31;
    v35 = (os_log_s *)objc_getProperty(v32, v34, 96LL, 1);
    log = v35;
    if (v33 != 1)
    {
      -[os_log_s eapProtocols](v35, "eapProtocols");
      v36 = a5;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [v37 count];

      a5 = v36;
      if (v38)
      {
        id v188 = v27;
        v190 = v10;
        __int128 v203 = 0u;
        __int128 v204 = 0u;
        __int128 v201 = 0u;
        __int128 v202 = 0u;
        v39 = -[os_log_s eapProtocols](log, "eapProtocols");
        uint64_t v40 = [v39 countByEnumeratingWithState:&v201 objects:v207 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v202;
          while (2)
          {
            for (uint64_t i = 0LL; i != v41; ++i)
            {
              if (*(void *)v202 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              if (v44)
              {
                unint64_t v46 = [*(id *)(*((void *)&v201 + 1) + 8 * i) method] - 2;
                if (v46 <= 5 && dword_187872E50[v46] == v33)
                {
                  objc_setProperty_atomic((id)a1, v45, v44, 160LL);
                  goto LABEL_74;
                }
              }
            }

            uint64_t v41 = [v39 countByEnumeratingWithState:&v201 objects:v207 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }

- (CFDataRef)sessionKey
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a1) {
    goto LABEL_8;
  }
  if (!*(void *)(a1 + 168))
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = "-[NEIKEv2EAP sessionKey]";
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "%s called with null self.module",  (uint8_t *)&v7,  0xCu);
    }

    goto LABEL_8;
  }

  int v1 = EAPClientModulePluginMasterSessionKeyCopyBytes();
  if (v1 < 1)
  {
LABEL_8:
    CFDataRef v4 = 0LL;
    return v4;
  }

  rsize_t v2 = v1;
  objc_opt_self();
  BOOL v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
  CFDataRef v4 = CFDataCreate(v3, (const UInt8 *)&v7, v2);
  memset_s(&v7, 0x40uLL, 0, v2);
  return v4;
}

@end