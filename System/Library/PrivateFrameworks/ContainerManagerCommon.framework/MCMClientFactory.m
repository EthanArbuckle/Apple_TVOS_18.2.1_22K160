@interface MCMClientFactory
- (MCMClientCodeSignInfoCache)clientCodeSignInfoCache;
- (MCMClientFactory)initWithUserIdentityCache:(id)a3 clientCodeSignInfoCache:(id)a4 clientIdentityCache:(id)a5;
- (MCMClientIdentityCache)clientIdentityCache;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_clientIdentityWithClient:(container_client *)a3 proximateClient:(id)a4 error:(id *)a5;
- (id)_clientIdentityWithClientMessageContext:(id)a3 error:(id *)a4;
- (id)_codeSignInfoWithClient:(container_client *)a3 CDHash:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 error:(id *)a7;
- (id)_proxiedClientIdentityFromMessage:(id)a3 proximateClient:(id)a4 error:(id *)a5;
- (id)clientIdentityWithClientMessageContext:(id)a3 xpcMessage:(id)a4 error:(id *)a5;
@end

@implementation MCMClientFactory

- (MCMClientFactory)initWithUserIdentityCache:(id)a3 clientCodeSignInfoCache:(id)a4 clientIdentityCache:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMClientFactory;
  v12 = -[MCMClientFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentityCache, a3);
    objc_storeStrong((id *)&v13->_clientCodeSignInfoCache, a4);
    objc_storeStrong((id *)&v13->_clientIdentityCache, a5);
  }

  return v13;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMClientCodeSignInfoCache)clientCodeSignInfoCache
{
  return self->_clientCodeSignInfoCache;
}

- (MCMClientIdentityCache)clientIdentityCache
{
  return self->_clientIdentityCache;
}

- (void).cxx_destruct
{
}

- (id)clientIdentityWithClientMessageContext:(id)a3 xpcMessage:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[MCMClientFactory clientIdentityCache](self, "clientIdentityCache");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    [v8 auditToken];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  [v8 personaUniqueString];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = 0LL;
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke;
  v26[3] = &unk_18A29D318;
  v26[4] = self;
  id v12 = v8;
  id v27 = v12;
  *(_OWORD *)buf = 0u;
  __int128 v30 = 0u;
  [v10 clientIdentityWithAuditToken:v31 proximateAuditToken:buf personaUniqueString:v11 error:&v28 generator:v26];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (MCMError *)v28;

  if (v13)
  {
    v25 = v14;
    -[MCMClientFactory _proxiedClientIdentityFromMessage:proximateClient:error:]( self,  "_proxiedClientIdentityFromMessage:proximateClient:error:",  v9,  v13,  &v25);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v25;

    if (v15 || !v16)
    {
      [v13 codeSignInfo];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 entitlements];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v13;
      if (!v15 || (char v21 = [v17 proxyAllowed], v20 = v15, (v21 & 1) != 0))
      {
        id v18 = v20;
        goto LABEL_18;
      }

      v14 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);

      container_log_handle_for_category();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, "Not entitled to proxy", buf, 2u);
      }

      if (!a5) {
        goto LABEL_17;
      }
    }

    else
    {
      objc_super v15 = 0LL;
      v17 = 0LL;
      v14 = v16;
      if (!a5) {
        goto LABEL_17;
      }
    }
  }

  else
  {
    objc_super v15 = 0LL;
    v17 = 0LL;
    if (!a5)
    {
LABEL_17:
      id v18 = 0LL;
      uint64_t v16 = v14;
      goto LABEL_18;
    }
  }

  uint64_t v16 = v14;
  id v18 = 0LL;
  *a5 = v16;
LABEL_18:
  id v23 = v18;

  return v23;
}

- (id)_proxiedClientIdentityFromMessage:(id)a3 proximateClient:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  xpc_dictionary_get_dictionary(a3, "ProxyForClient");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uint64_t v16 = 0LL;
    goto LABEL_14;
  }

  uint64_t v30 = 1LL;
  uint64_t v10 = container_client_copy_decoded_from_xpc_object();
  if (!v10)
  {
    uint64_t v16 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  v30,  3LL);
    container_log_handle_for_category();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
      char v21 = 0LL;
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }

    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = container_get_error_description();
    id v18 = "Invalid proxied client, error = %s";
    v19 = (os_log_s *)v17;
    uint32_t v20 = 12;
LABEL_28:
    _os_log_error_impl(&dword_188846000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_13;
  }

  uint64_t v11 = v10;
  id v12 = containermanager_copy_global_configuration();
  if (![v12 isInternalImage])
  {

    goto LABEL_12;
  }

  char v13 = [v8 isAllowedToTest];

  if ((v13 & 1) == 0)
  {
LABEL_12:
    uint64_t v16 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);
    container_log_handle_for_category();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v18 = "Not allowed to proxy a test client";
    v19 = (os_log_s *)v17;
    uint32_t v20 = 2;
    goto LABEL_28;
  }

- (id)_clientIdentityWithClientMessageContext:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = v6;
  uint64_t v21 = 1LL;
  if (v6)
  {
    [v6 auditToken];
  }

  else
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
  }

  [v7 personaUniqueString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = v24;
  __int128 v23 = v25;
  id v9 = (const char *)container_audit_token_copy_codesign_identifier();
  __s = v9;
  if (v9)
  {
    uint64_t v10 = (char *)v9;
    if (!strncmp("com.apple.installd", v9, 0x13uLL))
    {
      container_log_handle_for_category();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_debug_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEBUG,  "Ignoring client persona because it is identified as installd; persona was = [%@]",
          buf,
          0xCu);
      }

      id v8 = 0LL;
    }

    free(v10);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }

  id v12 = v8;
  [v12 UTF8String];
  *(_OWORD *)buf = v24;
  __int128 v23 = v25;
  uint64_t v13 = container_client_create_from_audit_token();
  if (v13)
  {
    id v19 = 0LL;
    v14 = -[MCMClientFactory _clientIdentityWithClient:proximateClient:error:]( self,  "_clientIdentityWithClient:proximateClient:error:",  v13,  0LL,  &v19);
    objc_super v15 = (MCMError *)v19;
  }

  else
  {
    uint64_t v16 = objc_alloc(&OBJC_CLASS___MCMError);
    objc_super v15 = -[MCMError initWithErrorType:category:](v16, "initWithErrorType:category:", v21, 2LL);
    container_log_handle_for_category();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Could not generate client object from xpc connection; error = %@",
        buf,
        0xCu);
    }

    v14 = 0LL;
  }

  container_free_client();
  if (a4 && !v14) {
    *a4 = v15;
  }

  return v14;
}

- (id)_clientIdentityWithClient:(container_client *)a3 proximateClient:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  container_client_get_audit_token();
  int is_test_client = container_client_is_test_client();
  uint64_t euid = container_client_get_euid();
  unsigned int pid = container_client_get_pid();
  unsigned int platform = container_client_get_platform();
  v54 = v7;
  if (!container_client_is_signed())
  {
    id v22 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  98LL,  3LL);
    container_log_handle_for_category();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Client pid [%d] is not signed or has died.",  buf,  8u);
    }

    goto LABEL_20;
  }

  uint64_t v64 = 0LL;
  *(_OWORD *)buf = v67;
  *(_OWORD *)&uint8_t buf[16] = v68;
  id v12 = (void *)container_audit_token_copy_codesign_hash();
  __s = v12;
  if (!v12)
  {
    container_log_handle_for_category();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)buf = v67;
      *(_OWORD *)&uint8_t buf[16] = v68;
      int v41 = container_audit_token_get_pid();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_188846000, v28, OS_LOG_TYPE_ERROR, "Failed to get codesign hash for pid %d", buf, 8u);
    }

    id v22 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  97LL,  3LL);
LABEL_20:
    __int128 v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    id v18 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v13 = 0LL;
LABEL_21:
    uint64_t v21 = 0LL;
    goto LABEL_22;
  }

  [MEMORY[0x189603F48] dataWithBytes:v12 length:v64];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  free(__s);
  memset_s(&__s, 8uLL, 0, 8uLL);
  uint64_t codesign_identifier = container_client_get_codesign_identifier();
  if (!codesign_identifier
    || ([NSString stringWithUTF8String:codesign_identifier],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    container_log_handle_for_category();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Could not get client identifier for pid [%d]",  buf,  8u);
    }

    id v22 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  97LL,  3LL);
    __int128 v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    id v18 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_21;
  }

  uint64_t v16 = (void *)v15;
  unsigned int v52 = platform;
  uint64_t codesign_team_identifier = container_client_get_codesign_team_identifier();
  if (codesign_team_identifier)
  {
    [NSString stringWithUTF8String:codesign_team_identifier];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (is_test_client) {
      goto LABEL_7;
    }
  }

  else
  {
    id v18 = 0LL;
    if (is_test_client)
    {
LABEL_7:
      if (v7)
      {
        id v19 = containermanager_copy_global_configuration();
        if ([v19 isInternalImage])
        {
          char v20 = [v7 isAllowedToTest];

          if ((v20 & 1) != 0)
          {
            unsigned int v51 = pid;
            id v62 = 0LL;
            -[MCMClientFactory _codeSignInfoWithClient:CDHash:identifier:teamIdentifier:error:]( self,  "_codeSignInfoWithClient:CDHash:identifier:teamIdentifier:error:",  a3,  v13,  v16,  v18,  &v62);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            id v22 = (MCMError *)v62;
            goto LABEL_28;
          }
        }

        else
        {
        }

        container_log_handle_for_category();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_188846000, v39, OS_LOG_TYPE_ERROR, "Cannot use a test client.", buf, 2u);
        }

        v37 = objc_alloc(&OBJC_CLASS___MCMError);
        uint64_t v38 = 55LL;
      }

      else
      {
        container_log_handle_for_category();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_188846000,  v36,  OS_LOG_TYPE_ERROR,  "Cannot use a test client without a proximate client.",  buf,  2u);
        }

        v37 = objc_alloc(&OBJC_CLASS___MCMError);
        uint64_t v38 = 38LL;
      }

      id v22 = -[MCMError initWithErrorType:category:](v37, "initWithErrorType:category:", v38, 3LL);
LABEL_43:
      __int128 v25 = 0LL;
      uint64_t v26 = 0LL;
      uint64_t v27 = 0LL;
      goto LABEL_21;
    }
  }

  unsigned int v51 = pid;
  v33 = -[MCMClientFactory clientCodeSignInfoCache](self, "clientCodeSignInfoCache");
  id v61 = 0LL;
  v56[0] = MEMORY[0x1895F87A8];
  v56[1] = 3221225472LL;
  v56[2] = __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke;
  v56[3] = &unk_18A29D368;
  v56[4] = self;
  v60 = a3;
  id v57 = v13;
  id v58 = v16;
  id v59 = v18;
  [v33 codeSignInfoForCDHash:v57 identifier:v58 error:&v61 generator:v56];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = (MCMError *)v61;

LABEL_28:
  if (!v21)
  {
    container_log_handle_for_category();
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v22;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Could not generate codesign info from xpc connection; error = %@",
        buf,
        0xCu);
    }

    goto LABEL_43;
  }

  char is_sandboxed = container_client_is_sandboxed();
  -[MCMClientFactory userIdentityCache](self, "userIdentityCache");
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v22;
  [v34 userIdentityForClient:a3 error:&v55];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v55;

  if (!v27)
  {
    container_log_handle_for_category();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v22 = v50;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v51;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v50;
      _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Could not compute user identity for client %d; error = %@",
        buf,
        0x12u);
    }

    __int128 v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
LABEL_22:
    id v29 = 0LL;
    uint64_t v30 = a5;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }

  bzero(v65, 0x401uLL);
  *(_OWORD *)buf = v67;
  *(_OWORD *)&uint8_t buf[16] = v68;
  if (sandbox_container_path_for_audit_token())
  {
    uint64_t v26 = 0LL;
  }

  else
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v65 isDirectory:1 relativeToURL:0];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v42 = +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", euid);
  if (!v42)
  {
    id v22 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  75LL,  3LL);

    container_log_handle_for_category();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = euid;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v51;
      _os_log_error_impl( &dword_188846000,  v45,  OS_LOG_TYPE_ERROR,  "Could not generate user details for euid %d from pid %d",  buf,  0xEu);
    }

    __int128 v25 = 0LL;
    goto LABEL_22;
  }

  __int128 v25 = (void *)v42;
  container_log_handle_for_category();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = a5;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    [v27 shortDescription];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v46;
    _os_log_debug_impl( &dword_188846000,  v43,  OS_LOG_TYPE_DEBUG,  "Generating new client identity for [%@/%@]",  buf,  0x16u);

    uint64_t v30 = a5;
  }

  v44 = objc_alloc(&OBJC_CLASS___MCMClientIdentity);
  *(_OWORD *)buf = v67;
  *(_OWORD *)&uint8_t buf[16] = v68;
  LOWORD(v48) = is_test_client;
  LOBYTE(v47) = is_sandboxed;
  id v29 = -[MCMClientIdentity initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:]( v44,  "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxCont ainerURL:testClient:kernel:",  v25,  v51,  v52,  v27,  v54,  buf,  v21,  v47,  v26,  v48);
  id v22 = v50;
  if (v30)
  {
LABEL_23:
    if (!v29) {
      *uint64_t v30 = v22;
    }
  }

- (id)_codeSignInfoWithClient:(container_client *)a3 CDHash:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  container_client_get_audit_token();
  __int128 v29 = v31;
  __int128 v30 = v32;
  uint64_t codesign_status = container_audit_token_get_codesign_status();
  int pid = container_client_get_pid();
  if ((codesign_status & 1) == 0)
  {
    uint64_t v15 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  98LL,  3LL,  v29,  v30);
    container_log_handle_for_category();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Client pid [%d] is not signed or has died.",  (uint8_t *)&v29,  8u);
    }

LABEL_17:
    id v22 = 0LL;
    id v18 = 0LL;
    goto LABEL_18;
  }

  v17 = (void *)container_client_copy_entitlement();
  if (!v17 || (id v18 = (void *)_CFXPCCreateCFObjectFromXPCObject()) == 0LL)
  {
    if ((container_client_is_alive() & 1) == 0)
    {
      uint64_t v15 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  98LL,  3LL,  v29,  v30);
      container_log_handle_for_category();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v29) = 67109120;
        DWORD1(v29) = pid;
        _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Client pid [%d] has died, failed to fetch entitlements.",  (uint8_t *)&v29,  8u);
      }

      goto LABEL_17;
    }

    id v18 = (void *)MEMORY[0x189604A60];
  }

  id v19 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  id v20 = containermanager_copy_global_configuration();
  objc_msgSend(v20, "classIterator", v29, v30);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v19,  "initWithEntitlements:clientIdentifier:classIterator:",  v18,  v11,  v21);

  container_log_handle_for_category();
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Could not initialize entitlements for pid [%d]",  (uint8_t *)&v29,  8u);
    }

    uint64_t v15 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  97LL,  3LL);
    id v22 = 0LL;
LABEL_18:
    __int128 v25 = 0LL;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v29) = 138412290;
    *(void *)((char *)&v29 + 4) = v11;
    _os_log_debug_impl( &dword_188846000,  v24,  OS_LOG_TYPE_DEBUG,  "Generating new codesign info blob for [%@]",  (uint8_t *)&v29,  0xCu);
  }

  __int128 v25 = -[MCMClientCodeSignInfo initWithCDHash:entitlements:identifier:teamIdentifier:status:]( objc_alloc(&OBJC_CLASS___MCMClientCodeSignInfo),  "initWithCDHash:entitlements:identifier:teamIdentifier:status:",  v10,  v22,  v11,  v12,  codesign_status);
  uint64_t v15 = 0LL;
  if (a7)
  {
LABEL_19:
    if (!v25) {
      *a7 = v15;
    }
  }

uint64_t __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _codeSignInfoWithClient:*(void *)(a1 + 64) CDHash:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) teamIdentifier:*(void *)(a1 + 56) error:a2];
}

uint64_t __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientIdentityWithClient:*(void *)(a1 + 48) proximateClient:*(void *)(a1 + 40) error:a2];
}

uint64_t __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientIdentityWithClientMessageContext:*(void *)(a1 + 40) error:a2];
}

@end