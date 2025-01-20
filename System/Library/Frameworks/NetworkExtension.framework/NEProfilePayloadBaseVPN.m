@interface NEProfilePayloadBaseVPN
- (BOOL)setPostprocessedPayloadContents:(id)a3;
- (NEProfilePayloadBaseVPN)initWithPayload:(id)a3;
- (id)getPreprocessedPayloadContents;
- (id)validatePayload;
@end

@implementation NEProfilePayloadBaseVPN

- (NEProfilePayloadBaseVPN)initWithPayload:(id)a3
{
  uint64_t v111 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_large_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v108 = (id)objc_opt_class();
    __int16 v109 = 2112;
    id v110 = v4;
    id v40 = v108;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "%@ NEProfilePayloadVPNBase initWithPayload: payloadDict %@",  buf,  0x16u);
  }

  v106.receiver = self;
  v106.super_class = (Class)&OBJC_CLASS___NEProfilePayloadBaseVPN;
  v6 = -[NEProfilePayloadBase initWithPayload:](&v106, sel_initWithPayload_, v4);
  ne_log_large_obj();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v41 = -[NEProfilePayloadBase payloadAtom](v6, "payloadAtom");
    *(_DWORD *)buf = 138412546;
    id v108 = v6;
    __int16 v109 = 2112;
    id v110 = v41;
    _os_log_debug_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEBUG,  "NEProfilePayloadVPNBase initWithPayload: self %@,  cached atom %@",  buf,  0x16u);
  }

  id v8 = v4;
  if (v6)
  {
    ne_log_large_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v42 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v108 = v42;
      __int16 v109 = 2112;
      id v110 = v8;
      id v43 = v42;
      _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "%@ extractPayloadContents: payloadDict %@",  buf,  0x16u);
    }

    if (v8)
    {
      [v8 objectForKeyedSubscript:@"Proxies"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        [v10 objectForKeyedSubscript:@"HTTPProxyAuthenticated"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            v6->_proxyUserNameRequired = [v12 intValue] != 0;
          }
          uint64_t v13 = [v11 objectForKeyedSubscript:@"HTTPProxyUsername"];
          proxyUserName = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v13;
        }

        else
        {
          uint64_t v16 = [v11 objectForKeyedSubscript:@"HTTPProxyUsername"];
          v17 = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v16;

          v6->_proxyUserNameRequired = v6->_proxyUserName != 0LL;
        }

        v6->_proxyPasswordRequired = v6->_proxyUserNameRequired;
        [v11 objectForKeyedSubscript:@"HTTPProxyPassword"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v15 = 0LL;
      }

      else {
        v18 = v15;
      }
      proxyPassword = v6->_proxyPassword;
      v6->_proxyPassword = v18;

      id v20 = v8;
      [v20 objectForKeyedSubscript:@"PPP"];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        [v21 objectForKeyedSubscript:@"AuthEAPPlugins"];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23) {
          int v25 = [v23 containsObject:@"EAP-RSA"];
        }
        else {
          int v25 = 0;
        }
      }

      else
      {
        int v25 = 0;
      }

      [v20 objectForKeyedSubscript:@"IPSec"];
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        [v26 objectForKeyedSubscript:@"XAuthPasswordEncryption"];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27) {
          int v29 = [v27 isEqualToString:@"Prompt"];
        }
        else {
          int v29 = 0;
        }
      }

      else
      {
        int v29 = 0;
      }

      [v20 objectForKeyedSubscript:@"VPNType"];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v30 isEqualToString:@"IPSec"])
      {
        [v20 objectForKeyedSubscript:@"IPSec"];
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          [v31 objectForKeyedSubscript:@"AuthenticationMethod"];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v32;
          if (v32)
          {
            if ([v32 isEqualToString:@"SharedSecret"])
            {
              uint64_t v33 = [v31 objectForKeyedSubscript:@"XAuthName"];
              userName = v6->_userName;
              v6->_userName = (NSString *)v33;

              v6->_userNameRequired = 1;
            }

            if (v25 && v29 || ([v26 isEqualToString:@"Certificate"] & 1) != 0) {
              goto LABEL_60;
            }
          }

          else if (v25 && v29)
          {
            goto LABEL_60;
          }

          [v31 objectForKeyedSubscript:@"PayloadCertificateUUID"];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
          }

          else
          {
            [v31 objectForKeyedSubscript:@"PayloadCertificateIdentityUUID"];
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v44)
            {
              [v31 objectForKeyedSubscript:@"XAuthPassword"];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v6->_passwordRequired = 1;
              goto LABEL_61;
            }
          }

- (id)validatePayload
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  ne_log_large_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[NEProfilePayloadBase payloadAtom](self, "payloadAtom");
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_DEBUG,  "NEProfilePayloadBaseVPN validate: To-Do. dict %@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (id)getPreprocessedPayloadContents
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = v3;
  userName = self->_userName;
  if (userName) {
    [v3 setValue:userName forKey:@"AuthName"];
  }
  if (self->_userNameRequired) {
    [v4 setValue:@"1" forKey:@"AuthNameRequired"];
  }
  password = self->_password;
  if (password) {
    [v4 setValue:password forKey:@"AuthPassword"];
  }
  if (self->_passwordRequired) {
    [v4 setValue:@"1" forKey:@"AuthPasswordRequired"];
  }
  proxyUserName = self->_proxyUserName;
  if (proxyUserName) {
    [v4 setValue:proxyUserName forKey:@"HTTPProxyUsername"];
  }
  if (self->_proxyUserNameRequired) {
    [v4 setValue:@"1" forKey:@"HTTPProxyUsernameRequired"];
  }
  proxyPassword = self->_proxyPassword;
  if (proxyPassword) {
    [v4 setValue:proxyPassword forKey:@"HTTPProxyPassword"];
  }
  if (self->_proxyPasswordRequired) {
    [v4 setValue:self->_proxyPassword forKey:@"HTTPProxyPasswordRequired"];
  }
  sharedSecret = self->_sharedSecret;
  if (sharedSecret) {
    [v4 setValue:sharedSecret forKey:@"SharedSecret"];
  }
  if (self->_sharedSecretRequired) {
    [v4 setValue:@"1" forKey:@"SharedSecretRequired"];
  }
  pin = self->_pin;
  if (pin) {
    [v4 setValue:pin forKey:@"PromptForVPNPIN"];
  }
  if (self->_pinRequired) {
    [v4 setValue:@"1" forKey:@"PromptForVPNPINRequired"];
  }
  ne_log_large_obj();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "NEProfilePayloadBaseVPN getPreprocessedPayloadContents: dict %@",  (uint8_t *)&v13,  0xCu);
  }

  return v4;
}

- (BOOL)setPostprocessedPayloadContents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_large_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138412546;
    *(void *)&v26[4] = objc_opt_class();
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v4;
    id v25 = *(id *)&v26[4];
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "%@ setPostprocessedPayloadContents newContents %@",  v26,  0x16u);
  }

  [v4 objectForKeyedSubscript:@"AuthName"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"AuthName"];
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    userName = self->_userName;
    self->_userName = v7;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", @"AuthPassword", *(_OWORD *)v26, *(void *)&v26[16], v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v4 objectForKeyedSubscript:@"AuthPassword"];
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    password = self->_password;
    self->_password = v10;
  }

  [v4 objectForKeyedSubscript:@"HTTPProxyUsername"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v4 objectForKeyedSubscript:@"HTTPProxyUsername"];
    int v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    proxyUserName = self->_proxyUserName;
    self->_proxyUserName = v13;
  }

  [v4 objectForKeyedSubscript:@"HTTPProxyPassword"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v4 objectForKeyedSubscript:@"HTTPProxyPassword"];
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = v16;
  }

  [v4 objectForKeyedSubscript:@"SharedSecret"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [v4 objectForKeyedSubscript:@"SharedSecret"];
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    sharedSecret = self->_sharedSecret;
    self->_sharedSecret = v19;
  }

  [v4 objectForKeyedSubscript:@"PromptForVPNPIN"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v4 objectForKeyedSubscript:@"PromptForVPNPIN"];
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    pin = self->_pin;
    self->_pin = v22;
  }

  return 1;
}

- (void).cxx_destruct
{
}

@end