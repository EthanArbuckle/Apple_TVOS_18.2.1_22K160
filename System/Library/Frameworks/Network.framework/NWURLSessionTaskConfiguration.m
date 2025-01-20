@interface NWURLSessionTaskConfiguration
- (id)URLCredentialStorage;
- (id)activity;
- (id)createRegistrableDomain:(void *)a1;
- (id)initWithConfiguration:(void *)a3 task:(void *)a4 request:;
- (void)configureConnection:(uint64_t)a1;
- (void)configureParameters:(id *)a1;
- (void)configureSecProtocolOptions:(uint64_t)a1;
@end

@implementation NWURLSessionTaskConfiguration

- (void).cxx_destruct
{
}

- (id)initWithConfiguration:(void *)a3 task:(void *)a4 request:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___NWURLSessionTaskConfiguration;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void)configureParameters:(id *)a1
{
  uint64_t v131 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    v5 = (id *)a1[3];
    v6 = v5;
    if (v5)
    {
      id v7 = v5[50];
      id v8 = v7;
      if (v7) {
        id v9 = (void *)*((void *)v7 + 20);
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
      id v9 = 0LL;
    }

    id v10 = v9;
    nw_parameters_set_context(v4, v10);

    v11 = a1 + 4;
    int v12 = [a1[4] _explicitlySetNetworkServiceType];
    objc_super v13 = a1 + 2;
    uint64_t v14 = 2LL;
    if (v12) {
      uint64_t v14 = 4LL;
    }
    unint64_t v15 = [a1[v14] networkServiceType];
    if (v15 > 0xB) {
      int v16 = 0;
    }
    else {
      int v16 = dword_1826671C0[v15];
    }
    nw_parameters_set_traffic_class(v4, v16);
    else {
      v17 = a1 + 2;
    }
    if (([*v17 allowsCellularAccess] & 1) == 0) {
      nw_parameters_prohibit_interface_type((nw_parameters_t)v4, nw_interface_type_cellular);
    }
    else {
      v18 = a1 + 2;
    }
    if (([*v18 allowsExpensiveNetworkAccess] & 1) == 0) {
      nw_parameters_set_prohibit_expensive((nw_parameters_t)v4, 1);
    }
    else {
      v19 = a1 + 2;
    }
    if (([*v19 allowsConstrainedNetworkAccess] & 1) == 0) {
      nw_parameters_set_prohibit_constrained((nw_parameters_t)v4, 1);
    }
    else {
      v20 = a1 + 2;
    }
    if (([*v13 waitsForConnectivity] & 1) == 0) {
      nw_parameters_set_indefinite(v4, 0);
    }
    if (!*v11) {
      goto LABEL_231;
    }
    CFURLRequestGetProxySettings();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v21) {
      goto LABEL_231;
    }
    *(void *)objects = _CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v22 = xpc_array_create((xpc_object_t *)objects, 1uLL);
    v23 = v22;
    id v24 = v22 ? nw_proxy_configs_create_with_schema_array(v22) : 0LL;

    if (!v24)
    {
LABEL_231:
      v25 = (id *)a1[3];
      if (v25)
      {
        id v26 = v25[50];
        v21 = (char *)v26;
        if (v26)
        {
          v27 = (void *)*((void *)v26 + 10);
          if (!v27)
          {
            [*((id *)v26 + 12) connectionProxyDictionary];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              *(void *)objects = _CFXPCCreateXPCObjectFromCFObject();
              xpc_object_t v29 = xpc_array_create((xpc_object_t *)objects, 1uLL);
              v30 = v29;
              if (v29)
              {
                id v31 = nw_proxy_configs_create_with_schema_array(v29);
                v32 = (void *)*((void *)v21 + 10);
                *((void *)v21 + 10) = v31;
              }
            }

            v27 = (void *)*((void *)v21 + 10);
          }

          id v24 = v27;
        }

        else
        {
          id v24 = 0LL;
        }
      }

      else
      {
        v21 = 0LL;
        id v24 = 0LL;
      }

      if (!v24)
      {
        id v126 = 0LL;
LABEL_52:
        objc_msgSend(*v13, "_sourceApplicationBundleIdentifier", v114, v117);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          [*v13 _sourceApplicationBundleIdentifier];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [*v13 _sourceApplicationAuditTokenData];
          id v24 = (id)objc_claimAutoreleasedReturnValue();

          v36 = (const char *)[v35 UTF8String];
          if (v24) {
            nw_parameters_set_effective_bundle_id(v4, v36);
          }
          else {
            nw_parameters_set_source_application_by_bundle_id_internal(v4, v36);
          }
        }

        [*v13 _sourceApplicationSecondaryIdentifier];
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          [*v13 _sourceApplicationSecondaryIdentifier];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          nw_parameters_set_account_id(v4, (const char *)[v38 UTF8String]);
        }

        [*v13 _sourceApplicationAuditTokenData];
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          [*v13 _sourceApplicationAuditTokenData];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v40 length] != 32)
          {
            _os_crash();
            __break(1u);
            goto LABEL_87;
          }

          v41 = (_OWORD *)[v40 bytes];
          *(_OWORD *)objects = *v41;
          *(_OWORD *)&objects[16] = v41[1];
          nw_parameters_set_source_application(v4, (__int128 *)objects);
        }

        [*v13 _CTDataConnectionServiceType];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          [*v11 boundInterfaceIdentifier];
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v44 = v43 == 0LL;

          if (v44)
          {
            xpc_object_t v45 = xpc_array_create(0LL, 0LL);
            xpc_array_set_string(v45, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
            xpc_object_t v46 = xpc_array_create(0LL, 0LL);
            [*v13 _CTDataConnectionServiceType];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            else {
              uint64_t v48 = 0LL;
            }
            xpc_array_set_string(v46, 0xFFFFFFFFFFFFFFFFLL, (const char *)([v47 UTF8String] + v48));
            nw_parameters_set_required_netagent_classes(v4, v45, v46);
          }
        }

        if (![*v13 _preventsSystemHTTPProxyAuthentication])
        {
LABEL_74:
          objc_msgSend(*v13, "_attributedBundleIdentifier", v115, v118);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v52 = v51 == 0LL;

          if (!v52)
          {
            [*v13 _attributedBundleIdentifier];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            nw_parameters_set_attributed_bundle_identifier(v4, (const char *)[v53 UTF8String]);
          }

          nw_parameters_set_skip_stack_trace_capture(v4, 1);
          uint64_t v54 = [a1[3] countOfBytesClientExpectsToSend];
          uint64_t v55 = [a1[3] countOfBytesClientExpectsToReceive];
          nw_parameters_set_expected_workload(v4, (v55 & ~(v55 >> 63)) + (v54 & ~(v54 >> 63)));
          if ([a1[4] attribution] == 1) {
            nw_parameters_set_attribution((nw_parameters_t)v4, nw_parameters_attribution_user);
          }
          [*v11 mainDocumentURL];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 host];
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          v40 = -[NWURLSessionTaskConfiguration createRegistrableDomain:](v21);
          id v57 = *v11;
          [v57 URL];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          [v58 host];
          id v24 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v127 = -[NWURLSessionTaskConfiguration createRegistrableDomain:](v24);
          [*v11 _trackerContext];
          v59 = (char *)objc_claimAutoreleasedReturnValue();
          unint64_t v2 = (unint64_t)v59;
          if (v59) {
            goto LABEL_79;
          }
          [*v11 mainDocumentURL];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v60)
          {
            [v60 scheme];
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v63 = [v62 length] - 2;
            if (v63 >= 4)
            {
            }

            else
            {
              BOOL v64 = [v62 caseInsensitiveCompare:off_189BB7FE8[v63]] == 0;

              if (v64)
              {
                v59 = (char *)v40;
                if (v40 || (v59 = v21) != 0LL) {
LABEL_79:
                }
                  nw_parameters_set_attribution_context(v4, (const char *)[v59 UTF8String]);
              }
            }
          }

- (id)createRegistrableDomain:(void *)a1
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  unint64_t v2 = v1;
  if (!v1)
  {
    v3 = 0LL;
LABEL_35:

    return v3;
  }

  id v4 = v1;
  unint64_t v5 = [v4 length];
  if (v5 >= 0x101) {
    goto LABEL_22;
  }
  unint64_t v6 = v5;
  if (!v5)
  {
    __nwlog_obj();
    xpc_object_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    *(_DWORD *)dest = 136446210;
    id v31 = "strict_malloc";
    LODWORD(v27) = 12;
    id v26 = dest;
    v23 = (void *)_os_log_send_and_compose_impl();

    id result = (id)__nwlog_abort((uint64_t)v23);
    if ((_DWORD)result) {
      goto LABEL_41;
    }
    free(v23);
  }

  id v7 = (unsigned __int16 *)malloc(2 * v6);
  if (v7)
  {
    objc_msgSend(v4, "getCharacters:range:", v7, 0, v6);
    if (!v6)
    {
LABEL_21:
      free(v7);
      goto LABEL_22;
    }

void __57__NWURLSessionTaskConfiguration_createIDNAEncodedDomain___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  code[0] = U_ZERO_ERROR;
  createIDNAEncodedDomain__idna = MEMORY[0x186E12348](60LL, code);
  if (code[0] >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v0 = (os_log_s *)(id)gLogObj;
    os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
    id v1 = u_errorName(code[0]);
    code[1] = 136446466;
    id v4 = "-[NWURLSessionTaskConfiguration createIDNAEncodedDomain:]_block_invoke";
    __int16 v5 = 2080;
    unint64_t v6 = v1;
    unint64_t v2 = (void *)_os_log_send_and_compose_impl();

    else {
      free(v2);
    }
  }

- (void)configureSecProtocolOptions:(uint64_t)a1
{
  options = a2;
  if (a1)
  {
    sec_protocol_options_set_min_tls_protocol_version( options,  (tls_protocol_version_t)[*(id *)(a1 + 16) TLSMinimumSupportedProtocolVersion]);
    sec_protocol_options_set_max_tls_protocol_version( options,  (tls_protocol_version_t)[*(id *)(a1 + 16) TLSMaximumSupportedProtocolVersion]);
  }
}

- (void)configureConnection:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    v3 = -[NWURLSessionTaskConfiguration activity](a1);
    nw_connection_start_activity(v6, v3);

    uint64_t v4 = [*(id *)(a1 + 24) countOfBytesClientExpectsToSend];
    if (v4 >= 1) {
      nw_connection_increment_estimated_bytes(v6, 0, v4);
    }
    uint64_t v5 = [*(id *)(a1 + 24) countOfBytesClientExpectsToReceive];
    if (v5 >= 1) {
      nw_connection_increment_estimated_bytes(v6, 1, v5);
    }
  }
}

- (id)activity
{
  if (a1)
  {
    unint64_t v2 = (id *)(a1 + 40);
    id v1 = *(void **)(a1 + 40);
    if (v1)
    {
      id v3 = v1;
    }

    else
    {
      id v4 = *(id *)(a1 + 24);
      objc_msgSend(v4, "_nw_activity");
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        id v3 = nw_activity_create(12, 2);
        nw_activity_activate(v3);
      }

      objc_storeStrong(v2, v3);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (id)URLCredentialStorage
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1)
  {
    id v4 = 0LL;
    goto LABEL_14;
  }

  if (!*(_BYTE *)(v1 + 21))
  {
    id v3 = *(id *)(v1 + 400);
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = (void *)*((void *)v3 + 7);
      if (!v5)
      {
        [*((id *)v3 + 12) URLCredentialStorage];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = v6;
        if (v6)
        {
          uint64_t v8 = v6;
          char v9 = objc_alloc_init(&OBJC_CLASS___NWConcrete_nw_authentication_credential_storage);
          credentialStorage = v9->credentialStorage;
          v9->credentialStorage = v8;

          int v11 = (void *)v4[7];
          v4[7] = v9;
        }

        uint64_t v5 = (void *)v4[7];
      }

      id v2 = v5;
      goto LABEL_11;
    }

@end