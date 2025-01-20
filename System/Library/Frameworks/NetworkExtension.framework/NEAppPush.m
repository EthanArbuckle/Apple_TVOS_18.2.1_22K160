@interface NEAppPush
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (BOOL)overlapsWithConfiguration:(id)a3;
- (NEAppPush)init;
- (NEAppPush)initWithCoder:(id)a3;
- (NSArray)matchPrivateLTENetworks;
- (NSArray)matchSSIDs;
- (NSDictionary)providerConfiguration;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMatchPrivateLTENetworks:(id)a3;
- (void)setMatchSSIDs:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(id)a3;
- (void)setProviderConfiguration:(id)a3;
@end

@implementation NEAppPush

- (NEAppPush)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEAppPush;
  v2 = -[NEAppPush init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[NEAppPush setEnabled:](v2, "setEnabled:", 0LL);
  }
  return v3;
}

- (NEAppPush)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NEAppPush;
  objc_super v5 = -[NEAppPush init](&v29, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MatchSSIDs"];
    matchSSIDs = v5->_matchSSIDs;
    v5->_matchSSIDs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ProviderConfig"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleID"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v21;

    v23 = (void *)MEMORY[0x189604010];
    uint64_t v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"MatchPLTEs"];
    matchPrivateLTENetworks = v5->_matchPrivateLTENetworks;
    v5->_matchPrivateLTENetworks = (NSArray *)v26;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAppPush isEnabled](self, "isEnabled"), @"Enabled");
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"MatchSSIDs"];
  v6 = -[NEAppPush providerConfiguration](self, "providerConfiguration");
  [v4 encodeObject:v6 forKey:@"ProviderConfig"];

  -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"ProviderBundleID"];
  v8 = -[NEAppPush pluginType](self, "pluginType");
  [v4 encodeObject:v8 forKey:@"PluginType"];

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"MatchPLTEs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEAppPush init](+[NEAppPush allocWithZone:](&OBJC_CLASS___NEAppPush, "allocWithZone:", a3), "init");
  -[NEAppPush setEnabled:](v4, "setEnabled:", -[NEAppPush isEnabled](self, "isEnabled"));
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setMatchSSIDs:](v4, "setMatchSSIDs:", v5);
  v6 = -[NEAppPush providerConfiguration](self, "providerConfiguration");
  -[NEAppPush setProviderConfiguration:](v4, "setProviderConfiguration:", v6);

  -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setProviderBundleIdentifier:](v4, "setProviderBundleIdentifier:", v7);
  v8 = -[NEAppPush pluginType](self, "pluginType");
  -[NEAppPush setPluginType:](v4, "setPluginType:", v8);

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setMatchPrivateLTENetworks:](v4, "setMatchPrivateLTENetworks:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
  }

  else
  {
    v6 = -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v10 = @"Empty SSID list or private LTE network list";
      goto LABEL_46;
    }
  }
  v8 = -[NEAppPush matchSSIDs](self, "matchSSIDs");
  unint64_t v9 = [v8 count];

  if (v9 < 0xB)
  {
    v11 = -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    unint64_t v12 = [v11 count];

    if (v12 < 0xB)
    {
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      -[NEAppPush matchSSIDs](self, "matchSSIDs");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v59 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if (!isa_nsstring(v18) || ![v18 length])
            {
              +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid/Empty SSID string in the SSID list",  v4);

              goto LABEL_47;
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v52 = *(void *)v55;
        unint64_t v21 = 0x189607000uLL;
        while (2)
        {
          for (uint64_t j = 0LL; j != v20; ++j)
          {
            if (*(void *)v55 != v52) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            objc_msgSend(v23, "mobileCountryCode", v52);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (!self || !isa_nsstring(v24) || [v25 length] != 3)
            {
              v50 = v25;
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_57;
            }

            [*(id *)(v21 + 2064) decimalDigitCharacterSet];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 invertedSet];
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v28 = [v25 rangeOfCharacterFromSet:v27];
            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_58;
            }

            [v23 mobileNetworkCode];
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            if (!isa_nsstring(v29)
              || [v29 length] != 3 && objc_msgSend(v29, "length") != 2)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_56;
            }

            unint64_t v30 = v21;
            [*(id *)(v21 + 2064) decimalDigitCharacterSet];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v31 invertedSet];
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v33 = [v29 rangeOfCharacterFromSet:v32];
            if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = @"Invalid MCC/MNC in Private LTE configuration";
              goto LABEL_59;
            }

            uint64_t v34 = [v23 trackingAreaCode];
            unint64_t v21 = v30;
            if (v34)
            {
              v25 = (void *)v34;
              [v23 trackingAreaCode];
              id v29 = (id)objc_claimAutoreleasedReturnValue();
              [*(id *)(v30 + 2064) decimalDigitCharacterSet];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              [v35 invertedSet];
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if ([v29 rangeOfCharacterFromSet:v36] != 0x7FFFFFFFFFFFFFFFLL
                || ![v29 length])
              {

LABEL_55:
                v51 = @"Invalid TAC in Private LTE configuration";
LABEL_56:
                v50 = v25;

                v25 = v29;
LABEL_57:

                v25 = v50;
LABEL_58:

LABEL_59:
                +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v51, v4);

                goto LABEL_47;
              }

              unint64_t v37 = [v29 length];

              if (v37 > 5)
              {
                v51 = @"Invalid TAC in Private LTE configuration";
                goto LABEL_59;
              }
            }
          }

          uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      v38 = -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
      uint64_t v39 = [v38 length];

      if (v39)
      {
        uint64_t v40 = -[NEAppPush providerConfiguration](self, "providerConfiguration");
        if (!v40) {
          goto LABEL_40;
        }
        v41 = (void *)v40;
        v42 = -[NEAppPush providerConfiguration](self, "providerConfiguration");
        [v42 allKeys];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v44 = [v43 count];

        if (!v44)
        {
LABEL_40:
          ne_log_obj();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v63 = self;
            _os_log_impl(&dword_1876B1000, v45, OS_LOG_TYPE_INFO, "%@ no provider configuration found", buf, 0xCu);
          }
        }
        v46 = -[NEAppPush pluginType](self, "pluginType");
        uint64_t v47 = [v46 length];

        if (v47)
        {
          BOOL v48 = 1;
          goto LABEL_48;
        }

        v10 = @"missing plugin type";
      }

      else
      {
        v10 = @"provider bundle identifier not found";
      }
    }

    else
    {
      v10 = @"A configuration can have maximum 10 Private LTE networks";
    }
  }

  else
  {
    v10 = @"A configuration can have maximum 10 SSIDs";
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAppPush isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  v8 = -[NEAppPush matchSSIDs](self, "matchSSIDs");
  [v7 appendPrettyObject:v8 withName:@"matching SSID List" andIndent:v5 options:a4];

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"matching Private LTE Network List" andIndent:v5 options:a4];
  v10 = -[NEAppPush providerConfiguration](self, "providerConfiguration");
  [v7 appendPrettyObject:v10 withName:@"vendor specific provider configuration" andIndent:v5 options:a4];
  v11 = -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  [v7 appendPrettyObject:v11 withName:@"provider bundle identifier" andIndent:v5 options:a4];

  -[NEAppPush pluginType](self, "pluginType");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"plugin type" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEAppPush descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (BOOL)overlapsWithConfiguration:(id)a3
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x189604010];
  v6 = -[NEAppPush matchSSIDs](self, "matchSSIDs");
  [v5 setWithArray:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x189604010];
  [v4 matchSSIDs];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setWithArray:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v10 intersectsSet:v7] & 1) == 0)
  {
    v11 = -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    [v4 matchPrivateLTENetworks];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v11;
    id v14 = v12;
    uint64_t v15 = v14;
    if (!self || (LOBYTE(self) = 0, !v13) || !v14)
    {
LABEL_45:

      goto LABEL_46;
    }

    if (![v13 count] || !objc_msgSend(v15, "count"))
    {
      LOBYTE(self) = 0;
      goto LABEL_45;
    }

    unint64_t v16 = [v13 count];
    unint64_t v17 = [v15 count];
    if (v16 >= v17) {
      v18 = v15;
    }
    else {
      v18 = v13;
    }
    if (v16 >= v17) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = v15;
    }
    id v20 = v18;
    id v21 = v19;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v22 = v20;
    uint64_t v47 = [v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (!v47)
    {
      LOBYTE(self) = 0;
      goto LABEL_44;
    }

    uint64_t v23 = *(void *)v61;
    __int128 v54 = v7;
    id v55 = v4;
    id v52 = v13;
    v53 = v10;
    id v50 = v21;
    v51 = v15;
    v49 = v22;
    uint64_t v46 = *(void *)v61;
LABEL_16:
    uint64_t v24 = 0LL;
LABEL_17:
    if (*(void *)v61 != v23) {
      objc_enumerationMutation(v22);
    }
    uint64_t v48 = v24;
    v25 = *(void **)(*((void *)&v60 + 1) + 8 * v24);
    id v26 = v21;
    id v27 = v25;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (!v29) {
      goto LABEL_38;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v65;
    id v56 = v28;
LABEL_21:
    uint64_t v32 = 0LL;
    while (1)
    {
      if (*(void *)v65 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void **)(*((void *)&v64 + 1) + 8 * v32);
      objc_msgSend(v33, "mobileCountryCode", v46);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 mobileCountryCode];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v34 isEqual:v35]) {
        break;
      }

LABEL_36:
      if (v30 == ++v32)
      {
        uint64_t v30 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (v30) {
          goto LABEL_21;
        }
LABEL_38:

        uint64_t v24 = v48 + 1;
        id v7 = v54;
        id v4 = v55;
        id v13 = v52;
        v10 = v53;
        id v21 = v50;
        uint64_t v15 = v51;
        id v22 = v49;
        uint64_t v23 = v46;
        if (v48 + 1 == v47)
        {
          LOBYTE(self) = 0;
          uint64_t v47 = [v49 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (!v47)
          {
LABEL_44:

            goto LABEL_45;
          }

          goto LABEL_16;
        }

        goto LABEL_17;
      }
    }

    [v33 mobileNetworkCode];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 mobileNetworkCode];
    unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v36 isEqual:v37])
    {
      char v44 = 0;
      goto LABEL_35;
    }

    uint64_t v58 = [v33 trackingAreaCode];
    if (v58 || ([v27 trackingAreaCode], (__int128 v57 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v33 trackingAreaCode];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 trackingAreaCode];
      uint64_t v39 = v30;
      uint64_t v40 = v31;
      id v41 = v27;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      char v59 = [v38 isEqual:v42];

      id v27 = v41;
      uint64_t v31 = v40;
      uint64_t v30 = v39;

      id v28 = v56;
      v43 = (void *)v58;
      if (v58)
      {
LABEL_34:

        char v44 = v59;
LABEL_35:

        if ((v44 & 1) != 0)
        {

          LOBYTE(self) = 1;
          id v7 = v54;
          id v4 = v55;
          id v13 = v52;
          v10 = v53;
          id v21 = v50;
          uint64_t v15 = v51;
          id v22 = v49;
          goto LABEL_44;
        }

        goto LABEL_36;
      }
    }

    else
    {
      __int128 v57 = 0LL;
      char v59 = 1;
      v43 = 0LL;
    }

    goto LABEL_34;
  }

  LOBYTE(self) = 1;
LABEL_46:

  return (char)self;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProviderConfiguration:(id)a3
{
}

- (NSArray)matchSSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMatchSSIDs:(id)a3
{
}

- (NSArray)matchPrivateLTENetworks
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMatchPrivateLTENetworks:(id)a3
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPluginType:(id)a3
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProviderBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end