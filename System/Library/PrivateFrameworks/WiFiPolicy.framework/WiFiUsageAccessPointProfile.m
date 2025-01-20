@interface WiFiUsageAccessPointProfile
+ (BOOL)_compareBytes:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 With:(id)a6;
+ (BOOL)_isProfileValidForStorage:(id)a3;
+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4;
+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4 onlyIfCurrent:(BOOL)a5;
+ (id)_cachedProfile:(id)a3;
+ (id)_config;
+ (id)_getBinTimeInterval:(double)a3 As:(unint64_t)a4;
+ (id)_getDefaults;
+ (id)_loadFromUserDefaults:(id)a3 withKey:(id)a4 withCachedData:(id)a5;
+ (id)_toMobileAssetsProfile:(id)a3;
+ (id)apNameForBSSID:(id)a3;
+ (id)beaconsAndWPSInfo;
+ (id)longProfileForBSSID:(id)a3;
+ (id)prefixForCA;
+ (id)profileForBSSID:(id)a3;
+ (id)profileForBSSID:(id)a3 onlyIfCurrent:(BOOL)a4;
+ (id)profileFromBeaconData:(id)a3 andParsedIE:(id)a4;
+ (id)shortProfileForBSSID:(id)a3;
+ (void)_applyMask:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 WithMask:(id)a6 AppendTo:(id)a7;
+ (void)_cleanUpStaleProfiles;
+ (void)_defaults;
+ (void)_endPrevAssoc;
+ (void)_extractFieldsFor:(id)a3 From:(id)a4 Into:(id)a5;
+ (void)_saveToUserDefaults:(id)a3 withKey:(id)a4 andValue:(id)a5;
+ (void)_submitProfileFor:(id)a3 withCachedDict:(id)a4 AndEraseWithLog:(id)a5;
+ (void)initialize;
+ (void)setMaxProfiles:(unint64_t)a3;
+ (void)updateConfig;
+ (void)updateWithAssocTime:(double)a3 forBssid:(id)a4;
+ (void)updateWithWPS:(id)a3;
- (NSString)apProfile;
- (NSString)bssid;
- (void)setApProfile:(id)a3;
- (void)setBssid:(id)a3;
@end

@implementation WiFiUsageAccessPointProfile

+ (id)prefixForCA
{
  return @"BeaconInformationElement_";
}

+ (void)initialize
{
  v2 = (void *)_configError;
  _configError = (uint64_t)@"Waiting on MobileAssets callback";
}

+ (id)_config
{
  v2 = (void *)NSString;
  uint64_t v3 = _apProfileMinAssoc;
  uint64_t v4 = _apProfileMinOccurrencies;
  uint64_t v5 = _apProfileMinSecsBetweenOccurrencies;
  uint64_t v6 = _maxProfiles;
  uint64_t v7 = _profileCacheTimeout;
  uint64_t v8 = _apProfileVersionString;
  uint64_t v9 = _shortProfileBytesLen;
  double v10 = *(double *)&_profileCacheTimeout / 86400.0;
  uint64_t v11 = [(id)_apProfileFields count];
  if (_apProfileListVendorIEs) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  uint64_t v13 = _apProfileListVendorIEsLen;
  uint64_t v14 = [(id)_apProfileVendorFields count];
  return (id)objc_msgSend( v2,  "stringWithFormat:",  @"apProfileMinAssoc(sec):%f apProfileMinOccurrencies:%lu apProfileMinIntervalBetweenOccurrencies(sec):%f maxProfiles:%lu maxAgeDays:%f (%f sec)\napProfileVersion:%@ shortApProfileBytesLen:%lu { fields:%u ; listVendorIEs:%@ ; listVendorIELen:%u ; vendor fields:%u ; vendor exclude:%u }",
               v3,
               v4,
               v5,
               v6,
               *(void *)&v10,
               v7,
               v8,
               v9,
               v11,
               v12,
               v13,
               v14,
               [(id)_apProfileVendorExcludeFields count]);
}

+ (void)setMaxProfiles:(unint64_t)a3
{
  _maxProfiles = a3;
}

+ (void)_defaults
{
  _apProfileVersion = 0;
  v2 = (void *)_apProfileVersionString;
  _apProfileVersionString = (uint64_t)@"profile_AP__UNDEFINED";

  _apProfileMinAssoc = 0LL;
  _apProfileMinOccurrencies = 1LL;
  _apProfileMinSecsBetweenOccurrencies = 0LL;
  _maxProfiles = 0LL;
  _profileCacheTimeout = 0x4122750000000000LL;
  _shortProfileBytesLen = 20LL;
  _apProfileListVendorIEs = 0;
  _apProfileListVendorIEsLen = 0x7FFFFFFFFFFFFFFFLL;
  _apProfileIncludeIELen = 1;
  uint64_t v3 = (void *)_apProfileFields;
  _apProfileFields = 0LL;

  uint64_t v4 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = 0LL;

  uint64_t v5 = (void *)_apProfileVendorExcludeFields;
  _apProfileVendorExcludeFields = 0LL;
}

+ (void)updateConfig
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"apProfileVersion");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_cache = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [NSString stringWithFormat:@"impossible to parse %@. Expected String, found: %@", @"apProfileVersion", v3];
      uint64_t v26 = LABEL_41:;
LABEL_42:
      uint64_t v13 = 0LL;
LABEL_43:
      v27 = (void *)_configError;
      _configError = v26;

      [a1 _defaults];
      goto LABEL_44;
    }
  }

  else
  {
    [a1 _defaults];
  }

  uint64_t v5 = (void *)_apProfileVersionString;
  _apProfileVersionString = (uint64_t)v3;
  id v6 = v3;

  _apProfileVersion = 1;
  uint64_t v7 = @"apProfileMinAssocSec";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"apProfileMinAssocSec");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  [v3 doubleValue];
  _apProfileMinAssoc = v8;
  uint64_t v9 = @"apProfileMinOccurrencies";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"apProfileMinOccurrencies");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  _apProfileMinOccurrencies = [v10 unsignedIntegerValue];
  uint64_t v7 = @"apProfileMinIntervalBetweenOccurrencies";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"apProfileMinIntervalBetweenOccurrencies");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  [v3 doubleValue];
  _apProfileMinSecsBetweenOccurrencies = v11;
  uint64_t v9 = @"useShortAPProfile";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"useShortAPProfile");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  _useShortProfile = [v10 BOOLValue];
  uint64_t v7 = @"shortApProfileBytesLen";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"shortApProfileBytesLen");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  _shortProfileBytesLen = [v3 unsignedIntegerValue];
  uint64_t v9 = @"maxProfilesCount";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"maxProfilesCount");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_47:
    uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@. Expected Number, found: %@", v9, v10];
    uint64_t v13 = 0LL;
    uint64_t v3 = v10;
    goto LABEL_43;
  }

  _maxProfiles = [v10 unsignedIntegerValue];
  uint64_t v7 = @"maxAgeDays";
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"maxAgeDays");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_40:
    [NSString stringWithFormat:@"impossible to parse %@. Expected Number, found: %@", v7, v3];
    goto LABEL_41;
  }

  [v3 doubleValue];
  *(double *)&_profileCacheTimeout = v12 * 86400.0;
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageAccessPointProfileConfiguration,  "getConfigForKey:",  @"apProfileDefinition");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@. Expected Dictionary, found: %@", @"apProfileDefinition", v13];
    uint64_t v3 = v13;
    goto LABEL_42;
  }

  [v13 objectForKeyedSubscript:@"includeIELen"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@.includeIELen. Expected Number, found: %@", @"apProfileDefinition", 0];
      uint64_t v3 = 0LL;
      goto LABEL_43;
    }
  }

  _apProfileIncludeIELen = [v14 BOOLValue];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"fields"];

  if (!v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@.fields. Expected Array, found: %@", @"apProfileDefinition", 0];
      uint64_t v3 = 0LL;
      goto LABEL_55;
    }
  }

  v16 = (void *)_apProfileFields;
  _apProfileFields = v15;

  [v13 objectForKeyedSubscript:@"listVendorIEs"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.listVendorIEs. Expected Number, found: %@", @"apProfileDefinition", v3];
    uint64_t v26 = LABEL_50:;
LABEL_55:
    p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
    goto LABEL_43;
  }

  _apProfileListVendorIEs = [v3 BOOLValue];
  [v13 objectForKeyedSubscript:@"listVendorIEsLen"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.listVendorIEsLen. Expected Number, found: %@", @"apProfileDefinition", v17];
    uint64_t v26 = LABEL_54:;
    uint64_t v3 = v17;
    goto LABEL_55;
  }

  _apProfileListVendorIEsLen = [v17 integerValue];
  [v13 objectForKeyedSubscript:@"vendor"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendor. Expected Dictionary, found: %@", @"apProfileDefinition", v3];
    goto LABEL_50;
  }

  [v13 objectForKeyedSubscript:@"vendor"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectForKeyedSubscript:@"fields"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendor.fields. Expected Array, found: %@", @"apProfileDefinition", v17];
    goto LABEL_54;
  }

  v19 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = (uint64_t)v17;

  [v13 objectForKeyedSubscript:@"vendorExclude"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendorExclude. Expected Dictionary, found: %@", @"apProfileDefinition", v3];
    goto LABEL_50;
  }

  [v13 objectForKeyedSubscript:@"vendorExclude"];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectForKeyedSubscript:@"fields"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = v21;
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendorExclude.fields. Expected Array, found: %@", @"apProfileDefinition", v21];
    goto LABEL_50;
  }

  objc_storeStrong((id *)&_apProfileVendorExcludeFields, v21);
  v22 = (void *)NSString;
  [a1 _config];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 stringWithFormat:@"%s: configParseError:%@ (%@)]\n%@", "+[WiFiUsageAccessPointProfile updateConfig]", @"NO", &stru_18A170410, v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    id v25 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = [v25 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
LABEL_44:
  if (*((_BYTE *)p_cache + 2192) == 1) {
    [a1 _cleanUpStaleProfiles];
  }
}

+ (id)_getDefaults
{
  return (id)[MEMORY[0x189604038] standardUserDefaults];
}

+ (BOOL)_isProfileValidForStorage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 objectForKey:@"apProfileVersion"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"apProfileCacheTimestampCreated"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    int v6 = [(id)_apProfileVersionString isEqualToString:v4];
LABEL_5:
    BOOL v8 = 0;
    if (v6 && v5)
    {
      [v5 timeIntervalSinceNow];
      BOOL v8 = *(double *)&_profileCacheTimeout >= -v9;
    }

    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:_apProfileVersion];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v7 isEqual:v4];

    goto LABEL_5;
  }

  BOOL v8 = 0;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    double v12 = "+[WiFiUsageAccessPointProfile _isProfileValidForStorage:]";
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: unknown version format: %@",  (uint8_t *)&v11,  0x16u);
    BOOL v8 = 0;
  }

+ (void)_cleanUpStaleProfiles
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895BA820](a1, a2);
  [a1 _getDefaults];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dictionaryRepresentation];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FA8] array];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  [v4 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v10);
        int v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          [v4 objectForKey:v10];
          double v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ([a1 _isProfileValidForStorage:v12])
          {
            [v12 objectForKey:@"apProfileCacheTimestamp"];
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v42 setObject:v10 forKeyedSubscript:v13];
          }

          else
          {
            [v43 addObject:v10];
          }
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }

    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v43 count];
    uint64_t v15 = [v42 count];
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    __int16 v55 = 2048;
    uint64_t v56 = v14;
    __int16 v57 = 2048;
    uint64_t v58 = v15;
    __int16 v59 = 2048;
    uint64_t v60 = _maxProfiles;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu",  buf,  0x2Au);
  }

  unint64_t v16 = [v42 count];
  if (v16 > _maxProfiles)
  {
    [v42 allKeys];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 sortedArrayUsingSelector:sel_compare_];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    [NSString stringWithFormat:@"%s: sortedEntries:%@", "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]", v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
      uint64_t v21 = [v20 UTF8String];
      *(_DWORD *)buf = 136446210;
      v54 = (const char *)v21;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    uint64_t v22 = [v42 count];
    if (v22 != _maxProfiles)
    {
      unint64_t v23 = 0LL;
      v24 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        [v18 objectAtIndexedSubscript:v23];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 objectForKeyedSubscript:v25];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 addObject:v26];

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          [v18 objectAtIndexedSubscript:v23];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v42 objectForKeyedSubscript:v27];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v28;
          _os_log_impl(&dword_187EBF000, v24, OS_LOG_TYPE_DEFAULT, "%s - marking %@ as stale", buf, 0x16u);
        }

        ++v23;
        uint64_t v29 = [v42 count];
      }

      while (v29 - _maxProfiles > v23);
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v43 count];
    uint64_t v31 = [v42 count];
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    __int16 v55 = 2048;
    uint64_t v56 = v30;
    __int16 v57 = 2048;
    uint64_t v58 = v31;
    __int16 v59 = 2048;
    uint64_t v60 = _maxProfiles;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu",  buf,  0x2Au);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v32 = v43;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v45;
    do
    {
      for (uint64_t j = 0LL; j != v34; ++j)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        [v4 objectForKeyedSubscript:v37];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( NSString,  "stringWithFormat:",  @"stale (from %s)",  "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [a1 _submitProfileFor:v37 withCachedDict:v38 AndEraseWithLog:v39];
      }

      uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v34);
  }

  [a1 _getDefaults];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 synchronize];

  objc_autoreleasePoolPop(context);
}

+ (void)_endPrevAssoc
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  [a1 _getDefaults];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 dictionaryRepresentation];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v29 = v3;
  [v3 allKeys];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v31;
    *(void *)&__int128 v5 = 136316162LL;
    __int128 v26 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "reformatMACAddress:",  v10,  v26);
        int v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          [v29 objectForKey:v10];
          double v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 objectForKeyedSubscript:@"apProfileMaxAssocTime"];
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v14 = [v13 unsignedIntegerValue];

          [v12 objectForKeyedSubscript:@"apProfileCacheTimestamp"];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 objectForKeyedSubscript:@"apProfileForLatestAssoc"];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          int v17 = [v16 BOOLValue];

          [v15 timeIntervalSinceNow];
          if (v17)
          {
            double v19 = -v18;
            if ((double)v14 >= v19)
            {
              id v22 = a1;
            }

            else
            {
              BOOL v20 = *(double *)&_apProfileMinAssoc > (double)v14;
              v7 |= v20;
              [MEMORY[0x189607968] numberWithUnsignedLong:(unint64_t)v19];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              id v22 = a1;
              [a1 _saveToUserDefaults:v10 withKey:@"apProfileMaxAssocTime" andValue:v21];
            }

            [v22 _saveToUserDefaults:v10 withKey:@"apProfileForLatestAssoc" andValue:MEMORY[0x189604A80]];
            if ((v7 & 1) != 0)
            {
              if ([v22 _isProfileValidForUse:v10 withCachedDict:0])
              {
                unint64_t v23 = (os_log_s *)MEMORY[0x1895F8DA0];
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  [v22 profileForBSSID:v10];
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v26;
                  uint64_t v35 = "+[WiFiUsageAccessPointProfile _endPrevAssoc]";
                  __int16 v36 = 2160;
                  uint64_t v37 = 1752392040LL;
                  __int16 v38 = 2112;
                  uint64_t v39 = v10;
                  __int16 v40 = 2160;
                  uint64_t v41 = 1752392040LL;
                  __int16 v42 = 2112;
                  v43 = v24;
                  _os_log_impl( &dword_187EBF000,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@",  buf,  0x34u);
                }
              }

              char v7 = 1;
            }

            else
            {
              char v7 = 0;
            }
          }
        }
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }

    while (v6);
  }

  [a1 _getDefaults];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 synchronize];
}

+ (BOOL)_compareBytes:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 With:(id)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = [v9 length];
  if (a5 > 4 || v11 < a5 + a4)
  {
    BOOL v14 = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v16 = 136316162;
      *(void *)&v16[4] = "+[WiFiUsageAccessPointProfile _compareBytes:FromStart:WithLen:With:]";
      __int16 v17 = 2048;
      uint64_t v18 = [v9 length];
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      __int16 v23 = 2048;
      uint64_t v24 = 4LL;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - fieldData len is %lu but start=%lu and len=%lu (<= %lu) - returning FALSE",  v16,  0x34u);
      BOOL v14 = 0;
    }
  }

  else
  {
    uint64_t v12 = [v9 bytes];
    *(void *)unint64_t v16 = [v10 unsignedIntValue];
    if (a5)
    {
      __int16 v13 = (_BYTE *)(v12 + a4);
      BOOL v14 = 1;
      do
        BOOL v14 = v14 && v16[--a5] == *v13++;
      while (a5);
    }

    else
    {
      BOOL v14 = 1;
    }
  }

  return v14;
}

+ (void)_applyMask:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 WithMask:(id)a6 AppendTo:(id)a7
{
  id v17 = a3;
  id v11 = a6;
  id v12 = a7;
  if ([v17 length] >= a5 + a4)
  {
    uint64_t v13 = [v17 bytes];
    uint64_t v18 = [v11 unsignedIntValue];
    if (a5)
    {
      BOOL v14 = (_BYTE *)(v13 + a4);
      uint64_t v15 = &v18;
      do
      {
        if (v11) {
          uint64_t v16 = (*v14 & *(_BYTE *)v15);
        }
        else {
          uint64_t v16 = *v14;
        }
        objc_msgSend(v12, "appendFormat:", @"%02X", v16);
        ++v14;
        uint64_t v15 = (uint64_t *)((char *)v15 + 1);
        --a5;
      }

      while (a5);
    }
  }
}

+ (void)_extractFieldsFor:(id)a3 From:(id)a4 Into:(id)a5
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 objectForKeyedSubscript:@"subfields"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [v7 objectForKeyedSubscript:@"subfields"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v7 objectForKeyedSubscript:@"subfields"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  [v7 objectForKeyedSubscript:@"len"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    [v7 objectForKeyedSubscript:@"len"];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v7 objectForKeyedSubscript:@"len"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  [v7 objectForKeyedSubscript:@"mask"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    [v7 objectForKeyedSubscript:@"mask"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v7 objectForKeyedSubscript:@"mask"];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v18 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  if (v12)
  {
    uint64_t v37 = v18;
    __int16 v38 = v15;
    id v41 = v9;
    uint64_t v39 = v12;
    id v40 = v7;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    obuint64_t j = v12;
    uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v44 = *(void *)v46;
      do
      {
        for (uint64_t i = 0LL; i != v20; ++i)
        {
          if (*(void *)v46 != v44) {
            objc_enumerationMutation(obj);
          }
          unint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", @"start", v37, v38, v39, v40);
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            [v22 objectForKeyedSubscript:@"start"];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v22 objectForKeyedSubscript:@"start"];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v25 = 0LL;
            }
          }

          else
          {
            uint64_t v25 = 0LL;
          }

          __int128 v26 = v8;

          [v22 objectForKeyedSubscript:@"len"];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            [v22 objectForKeyedSubscript:@"len"];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v22 objectForKeyedSubscript:@"len"];
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v29 = 0LL;
            }
          }

          else
          {
            uint64_t v29 = 0LL;
          }

          [v22 objectForKeyedSubscript:@"mask"];
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            [v22 objectForKeyedSubscript:@"mask"];
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v22 objectForKeyedSubscript:@"mask"];
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              __int128 v32 = 0LL;
            }
          }

          else
          {
            __int128 v32 = 0LL;
          }

          id v8 = v26;
          if ([v26 length])
          {
            if (v29 && v25)
            {
              objc_msgSend( a1,  "_applyMask:FromStart:WithLen:WithMask:AppendTo:",  v26,  objc_msgSend(v25, "integerValue"),  objc_msgSend(v29, "unsignedIntValue"),  v32,  v41);
            }

            else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              int v33 = [v25 unsignedIntValue];
              int v34 = [v29 unsignedIntValue];
              *(_DWORD *)buf = 136315906;
              __int128 v50 = "+[WiFiUsageAccessPointProfile _extractFieldsFor:From:Into:]";
              __int16 v51 = 1024;
              int v52 = v33;
              __int16 v53 = 1024;
              int v54 = v34;
              __int16 v55 = 2112;
              uint64_t v56 = v22;
              _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Subfield has wrong format (start:%u, len:%u) - ignoring %@",  buf,  0x22u);
            }
          }
        }

        uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
      }

      while (v20);
    }

    id v12 = v39;
    id v7 = v40;
    id v9 = v41;
    uint64_t v18 = v37;
    uint64_t v15 = v38;
  }

  else
  {
    unint64_t v35 = [v8 length];
    else {
      uint64_t v36 = [v8 length];
    }
    [a1 _applyMask:v8 FromStart:0 WithLen:v36 WithMask:v18 AppendTo:v9];
  }
}

+ (id)_toMobileAssetsProfile:(id)a3
{
  uint64_t v132 = *MEMORY[0x1895F89C0];
  id v90 = a3;
  v89 = (void *)objc_opt_new();
  id v84 = objc_alloc_init(MEMORY[0x189607978]);
  [v84 setNumberStyle:1];
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  obuint64_t j = (id)_apProfileFields;
  uint64_t v3 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v97 = *(id *)v116;
    do
    {
      uint64_t v5 = 0LL;
      uint64_t v91 = v4;
      do
      {
        if (*(id *)v116 != v97) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v115 + 1) + 8 * v5);
        [v6 objectForKeyedSubscript:@"name"];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          [v6 objectForKeyedSubscript:@"name"];
          id v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v6 objectForKeyedSubscript:@"name"];
            id v9 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v9 = 0LL;
          }
        }

        else
        {
          id v9 = 0LL;
        }

        [v6 objectForKeyedSubscript:@"len"];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          [v6 objectForKeyedSubscript:@"len"];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v6 objectForKeyedSubscript:@"len"];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v12 = 0LL;
          }
        }

        else
        {
          id v12 = 0LL;
        }

        [v6 objectForKeyedSubscript:@"mask"];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          [v6 objectForKeyedSubscript:@"mask"];
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v6 objectForKeyedSubscript:@"mask"];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v15 = 0LL;
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        if (v9)
        {
          if ([v9 hasPrefix:@"EL "])
          {
            v96 = v15;
            objc_msgSend(v9, "substringFromIndex:", objc_msgSend(@"EL ", "length"));
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v84 numberFromString:v16];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v90 taggedIEList];
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString stringWithFormat:@"%@%@", @"BeaconInformationElement_", v16];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 objectForKeyedSubscript:v19];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v17, "unsignedIntValue"));
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v20, "length"));
              uint64_t v4 = v91;
            }

            else
            {
              uint64_t v4 = v91;
              if (v20) {
                int v33 = @"1";
              }
              else {
                int v33 = @"0";
              }
              [v89 appendString:v33];
            }

            [a1 _extractFieldsFor:v6 From:v20 Into:v89];
          }

          else
          {
            if (![v9 hasPrefix:@"exEL "])
            {
              [v90 valueForKey:v9];
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = [v26 unsignedLongValue];

              objc_msgSend( NSString,  "stringWithFormat:",  @"%%0%ulX",  2 * objc_msgSend(v12, "unsignedIntValue"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                if ([v12 longValue] < 1 || (unint64_t)objc_msgSend(v12, "longValue") < 9)
                {
                  if (v15) {
                    v27 &= [v15 unsignedLongValue];
                  }
                  if ([v12 longValue] == -1) {
                    objc_msgSend(v89, "appendFormat:", @"%lu", v27);
                  }
                  else {
                    objc_msgSend(v89, "appendFormat:", v28, v27);
                  }
                }

                else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v29 = [v12 longValue];
                  *(_DWORD *)buf = 136315906;
                  v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                  __int16 v125 = 2112;
                  v126 = v6;
                  __int16 v127 = 2048;
                  uint64_t v128 = v29;
                  __int16 v129 = 2048;
                  uint64_t v130 = 8LL;
                  __int128 v30 = (os_log_s *)MEMORY[0x1895F8DA0];
                  __int128 v31 = "%s - Field %@ len (%ld) is too large for non TLV values (max=%lu)";
                  uint32_t v32 = 42;
                  goto LABEL_48;
                }
              }

              else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                __int16 v125 = 2112;
                v126 = v6;
                __int128 v30 = (os_log_s *)MEMORY[0x1895F8DA0];
                __int128 v31 = "%s - Field %@ has wrong format (missing len) - ignoring";
                uint32_t v32 = 22;
LABEL_48:
                _os_log_impl(&dword_187EBF000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
              }

              goto LABEL_58;
            }

            v96 = v15;
            objc_msgSend(v9, "substringFromIndex:", objc_msgSend(@"exEL ", "length"));
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v84 numberFromString:v21];
            unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v90 extendedIEList];
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString stringWithFormat:@"%@255_%@", @"BeaconInformationElement_", v21];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 objectForKeyedSubscript:v24];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

            [v89 appendString:@"FF"];
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v25, "length"));
              uint64_t v4 = v91;
            }

            else
            {
              uint64_t v4 = v91;
              if (v25) {
                int v34 = @"1";
              }
              else {
                int v34 = @"0";
              }
              [v89 appendString:v34];
            }

            objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v22, "unsignedIntValue"));
            [a1 _extractFieldsFor:v6 From:v25 Into:v89];
          }

          uint64_t v15 = v96;
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
          __int16 v125 = 2112;
          v126 = v6;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Field has wrong format (missing name) - ignoring : %@",  buf,  0x16u);
        }

+ (id)_loadFromUserDefaults:(id)a3 withKey:(id)a4 withCachedData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
    {
      id v12 = v10;
      if (!v9) {
        goto LABEL_11;
      }
    }

    else
    {
      [a1 _getDefaults];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 dictionaryForKey:v11];
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9) {
        goto LABEL_11;
      }
    }

    if (v12)
    {
      if (![v9 isEqualToString:@"apProfileID"]
        || [a1 _isProfileValidForStorage:v12])
      {
        [v12 objectForKey:v9];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        id v13 = v15;

        goto LABEL_17;
      }

      objc_msgSend( NSString,  "stringWithFormat:",  @"stale (from %s)",  "+[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 _submitProfileFor:v8 withCachedDict:v12 AndEraseWithLog:v28];

LABEL_15:
      uint64_t v15 = 0LL;
      goto LABEL_16;
    }

+ (void)_saveToUserDefaults:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v19 = a3;
  id v8 = (void *)MEMORY[0x189603FC8];
  id v9 = a5;
  id v10 = a4;
  [v8 dictionary];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _getDefaults];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 dictionaryForKey:v13];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [v11 addEntriesFromDictionary:v14];
  }

  else
  {
    [MEMORY[0x189603F50] date];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setValue:v15 forKey:@"apProfileCacheTimestampCreated"];

    [v11 setValue:_apProfileVersionString forKey:@"apProfileVersion"];
  }

  [v11 setValue:v9 forKey:v10];

  [MEMORY[0x189603F50] date];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setValue:v16 forKey:@"apProfileCacheTimestamp"];

  [a1 _getDefaults];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v11 forKey:v18];
}

+ (id)_cachedProfile:(id)a3
{
  return +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  a3,  @"apProfileID",  0LL);
}

+ (id)profileFromBeaconData:(id)a3 andParsedIE:(id)a4
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7
    || ([v7 objectForKeyedSubscript:@"BSSID"],
        (id v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: no BSSID in ParsedIE", buf, 0xCu);
    }

    id v9 = 0LL;
  }

  if (_apProfileVersion == 1)
  {
    [a1 _endPrevAssoc];
    id v10 = objc_alloc_init((Class)a1);
    [v10 setBssid:0];
    [v10 setApProfile:0];
    if (!v6)
    {
      int v20 = 0;
      goto LABEL_59;
    }

    id v92 = a1;
    id v11 = -[WiFiUsageParsedBeacon initWithBeaconData:andAdditionalMetadata:]( objc_alloc(&OBJC_CLASS___WiFiUsageParsedBeacon),  "initWithBeaconData:andAdditionalMetadata:",  v6,  v8);
    -[WiFiUsageParsedBeacon bssid](v11, "bssid");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setBssid:v12];

    -[WiFiUsageParsedBeacon vendorIEList](v11, "vendorIEList");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 allKeys];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896079C8] predicateWithFormat:@"SELF BEGINSWITH[c] '00:17:F2-6' OR SELF BEGINSWITH[c] '00:17:F2-9'"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 filteredArrayUsingPredicate:v15];
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString count](v16, "count"))
    {
      id v17 = v11;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [v10 bssid];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
        *(_WORD *)&buf[12] = 2160;
        *(void *)&buf[14] = 1752392040LL;
        __int16 v95 = 2112;
        v96 = v18;
        __int16 v97 = 2112;
        id v98 = v16;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: (%{mask.hash}@) contains PersonalHotspotIEs:%@ -- skip",  buf,  0x2Au);
      }

      goto LABEL_64;
    }

    -[WiFiUsageParsedBeacon taggedIEList](v11, "taggedIEList");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = MEMORY[0x189604A80];
    [v21 allKeysForObject:MEMORY[0x189604A80]];
    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiUsageParsedBeacon extendedIEList](v11, "extendedIEList");
    double v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 allKeysForObject:v22];
    double v24 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v25 = -[WiFiUsageParsedBeacon parsingSuccessful](v11, "parsingSuccessful");
    __int128 v26 = v11;
    a1 = v92;
    if (!v25 || [v91 count] || objc_msgSend(v24, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [v10 bssid];
        int v27 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v28 = -[WiFiUsageParsedBeacon parsingSuccessful](v26, "parsingSuccessful");
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = @"NO";
        *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
        *(_WORD *)&buf[12] = 2160;
        *(void *)&buf[14] = 1752392040LL;
        __int16 v95 = 2112;
        if (v28) {
          uint64_t v29 = @"YES";
        }
        v96 = v27;
        __int16 v97 = 2112;
        id v98 = v29;
        __int16 v99 = 2112;
        __int128 v100 = v91;
        __int16 v101 = 2112;
        __int128 v102 = v24;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: (%{mask.hash}@) parsingSuccessful: %@ invalidElements:%@ invalidExtElements:%@ -- skip",  buf,  0x3Eu);
      }

      if (!+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall"))
      {
        int v45 = 0;
        int v20 = 0;
        goto LABEL_58;
      }
    }

    v86 = v24;
    [v10 bssid];
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _cachedProfile:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "_cachedProfile:", v30);
    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 bssid];
    id v90 = v26;
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v31,  @"apProfileBeaconInfoOccurrencies",  0LL);
    uint32_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v32 unsignedIntegerValue];

    [v10 bssid];
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v34,  @"apProfileCacheTimestamp",  0LL);
    [v10 bssid];
    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v35,  @"apProfile_shortID",  0LL);
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v26 = v90;
    if (_apProfileVersion == 1)
    {
      +[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_toMobileAssetsProfile:",  v90);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setApProfile:v36];
    }

    [v10 apProfile];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37) {
      goto LABEL_27;
    }
    __int16 v38 = v37;
    if (v89)
    {
      [v89 timeIntervalSinceNow];
      double v40 = -v39;
      double v41 = *(double *)&_apProfileMinSecsBetweenOccurrencies;

      if (v41 >= v40)
      {
LABEL_27:
        [v10 bssid];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
        int v43 = [v42 isEqualToString:v9];

        if (!v43)
        {
          int v20 = 0;
LABEL_57:
          double v24 = v86;

          int v45 = 1;
LABEL_58:

          if (!v45)
          {
LABEL_64:
            id v19 = 0LL;
LABEL_65:

            goto LABEL_66;
          }

+ (void)updateWithWPS:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && ([v3 objectForKeyedSubscript:@"BSSID"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    [v4 objectForKeyedSubscript:@"WPS_PROB_RESP_IE"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [MEMORY[0x189603FC8] dictionary];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:@"IE_KEY_WPS_PRIMARY_DEV_TYPE"];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v9;
      if (v9)
      {
        [v9 objectForKeyedSubscript:@"WPS_DEV_TYPE_CAT"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v11 forKeyedSubscript:@"apProfileWPSDeviceCategory"];

        [v10 objectForKeyedSubscript:@"WPS_DEV_TYPE_SUB_CAT"];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v12 forKeyedSubscript:@"apProfileWPSDeviceSubcategory"];
      }

      [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NAME"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v13);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceModelName"];
      }

      else
      {
        [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NAME"];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v15 forKeyedSubscript:@"apProfileWPSDeviceModelName"];
      }

      [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NUM"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v16);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceModelNumber"];
      }

      else
      {
        [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NUM"];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v18 forKeyedSubscript:@"apProfileWPSDeviceModelNumber"];
      }

      [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MANUFACTURER"];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceManufacturer"];
      }

      else
      {
        [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MANUFACTURER"];
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v21 forKeyedSubscript:@"apProfileWPSDeviceManufacturer"];
      }

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v6,  @"apProfileWPSInfo",  v8);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    double v23 = "+[WiFiUsageAccessPointProfile updateWithWPS:]";
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: no BSSID in ParsedIE",  (uint8_t *)&v22,  0xCu);
  }
}

+ (void)updateWithAssocTime:(double)a3 forBssid:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v6,  @"apProfileVersion",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v6,  @"apProfileMaxAssocTime",  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 unsignedIntegerValue];

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v6,  @"apProfileForLatestAssoc",  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [v10 BOOLValue];

    if (v11 && (double v12 = (double)v9, (double)v9 <= a3))
    {
      double v13 = *(double *)&_apProfileMinAssoc;
      [MEMORY[0x189607968] numberWithUnsignedLong:(unint64_t)a3];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 _saveToUserDefaults:v6 withKey:@"apProfileMaxAssocTime" andValue:v14];

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v6,  @"apProfileForLatestAssoc",  MEMORY[0x189604A80]);
      BOOL v15 = v13 <= v12 || v13 > a3;
      if (!v15
        && [a1 _isProfileValidForUse:v6 withCachedDict:0]
        && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [a1 profileForBSSID:v6];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = 136316162;
        uint64_t v18 = "+[WiFiUsageAccessPointProfile updateWithAssocTime:forBssid:]";
        __int16 v19 = 2160;
        uint64_t v20 = 1752392040LL;
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        __int128 v26 = v16;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@",  (uint8_t *)&v17,  0x34u);
      }
    }

    else
    {
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v6,  @"apProfileForLatestAssoc",  MEMORY[0x189604A80]);
    }
  }
}

+ (void)_submitProfileFor:(id)a3 withCachedDict:(id)a4 AndEraseWithLog:(id)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v8,  @"apProfileVersion",  v9);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    int v12 = [a1 _isProfileValidForUse:v8 withCachedDict:v9];
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v8,  @"submittedToCA",  v9);
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 BOOLValue];

    BOOL v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v16 = MEMORY[0x1895F8DA0];
    unint64_t v17 = 0x18A16B000LL;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        uint64_t v18 = &stru_18A170410;
      }
      else {
        uint64_t v18 = @"NOT ";
      }
      if (v14) {
        __int16 v19 = &stru_18A170410;
      }
      else {
        __int16 v19 = @"NOT ";
      }
      if (v14) {
        uint64_t v20 = &stru_18A170410;
      }
      else {
        uint64_t v20 = @"-- skip";
      }
      if (((v14 | v12) & 1) == 0)
      {
        if (+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall")) {
          uint64_t v20 = @"-- skip";
        }
        else {
          uint64_t v20 = &stru_18A170410;
        }
      }

      *(_DWORD *)buf = 136316418;
      uint64_t v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v8;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      unint64_t v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      __int16 v38 = 2112;
      double v39 = v10;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: profile for %@ is %@valid and %@already sentToCA%@ (%@)",  buf,  0x3Eu);
      unint64_t v17 = 0x18A16B000uLL;
    }

    if ((v14 & 1) == 0 && ((v12 & 1) != 0 || [*(id *)(v17 + 2872) isInternalInstall]))
    {
      +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v8,  0LL,  v9);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        [MEMORY[0x189607968] numberWithBool:1];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [a1 _saveToUserDefaults:v8 withKey:@"submittedToCA" andValue:v22];

        if (v10)
        {
          -[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", @"(");
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 objectAtIndexedSubscript:0];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 setValue:v24 forKey:@"reasonForSending"];
        }

        id v21 = v21;
        AnalyticsSendEventLazy();
      }
    }

    else
    {
      id v21 = 0LL;
    }

    [a1 _getDefaults];
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(v17 + 2872) reformatMACAddress:v8];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 removeObjectForKey:v26];

    if (v10 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(v17 + 2872) reformatMACAddress:v8];
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      __int16 v30 = 2160;
      uint64_t v31 = 1752392040LL;
      __int16 v32 = 2112;
      uint64_t v33 = v27;
      __int16 v34 = 2112;
      unint64_t v35 = v10;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: removed %{mask.hash}@ from defaults: %@",  buf,  0x2Au);
    }
  }

  else
  {
    id v21 = 0LL;
  }
}

id __80__WiFiUsageAccessPointProfile__submitProfileFor_withCachedDict_AndEraseWithLog___block_invoke( uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)_getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  (unint64_t)a3,  &unk_18A1B5A98,  @"0",  a4);
}

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4 onlyIfCurrent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (v7 && _apProfileVersion == 1)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileVersion",  v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileBeaconInfoOccurrencies",  v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = [v10 unsignedIntegerValue];

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileMaxAssocTime",  v8);
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = [v12 unsignedIntegerValue];

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileCacheTimestamp",  v8);
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileForLatestAssoc",  v8);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = [v15 BOOLValue];

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v7,  @"apProfileBeaconInfoParsingSuccessful",  v8);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 BOOLValue];

    if (!v5 || (v16 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([(id)_apProfileVersionString isEqualToString:v9] & v18) == 1
        && v11 >= _apProfileMinOccurrencies
        && (*(double *)&_apProfileMinAssoc <= (double)v13
         || v16
         && (objc_msgSend(v14, "timeIntervalSinceNow", (double)v13, *(double *)&_apProfileMinAssoc),
             *(double *)&_apProfileMinAssoc < -v23)))
      {
        BOOL v19 = 1;
      }

      else
      {
        if (!v9)
        {
LABEL_25:
          BOOL v19 = 0;
          goto LABEL_26;
        }

        BOOL v19 = 0;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = _apProfileVersionString;
          if (v18) {
            __int16 v25 = @"YES";
          }
          else {
            __int16 v25 = @"NO";
          }
          uint64_t v26 = _apProfileMinOccurrencies;
          uint64_t v30 = _apProfileMinAssoc;
          if (v16) {
            uint64_t v27 = @"YES";
          }
          else {
            uint64_t v27 = @"NO";
          }
          [v14 timeIntervalSinceNow];
          *(_DWORD *)buf = 136317698;
          __int16 v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
          __int16 v33 = 2112;
          uint64_t v34 = (uint64_t)v7;
          __int16 v35 = 2112;
          id v36 = v9;
          __int16 v37 = 2112;
          uint64_t v38 = v24;
          __int16 v39 = 2112;
          uint64_t v40 = v25;
          __int16 v41 = 2048;
          unint64_t v42 = v11;
          __int16 v43 = 2048;
          uint64_t v44 = v26;
          __int16 v45 = 2048;
          unint64_t v46 = v13;
          __int16 v47 = 2048;
          uint64_t v48 = v30;
          __int16 v49 = 2112;
          uint64_t v50 = v27;
          __int16 v51 = 2048;
          double v52 = -v28;
          uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v21 = "%s: Profile for bssid: %@ is NOT valid: version:%@ (current:%@) parsingSuccessful:%@ occurrencies:%lu (>"
                "=%lu) maxAssocTime(sec):%lu (>=%f) isCurrent:%@ lastUpdated/currentAssocTime(sec):%f";
          uint32_t v22 = 112;
          goto LABEL_24;
        }
      }
    }

    else
    {
      BOOL v19 = 0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
        __int16 v33 = 2160;
        uint64_t v34 = 1752392040LL;
        __int16 v35 = 2112;
        id v36 = v7;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v14;
        uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v21 = "%s: bssid %{mask.hash}@ has not been derived from a beacon retrieved after the current association (last updated: %@)";
        uint32_t v22 = 42;
LABEL_24:
        _os_log_impl(&dword_187EBF000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        goto LABEL_25;
      }
    }

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4
{
  return [a1 _isProfileValidForUse:a3 withCachedDict:a4 onlyIfCurrent:0];
}

+ (id)profileForBSSID:(id)a3
{
  return (id)[a1 profileForBSSID:a3 onlyIfCurrent:0];
}

+ (id)profileForBSSID:(id)a3 onlyIfCurrent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (_useShortProfile) {
      id v7 = @"apProfile_shortID";
    }
    else {
      id v7 = @"apProfileID";
    }
    id v8 = v7;
    int v9 = [a1 _isProfileValidForUse:v6 withCachedDict:0 onlyIfCurrent:v4];
    id v10 = 0LL;
    if (v9)
    {
      +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v6,  v8,  0LL);
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v11];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)longProfileForBSSID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _isProfileValidForUse:v4 withCachedDict:0];
  id v6 = 0LL;
  if (v5)
  {
    +[WiFiUsageAccessPointProfile _cachedProfile:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "_cachedProfile:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v7];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)shortProfileForBSSID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _isProfileValidForUse:v4 withCachedDict:0];
  id v6 = 0LL;
  if (v5)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v4,  @"apProfile_shortID",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v7];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)beaconsAndWPSInfo
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  [a1 _getDefaults];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dictionaryRepresentation];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v29 = (id)objc_opt_new();
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  [v4 allKeys];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "reformatMACAddress:", v9);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          unint64_t v11 = (void *)objc_opt_new();
          [v4 objectForKeyedSubscript:v9];
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileBeaconInfo" withCachedData:v12];
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 objectForKey:@"BeaconInformationElement_0"];
          int v14 = (void *)objc_claimAutoreleasedReturnValue();

          [v11 setBssid:v9];
          [v4 objectForKeyedSubscript:v9];
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileBeaconRaw" withCachedData:v15];
          int v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setBeacon:v16];

          if (v14)
          {
            unint64_t v17 = (void *)[objc_alloc(NSString) initWithData:v14 encoding:4];
            [v11 setSsid:v17];
          }

          [v4 objectForKeyedSubscript:v9];
          int v18 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileWPSInfo" withCachedData:v18];
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setApProfileWPSInfo:v19];

          [v4 objectForKeyedSubscript:v9];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileVersion" withCachedData:v20];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setApProfileVersion:v21];

          [v4 objectForKeyedSubscript:v9];
          uint32_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileID" withCachedData:v22];
          double v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setApProfileID:v23];

          [v4 objectForKeyedSubscript:v9];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfile_shortID" withCachedData:v24];
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setApProfile_shortID:", v25);

          [v4 objectForKeyedSubscript:v9];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 _loadFromUserDefaults:v9 withKey:@"apProfileCacheTimestampCreated" withCachedData:v26];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 && v27) {
            [v29 setObject:v11 forKey:v27];
          }
        }
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v6);
  }

  return v29;
}

+ (id)apNameForBSSID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 objectForKeyedSubscript:@"apName"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end