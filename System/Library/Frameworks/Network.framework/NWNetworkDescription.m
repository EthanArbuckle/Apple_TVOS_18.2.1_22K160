@interface NWNetworkDescription
+ (int64_t)getNewStateFromPathMatch:(BOOL)a3 oldState:(int64_t)a4 probeExists:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPath:(id)a3;
- (NSSet)dnsSearchDomainOptions;
- (NSSet)dnsServerAddressOptions;
- (NSSet)interfaceTypeOptions;
- (NSSet)ssidOptions;
- (NSString)privateDescription;
- (NSURL)probeURL;
- (NWNetworkDescription)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)roamingPreference;
- (int64_t)state;
- (unint64_t)hash;
- (void)setDnsSearchDomainOptions:(id)a3;
- (void)setDnsServerAddressOptions:(id)a3;
- (void)setInterfaceTypeOptions:(id)a3;
- (void)setProbeURL:(id)a3;
- (void)setRoamingPreference:(int64_t)a3;
- (void)setSsidOptions:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateStateWithPath:(id)a3;
@end

@implementation NWNetworkDescription

- (BOOL)matchesPath:(id)a3
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v66 = "-[NWNetworkDescription matchesPath:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v59 = 0;
    if (__nwlog_fault(v14, type, &v59))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v16 = type[0];
        if (!os_log_type_enabled(v15, type[0])) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path";
LABEL_37:
        v31 = v15;
        os_log_type_t v32 = v16;
        goto LABEL_38;
      }

      if (!v59)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v16 = type[0];
        if (!os_log_type_enabled(v15, type[0])) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path, backtrace limit exceeded";
        goto LABEL_37;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type[0];
      BOOL v20 = os_log_type_enabled(v15, type[0]);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_39:

          if (!v14) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }

        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path, no backtrace";
        v31 = v15;
        os_log_type_t v32 = v19;
LABEL_38:
        _os_log_impl(&dword_181A5C000, v31, v32, v17, buf, 0xCu);
        goto LABEL_39;
      }

      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v66 = "-[NWNetworkDescription matchesPath:]";
        __int16 v67 = 2082;
        v68 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v15,  v19,  "%{public}s called with null path, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v14) {
      goto LABEL_24;
    }
LABEL_23:
    free(v14);
    goto LABEL_24;
  }

  if ([v5 status] == 1)
  {
    v7 = -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    v8 = v7;
    if (v7)
    {
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v3 = *(Class **)v56;
        while (2)
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(Class **)v56 != v3) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend( v6,  "usesInterfaceType:",  objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "integerValue")))
            {

              goto LABEL_26;
            }
          }

          uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      goto LABEL_81;
    }

- (void)updateStateWithPath:(id)a3
{
  BOOL v4 = -[NWNetworkDescription matchesPath:](self, "matchesPath:", a3);
  int64_t v5 = -[NWNetworkDescription state](self, "state");
  -[NWNetworkDescription probeURL](self, "probeURL");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription setState:]( self,  "setState:",  +[NWNetworkDescription getNewStateFromPathMatch:oldState:probeExists:]( &OBJC_CLASS___NWNetworkDescription,  "getNewStateFromPathMatch:oldState:probeExists:",  v4,  v5,  v6 != 0LL));
}

- (NWNetworkDescription)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  v8 = -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
  [v7 appendPrettyObject:v8 withName:@"interfaceType" indent:v5 showFullContent:1];

  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"ssid" indent:v5 showFullContent:1];

  -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"dnsSearchDomain" indent:v5 showFullContent:1];

  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"dnsServerAddress" indent:v5 showFullContent:1];

  int64_t v12 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
  id v13 = (NWNetworkDescription *)v7;
  v14 = @"roaming";
  if (v12 == 1)
  {
    v15 = @"%@Required";
  }

  else
  {
    if (v12 != 2) {
      goto LABEL_6;
    }
    v15 = @"%@Prohibited";
  }

  objc_msgSend(NSString, "stringWithFormat:", v15, @"roaming");
  os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription appendPrettyBOOL:withName:indent:](v13, "appendPrettyBOOL:withName:indent:", 1LL, v16, v5);

LABEL_6:
  v17 = -[NWNetworkDescription probeURL](self, "probeURL");
  [v17 absoluteString];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription appendPrettyObject:withName:indent:showFullContent:]( v13,  "appendPrettyObject:withName:indent:showFullContent:",  v18,  @"probeURL",  v5,  1LL);

  if (v4)
  {
    unint64_t v19 = -[NWNetworkDescription state](self, "state");
    if (v19 >= 4) {
      BOOL v20 = (__CFString *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"Unknown[%lld]", v19);
    }
    else {
      BOOL v20 = off_189BBE198[v19];
    }
    -[NWNetworkDescription appendPrettyObject:withName:indent:showFullContent:]( v13,  "appendPrettyObject:withName:indent:showFullContent:",  v20,  @"state",  v5,  1LL);
  }

  return v13;
}

- (id)description
{
  return  -[NWNetworkDescription descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWNetworkDescription descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)objc_opt_new();
  -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x189604010]);
    v8 = -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    id v9 = (void *)[v7 initWithSet:v8 copyItems:1];
    [v4 setInterfaceTypeOptions:v9];
  }

  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x189604010]);
    -[NWNetworkDescription ssidOptions](self, "ssidOptions");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)[v12 initWithSet:v13 copyItems:1];
    [v4 setSsidOptions:v14];
  }
  v15 = -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x189604010]);
    v18 = -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    unint64_t v19 = (void *)[v17 initWithSet:v18 copyItems:1];
    [v4 setDnsSearchDomainOptions:v19];
  }

  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 count];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x189604010]);
    -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (void *)[v22 initWithSet:v23 copyItems:1];
    [v4 setDnsServerAddressOptions:v24];
  }

  objc_msgSend(v4, "setRoamingPreference:", -[NWNetworkDescription roamingPreference](self, "roamingPreference"));
  v25 = -[NWNetworkDescription probeURL](self, "probeURL");
  if (v25)
  {
    v26 = -[NWNetworkDescription probeURL](self, "probeURL");
    int v27 = (void *)[v26 copy];
    [v4 setProbeURL:v27];
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 interfaceTypeOptions];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = areNSSetsEqual(v6, v7);

    if (!v8) {
      goto LABEL_10;
    }
    -[NWNetworkDescription ssidOptions](self, "ssidOptions");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 ssidOptions];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = areNSSetsEqual(v9, v10);

    if (!v11) {
      goto LABEL_10;
    }
    -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 dnsSearchDomainOptions];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = areNSSetsEqual(v12, v13);

    if (!v14) {
      goto LABEL_10;
    }
    v15 = -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
    [v5 dnsServerAddressOptions];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = areNSSetsEqual(v15, v16);

    if (!v17) {
      goto LABEL_10;
    }
    int64_t v18 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
    if (v18 == [v5 roamingPreference])
    {
      -[NWNetworkDescription probeURL](self, "probeURL");
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 probeURL];
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = NWUtilsAreNSObjectsEqual(v19, v20);
    }

    else
    {
LABEL_10:
      char v21 = 0;
    }
  }

  else
  {
    char v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 hash] ^ v4;
  -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 hash];
  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int64_t v11 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
  -[NWNetworkDescription probeURL](self, "probeURL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = v10 ^ v11 ^ [v12 hash];

  return v13;
}

- (NSSet)interfaceTypeOptions
{
  return (NSSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInterfaceTypeOptions:(id)a3
{
}

- (NSSet)ssidOptions
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSsidOptions:(id)a3
{
}

- (NSSet)dnsSearchDomainOptions
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDnsSearchDomainOptions:(id)a3
{
}

- (NSSet)dnsServerAddressOptions
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDnsServerAddressOptions:(id)a3
{
}

- (int64_t)roamingPreference
{
  return self->_roamingPreference;
}

- (void)setRoamingPreference:(int64_t)a3
{
  self->_roamingPreference = a3;
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProbeURL:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

+ (int64_t)getNewStateFromPathMatch:(BOOL)a3 oldState:(int64_t)a4 probeExists:(BOOL)a5
{
  int64_t v5 = 1LL;
  if (a5) {
    int64_t v5 = 2LL;
  }
  if (a3) {
    int64_t v6 = a4;
  }
  else {
    int64_t v6 = 0LL;
  }
  if (!a3) {
    int64_t v5 = 0LL;
  }
  if (a4) {
    return v6;
  }
  else {
    return v5;
  }
}

@end