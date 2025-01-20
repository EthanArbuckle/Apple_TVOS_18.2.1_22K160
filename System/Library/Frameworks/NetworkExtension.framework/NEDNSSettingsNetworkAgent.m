@interface NEDNSSettingsNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (NEDNSSettings)settings;
- (id)copyAgentData;
- (void)setSettings:(id)a3;
@end

@implementation NEDNSSettingsNetworkAgent

+ (id)agentDomain
{
  return @"SystemConfig";
}

+ (id)agentType
{
  return @"DNSAgent";
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

- (id)copyAgentData
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  v3 = (void *)nw_resolver_config_create();
  nw_resolver_config_set_class();
  v4 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  uint64_t v5 = [v4 dnsProtocol];

  if (v5 != 1)
  {
    if (v5 == 3)
    {
      v6 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
      [v6 proxyAgentUUID];
    }

    else if (v5 != 2)
    {
      v46 = 0LL;
      goto LABEL_40;
    }
  }

  nw_resolver_config_set_protocol();
  v7 = -[NENetworkAgent configurationUUID](self, "configurationUUID");
  [v7 getUUIDBytes:v63];

  nw_resolver_config_set_identifier();
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  v8 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  [v8 servers];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v57;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) UTF8String];
        nw_resolver_config_add_name_server();
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }

    while (v11);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v14 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  [v14 searchDomains];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * j) UTF8String];
        nw_resolver_config_add_search_domain();
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }

    while (v17);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v20 = -[NEDNSSettingsNetworkAgent settings](self, "settings", 0LL);
  [v20 matchDomains];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t k = 0LL; k != v23; ++k)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * k) UTF8String];
        nw_resolver_config_add_match_domain();
      }

      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }

    while (v23);
  }
  v26 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  [v26 proxyAgentUUID];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
    [v28 proxyAgentUUID];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 UUIDString];
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    [v30 UTF8String];
    nw_resolver_config_set_proxy_agent();
  }
  v31 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v33 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
    [v33 serverName];
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    [v34 UTF8String];
    nw_resolver_config_set_provider_name();
    v35 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
    [v35 identityReference];
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      [v36 bytes];
      [v36 length];
      nw_resolver_config_set_identity_reference();
    }
  }
  v37 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
  objc_opt_class();
  char v38 = objc_opt_isKindOfClass();

  if ((v38 & 1) != 0)
  {
    v39 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
    [v39 serverURL];
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v40 resolvingAgainstBaseURL:0];
    [v41 percentEncodedHost];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 percentEncodedPath];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 UTF8String];
    nw_resolver_config_set_provider_name();
    [v43 UTF8String];
    nw_resolver_config_set_provider_path();
    v44 = -[NEDNSSettingsNetworkAgent settings](self, "settings");
    [v44 identityReference];
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      [v45 bytes];
      [v45 length];
      nw_resolver_config_set_identity_reference();
    }
  }

  v46 = (void *)nw_resolver_config_copy_plist_data();
LABEL_40:

  return v46;
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end