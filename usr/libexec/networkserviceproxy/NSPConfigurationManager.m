@interface NSPConfigurationManager
- (BOOL)environmentUsesNonDefaultServer;
- (BOOL)getGeohashSharingPreference;
- (BOOL)getPrivateAccessTokensEnabled;
- (BOOL)policyIncludesUnlimited;
- (BOOL)setUserTier:(unint64_t)a3 resetDate:(id)a4 clearResetDate:(BOOL)a5 changeSource:(unint64_t)a6;
- (NSPConfigurationManager)initWithDelegate:(id)a3 configuration:(id)a4;
- (id)currentConfiguration;
- (id)diagnostics;
- (id)mergeProxyTrafficStateWithCurrentPolicy;
- (unint64_t)configurationSubscriberPoliciesCount;
- (unint64_t)effectiveUserTier;
- (unint64_t)getPrivacyProxyAccountType;
- (void)clearResetDate;
- (void)configurationEnabled:(BOOL)a3;
- (void)copyProxyInfo:(id)a3;
- (void)dealloc;
- (void)handlePathChange:(id)a3;
- (void)publishDailyConfigurationStats;
- (void)refreshConfigurationWithReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)resetConfigurationManager;
- (void)setConfigurationTrialVersion:(int64_t)a3;
- (void)setGeohashOverride:(id)a3;
- (void)setGeohashSharingPreference:(BOOL)a3;
- (void)setInProcessFlowDivert:(BOOL)a3;
- (void)setPreferredPathRoutingEnabled:(BOOL)a3;
- (void)setPrivateAccessTokensAllowTools:(BOOL)a3;
- (void)setPrivateAccessTokensEnabled:(BOOL)a3;
- (void)setProxyAccountType:(unint64_t)a3 unlimited:(BOOL)a4;
- (void)setProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4;
- (void)setResetDate:(id)a3;
- (void)setup;
- (void)updateConfiguration:(id)a3;
@end

@implementation NSPConfigurationManager

- (void)resetConfigurationManager
{
  v2 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  id v30 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  if (v2) {
    configuration = v2->_configuration;
  }
  else {
    configuration = 0LL;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](configuration, "geohashOverride"));
  if (v2) {
    v4 = v2->_configuration;
  }
  else {
    v4 = 0LL;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration preferredPathRoutingEnabledStatus](v4, "preferredPathRoutingEnabledStatus"));
  if (v2) {
    v5 = v2->_configuration;
  }
  else {
    v5 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensEnabledStatus](v5, "privateAccessTokensEnabledStatus"));
  if (v2) {
    v7 = v2->_configuration;
  }
  else {
    v7 = 0LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensAllowTools](v7, "privateAccessTokensAllowTools"));
  if (v2) {
    v9 = v2->_configuration;
  }
  else {
    v9 = 0LL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](v9, "inProcessFlowDivert"));
  if (v2) {
    v11 = v2->_configuration;
  }
  else {
    v11 = 0LL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v11, "proxyTrafficState"));
  if (v2) {
    v13 = v2->_configuration;
  }
  else {
    v13 = 0LL;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v13, "userTier"));
  if (v2) {
    v15 = v2->_configuration;
  }
  else {
    v15 = 0LL;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v15, "proxyAccountType"));
  if (v2) {
    v17 = v2->_configuration;
  }
  else {
    v17 = 0LL;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v17, "proxyAccountUnlimited"));
  if (v2) {
    v19 = v2->_configuration;
  }
  else {
    v19 = 0LL;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](v19, "userPreferredTier"));
  if (v2) {
    v21 = v2->_configuration;
  }
  else {
    v21 = 0LL;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration subscriberEnabledFromNonSettingsApp](v21, "subscriberEnabledFromNonSettingsApp"));
  if (v2) {
    v23 = v2->_configuration;
  }
  else {
    v23 = 0LL;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration lastPrivateCloudComputeEnvironment](v23, "lastPrivateCloudComputeEnvironment"));
  sub_100088028((uint64_t)v2, v24, v25);
  if (v2)
  {
    -[NSPConfiguration setGeohashSharingEnabledStatus:](v2->_configuration, "setGeohashSharingEnabledStatus:", v30);
    -[NSPConfiguration setGeohashOverride:](v2->_configuration, "setGeohashOverride:", v29);
    -[NSPConfiguration setPreferredPathRoutingEnabledStatus:]( v2->_configuration,  "setPreferredPathRoutingEnabledStatus:",  v28);
    -[NSPConfiguration setPrivateAccessTokensEnabledStatus:]( v2->_configuration,  "setPrivateAccessTokensEnabledStatus:",  v6);
    -[NSPConfiguration setPrivateAccessTokensAllowTools:](v2->_configuration, "setPrivateAccessTokensAllowTools:", v8);
    -[NSPConfiguration setInProcessFlowDivert:](v2->_configuration, "setInProcessFlowDivert:", v10);
    -[NSPConfiguration setProxyTrafficState:](v2->_configuration, "setProxyTrafficState:", v12);
    -[NSPConfiguration setUserTier:](v2->_configuration, "setUserTier:", v14);
    -[NSPConfiguration setProxyAccountType:](v2->_configuration, "setProxyAccountType:", v16);
    -[NSPConfiguration setProxyAccountUnlimited:](v2->_configuration, "setProxyAccountUnlimited:", v18);
    -[NSPConfiguration setUserPreferredTier:](v2->_configuration, "setUserPreferredTier:", v20);
    -[NSPConfiguration setSubscriberEnabledFromNonSettingsApp:]( v2->_configuration,  "setSubscriberEnabledFromNonSettingsApp:",  v22);
    v26 = v2->_configuration;
  }

  else
  {
    [0 setGeohashSharingEnabledStatus:v30];
    [0 setGeohashOverride:v29];
    [0 setPreferredPathRoutingEnabledStatus:v28];
    [0 setPrivateAccessTokensEnabledStatus:v6];
    [0 setPrivateAccessTokensAllowTools:v8];
    [0 setInProcessFlowDivert:v10];
    [0 setProxyTrafficState:v12];
    [0 setUserTier:v14];
    [0 setProxyAccountType:v16];
    [0 setProxyAccountUnlimited:v18];
    [0 setUserPreferredTier:v20];
    [0 setSubscriberEnabledFromNonSettingsApp:v22];
    v26 = 0LL;
  }

  -[NSPConfiguration setLastPrivateCloudComputeEnvironment:](v26, "setLastPrivateCloudComputeEnvironment:", v27);
  sub_1000883F4((uint64_t)v2);
}

- (BOOL)policyIncludesUnlimited
{
  v2 = (NSMutableArray *)self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyTrafficState](self, "proxyTrafficState"));
  unsigned int v4 = [v3 unsignedLongLongValue];

  if ((v4 & 0x20000) == 0) {
    return 0;
  }
  v6 = sub_100089A94((id *)&v2->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_100089884(v2, v7);
  v9 = v8;
  if (v8 && -[NSMutableArray containsObject:](v8, "containsObject:", &off_100103698))
  {
    if (v2) {
      Class isa = v2[4].super.super.isa;
    }
    else {
      Class isa = 0LL;
    }
    v11 = isa;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class proxyAccountUnlimited](v11, "proxyAccountUnlimited"));
    if ([v12 BOOLValue])
    {
      char v5 = 1;
    }

    else
    {
      if (v2) {
        Class v13 = v2[4].super.super.isa;
      }
      else {
        Class v13 = 0LL;
      }
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class cloudSubscriptionCheckEnabled](v14, "cloudSubscriptionCheckEnabled"));
      if (v15)
      {
        if (v2) {
          Class v16 = v2[4].super.super.isa;
        }
        else {
          Class v16 = 0LL;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class cloudSubscriptionCheckEnabled](v16, "cloudSubscriptionCheckEnabled"));
        unsigned __int8 v18 = [v17 BOOLValue];

        char v5 = v18 ^ 1;
      }

      else
      {
        char v5 = 0;
      }
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)mergeProxyTrafficStateWithCurrentPolicy
{
  uint64_t v4 = nplog_obj(self, a2, v2);
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Merging current policy with proxy traffic state",  buf,  2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  v7 = configuration;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v7, "proxyTrafficState"));

  if (v8)
  {
    v12 = sub_100089A94((id *)&self->super.isa);
    Class v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = sub_100089884((NSMutableArray *)self, v13);
    v17 = v14;
    if (!v14)
    {
      uint64_t v26 = nplog_obj(0LL, v15, v16);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%@ failed to find conditions in the current policy",  buf,  0xCu);
      }

      uint64_t v25 = 0LL;
      goto LABEL_125;
    }

    if (!-[NSMutableArray containsObject:](v14, "containsObject:", &off_100103698))
    {
LABEL_31:
      if (self) {
        v40 = self->_configuration;
      }
      else {
        v40 = 0LL;
      }
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v41, "proxyTrafficState"));
      unsigned int v43 = [v42 unsignedLongLongValue];

      uint64_t v47 = nplog_obj(v44, v45, v46);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        if (self) {
          v49 = self->_configuration;
        }
        else {
          v49 = 0LL;
        }
        v50 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v50, "proxyTrafficState"));
        id v52 = (id)objc_claimAutoreleasedReturnValue( +[NSPConfiguration proxyTrafficStateToString:]( &OBJC_CLASS___NSPConfiguration,  "proxyTrafficStateToString:",  v51));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
        *(_DWORD *)buf = 138412802;
        v73 = self;
        __int16 v74 = 2112;
        id v75 = v52;
        __int16 v76 = 2112;
        v77 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "%@ merging proxy traffic state [%@] with current proxy policy [%@]",  buf,  0x20u);
      }

      if ((v43 & 0x40000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103728))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103728);
      }

      if ((v43 & 0x80000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103740))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103740);
      }

      if ((v43 & 0x100000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103758))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103758);
      }

      if ((v43 & 0x200000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103770))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103770);
      }

      if ((v43 & 0x10000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103818))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103818);
      }

      if ((v43 & 0x1000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103848))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103848);
      }

      if ((v43 & 0x2000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103860))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103860);
      }

      if ((v43 & 0x4000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103878))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103878);
      }

      if ((v43 & 0x8000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103890))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103890);
      }

      if ((v43 & 0x20000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_100103698))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103698);
      }

      if ((v43 & 0x400000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_1001038A8))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_1001038A8);
      }

      if ((v43 & 0x800000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_1001038C0))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_1001038C0);
      }

      if ((v43 & 0x1000000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_1001038D8))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_1001038D8);
      }

      if ((v43 & 0x2000000) == 0
        && -[NSMutableArray containsObject:](v17, "containsObject:", &off_1001038F0))
      {
        -[NSMutableArray removeObject:](v17, "removeObject:", &off_1001038F0);
      }

      v54 = objc_alloc_init(&OBJC_CLASS___NSPPrivacyProxyPolicy);
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      v55 = v17;
      id v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v67,  v71,  16LL);
      if (v56)
      {
        id v57 = v56;
        uint64_t v58 = *(void *)v68;
        do
        {
          for (i = 0LL; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v68 != v58) {
              objc_enumerationMutation(v55);
            }
            -[NSPPrivacyProxyPolicy addConditions:]( v54,  "addConditions:",  objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)i), "intValue", (void)v67));
          }

          id v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v67,  v71,  16LL);
        }

        while (v57);
      }

      uint64_t v63 = nplog_obj(v60, v61, v62);
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyPolicy description](v54, "description"));
        *(_DWORD *)buf = 138412546;
        v73 = self;
        __int16 v74 = 2112;
        id v75 = v65;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%@ merged privacy proxy policy: [%@]",  buf,  0x16u);
      }

      v27 = v54;
      uint64_t v25 = v27;
LABEL_125:

      goto LABEL_126;
    }

    if (self) {
      unsigned __int8 v18 = self->_configuration;
    }
    else {
      unsigned __int8 v18 = 0LL;
    }
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v19, "proxyAccountUnlimited"));
    if ([v20 BOOLValue])
    {

LABEL_24:
      uint64_t v36 = nplog_obj(v21, v22, v23);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Allowed to use app condition", buf, 2u);
      }

      goto LABEL_31;
    }

    if (self) {
      v28 = self->_configuration;
    }
    else {
      v28 = 0LL;
    }
    v29 = v28;
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v29, "cloudSubscriptionCheckEnabled"));
    if (v30)
    {
      v31 = (void *)v30;
      if (self) {
        v32 = self->_configuration;
      }
      else {
        v32 = 0LL;
      }
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v33, "cloudSubscriptionCheckEnabled"));
      unsigned __int8 v35 = [v34 BOOLValue];

      if ((v35 & 1) == 0) {
        goto LABEL_24;
      }
    }

    else
    {
    }

    uint64_t v38 = nplog_obj(v21, v22, v23);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Not allowed to use app condition", buf, 2u);
    }

    -[NSMutableArray removeObject:](v17, "removeObject:", &off_100103698);
    goto LABEL_31;
  }

  uint64_t v24 = nplog_obj(v9, v10, v11);
  Class v13 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%@ proxy traffic state is nil",  buf,  0xCu);
  }

  uint64_t v25 = 0LL;
LABEL_126:

  return v25;
}

- (id)currentConfiguration
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  return self;
}

- (void)updateConfiguration:(id)a3
{
  id v674 = a3;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  char v5 = configuration;
  id v677 = -[NSPConfiguration copy](v5, "copy");

  unint64_t v6 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (self)
  {
    v7 = self->_configuration;
    -[NSPConfiguration merge:](v7, "merge:", v674);

    v8 = self->_configuration;
  }

  else
  {
    [0 merge:v674];
    v8 = 0LL;
  }

  uint64_t v9 = v8;
  -[NSPConfiguration evaluateEnableRatios](v9, "evaluateEnableRatios");

  unint64_t v10 = sub_10008EDDC((uint64_t)self);
  v679 = self;
  if (self)
  {
    self->_effectiveUserTier = v10;
    uint64_t v11 = self->_configuration;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  v678 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfigurationData](v678, "proxyConfigurationData"));
  Class v13 = (void *)objc_claimAutoreleasedReturnValue([v677 proxyConfigurationData]);
  unint64_t v14 = v12;
  unint64_t v15 = v13;
  uint64_t v16 = (void *)v15;

  int v21 = v17;
  if (v17)
  {
    uint64_t v22 = nplog_obj(v18, v19, v20);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "proxy configuration data changed",  (uint8_t *)&buf,  2u);
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v677 enabled]);
  unint64_t v26 = v24;
  unint64_t v27 = v25;
  v28 = (void *)v27;
  if (v26 | v27 && (!v26 || !v27 || ![(id)v26 isEqual:v27]))
  {

    uint64_t v48 = nplog_obj(v45, v46, v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
      unsigned int v51 = [v50 BOOLValue];
      id v52 = @"disabled";
      if (v51) {
        id v52 = @"enabled";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v52;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "privacy proxy %@", (uint8_t *)&buf, 0xCu);
    }

    if (v679)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v832 = 0x3032000000LL;
      v833 = sub_100086D74;
      v834 = sub_100086D84;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.configEnableStateUpdated");
      v53 = v679->_configuration;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v53, "enabled"));
      unsigned int v55 = [v54 BOOLValue];

      if (v55)
      {
        uint64_t v58 = v679->_configuration;
        -[NSPConfiguration setConfigServerEnabled:](v58, "setConfigServerEnabled:", &__kCFBooleanTrue);

        sub_100088828((uint64_t)v679);
        sub_100086A34((uint64_t)v679);
        sub_100087CDC((id *)&v679->super.isa, v59, v60);
        uint64_t v61 = v679->_configuration;
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v61, "configServerHost"));
        v679->_useDefaultInterface = [v62 isEqualToString:@"mask-api.icloud.com"] ^ 1;

        uint64_t v64 = NPGetInternalQueue(v63);
        v65 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v64);
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472LL;
        uint64_t v809 = (uint64_t)sub_100088A08;
      }

      else
      {
        sub_100087984((uint64_t)v679, v56, v57);
        sub_1000876FC((uint64_t)v679, v66, v67);
        sub_100088028((uint64_t)v679, v68, v69);
        __int128 v70 = v679->_configuration;
        -[NSPConfiguration setEnabled:](v70, "setEnabled:", &__kCFBooleanFalse);

        sub_100088A64((uint64_t)v679);
        id v71 = +[NSPConfigurationSignatureInfo removeFromPreferences]( &OBJC_CLASS___NSPConfigurationSignatureInfo,  "removeFromPreferences");
        v679->_effectiveUserTier = 1LL;
        uint64_t v72 = NPGetInternalQueue(v71);
        v65 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v72);
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472LL;
        uint64_t v809 = (uint64_t)sub_100088AA0;
      }

      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F9428;
      v811 = (void (*)(uint64_t))v679;
      p___int128 buf = &buf;
      dispatch_async(v65, &block);

      _Block_object_dispose(&buf, 8);
    }

    goto LABEL_128;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
  unsigned __int8 v30 = [v29 BOOLValue];

  if ((v30 & 1) == 0) {
    goto LABEL_127;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v678, "configServerHost"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v677 configServerHost]);
  unsigned __int8 v33 = [v31 isEqualToString:v32];

  if ((v33 & 1) == 0)
  {
    uint64_t v73 = nplog_obj(v34, v35, v36);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v678, "configServerHost"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "configuration server host changed to %@",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_24;
  }

  unsigned int v37 = -[NSPConfiguration ignoreInvalidCerts](v678, "ignoreInvalidCerts");
  id v38 = [v677 ignoreInvalidCerts];
  if (v37 != (_DWORD)v38)
  {
    uint64_t v41 = nplog_obj(v38, v39, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v43 = -[NSPConfiguration ignoreInvalidCerts](v678, "ignoreInvalidCerts");
      uint64_t v44 = "no";
      if (v43) {
        uint64_t v44 = "yes";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "ignore invalid certs changed to %s",  (uint8_t *)&buf,  0xCu);
    }

- (void)setConfigurationTrialVersion:(int64_t)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager trialConfigVersion](self, "trialConfigVersion"));
  id v6 = [v5 longValue];

  if (v6 != (id)a3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
    [v9 setTrialConfigVersion:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (void)configurationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager enabled](self, "enabled"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setEnabled:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (void)setResetDate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    if (self) {
      configuration = self->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v8 = -[NSPConfiguration copy](configuration, "copy");
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 willResetSubscriberTierTomorrow]);

    if (!v9) {
      [v8 setWillResetSubscriberTierTomorrow:&off_100103908];
    }
    [v8 setResetTomorrowDate:v6];
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v8);
  }

  else
  {
    uint64_t v10 = nplog_obj(0LL, v4, v5);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      Class v13 = "-[NSPConfigurationManager setResetDate:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null resetDate",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)clearResetDate
{
  uint64_t v2 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  id v3 = -[NSPConfigurationManager copy](self, "copy");
  [v3 setWillResetSubscriberTierTomorrow:&off_100103908];
  [v3 setResetTomorrowDate:0];
  -[NSPConfigurationManager updateConfiguration:](v2, "updateConfiguration:", v3);
}

- (BOOL)setUserTier:(unint64_t)a3 resetDate:(id)a4 clearResetDate:(BOOL)a5 changeSource:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](configuration, "userTier"));
  id v13 = [v12 unsignedIntegerValue];

  if (v13 != (id)a3)
  {
    if (self) {
      uint64_t v19 = self->_configuration;
    }
    else {
      uint64_t v19 = 0LL;
    }
    uint64_t v20 = v19;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v20, "cloudSubscriptionCheckEnabled"));
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      if (self) {
        uint64_t v23 = self->_configuration;
      }
      else {
        uint64_t v23 = 0LL;
      }
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v23, "cloudSubscriptionCheckEnabled"));
      unsigned int v25 = [v24 BOOLValue];

      if (!v25)
      {
LABEL_37:
        if (self) {
          uint64_t v45 = self->_configuration;
        }
        else {
          uint64_t v45 = 0LL;
        }
        id v46 = -[NSPConfiguration copy](v45, "copy");
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
        [v46 setUserTier:v47];

        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
        [v46 setUserPreferredTier:v48];

        if (a3 == 2)
        {
          if (a6 == 1)
          {
            v49 = &off_100103908;
            goto LABEL_49;
          }

          if (a6 == 3)
          {
            v49 = &off_100103920;
LABEL_49:
            [v46 setSubscriberEnabledFromNonSettingsApp:v49];
          }
        }

        else if (a3 == 1 && v10)
        {
          [v46 setWillResetSubscriberTierTomorrow:&off_100103920];
          v50 = v46;
          id v51 = v10;
          goto LABEL_52;
        }

        [v46 setWillResetSubscriberTierTomorrow:&off_100103908];
        if (!v7)
        {
LABEL_53:
          -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v46);

LABEL_54:
          BOOL v29 = 1;
          goto LABEL_55;
        }

        v50 = v46;
        id v51 = 0LL;
LABEL_52:
        [v50 setResetTomorrowDate:v51];
        goto LABEL_53;
      }
    }

    else
    {
    }

    if (self) {
      v32 = self->_configuration;
    }
    else {
      v32 = 0LL;
    }
    unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v32, "proxyAccountType"));

    if (v33)
    {
      if (self) {
        unsigned int v37 = self->_configuration;
      }
      else {
        unsigned int v37 = 0LL;
      }
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v37, "proxyAccountType"));
      id v39 = [v38 unsignedIntegerValue];

      if (a3 != 2 || v39 != (id)1) {
        goto LABEL_37;
      }
      uint64_t v43 = nplog_obj(v40, v41, v42);
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "invalid to set subscriber tier for free account type",  buf,  2u);
      }
    }

    else
    {
      uint64_t v52 = nplog_obj(v34, v35, v36);
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        if (a3 >= 3) {
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  a3));
        }
        else {
          v54 = *(&off_1000FA9C0 + (int)a3);
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v56 = v54;
        _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "invalid to set %@ tier until proxy account type is available",  buf,  0xCu);
      }
    }

    BOOL v29 = 0;
    goto LABEL_55;
  }

  if (self) {
    unint64_t v14 = self->_configuration;
  }
  else {
    unint64_t v14 = 0LL;
  }
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration willResetSubscriberTierTomorrow](v14, "willResetSubscriberTierTomorrow"));
  unsigned int v16 = [v15 BOOLValue];

  if (!v10 && v16)
  {
    if (self) {
      int v17 = self->_configuration;
    }
    else {
      int v17 = 0LL;
    }
    id v18 = -[NSPConfiguration copy](v17, "copy");
    [v18 setWillResetSubscriberTierTomorrow:&off_100103908];
    if (v7) {
      [v18 setResetTomorrowDate:0];
    }
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v18);

    goto LABEL_54;
  }

  if (self) {
    unint64_t v26 = self->_configuration;
  }
  else {
    unint64_t v26 = 0LL;
  }
  unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration willResetSubscriberTierTomorrow](v26, "willResetSubscriberTierTomorrow"));
  unsigned __int8 v28 = [v27 BOOLValue];

  BOOL v29 = 1;
  if (v10 && (v28 & 1) == 0)
  {
    if (self) {
      unsigned __int8 v30 = self->_configuration;
    }
    else {
      unsigned __int8 v30 = 0LL;
    }
    id v31 = -[NSPConfiguration copy](v30, "copy");
    [v31 setWillResetSubscriberTierTomorrow:&off_100103920];
    [v31 setResetTomorrowDate:v10];
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v31);

    goto LABEL_54;
  }

- (void)setProxyAccountType:(unint64_t)a3 unlimited:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if (self) {
      configuration = self->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v8 = configuration;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v8, "proxyAccountType"));
    if ([v9 unsignedIntegerValue] == (id)a3)
    {
      if (self) {
        id v10 = self->_configuration;
      }
      else {
        id v10 = 0LL;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v10, "proxyAccountUnlimited"));
      unsigned int v12 = [v11 BOOLValue];

      if (v12 == v4) {
        return;
      }
    }

    else
    {
    }

    if (self) {
      id v13 = self->_configuration;
    }
    else {
      id v13 = 0LL;
    }
    id v21 = -[NSPConfiguration copy](v13, "copy");
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v21 setProxyAccountType:v14];

    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    [v21 setProxyAccountUnlimited:v15];

    if (a3 == 2)
    {
      if (self) {
        int v17 = self->_configuration;
      }
      else {
        int v17 = 0LL;
      }
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](v17, "userPreferredTier"));
    }

    else
    {
      if (a3 != 1)
      {
LABEL_19:
        -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v21);

        return;
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
    }

    id v18 = (void *)v16;
    [v21 setUserTier:v16];

    goto LABEL_19;
  }

  uint64_t v19 = nplog_obj(self, a2, 0LL);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v23 = "-[NSPConfigurationManager setProxyAccountType:unlimited:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "%s called with null proxyAccountType",  buf,  0xCu);
  }
}

- (void)setGeohashSharingPreference:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setGeohashSharingEnabledStatus:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (BOOL)getGeohashSharingPreference
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setGeohashOverride:(id)a3
{
  id v11 = a3;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v5 = configuration;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v5, "geohashOverride"));
  if (v6 == v11)
  {

LABEL_11:
    goto LABEL_12;
  }

  if (self) {
    BOOL v7 = self->_configuration;
  }
  else {
    BOOL v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v7, "geohashOverride"));
  unsigned __int8 v9 = [v8 isEqualToString:v11];

  if ((v9 & 1) == 0)
  {
    if (self) {
      id v10 = self->_configuration;
    }
    else {
      id v10 = 0LL;
    }
    uint64_t v5 = (NSPConfiguration *)-[NSPConfiguration copy](v10, "copy");
    -[NSPConfiguration setGeohashOverride:](v5, "setGeohashOverride:", v11);
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v5);
    goto LABEL_11;
  }

- (void)setPreferredPathRoutingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setPreferredPathRoutingEnabledStatus:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (void)setPrivateAccessTokensEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setPrivateAccessTokensEnabledStatus:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (BOOL)getPrivateAccessTokensEnabled
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPrivateAccessTokensAllowTools:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setPrivateAccessTokensAllowTools:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (void)setInProcessFlowDivert:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager inProcessFlowDivert](self, "inProcessFlowDivert"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0LL;
    }
    id v9 = -[NSPConfiguration copy](configuration, "copy");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v9 setInProcessFlowDivert:v8];

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }

- (unint64_t)getPrivacyProxyAccountType
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyAccountType](self, "proxyAccountType"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4
{
  unsigned int v6 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyTrafficState](self, "proxyTrafficState"));
  unint64_t v8 = (unint64_t)[v7 unsignedLongLongValue];

  unint64_t v9 = v8 & ~a3 | a4 & a3;
  if (v6) {
    configuration = v6->_configuration;
  }
  else {
    configuration = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](configuration, "proxyTrafficState"));
  id v12 = [v11 unsignedLongLongValue];

  if (v12 != (id)v9)
  {
    if (v6) {
      id v13 = v6->_configuration;
    }
    else {
      id v13 = 0LL;
    }
    id v19 = -[NSPConfiguration copy](v13, "copy");
    if ((v9 & 0x20000) != 0)
    {
      if (v6) {
        unint64_t v14 = v6->_configuration;
      }
      else {
        unint64_t v14 = 0LL;
      }
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v14, "proxyTrafficState"));
      unsigned int v16 = [v15 unsignedLongLongValue];

      if ((v16 & 0x20000) == 0)
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v19 setAnyAppEnabledDate:v17];
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
    [v19 setProxyTrafficState:v18];

    -[NSPConfigurationManager updateConfiguration:](v6, "updateConfiguration:", v19);
  }

- (void)refreshConfigurationWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  unint64_t v8 = configuration;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v8, "enabled"));
  if (self) {
    id v10 = self->_configuration;
  }
  else {
    id v10 = 0LL;
  }
  id v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerEnabled](v11, "configServerEnabled"));
  if (![v12 BOOLValue])
  {

LABEL_15:
    goto LABEL_16;
  }

  if (self) {
    id v13 = self->_configuration;
  }
  else {
    id v13 = 0LL;
  }
  unint64_t v14 = v13;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v14, "resurrectionDate"));
  if (v15)
  {
    unsigned int v16 = (void *)v15;
    if (self) {
      int v17 = self->_configuration;
    }
    else {
      int v17 = 0LL;
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v17, "resurrectionDate"));
    [v18 timeIntervalSinceNow];
    double v20 = v19;

    if (v20 >= 0.0) {
      goto LABEL_16;
    }
  }

  else
  {
  }

  uint64_t v24 = nplog_obj(v21, v22, v23);
  unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Refresh configuration", buf, 2u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000900C8;
  v26[3] = &unk_1000FA808;
  id v27 = v6;
  sub_100086DA0((uint64_t)self, (void *)a3, v26);

LABEL_16:
}

- (unint64_t)configurationSubscriberPoliciesCount
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyConfiguration](self, "proxyConfiguration", (void)v10));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 policyTierMaps]);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v7 tier] == 2)
        {
          unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 policy]);
          id v4 = [v8 conditionsCount];

          goto LABEL_13;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)handlePathChange:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_path, a3);
    path = self->_path;
  }

  else
  {
    path = 0LL;
  }

  id v7 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:]( &OBJC_CLASS___NPUtilities,  "copyCurrentNetworkCharacteristicsForPath:",  path);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Signature"]);
  if (self) {
    networkCharacteristics = self->_networkCharacteristics;
  }
  else {
    networkCharacteristics = 0LL;
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( networkCharacteristics,  "objectForKeyedSubscript:",  @"Signature"));
  unint64_t v11 = v8;
  unint64_t v12 = v10;
  __int128 v13 = (void *)v12;
  if (v11 | v12 && (v11 ? (BOOL v14 = v12 == 0) : (BOOL v14 = 1), v14 || ![(id)v11 isEqual:v12]))
  {

    uint64_t v18 = nplog_obj(v15, v16, v17);
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "config manager: network signature changed",  buf,  2u);
    }

    if (self)
    {
      objc_storeStrong((id *)&self->_networkCharacteristics, v7);
      if ([v5 status] == (id)1 && self->_configFetchOnNetworkChange)
      {
        uint64_t v22 = nplog_obj(1LL, v20, v21);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retry fetching configuration", buf, 2u);
        }

        unint64_t configFetchRetryAttempt = self->_configFetchRetryAttempt;
        sub_1000876FC((uint64_t)self, v25, v26);
        self->_unint64_t configFetchRetryAttempt = configFetchRetryAttempt;
        *(void *)__int128 buf = 0LL;
        BOOL v29 = buf;
        uint64_t v30 = 0x3032000000LL;
        id v31 = sub_100086D74;
        v32 = sub_100086D84;
        id v33 = (id)os_transaction_create("com.apple.networkserviceproxy.configManagerHandlePathChange");
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10008FED4;
        v27[3] = &unk_1000FA170;
        v27[4] = buf;
        sub_100086DA0((uint64_t)self, (void *)0xA, v27);
        _Block_object_dispose(buf, 8);
      }
    }

    else
    {
      [v5 status];
    }
  }

  else
  {
  }
}

- (void)setup
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  id v4 = sub_100090548;
  id v5 = &unk_1000F9720;
  id v6 = self;
  if (self)
  {
    uint64_t v2 = v3;
    os_variant_has_internal_content("com.apple.networkserviceproxy");
    v4((uint64_t)v2, 0);
  }

- (void)dealloc
{
  uint64_t v4 = nplog_obj(self, a2, v2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138412290;
    unint64_t v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dealloc: \nConfiguration: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSPConfigurationManager;
  -[NSPConfigurationManager dealloc](&v6, "dealloc");
}

- (NSPConfigurationManager)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v10 = v7;
  if (!v6)
  {
    uint64_t v20 = nplog_obj(v7, v8, v9);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_FAULT))
    {
LABEL_12:

      uint64_t v17 = 0LL;
      goto LABEL_8;
    }

    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v26 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    uint64_t v22 = "%s called with null delegate";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_FAULT, v22, buf, 0xCu);
    goto LABEL_12;
  }

  if (!v7)
  {
    uint64_t v23 = nplog_obj(0LL, v8, v9);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v26 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    uint64_t v22 = "%s called with null configuration";
    goto LABEL_14;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NSPConfigurationManager;
  unint64_t v11 = -[NSPConfigurationManager init](&v24, "init");
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    objc_storeStrong((id *)(v12 + 32), a4);
    *(void *)(v12 + 16) = sub_10008EDDC(v12);
    ++*(void *)(v12 + 56);
    sub_100088828(v12);
    id v13 = +[NPUtilities copyTrueClientIPAddressFromPreferences]( &OBJC_CLASS___NPUtilities,  "copyTrueClientIPAddressFromPreferences");
    BOOL v14 = *(void **)(v12 + 120);
    *(void *)(v12 + 120) = v13;

    uint64_t v15 = nplog_large_obj();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v19 = *(const char **)(v12 + 32);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v26 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Configuration state: %@", buf, 0xCu);
    }
  }

  self = (NSPConfigurationManager *)(id)v12;
  uint64_t v17 = self;
LABEL_8:

  return v17;
}

- (BOOL)environmentUsesNonDefaultServer
{
}

- (void)publishDailyConfigurationStats
{
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSPConfigurationStats);
  if (self)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](self->_configuration, "proxyConfiguration"));
    -[NSPConfigurationStats setConfigurationVersion:]( v15,  "setConfigurationVersion:",  [v3 version]);

    configuration = self->_configuration;
  }

  else
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([0 proxyConfiguration]);
    -[NSPConfigurationStats setConfigurationVersion:]( v15,  "setConfigurationVersion:",  [v14 version]);

    configuration = 0LL;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](configuration, "enabled"));
  -[NSPConfigurationStats setConfigurationEnabled:](v15, "setConfigurationEnabled:", [v5 BOOLValue]);

  if (self) {
    id v6 = self->_configuration;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v6, "proxyConfiguration"));
  -[NSPConfigurationStats setTokenFetchEnabled:](v15, "setTokenFetchEnabled:", [v7 enabled]);

  unint64_t v8 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (v8 >= 3) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v8));
  }
  else {
    uint64_t v9 = *(&off_1000FA9C0 + (int)v8);
  }
  -[NSPConfigurationStats setTierType:](v15, "setTierType:", v9);

  if (self) {
    __int128 v10 = self->_configuration;
  }
  else {
    __int128 v10 = 0LL;
  }
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v10, "proxyTrafficState"));
  unsigned int v12 = [v11 unsignedLongLongValue];

  if ((v12 & 1) != 0) {
    -[NSPConfigurationStats setSafariUnencryptedEnabled:](v15, "setSafariUnencryptedEnabled:", 1LL);
  }
  id v13 = v15;
  if ((v12 & 2) != 0)
  {
    -[NSPConfigurationStats setSafariDNSEnabled:](v15, "setSafariDNSEnabled:", 1LL);
    id v13 = v15;
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_41;
    }
  }

  else if ((v12 & 4) == 0)
  {
    goto LABEL_14;
  }

  -[NSPConfigurationStats setSafariTrackersEnabled:](v15, "setSafariTrackersEnabled:", 1LL);
  id v13 = v15;
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }

- (void)copyProxyInfo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    if (self)
    {
      [v4 setConfigFetchedSuccessCount:self->_configFetchSuccessCount];
      unint64_t configFetchFailedCount = self->_configFetchFailedCount;
    }

    else
    {
      [v4 setConfigFetchedSuccessCount:0];
      unint64_t configFetchFailedCount = 0LL;
    }

    [v7 setConfigFetchedFailedCount:configFetchFailedCount];
  }

  else
  {
    uint64_t v9 = nplog_obj(0LL, v5, v6);
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      unsigned int v12 = "-[NSPConfigurationManager copyProxyInfo:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null proxyInfo",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (id)diagnostics
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v4 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (v4 >= 3) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v4));
  }
  else {
    uint64_t v5 = *(&off_1000FA9C0 + (int)v4);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"EffectiveUserTier");

  return v3;
}

- (unint64_t)effectiveUserTier
{
  return self->_effectiveUserTier;
}

- (void).cxx_destruct
{
}

@end