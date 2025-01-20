@interface ICLPlaceholderRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isBeta;
- (BOOL)isDeletable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarketplace;
- (BOOL)isOnDemandInstallCapable;
- (BOOL)isSwiftPlaygroundsApp;
- (BOOL)isWebNotificationBundle;
- (ICLPlaceholderRecord)initWithCoder:(id)a3;
- (ICLPlaceholderRecord)initWithLegacyRecordDictionary:(id)a3;
- (ICLSinfInfo)sinfInfo;
- (NSArray)parentIdentifiers;
- (NSData)installSessionID;
- (NSData)uniqueInstallID;
- (NSDate)installDate;
- (NSNumber)lsInstallType;
- (NSString)alternateIconName;
- (NSString)appManagementDomain;
- (NSString)linkedParentBundleID;
- (NSURL)bundleContainerURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (unint64_t)placeholderFailureReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAppManagementDomain:(id)a3;
- (void)setBundleContainerURL:(id)a3;
- (void)setInstallDate:(id)a3;
- (void)setInstallSessionID:(id)a3;
- (void)setIsBeta:(BOOL)a3;
- (void)setIsDeletable:(BOOL)a3;
- (void)setIsMarketplace:(BOOL)a3;
- (void)setIsOnDemandInstallCapable:(BOOL)a3;
- (void)setIsSwiftPlaygroundsApp:(BOOL)a3;
- (void)setIsWebNotificationBundle:(BOOL)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setLsInstallType:(id)a3;
- (void)setParentIdentifiers:(id)a3;
- (void)setPlaceholderFailureReason:(unint64_t)a3;
- (void)setSinfInfo:(id)a3;
- (void)setUniqueInstallID:(id)a3;
@end

@implementation ICLPlaceholderRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLPlaceholderRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  v5 = -[ICLBundleRecord initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleContainerURL"];
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v6;

    v5->_isOnDemandInstallCapable = [v4 decodeBoolForKey:@"isOnDemandInstallCapable"];
    v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"parentIdentifiers"];
    parentIdentifiers = v5->_parentIdentifiers;
    v5->_parentIdentifiers = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appManagementDomain"];
    appManagementDomain = v5->_appManagementDomain;
    v5->_appManagementDomain = (NSString *)v13;

    v5->_isSwiftPlaygroundsApp = [v4 decodeBoolForKey:@"isSwiftPlaygroundsApp"];
    v5->_isDeletable = [v4 decodeBoolForKey:@"isDeletable"];
    v5->_isBeta = [v4 decodeBoolForKey:@"isBeta"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureReason"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureReason = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsInstallType"];
    lsInstallType = v5->_lsInstallType;
    v5->_lsInstallType = (NSNumber *)v20;

    v5->_isWebNotificationBundle = [v4 decodeBoolForKey:@"isWebNotificationBundle"];
    v5->_isMarketplace = [v4 decodeBoolForKey:@"isMarketplace"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfInfo"];
    sinfInfo = v5->_sinfInfo;
    v5->_sinfInfo = (ICLSinfInfo *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueInstallID"];
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installSessionID"];
    installSessionID = v5->_installSessionID;
    v5->_installSessionID = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  id v4 = a3;
  -[ICLBundleRecord encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  v5 = -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL", v16.receiver, v16.super_class);
  [v4 encodeObject:v5 forKey:@"bundleContainerURL"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"),  @"isOnDemandInstallCapable");
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"parentIdentifiers"];
  v7 = -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  [v4 encodeObject:v7 forKey:@"appManagementDomain"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"),  @"isSwiftPlaygroundsApp");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"), @"isDeletable");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isBeta](self, "isBeta"), @"isBeta");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"placeholderFailureReason"];

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"alternateIconName"];
  v10 = -[ICLPlaceholderRecord installDate](self, "installDate");
  [v4 encodeObject:v10 forKey:@"installDate"];

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"lsInstallType"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"),  @"isWebNotificationBundle");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"),  @"isMarketplace");
  v12 = -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  [v4 encodeObject:v12 forKey:@"sinfInfo"];

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"uniqueInstallID"];
  v14 = -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  [v4 encodeObject:v14 forKey:@"installSessionID"];
  v15 = -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  [v4 encodeObject:v15 forKey:@"linkedParentBundleID"];
}

- (ICLPlaceholderRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  v5 = -[ICLBundleRecord initWithLegacyRecordDictionary:](&v44, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"BundleContainer"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    if (v8)
    {
      [MEMORY[0x189604030] fileURLWithPath:v8 isDirectory:1];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLPlaceholderRecord setBundleContainerURL:](v5, "setBundleContainerURL:", v9);
    }

    [v4 objectForKeyedSubscript:@"IsOnDemandInstallCapable"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsOnDemandInstallCapable:](v5, "setIsOnDemandInstallCapable:", MIBooleanValue(v10, 0LL));

    [v4 objectForKeyedSubscript:@"ParentIdentifiers"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }

    if (v13)
    {
      objc_opt_class();
    }

    [v4 objectForKeyedSubscript:@"AppManagementDomain"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v16 = v15;
    }
    else {
      id v16 = 0LL;
    }

    -[ICLPlaceholderRecord setAppManagementDomain:](v5, "setAppManagementDomain:", v16);
    [v4 objectForKeyedSubscript:@"IsSwiftPlaygroundsApp"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsSwiftPlaygroundsApp:](v5, "setIsSwiftPlaygroundsApp:", MIBooleanValue(v17, 0LL));

    [v4 objectForKeyedSubscript:@"IsDeletable"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsDeletable:](v5, "setIsDeletable:", MIBooleanValue(v18, 0LL));

    [v4 objectForKeyedSubscript:@"PlaceholderFailureReason"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v21 = v20;
    }
    else {
      id v21 = 0LL;
    }

    -[ICLPlaceholderRecord setPlaceholderFailureReason:]( v5,  "setPlaceholderFailureReason:",  [v21 unsignedIntegerValue]);
    [v4 objectForKeyedSubscript:@"AlternateIconName"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v24 = v23;
    }
    else {
      id v24 = 0LL;
    }

    -[ICLPlaceholderRecord setAlternateIconName:](v5, "setAlternateIconName:", v24);
    [v4 objectForKeyedSubscript:@"AppInstallDate"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v26 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v27 = v26;
    }
    else {
      id v27 = 0LL;
    }

    -[ICLPlaceholderRecord setInstallDate:](v5, "setInstallDate:", v27);
    [v4 objectForKeyedSubscript:@"LSInstallType"];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v29 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v30 = v29;
    }
    else {
      id v30 = 0LL;
    }

    -[ICLPlaceholderRecord setLsInstallType:](v5, "setLsInstallType:", v30);
    [v4 objectForKeyedSubscript:@"IsWebNotificationBundle"];
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsWebNotificationBundle:](v5, "setIsWebNotificationBundle:", MIBooleanValue(v31, 0LL));

    [v4 objectForKeyedSubscript:@"IsMarketplace"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsMarketplace:](v5, "setIsMarketplace:", MIBooleanValue(v32, 0LL));

    v33 = -[ICLSinfInfo initWithLegacySinfInfoDictionary:]( objc_alloc(&OBJC_CLASS___ICLSinfInfo),  "initWithLegacySinfInfoDictionary:",  v4);
    -[ICLPlaceholderRecord setSinfInfo:](v5, "setSinfInfo:", v33);

    [v4 objectForKeyedSubscript:@"UniqueInstallID"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v35 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v36 = v35;
    }
    else {
      id v36 = 0LL;
    }

    -[ICLPlaceholderRecord setUniqueInstallID:](v5, "setUniqueInstallID:", v36);
    [v4 objectForKeyedSubscript:@"InstallSessionID"];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v38 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v39 = v38;
    }
    else {
      id v39 = 0LL;
    }

    -[ICLPlaceholderRecord setInstallSessionID:](v5, "setInstallSessionID:", v39);
    [v4 objectForKeyedSubscript:@"LinkedParentBundleID"];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v41 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v42 = v41;
    }
    else {
      id v42 = 0LL;
    }

    -[ICLPlaceholderRecord setLinkedParentBundleID:](v5, "setLinkedParentBundleID:", v42);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  id v5 = -[ICLBundleRecord copyWithZone:](&v27, sel_copyWithZone_);
  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleContainerURL:v7];

  objc_msgSend( v5,  "setIsOnDemandInstallCapable:",  -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"));
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setParentIdentifiers:v9];
  v10 = -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAppManagementDomain:v11];

  objc_msgSend( v5,  "setIsSwiftPlaygroundsApp:",  -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"));
  objc_msgSend(v5, "setIsDeletable:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"));
  objc_msgSend(v5, "setIsBeta:", -[ICLPlaceholderRecord isBeta](self, "isBeta"));
  objc_msgSend( v5,  "setPlaceholderFailureReason:",  -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = (void *)[v12 copyWithZone:a3];
  [v5 setAlternateIconName:v13];
  v14 = -[ICLPlaceholderRecord installDate](self, "installDate");
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setInstallDate:v15];

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLsInstallType:v17];

  objc_msgSend( v5,  "setIsWebNotificationBundle:",  -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"));
  objc_msgSend(v5, "setIsMarketplace:", -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"));
  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSinfInfo:v19];

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = (void *)[v20 copyWithZone:a3];
  [v5 setUniqueInstallID:v21];

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = (void *)[v22 copyWithZone:a3];
  [v5 setInstallSessionID:v23];

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setLinkedParentBundleID:v25];

  return v5;
}

- (id)legacyRecordDictionary
{
  v3 = (void *)objc_opt_new();
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  -[ICLBundleRecord legacyRecordDictionary](&v28, sel_legacyRecordDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v4];

  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"BundleContainer"];
  }

  BOOL v7 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
  uint64_t v8 = MEMORY[0x189604A80];
  uint64_t v9 = MEMORY[0x189604A88];
  if (v7) {
    uint64_t v10 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v10 = MEMORY[0x189604A80];
  }
  [v3 setObject:v10 forKeyedSubscript:@"IsOnDemandInstallCapable"];
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"ParentIdentifiers"];
  }

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"AppManagementDomain"];
  }

  if (-[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp")) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = v8;
  }
  [v3 setObject:v13 forKeyedSubscript:@"IsSwiftPlaygroundsApp"];
  if (-[ICLPlaceholderRecord isDeletable](self, "isDeletable")) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = v8;
  }
  [v3 setObject:v14 forKeyedSubscript:@"IsDeletable"];
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"PlaceholderFailureReason"];
  }

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16) {
    [v3 setObject:v16 forKeyedSubscript:@"AlternateIconName"];
  }
  v17 = -[ICLPlaceholderRecord installDate](self, "installDate");
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"AppInstallDate"];
  }

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"LSInstallType"];
  }

  if (-[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle")) {
    uint64_t v19 = v9;
  }
  else {
    uint64_t v19 = v8;
  }
  [v3 setObject:v19 forKeyedSubscript:@"IsWebNotificationBundle"];
  if (-[ICLPlaceholderRecord isMarketplace](self, "isMarketplace")) {
    uint64_t v20 = v9;
  }
  else {
    uint64_t v20 = v8;
  }
  [v3 setObject:v20 forKeyedSubscript:@"IsMarketplace"];
  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 legacySinfInfoDictionary];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v22];

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23) {
    [v3 setObject:v23 forKeyedSubscript:@"UniqueInstallID"];
  }

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"InstallSessionID"];
  }
  v25 = -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  if (v25) {
    [v3 setObject:v25 forKeyedSubscript:@"LinkedParentBundleID"];
  }

  id v26 = (void *)[v3 copy];
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLPlaceholderRecord *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45.receiver = self;
      v45.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
      if (-[ICLBundleRecord isEqual:](&v45, sel_isEqual_, v4))
      {
        id v5 = v4;
        -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLPlaceholderRecord bundleContainerURL](v5, "bundleContainerURL");
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          BOOL v9 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
          if (v9 == -[ICLPlaceholderRecord isOnDemandInstallCapable](v5, "isOnDemandInstallCapable"))
          {
            -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLPlaceholderRecord parentIdentifiers](v5, "parentIdentifiers");
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v13 = MICompareObjects(v11, v12);

            if (v13)
            {
              -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLPlaceholderRecord appManagementDomain](v5, "appManagementDomain");
              id v15 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v16 = MICompareObjects(v14, v15);

              if (v16)
              {
                BOOL v17 = -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp");
                if (v17 == -[ICLPlaceholderRecord isSwiftPlaygroundsApp](v5, "isSwiftPlaygroundsApp"))
                {
                  BOOL v18 = -[ICLPlaceholderRecord isDeletable](self, "isDeletable");
                  if (v18 == -[ICLPlaceholderRecord isDeletable](v5, "isDeletable"))
                  {
                    BOOL v19 = -[ICLPlaceholderRecord isBeta](self, "isBeta");
                    if (v19 == -[ICLPlaceholderRecord isBeta](v5, "isBeta"))
                    {
                      unint64_t v20 = -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason");
                      if (v20 == -[ICLPlaceholderRecord placeholderFailureReason](v5, "placeholderFailureReason"))
                      {
                        -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
                        id v21 = (void *)objc_claimAutoreleasedReturnValue();
                        -[ICLPlaceholderRecord alternateIconName](v5, "alternateIconName");
                        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                        BOOL v23 = MICompareObjects(v21, v22);

                        if (v23)
                        {
                          -[ICLPlaceholderRecord installDate](self, "installDate");
                          id v24 = (void *)objc_claimAutoreleasedReturnValue();
                          v25 = -[ICLPlaceholderRecord installDate](v5, "installDate");
                          BOOL v26 = MICompareObjects(v24, v25);

                          if (v26)
                          {
                            -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
                            objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
                            -[ICLPlaceholderRecord lsInstallType](v5, "lsInstallType");
                            objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();
                            BOOL v29 = MICompareObjects(v27, v28);

                            if (v29)
                            {
                              -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
                              id v30 = (void *)objc_claimAutoreleasedReturnValue();
                              -[ICLPlaceholderRecord sinfInfo](v5, "sinfInfo");
                              objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
                              BOOL v32 = MICompareObjects(v30, v31);

                              if (v32)
                              {
                                BOOL v33 = -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle");
                                if (v33 == -[ICLPlaceholderRecord isWebNotificationBundle]( v5,  "isWebNotificationBundle"))
                                {
                                  BOOL v35 = -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace");
                                  if (v35 == -[ICLPlaceholderRecord isMarketplace](v5, "isMarketplace"))
                                  {
                                    -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
                                    id v36 = (void *)objc_claimAutoreleasedReturnValue();
                                    v37 = -[ICLPlaceholderRecord uniqueInstallID](v5, "uniqueInstallID");
                                    BOOL v38 = MICompareObjects(v36, v37);

                                    if (v38)
                                    {
                                      -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
                                      id v39 = (void *)objc_claimAutoreleasedReturnValue();
                                      v40 = -[ICLPlaceholderRecord installSessionID](v5, "installSessionID");
                                      BOOL v41 = MICompareObjects(v39, v40);

                                      if (v41)
                                      {
                                        -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
                                        id v42 = (void *)objc_claimAutoreleasedReturnValue();
                                        v43 = -[ICLPlaceholderRecord linkedParentBundleID](v5, "linkedParentBundleID");
                                        BOOL v44 = MICompareObjects(v42, v43);

                                        if (v44)
                                        {
                                          BOOL v10 = 1;
                                          goto LABEL_59;
                                        }

                                        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
LABEL_58:
                                          BOOL v10 = 0;
LABEL_59:

                                          goto LABEL_60;
                                        }
                                      }

                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_58;
                                      }
                                    }

                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_58;
                                    }
                                  }

                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_58;
                                  }
                                }

                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_58;
                                }
                              }

                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_58;
                              }
                            }

                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_58;
                            }
                          }

                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_58;
                          }
                        }

                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_58;
                        }
                      }

                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_58;
                      }
                    }

                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_58;
                    }
                  }

                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_58;
                  }
                }

                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_58;
                }
              }

              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_58;
              }
            }

            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_58;
            }
          }

          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_58;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_58;
        }

        MOLogWrite();
        goto LABEL_58;
      }
    }

    BOOL v10 = 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
  BOOL v4 = -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp");
  uint64_t v5 = 2LL;
  if (!v4) {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5 | v3;
  if (-[ICLPlaceholderRecord isDeletable](self, "isDeletable")) {
    uint64_t v7 = 4LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  BOOL v8 = -[ICLPlaceholderRecord isBeta](self, "isBeta");
  uint64_t v9 = 8LL;
  if (!v8) {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = v6 | v7 | v9 | (16LL * (-[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason") != 0));
  if (-[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle")) {
    uint64_t v11 = 32LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  BOOL v12 = -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace");
  uint64_t v13 = 64LL;
  if (!v12) {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = v10 | v11 | v13;
  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 hash];

  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v16 ^ [v17 hash];

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v18 ^ [v19 hash];

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = v20 ^ [v21 hash];

  -[ICLPlaceholderRecord installDate](self, "installDate");
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v22 ^ [v23 hash];
  v25 = -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  uint64_t v26 = v24 ^ [v25 hash];

  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = v14 ^ v26 ^ [v27 hash];

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 hash];

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = v30 ^ [v31 hash];

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = v32 ^ [v33 hash];

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___ICLPlaceholderRecord;
  return v28 ^ v34 ^ -[ICLBundleRecord hash](&v36, sel_hash);
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (void)setBundleContainerURL:(id)a3
{
}

- (BOOL)isOnDemandInstallCapable
{
  return self->_isOnDemandInstallCapable;
}

- (void)setIsOnDemandInstallCapable:(BOOL)a3
{
  self->_isOnDemandInstallCapable = a3;
}

- (NSArray)parentIdentifiers
{
  return self->_parentIdentifiers;
}

- (void)setParentIdentifiers:(id)a3
{
}

- (NSString)appManagementDomain
{
  return self->_appManagementDomain;
}

- (void)setAppManagementDomain:(id)a3
{
}

- (BOOL)isSwiftPlaygroundsApp
{
  return self->_isSwiftPlaygroundsApp;
}

- (void)setIsSwiftPlaygroundsApp:(BOOL)a3
{
  self->_isSwiftPlaygroundsApp = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (NSNumber)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(id)a3
{
}

- (BOOL)isWebNotificationBundle
{
  return self->_isWebNotificationBundle;
}

- (void)setIsWebNotificationBundle:(BOOL)a3
{
  self->_isWebNotificationBundle = a3;
}

- (ICLSinfInfo)sinfInfo
{
  return self->_sinfInfo;
}

- (void)setSinfInfo:(id)a3
{
}

- (NSData)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
}

- (NSData)installSessionID
{
  return self->_installSessionID;
}

- (void)setInstallSessionID:(id)a3
{
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (BOOL)isMarketplace
{
  return self->_isMarketplace;
}

- (void)setIsMarketplace:(BOOL)a3
{
  self->_isMarketplace = a3;
}

- (void).cxx_destruct
{
}

@end