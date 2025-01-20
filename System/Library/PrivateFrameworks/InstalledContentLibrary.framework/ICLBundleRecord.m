@interface ICLBundleRecord
+ (BOOL)supportsSecureCoding;
+ (id)bundleRecordArrayToInfoDictionaryArray:(id)a3;
+ (id)infoDictionaryArrayToBundleRecordArray:(id)a3;
- (BOOL)codeSigningInfoNotAuthoritative;
- (BOOL)hasAppGroupContainers;
- (BOOL)hasSettingsBundle;
- (BOOL)hasSystemContainer;
- (BOOL)hasSystemGroupContainers;
- (BOOL)isContainerized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoLongerCompatible;
- (BOOL)isOnMountedDiskImage;
- (BOOL)isPlaceholder;
- (ICLBundleRecord)initWithCoder:(id)a3;
- (ICLBundleRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSArray)counterpartIdentifiers;
- (NSDictionary)entitlements;
- (NSDictionary)environmentVariables;
- (NSDictionary)groupContainers;
- (NSDictionary)legacyRecordDictionary;
- (NSDictionary)personasRecordMap;
- (NSNumber)signatureVersion;
- (NSNumber)staticDiskUsage;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)codeInfoIdentifier;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (NSURL)bundleURL;
- (NSURL)dataContainerURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)applicationType;
- (unint64_t)codeSignerType;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unint64_t)profileValidationType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationType:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCodeInfoIdentifier:(id)a3;
- (void)setCodeSignerType:(unint64_t)a3;
- (void)setCodeSigningInfoNotAuthoritative:(BOOL)a3;
- (void)setCompatibilityState:(unint64_t)a3;
- (void)setCounterpartIdentifiers:(id)a3;
- (void)setDataContainerURL:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setEnvironmentVariables:(id)a3;
- (void)setGroupContainers:(id)a3;
- (void)setHasAppGroupContainers:(BOOL)a3;
- (void)setHasSettingsBundle:(BOOL)a3;
- (void)setHasSystemContainer:(BOOL)a3;
- (void)setHasSystemGroupContainers:(BOOL)a3;
- (void)setIsContainerized:(BOOL)a3;
- (void)setIsNoLongerCompatible:(BOOL)a3;
- (void)setIsOnMountedDiskImage:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setPersonasRecordMap:(id)a3;
- (void)setProfileValidationType:(unint64_t)a3;
- (void)setSignatureVersion:(id)a3;
- (void)setSignerIdentity:(id)a3;
- (void)setSignerOrganization:(id)a3;
- (void)setStaticDiskUsage:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation ICLBundleRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLBundleRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[ICLBundleRecord init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleShortVersion"];
    bundleShortVersion = v5->_bundleShortVersion;
    v5->_bundleShortVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signerIdentity"];
    signerIdentity = v5->_signerIdentity;
    v5->_signerIdentity = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signatureVersion"];
    signatureVersion = v5->_signatureVersion;
    v5->_signatureVersion = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signerOrganization"];
    signerOrganization = v5->_signerOrganization;
    v5->_signerOrganization = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v20;

    v5->_codeSigningInfoNotAuthoritative = [v4 decodeBoolForKey:@"codeSigningInfoNotAuthoritative"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codeInfoIdentifier"];
    codeInfoIdentifier = v5->_codeInfoIdentifier;
    v5->_codeInfoIdentifier = (NSString *)v22;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codeSignerType"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_codeSignerType = [v24 unsignedIntegerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileValidationType"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_profileValidationType = [v25 unsignedIntegerValue];

    v5->_isPlaceholder = [v4 decodeBoolForKey:@"isPlaceholder"];
    v5->_isNoLongerCompatible = [v4 decodeBoolForKey:@"isNoLongerCompatible"];
    v5->_hasSettingsBundle = [v4 decodeBoolForKey:@"hasSettingsBundle"];
    v5->_isContainerized = [v4 decodeBoolForKey:@"isContainerized"];
    v5->_hasAppGroupContainers = [v4 decodeBoolForKey:@"hasAppGroupContainers"];
    v5->_hasSystemContainer = [v4 decodeBoolForKey:@"hasSystemContainer"];
    v5->_hasSystemGroupContainers = [v4 decodeBoolForKey:@"hasSystemGroupContainers"];
    v5->_isOnMountedDiskImage = [v4 decodeBoolForKey:@"isOnMountedDiskImage"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compatibilityState"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_compatibilityState = [v26 unsignedIntegerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationType"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_applicationType = [v27 unsignedIntegerValue];

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticDiskUsage"];
    staticDiskUsage = v5->_staticDiskUsage;
    v5->_staticDiskUsage = (NSNumber *)v28;

    v30 = (void *)MEMORY[0x189604010];
    uint64_t v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"counterpartIdentifiers"];
    counterpartIdentifiers = v5->_counterpartIdentifiers;
    v5->_counterpartIdentifiers = (NSArray *)v33;

    v35 = (void *)MEMORY[0x189604010];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"entitlements"];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSDictionary *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataContainerURL"];
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v42;

    v44 = (void *)MEMORY[0x189604010];
    uint64_t v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"environmentVariables"];
    environmentVariables = v5->_environmentVariables;
    v5->_environmentVariables = (NSDictionary *)v47;

    v49 = (void *)MEMORY[0x189604010];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"groupContainers"];
    groupContainers = v5->_groupContainers;
    v5->_groupContainers = (NSDictionary *)v53;

    v55 = (void *)MEMORY[0x189604010];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"personasRecordMap"];
    personasRecordMap = v5->_personasRecordMap;
    v5->_personasRecordMap = (NSDictionary *)v59;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"bundleVersion"];
  v7 = -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  [v4 encodeObject:v7 forKey:@"bundleShortVersion"];

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"bundleURL"];
  v9 = -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  [v4 encodeObject:v9 forKey:@"signerIdentity"];

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"signatureVersion"];
  v11 = -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  [v4 encodeObject:v11 forKey:@"signerOrganization"];

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"teamIdentifier"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"),  @"codeSigningInfoNotAuthoritative");
  v13 = -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  [v4 encodeObject:v13 forKey:@"codeInfoIdentifier"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"codeSignerType"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"profileValidationType"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"),  @"isPlaceholder");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"),  @"isNoLongerCompatible");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"),  @"hasSettingsBundle");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord isContainerized](self, "isContainerized"),  @"isContainerized");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"),  @"hasAppGroupContainers");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"),  @"hasSystemContainer");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"),  @"hasSystemGroupContainers");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"),  @"isOnMountedDiskImage");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"compatibilityState"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLBundleRecord applicationType](self, "applicationType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v17 forKey:@"applicationType"];

  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v18 forKey:@"staticDiskUsage"];
  v19 = -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  [v4 encodeObject:v19 forKey:@"counterpartIdentifiers"];

  -[ICLBundleRecord entitlements](self, "entitlements");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v20 forKey:@"entitlements"];
  v21 = -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  [v4 encodeObject:v21 forKey:@"dataContainerURL"];

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v22 forKey:@"environmentVariables"];
  v23 = -[ICLBundleRecord groupContainers](self, "groupContainers");
  [v4 encodeObject:v23 forKey:@"groupContainers"];

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v24 forKey:@"personasRecordMap"];
}

- (ICLBundleRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[ICLBundleRecord init](self, "init");
  if (v5)
  {
    [v4 objectForKeyedSubscript:*MEMORY[0x189604E00]];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    -[ICLBundleRecord setBundleIdentifier:](v5, "setBundleIdentifier:", v8);
    [v4 objectForKeyedSubscript:*MEMORY[0x189604E18]];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    -[ICLBundleRecord setBundleVersion:](v5, "setBundleVersion:", v11);
    [v4 objectForKeyedSubscript:*MEMORY[0x189604AC8]];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    -[ICLBundleRecord setBundleShortVersion:](v5, "setBundleShortVersion:", v14);
    [v4 objectForKeyedSubscript:@"Path"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v16 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v17 = v16;
    }
    else {
      id v17 = 0LL;
    }

    if (v17)
    {
      [MEMORY[0x189604030] fileURLWithPath:v17 isDirectory:1];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord setBundleURL:](v5, "setBundleURL:", v18);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", @"SignerIdentity", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v21 = v20;
    }
    else {
      id v21 = 0LL;
    }

    -[ICLBundleRecord setSignerIdentity:](v5, "setSignerIdentity:", v21);
    [v4 objectForKeyedSubscript:@"SignatureVersion"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v24 = v23;
    }
    else {
      id v24 = 0LL;
    }

    -[ICLBundleRecord setSignatureVersion:](v5, "setSignatureVersion:", v24);
    [v4 objectForKeyedSubscript:@"SignerOrganization"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v26 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v27 = v26;
    }
    else {
      id v27 = 0LL;
    }

    -[ICLBundleRecord setSignerOrganization:](v5, "setSignerOrganization:", v27);
    [v4 objectForKeyedSubscript:@"TeamIdentifier"];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v29 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v30 = v29;
    }
    else {
      id v30 = 0LL;
    }

    -[ICLBundleRecord setTeamIdentifier:](v5, "setTeamIdentifier:", v30);
    [v4 objectForKeyedSubscript:@"CodeSigningInfoNotAuthoritative"];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setCodeSigningInfoNotAuthoritative:]( v5,  "setCodeSigningInfoNotAuthoritative:",  MIBooleanValue(v31, 0LL));

    [v4 objectForKeyedSubscript:@"CodeInfoIdentifier"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v33 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v34 = v33;
    }
    else {
      id v34 = 0LL;
    }

    -[ICLBundleRecord setCodeInfoIdentifier:](v5, "setCodeInfoIdentifier:", v34);
    [v4 objectForKeyedSubscript:@"ProfileValidated"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    char v36 = MIBooleanValue(v35, 0LL);

    if ((v36 & 1) != 0)
    {
      uint64_t v37 = 3LL;
    }

    else
    {
      [v4 objectForKeyedSubscript:@"IsAdHocSigned"];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      char v39 = MIBooleanValue(v38, 0LL);

      if ((v39 & 1) != 0)
      {
        uint64_t v37 = 1LL;
      }

      else if (-[ICLBundleRecord isPlaceholder](v5, "isPlaceholder"))
      {
        uint64_t v37 = 6LL;
      }

      else
      {
        uint64_t v37 = 2LL;
      }
    }

    -[ICLBundleRecord setCodeSignerType:](v5, "setCodeSignerType:", v37);
    [v4 objectForKeyedSubscript:@"UPPValidated"];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    char v41 = MIBooleanValue(v40, 0LL);

    if ((v41 & 1) != 0)
    {
      uint64_t v42 = 2LL;
    }

    else
    {
      [v4 objectForKeyedSubscript:@"FreeProfileValidated"];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v44 = MIBooleanValue(v43, 0LL);

      if (v44) {
        uint64_t v42 = 3LL;
      }
      else {
        uint64_t v42 = 1LL;
      }
    }

    -[ICLBundleRecord setProfileValidationType:](v5, "setProfileValidationType:", v42);
    [v4 objectForKeyedSubscript:@"IsPlaceholder"];
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsPlaceholder:](v5, "setIsPlaceholder:", MIBooleanValue(v45, 0LL));

    [v4 objectForKeyedSubscript:@"IsNoLongerCompatible"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsNoLongerCompatible:](v5, "setIsNoLongerCompatible:", MIBooleanValue(v46, 0LL));

    [v4 objectForKeyedSubscript:@"HasSettingsBundle"];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSettingsBundle:](v5, "setHasSettingsBundle:", MIBooleanValue(v47, 0LL));

    [v4 objectForKeyedSubscript:@"IsContainerized"];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsContainerized:](v5, "setIsContainerized:", MIBooleanValue(v48, 0LL));

    [v4 objectForKeyedSubscript:@"HasAppGroupContainers"];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasAppGroupContainers:](v5, "setHasAppGroupContainers:", MIBooleanValue(v49, 0LL));

    [v4 objectForKeyedSubscript:@"HasSystemContainer"];
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSystemContainer:](v5, "setHasSystemContainer:", MIBooleanValue(v50, 0LL));

    [v4 objectForKeyedSubscript:@"HasSystemGroupContainers"];
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSystemGroupContainers:](v5, "setHasSystemGroupContainers:", MIBooleanValue(v51, 0LL));

    [v4 objectForKeyedSubscript:@"IsOnMountedDiskImage"];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsOnMountedDiskImage:](v5, "setIsOnMountedDiskImage:", MIBooleanValue(v52, 0LL));

    [v4 objectForKeyedSubscript:@"CompatibilityState"];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v54 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v55 = v54;
    }
    else {
      id v55 = 0LL;
    }

    -[ICLBundleRecord setCompatibilityState:](v5, "setCompatibilityState:", [v55 unsignedIntegerValue]);
    [v4 objectForKeyedSubscript:@"ApplicationType"];
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v56 isEqualToString:@"Any"])
    {
      uint64_t v57 = 6LL;
    }

    else if ([v56 isEqualToString:@"CoreServices"])
    {
      uint64_t v57 = 1LL;
    }

    else if ([v56 isEqualToString:@"System"])
    {
      uint64_t v57 = 2LL;
    }

    else if ([v56 isEqualToString:@"SystemAppPlaceholder"])
    {
      uint64_t v57 = 3LL;
    }

    else if ([v56 isEqualToString:@"User"])
    {
      uint64_t v57 = 4LL;
    }

    else if ([v56 isEqualToString:@"Internal"])
    {
      uint64_t v57 = 5LL;
    }

    else
    {
      uint64_t v57 = 0LL;
    }

    -[ICLBundleRecord setApplicationType:](v5, "setApplicationType:", v57);
    [v4 objectForKeyedSubscript:@"StaticDiskUsage"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v59 = v58;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v60 = v59;
    }
    else {
      id v60 = 0LL;
    }

    -[ICLBundleRecord setStaticDiskUsage:](v5, "setStaticDiskUsage:", v60);
    [v4 objectForKeyedSubscript:@"LSCounterpartIdentifiers"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v62 = v61;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v63 = v62;
    }
    else {
      id v63 = 0LL;
    }

    if (v63)
    {
      objc_opt_class();
    }

    [v4 objectForKeyedSubscript:@"Entitlements"];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v65 = v64;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v66 = v65;
    }
    else {
      id v66 = 0LL;
    }

    if (v66)
    {
      uint64_t v67 = objc_opt_class();
    }

    [v4 objectForKeyedSubscript:@"Container"];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v69 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v70 = v69;
    }
    else {
      id v70 = 0LL;
    }

    if (v70)
    {
      [MEMORY[0x189604030] fileURLWithPath:v70 isDirectory:1];
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord setDataContainerURL:](v5, "setDataContainerURL:", v71);
    }

    [v4 objectForKeyedSubscript:@"EnvironmentVariables"];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v73 = v72;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v74 = v73;
    }
    else {
      id v74 = 0LL;
    }

    if (v74)
    {
      uint64_t v75 = objc_opt_class();
      uint64_t v76 = objc_opt_class();
    }

    [v4 objectForKeyedSubscript:@"GroupContainers"];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v78 = v77;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v79 = v78;
    }
    else {
      id v79 = 0LL;
    }

    if (v79)
    {
      uint64_t v80 = objc_opt_class();
      uint64_t v81 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v79, v80, v81))
      {
        v82 = (void *)objc_opt_new();
        v87[0] = MEMORY[0x1895F87A8];
        v87[1] = 3221225472LL;
        v87[2] = __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke;
        v87[3] = &unk_189D48C68;
        id v88 = v82;
        id v83 = v82;
        [v79 enumerateKeysAndObjectsUsingBlock:v87];
        v84 = (void *)[v83 copy];
        -[ICLBundleRecord setGroupContainers:](v5, "setGroupContainers:", v84);
      }
    }
  }

  return v5;
}

void __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x189604030];
  id v6 = a2;
  [v5 fileURLWithPath:a3 isDirectory:1];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBundleVersion:v9];

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setBundleShortVersion:v11];

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBundleURL:v13];

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setSignerIdentity:v15];

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = (void *)[v16 copyWithZone:a3];
  [v5 setSignatureVersion:v17];

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSignerOrganization:v19];

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = (void *)[v20 copyWithZone:a3];
  [v5 setTeamIdentifier:v21];

  objc_msgSend( v5,  "setCodeSigningInfoNotAuthoritative:",  -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"));
  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = (void *)[v22 copyWithZone:a3];
  [v5 setCodeInfoIdentifier:v23];

  objc_msgSend(v5, "setCodeSignerType:", -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  objc_msgSend(v5, "setProfileValidationType:", -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  objc_msgSend(v5, "setIsPlaceholder:", -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v5, "setIsNoLongerCompatible:", -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"));
  objc_msgSend(v5, "setHasSettingsBundle:", -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"));
  objc_msgSend(v5, "setIsContainerized:", -[ICLBundleRecord isContainerized](self, "isContainerized"));
  objc_msgSend(v5, "setHasAppGroupContainers:", -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"));
  objc_msgSend(v5, "setHasSystemContainer:", -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"));
  objc_msgSend( v5,  "setHasSystemGroupContainers:",  -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"));
  objc_msgSend(v5, "setIsOnMountedDiskImage:", -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"));
  objc_msgSend(v5, "setCompatibilityState:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  objc_msgSend(v5, "setApplicationType:", -[ICLBundleRecord applicationType](self, "applicationType"));
  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setStaticDiskUsage:v25];

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = (void *)[v26 copyWithZone:a3];
  [v5 setCounterpartIdentifiers:v27];

  -[ICLBundleRecord entitlements](self, "entitlements");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = (void *)[v28 copyWithZone:a3];
  [v5 setEntitlements:v29];

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = (void *)[v30 copyWithZone:a3];
  [v5 setDataContainerURL:v31];
  v32 = -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  id v33 = (void *)[v32 copyWithZone:a3];
  [v5 setEnvironmentVariables:v33];

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)[v34 copyWithZone:a3];
  [v5 setGroupContainers:v35];

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  char v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)[v36 copyWithZone:a3];
  [v5 setPersonasRecordMap:v37];

  return v5;
}

- (NSDictionary)legacyRecordDictionary
{
  v3 = (void *)objc_opt_new();
  unint64_t v4 = -[ICLBundleRecord applicationType](self, "applicationType") - 1;
  if (v4 <= 5) {
    [v3 setObject:off_189D48CB0[v4] forKeyedSubscript:@"ApplicationType"];
  }
  v5 = -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x189604E00]];
  }

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x189604E18]];
  }

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x189604AC8]];
  }

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 path];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"Path"];
  }

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:@"SignerIdentity"];
  }

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"SignatureVersion"];
  }

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"SignerOrganization"];
  }

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13) {
    [v3 setObject:v13 forKeyedSubscript:@"TeamIdentifier"];
  }

  BOOL v14 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
  uint64_t v15 = MEMORY[0x189604A80];
  uint64_t v16 = MEMORY[0x189604A88];
  if (v14) {
    uint64_t v17 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v17 = MEMORY[0x189604A80];
  }
  [v3 setObject:v17 forKeyedSubscript:@"CodeSigningInfoNotAuthoritative"];
  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"CodeInfoIdentifier"];
  }

  if (-[ICLBundleRecord codeSignerType](self, "codeSignerType") == 3) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = v15;
  }
  [v3 setObject:v19 forKeyedSubscript:@"ProfileValidated"];
  if (-[ICLBundleRecord profileValidationType](self, "profileValidationType") == 2) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = v15;
  }
  [v3 setObject:v20 forKeyedSubscript:@"UPPValidated"];
  if (-[ICLBundleRecord profileValidationType](self, "profileValidationType") == 3) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = v15;
  }
  [v3 setObject:v21 forKeyedSubscript:@"FreeProfileValidated"];
  if (-[ICLBundleRecord codeSignerType](self, "codeSignerType") == 1) {
    uint64_t v22 = v16;
  }
  else {
    uint64_t v22 = v15;
  }
  [v3 setObject:v22 forKeyedSubscript:@"IsAdHocSigned"];
  if (-[ICLBundleRecord isPlaceholder](self, "isPlaceholder")) {
    uint64_t v23 = v16;
  }
  else {
    uint64_t v23 = v15;
  }
  [v3 setObject:v23 forKeyedSubscript:@"IsPlaceholder"];
  if (-[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible")) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v15;
  }
  [v3 setObject:v24 forKeyedSubscript:@"IsNoLongerCompatible"];
  if (-[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle")) {
    uint64_t v25 = v16;
  }
  else {
    uint64_t v25 = v15;
  }
  [v3 setObject:v25 forKeyedSubscript:@"HasSettingsBundle"];
  if (-[ICLBundleRecord isContainerized](self, "isContainerized")) {
    uint64_t v26 = v16;
  }
  else {
    uint64_t v26 = v15;
  }
  [v3 setObject:v26 forKeyedSubscript:@"IsContainerized"];
  if (-[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers")) {
    uint64_t v27 = v16;
  }
  else {
    uint64_t v27 = v15;
  }
  [v3 setObject:v27 forKeyedSubscript:@"HasAppGroupContainers"];
  if (-[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer")) {
    uint64_t v28 = v16;
  }
  else {
    uint64_t v28 = v15;
  }
  [v3 setObject:v28 forKeyedSubscript:@"HasSystemContainer"];
  if (-[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers")) {
    uint64_t v29 = v16;
  }
  else {
    uint64_t v29 = v15;
  }
  [v3 setObject:v29 forKeyedSubscript:@"HasSystemGroupContainers"];
  if (-[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage")) {
    uint64_t v30 = v16;
  }
  else {
    uint64_t v30 = v15;
  }
  [v3 setObject:v30 forKeyedSubscript:@"IsOnMountedDiskImage"];
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31) {
    [v3 setObject:v31 forKeyedSubscript:@"CompatibilityState"];
  }
  v32 = -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  if (v32) {
    [v3 setObject:v32 forKeyedSubscript:@"StaticDiskUsage"];
  }

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v33 forKeyedSubscript:@"LSCounterpartIdentifiers"];

  -[ICLBundleRecord entitlements](self, "entitlements");
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34) {
    [v3 setObject:v34 forKeyedSubscript:@"Entitlements"];
  }
  v35 = -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  [v35 path];
  char v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36) {
    [v3 setObject:v36 forKeyedSubscript:@"Container"];
  }

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37) {
    [v3 setObject:v37 forKeyedSubscript:@"EnvironmentVariables"];
  }

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    char v39 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 3221225472LL;
    v44[2] = __41__ICLBundleRecord_legacyRecordDictionary__block_invoke;
    v44[3] = &unk_189D48C90;
    id v40 = v39;
    id v45 = v40;
    [v38 enumerateKeysAndObjectsUsingBlock:v44];
    char v41 = (void *)[v40 copy];
    if (v41) {
      [v3 setObject:v41 forKeyedSubscript:@"GroupContainers"];
    }
  }

  uint64_t v42 = (void *)[v3 copy];

  return (NSDictionary *)v42;
}

void __41__ICLBundleRecord_legacyRecordDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 path];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ICLBundleRecord *)a3;
  if (self == v4)
  {
    BOOL v31 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord bundleIdentifier](v5, "bundleIdentifier");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = -[ICLBundleRecord bundleVersion](self, "bundleVersion");
        -[ICLBundleRecord bundleVersion](v5, "bundleVersion");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLBundleRecord bundleShortVersion](v5, "bundleShortVersion");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            -[ICLBundleRecord bundleURL](self, "bundleURL");
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLBundleRecord bundleURL](v5, "bundleURL");
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v17 = MICompareObjects(v15, v16);

            if (v17)
            {
              -[ICLBundleRecord signerIdentity](self, "signerIdentity");
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLBundleRecord signerIdentity](v5, "signerIdentity");
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v20 = MICompareObjects(v18, v19);

              if (v20)
              {
                -[ICLBundleRecord signatureVersion](self, "signatureVersion");
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICLBundleRecord signatureVersion](v5, "signatureVersion");
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v23 = MICompareObjects(v21, v22);

                if (v23)
                {
                  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
                  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ICLBundleRecord signerOrganization](v5, "signerOrganization");
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v26 = MICompareObjects(v24, v25);

                  if (v26)
                  {
                    -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ICLBundleRecord teamIdentifier](v5, "teamIdentifier");
                    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v29 = MICompareObjects(v27, v28);

                    if (v29)
                    {
                      BOOL v30 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
                      if (v30 == -[ICLBundleRecord codeSigningInfoNotAuthoritative]( v5,  "codeSigningInfoNotAuthoritative"))
                      {
                        v32 = -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
                        -[ICLBundleRecord codeInfoIdentifier](v5, "codeInfoIdentifier");
                        id v33 = (void *)objc_claimAutoreleasedReturnValue();
                        BOOL v34 = MICompareObjects(v32, v33);

                        if (v34)
                        {
                          unint64_t v35 = -[ICLBundleRecord codeSignerType](self, "codeSignerType");
                          if (v35 == -[ICLBundleRecord codeSignerType](v5, "codeSignerType"))
                          {
                            unint64_t v36 = -[ICLBundleRecord profileValidationType](self, "profileValidationType");
                            if (v36 == -[ICLBundleRecord profileValidationType](v5, "profileValidationType"))
                            {
                              BOOL v37 = -[ICLBundleRecord isPlaceholder](self, "isPlaceholder");
                              if (v37 == -[ICLBundleRecord isPlaceholder](v5, "isPlaceholder"))
                              {
                                BOOL v38 = -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible");
                                if (v38 == -[ICLBundleRecord isNoLongerCompatible](v5, "isNoLongerCompatible"))
                                {
                                  BOOL v39 = -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle");
                                  if (v39 == -[ICLBundleRecord hasSettingsBundle](v5, "hasSettingsBundle"))
                                  {
                                    BOOL v40 = -[ICLBundleRecord isContainerized](self, "isContainerized");
                                    if (v40 == -[ICLBundleRecord isContainerized](v5, "isContainerized"))
                                    {
                                      BOOL v41 = -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers");
                                      if (v41 == -[ICLBundleRecord hasAppGroupContainers](v5, "hasAppGroupContainers"))
                                      {
                                        BOOL v42 = -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer");
                                        if (v42 == -[ICLBundleRecord hasSystemContainer](v5, "hasSystemContainer"))
                                        {
                                          BOOL v43 = -[ICLBundleRecord hasSystemGroupContainers]( self,  "hasSystemGroupContainers");
                                          if (v43 == -[ICLBundleRecord hasSystemGroupContainers]( v5,  "hasSystemGroupContainers"))
                                          {
                                            BOOL v44 = -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage");
                                            if (v44 == -[ICLBundleRecord isOnMountedDiskImage]( v5,  "isOnMountedDiskImage"))
                                            {
                                              unint64_t v45 = -[ICLBundleRecord compatibilityState](self, "compatibilityState");
                                              if (v45 == -[ICLBundleRecord compatibilityState]( v5,  "compatibilityState"))
                                              {
                                                unint64_t v46 = -[ICLBundleRecord applicationType](self, "applicationType");
                                                if (v46 == -[ICLBundleRecord applicationType](v5, "applicationType"))
                                                {
                                                  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
                                                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v48 = -[ICLBundleRecord staticDiskUsage](v5, "staticDiskUsage");
                                                  BOOL v49 = MICompareObjects(v47, v48);

                                                  if (v49)
                                                  {
                                                    -[ICLBundleRecord counterpartIdentifiers]( self,  "counterpartIdentifiers");
                                                    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[ICLBundleRecord counterpartIdentifiers]( v5,  "counterpartIdentifiers");
                                                    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                    BOOL v52 = MICompareObjects(v50, v51);

                                                    if (v52)
                                                    {
                                                      -[ICLBundleRecord entitlements](self, "entitlements");
                                                      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[ICLBundleRecord entitlements](v5, "entitlements");
                                                      id v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                      BOOL v55 = MICompareObjects(v53, v54);

                                                      if (v55)
                                                      {
                                                        -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
                                                        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[ICLBundleRecord dataContainerURL](v5, "dataContainerURL");
                                                        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                        BOOL v58 = MICompareObjects(v56, v57);

                                                        if (v58)
                                                        {
                                                          -[ICLBundleRecord environmentVariables]( self,  "environmentVariables");
                                                          id v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[ICLBundleRecord environmentVariables]( v5,  "environmentVariables");
                                                          id v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                          BOOL v61 = MICompareObjects(v59, v60);

                                                          if (v61)
                                                          {
                                                            -[ICLBundleRecord groupContainers](self, "groupContainers");
                                                            id v62 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[ICLBundleRecord groupContainers](v5, "groupContainers");
                                                            id v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                            BOOL v64 = MICompareObjects(v62, v63);

                                                            if (v64)
                                                            {
                                                              -[ICLBundleRecord personasRecordMap]( self,  "personasRecordMap");
                                                              id v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                              -[ICLBundleRecord personasRecordMap]( v5,  "personasRecordMap");
                                                              id v66 = (void *)objc_claimAutoreleasedReturnValue();
                                                              BOOL v67 = MICompareObjects(v65, v66);

                                                              if (v67)
                                                              {
                                                                BOOL v31 = 1;
LABEL_123:

                                                                goto LABEL_124;
                                                              }

                                                              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                              {
LABEL_122:
                                                                BOOL v31 = 0;
                                                                goto LABEL_123;
                                                              }
                                                            }

                                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                            {
                                                              goto LABEL_122;
                                                            }
                                                          }

                                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                          {
                                                            goto LABEL_122;
                                                          }
                                                        }

                                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                        {
                                                          goto LABEL_122;
                                                        }
                                                      }

                                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                      {
                                                        goto LABEL_122;
                                                      }
                                                    }

                                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                    {
                                                      goto LABEL_122;
                                                    }
                                                  }

                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_122;
                                                  }
                                                }

                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_122;
                                                }
                                              }

                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_122;
                                              }
                                            }

                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_122;
                                            }
                                          }

                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_122;
                                          }
                                        }

                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_122;
                                        }
                                      }

                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_122;
                                      }
                                    }

                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_122;
                                    }
                                  }

                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_122;
                                  }
                                }

                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_122;
                                }
                              }

                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_122;
                              }
                            }

                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_122;
                            }
                          }

                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_122;
                          }
                        }

                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_122;
                        }
                      }

                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_122;
                      }
                    }

                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_122;
                    }
                  }

                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_122;
                  }
                }

                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_122;
                }
              }

              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_122;
              }
            }

            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_122;
            }
          }

          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_122;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_122;
        }
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_122;
      }

      MOLogWrite();
      goto LABEL_122;
    }

    BOOL v31 = 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
  BOOL v4 = -[ICLBundleRecord isPlaceholder](self, "isPlaceholder");
  uint64_t v5 = 2LL;
  if (!v4) {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5 | v3;
  if (-[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible")) {
    uint64_t v7 = 4LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  BOOL v8 = -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle");
  uint64_t v9 = 8LL;
  if (!v8) {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = v6 | v7 | v9;
  if (-[ICLBundleRecord isContainerized](self, "isContainerized")) {
    uint64_t v11 = 16LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  BOOL v12 = -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers");
  uint64_t v13 = 32LL;
  if (!v12) {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = v11 | v13;
  BOOL v15 = -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer");
  uint64_t v16 = 64LL;
  if (!v15) {
    uint64_t v16 = 0LL;
  }
  uint64_t v17 = v10 | v14 | v16;
  if (-[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers")) {
    uint64_t v18 = 128LL;
  }
  else {
    uint64_t v18 = 0LL;
  }
  BOOL v19 = -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage");
  uint64_t v20 = 256LL;
  if (!v19) {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = v18 ^ v20;
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v21 ^ [v22 hash];

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = v17 ^ v23 ^ [v24 hash];

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 hash];

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = v27 ^ [v28 hash];

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = v29 ^ [v30 hash];
  v32 = -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  uint64_t v33 = v31 ^ [v32 hash];

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = v33 ^ [v34 hash];

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = v25 ^ v35 ^ [v36 hash];

  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v38 hash];

  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  BOOL v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = v39 ^ [v40 hash];

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = v41 ^ [v42 hash];

  -[ICLBundleRecord entitlements](self, "entitlements");
  BOOL v44 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = v43 ^ [v44 hash];

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = v45 ^ [v46 hash];
  v48 = -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  uint64_t v49 = v47 ^ [v48 hash];

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = v37 ^ v49 ^ [v50 hash];

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  BOOL v52 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [v52 hash];

  unint64_t v54 = v53 ^ -[ICLBundleRecord codeSignerType](self, "codeSignerType");
  unint64_t v55 = v54 ^ -[ICLBundleRecord profileValidationType](self, "profileValidationType");
  unint64_t v56 = v55 ^ -[ICLBundleRecord compatibilityState](self, "compatibilityState");
  return v51 ^ v56 ^ -[ICLBundleRecord applicationType](self, "applicationType");
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bundleRecordArrayToInfoDictionaryArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "legacyRecordDictionary", (void)v13);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    uint64_t v11 = (void *)[v4 copy];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

+ (id)infoDictionaryArrayToBundleRecordArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = objc_alloc(&OBJC_CLASS___ICLBundleRecord);
          BOOL v12 = -[ICLBundleRecord initWithLegacyRecordDictionary:]( v11,  "initWithLegacyRecordDictionary:",  v10,  (void)v15);
          [v4 addObject:v12];
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    __int128 v13 = (void *)[v4 copy];
  }

  else
  {
    __int128 v13 = 0LL;
  }

  return v13;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (void)setSignerIdentity:(id)a3
{
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (void)setSignatureVersion:(id)a3
{
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (void)setSignerOrganization:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (BOOL)codeSigningInfoNotAuthoritative
{
  return self->_codeSigningInfoNotAuthoritative;
}

- (void)setCodeSigningInfoNotAuthoritative:(BOOL)a3
{
  self->_codeSigningInfoNotAuthoritative = a3;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (void)setCodeInfoIdentifier:(id)a3
{
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (void)setCodeSignerType:(unint64_t)a3
{
  self->_codeSignerType = a3;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (void)setProfileValidationType:(unint64_t)a3
{
  self->_profileValidationType = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isNoLongerCompatible
{
  return self->_isNoLongerCompatible;
}

- (void)setIsNoLongerCompatible:(BOOL)a3
{
  self->_isNoLongerCompatible = a3;
}

- (BOOL)hasSettingsBundle
{
  return self->_hasSettingsBundle;
}

- (void)setHasSettingsBundle:(BOOL)a3
{
  self->_hasSettingsBundle = a3;
}

- (BOOL)isContainerized
{
  return self->_isContainerized;
}

- (void)setIsContainerized:(BOOL)a3
{
  self->_isContainerized = a3;
}

- (BOOL)hasAppGroupContainers
{
  return self->_hasAppGroupContainers;
}

- (void)setHasAppGroupContainers:(BOOL)a3
{
  self->_hasAppGroupContainers = a3;
}

- (BOOL)hasSystemContainer
{
  return self->_hasSystemContainer;
}

- (void)setHasSystemContainer:(BOOL)a3
{
  self->_hasSystemContainer = a3;
}

- (BOOL)hasSystemGroupContainers
{
  return self->_hasSystemGroupContainers;
}

- (void)setHasSystemGroupContainers:(BOOL)a3
{
  self->_hasSystemGroupContainers = a3;
}

- (BOOL)isOnMountedDiskImage
{
  return self->_isOnMountedDiskImage;
}

- (void)setIsOnMountedDiskImage:(BOOL)a3
{
  self->_isOnMountedDiskImage = a3;
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (unint64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (NSNumber)staticDiskUsage
{
  return self->_staticDiskUsage;
}

- (void)setStaticDiskUsage:(id)a3
{
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setCounterpartIdentifiers:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)setDataContainerURL:(id)a3
{
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
}

- (NSDictionary)groupContainers
{
  return self->_groupContainers;
}

- (void)setGroupContainers:(id)a3
{
}

- (NSDictionary)personasRecordMap
{
  return self->_personasRecordMap;
}

- (void)setPersonasRecordMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end