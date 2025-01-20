@interface MIInstallOptions
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)installationRequestorAuditToken;
- (BOOL)allowLocalProvisioned;
- (BOOL)installForMigrator;
- (BOOL)isDeveloperInstall;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemAppInstall;
- (BOOL)isUserInitiated;
- (BOOL)performAPFSClone;
- (BOOL)preservePlaceholderAsParallel;
- (BOOL)provisioningProfileInstallFailureIsFatal;
- (BOOL)skipBlacklist;
- (BOOL)skipWatchAppInstall;
- (BOOL)waitForDeletion;
- (MIInstallOptions)initWithCoder:(id)a3;
- (MIInstallOptions)initWithLegacyOptionsDictionary:(id)a3;
- (MIStoreMetadata)iTunesMetadata;
- (NSArray)provisioningProfiles;
- (NSData)geoJSONData;
- (NSData)iTunesArtworkData;
- (NSData)sinfData;
- (NSDictionary)legacyOptionsDictionary;
- (NSString)alternateIconName;
- (NSString)bundleIdentifier;
- (NSString)installTypeSummaryString;
- (NSString)linkedParentBundleID;
- (NSString)personaUniqueString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)autoInstallOverride;
- (unint64_t)installIntent;
- (unint64_t)installLocation;
- (unint64_t)installTargetType;
- (unint64_t)lsInstallType;
- (unint64_t)stashMode;
- (unsigned)sinfDataType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowLocalProvisioned:(BOOL)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeveloperInstall:(BOOL)a3;
- (void)setGeoJSONData:(id)a3;
- (void)setITunesArtworkData:(id)a3;
- (void)setITunesMetadata:(id)a3;
- (void)setInstallForMigrator:(BOOL)a3;
- (void)setInstallIntent:(unint64_t)a3;
- (void)setInstallLocation:(unint64_t)a3;
- (void)setInstallTargetType:(unint64_t)a3;
- (void)setInstallationRequestorAuditToken:(id *)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setLsInstallType:(unint64_t)a3;
- (void)setPerformAPFSClone:(BOOL)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setPreservePlaceholderAsParallel:(BOOL)a3;
- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3;
- (void)setProvisioningProfiles:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setSinfDataType:(unsigned int)a3;
- (void)setSkipBlacklist:(BOOL)a3;
- (void)setSkipWatchAppInstall:(BOOL)a3;
- (void)setStashMode:(unint64_t)a3;
- (void)setSystemAppInstall:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWaitForDeletion:(BOOL)a3;
@end

@implementation MIInstallOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIInstallOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIInstallOptions init](self, "init");
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installTargetType"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installTargetType = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v5->_developerInstall = [v4 decodeBoolForKey:@"developerInstall"];
    v5->_systemAppInstall = [v4 decodeBoolForKey:@"systemAppInstall"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_waitForDeletion = [v4 decodeBoolForKey:@"waitForDeletion"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsInstallType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lsInstallType = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesMetadata"];
    iTunesMetadata = v5->_iTunesMetadata;
    v5->_iTunesMetadata = (MIStoreMetadata *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfData"];
    sinfData = v5->_sinfData;
    v5->_sinfData = (NSData *)v12;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfDataType"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sinfDataType = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesArtworkData"];
    iTunesArtworkData = v5->_iTunesArtworkData;
    v5->_iTunesArtworkData = (NSData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoJSONData"];
    geoJSONData = v5->_geoJSONData;
    v5->_geoJSONData = (NSData *)v17;

    v19 = (void *)MEMORY[0x189604010];
    uint64_t v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"provisioningProfiles"];
    provisioningProfiles = v5->_provisioningProfiles;
    v5->_provisioningProfiles = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v24;

    v5->_skipWatchAppInstall = [v4 decodeBoolForKey:@"skipWatchAppInstall"];
    v5->_allowLocalProvisioned = [v4 decodeBoolForKey:@"allowLocalProvisioned"];
    v5->_performAPFSClone = [v4 decodeBoolForKey:@"performAPFSClone"];
    v5->_provisioningProfileInstallFailureIsFatal = [v4 decodeBoolForKey:@"provisioningProfileInstallFailureIsFatal"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoInstallOverride"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallOverride = [v26 unsignedIntegerValue];

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v27;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stashMode"];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stashMode = [v29 unsignedIntegerValue];

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v30;

    v5->_preservePlaceholderAsParallel = [v4 decodeBoolForKey:@"preservePlaceholderAsParallel"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installIntent"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installIntent = [v32 unsignedIntegerValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationRequestorAuditToken"];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33 && [v33 length] == 32) {
      -[MIInstallOptions setInstallationRequestorAuditToken:]( v5, "setInstallationRequestorAuditToken:", [v34 bytes]);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIInstallOptions installTargetType](self, "installTargetType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v4 forKey:@"installTargetType"];
  v5 = -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  [v21 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"),  @"developerInstall");
  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"),  @"systemAppInstall");
  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions isUserInitiated](self, "isUserInitiated"),  @"userInitiated");
  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions waitForDeletion](self, "waitForDeletion"),  @"waitForDeletion");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v6 forKey:@"lsInstallType"];

  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v7 forKey:@"iTunesMetadata"];
  v8 = -[MIInstallOptions sinfData](self, "sinfData");
  [v21 encodeObject:v8 forKey:@"sinfData"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v9 forKey:@"sinfDataType"];

  -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v10 forKey:@"iTunesArtworkData"];
  v11 = -[MIInstallOptions geoJSONData](self, "geoJSONData");
  [v21 encodeObject:v11 forKey:@"geoJSONData"];

  -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v12 forKey:@"provisioningProfiles"];
  v13 = -[MIInstallOptions alternateIconName](self, "alternateIconName");
  [v21 encodeObject:v13 forKey:@"alternateIconName"];

  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"),  @"skipWatchAppInstall");
  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"),  @"allowLocalProvisioned");
  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions performAPFSClone](self, "performAPFSClone"),  @"performAPFSClone");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v14 forKey:@"autoInstallOverride"];

  -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v15 forKey:@"linkedParentBundleID"];

  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"),  @"provisioningProfileInstallFailureIsFatal");
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[MIInstallOptions stashMode](self, "stashMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v16 forKey:@"stashMode"];

  -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v17 forKey:@"personaUniqueString"];

  objc_msgSend( v21,  "encodeBool:forKey:",  -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"),  @"preservePlaceholderAsParallel");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIInstallOptions installIntent](self, "installIntent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v18 forKey:@"installIntent"];

  v19 = -[MIInstallOptions installationRequestorAuditToken]( self, "installationRequestorAuditToken");
  if (v19)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:v19 length:32 freeWhenDone:0];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 encodeObject:v20 forKey:@"installationRequestorAuditToken"];
  }
}

- (MIInstallOptions)initWithLegacyOptionsDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[MIInstallOptions init](self, "init");
  if (!v5)
  {
LABEL_59:
    v60 = v5;
    goto LABEL_60;
  }

  [v4 objectForKeyedSubscript:@"PackageType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"Developer"])
  {
    -[MIInstallOptions setInstallTargetType:](v5, "setInstallTargetType:", 1LL);
    -[MIInstallOptions setDeveloperInstall:](v5, "setDeveloperInstall:", 1LL);
  }

  else
  {
    if (![v6 isEqualToString:@"System"])
    {
      if ([v6 isEqualToString:@"Placeholder"])
      {
        [v4 objectForKeyedSubscript:@"DowngradeToPlaceholder"];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        int v63 = MIBooleanValue(v62, 0LL);

        uint64_t v7 = v5;
        if (v63) {
          uint64_t v8 = 3LL;
        }
        else {
          uint64_t v8 = 2LL;
        }
        goto LABEL_4;
      }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIInstallOptions;
  -[MIInstallOptions dealloc](&v3, sel_dealloc);
}

- (void)setInstallationRequestorAuditToken:(id *)a3
{
  installationRequestorAuditToken = self->_installationRequestorAuditToken;
  if (installationRequestorAuditToken) {
    free(installationRequestorAuditToken);
  }
  if (a3)
  {
    v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)malloc(0x20uLL);
    __int128 v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v6->var0 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v6->var0[4] = v7;
  }

  else
  {
    v6 = 0LL;
  }

  self->_installationRequestorAuditToken = v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)installationRequestorAuditToken
{
  return self->_installationRequestorAuditToken;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setInstallTargetType:", -[MIInstallOptions installTargetType](self, "installTargetType"));
  v6 = -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  __int128 v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  objc_msgSend(v5, "setDeveloperInstall:", -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"));
  objc_msgSend(v5, "setSystemAppInstall:", -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"));
  objc_msgSend(v5, "setUserInitiated:", -[MIInstallOptions isUserInitiated](self, "isUserInitiated"));
  objc_msgSend(v5, "setWaitForDeletion:", -[MIInstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v5, "setLsInstallType:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setITunesMetadata:v9];

  -[MIInstallOptions sinfData](self, "sinfData");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setSinfData:v11];

  objc_msgSend(v5, "setSinfDataType:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setITunesArtworkData:v13];
  v14 = -[MIInstallOptions geoJSONData](self, "geoJSONData");
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setGeoJSONData:v15];

  -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [v5 setProvisioningProfiles:v17];

  -[MIInstallOptions alternateIconName](self, "alternateIconName");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = (void *)[v18 copyWithZone:a3];
  [v5 setAlternateIconName:v19];

  objc_msgSend(v5, "setSkipWatchAppInstall:", -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"));
  objc_msgSend( v5,  "setAllowLocalProvisioned:",  -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"));
  objc_msgSend(v5, "setPerformAPFSClone:", -[MIInstallOptions performAPFSClone](self, "performAPFSClone"));
  objc_msgSend(v5, "setAutoInstallOverride:", -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setLinkedParentBundleID:v20];

  objc_msgSend( v5,  "setProvisioningProfileInstallFailureIsFatal:",  -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(v5, "setStashMode:", -[MIInstallOptions stashMode](self, "stashMode"));
  -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setPersonaUniqueString:v21];

  objc_msgSend( v5,  "setPreservePlaceholderAsParallel:",  -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"));
  objc_msgSend(v5, "setInstallIntent:", -[MIInstallOptions installIntent](self, "installIntent"));
  objc_msgSend( v5, "setInstallationRequestorAuditToken:", -[MIInstallOptions installationRequestorAuditToken](self, "installationRequestorAuditToken"));
  return v5;
}

- (NSDictionary)legacyOptionsDictionary
{
  objc_super v3 = (void *)objc_opt_new();
  unint64_t v4 = -[MIInstallOptions installTargetType](self, "installTargetType");
  if (v4 == 3)
  {
    [v3 setObject:@"Placeholder" forKeyedSubscript:@"PackageType"];
    v5 = (const __CFString *)MEMORY[0x189604A88];
    v6 = @"DowngradeToPlaceholder";
  }

  else
  {
    if (v4 == 2)
    {
      v5 = @"Placeholder";
    }

    else
    {
      if (v4 != 1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          -[MIInstallOptions installTargetType](self, "installTargetType");
          MOLogWrite();
        }

        goto LABEL_66;
      }

      if (-[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"))
      {
        v5 = @"Developer";
      }

      else if (-[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"))
      {
        v5 = @"System";
      }

      else
      {
        v5 = @"Customer";
      }
    }

    v6 = @"PackageType";
  }

  [v3 setObject:v5 forKeyedSubscript:v6];
  -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x189604E00]];
  }

  if (-[MIInstallOptions isUserInitiated](self, "isUserInitiated")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsUserInitiated"];
  }
  if (-[MIInstallOptions waitForDeletion](self, "waitForDeletion")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"WaitForStorageDeletion"];
  }
  if (-[MIInstallOptions lsInstallType](self, "lsInstallType"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MIInstallOptions lsInstallType](self, "lsInstallType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKeyedSubscript:@"LSInstallType"];
  }

  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = 0LL;
    [v11 propertyListDataWithError:&v31];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v31;

    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"iTunesMetadata"];

      goto LABEL_20;
    }

LABEL_66:
    v29 = 0LL;
    goto LABEL_67;
  }

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MIInstallOptions *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      unint64_t v6 = -[MIInstallOptions installTargetType](self, "installTargetType");
      if (v6 == -[MIInstallOptions installTargetType](v5, "installTargetType"))
      {
        -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
        __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIInstallOptions bundleIdentifier](v5, "bundleIdentifier");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v9 = MICompareObjects(v7, v8);

        if (v9)
        {
          BOOL v10 = -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall");
          if (v10 == -[MIInstallOptions isDeveloperInstall](v5, "isDeveloperInstall"))
          {
            BOOL v12 = -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall");
            if (v12 == -[MIInstallOptions isSystemAppInstall](v5, "isSystemAppInstall"))
            {
              BOOL v13 = -[MIInstallOptions isUserInitiated](self, "isUserInitiated");
              if (v13 == -[MIInstallOptions isUserInitiated](v5, "isUserInitiated"))
              {
                BOOL v14 = -[MIInstallOptions waitForDeletion](self, "waitForDeletion");
                if (v14 == -[MIInstallOptions waitForDeletion](v5, "waitForDeletion"))
                {
                  unint64_t v15 = -[MIInstallOptions lsInstallType](self, "lsInstallType");
                  if (v15 == -[MIInstallOptions lsInstallType](v5, "lsInstallType"))
                  {
                    -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
                    id v16 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MIInstallOptions iTunesMetadata](v5, "iTunesMetadata");
                    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v18 = MICompareObjects(v16, v17);

                    if (v18)
                    {
                      -[MIInstallOptions sinfData](self, "sinfData");
                      id v19 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MIInstallOptions sinfData](v5, "sinfData");
                      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                      BOOL v21 = MICompareObjects(v19, v20);

                      if (v21)
                      {
                        unsigned int v22 = -[MIInstallOptions sinfDataType](self, "sinfDataType");
                        if (v22 == -[MIInstallOptions sinfDataType](v5, "sinfDataType"))
                        {
                          v23 = -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
                          -[MIInstallOptions iTunesArtworkData](v5, "iTunesArtworkData");
                          id v24 = (void *)objc_claimAutoreleasedReturnValue();
                          BOOL v25 = MICompareObjects(v23, v24);

                          if (v25)
                          {
                            v26 = -[MIInstallOptions geoJSONData](self, "geoJSONData");
                            -[MIInstallOptions geoJSONData](v5, "geoJSONData");
                            unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                            BOOL v28 = MICompareObjects(v26, v27);

                            if (v28)
                            {
                              v29 = -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
                              -[MIInstallOptions provisioningProfiles](v5, "provisioningProfiles");
                              id v30 = (void *)objc_claimAutoreleasedReturnValue();
                              BOOL v31 = MICompareObjects(v29, v30);

                              if (v31)
                              {
                                v32 = -[MIInstallOptions alternateIconName](self, "alternateIconName");
                                -[MIInstallOptions alternateIconName](v5, "alternateIconName");
                                id v33 = (void *)objc_claimAutoreleasedReturnValue();
                                BOOL v34 = MICompareObjects(v32, v33);

                                if (v34)
                                {
                                  BOOL v35 = -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall");
                                  if (v35 == -[MIInstallOptions skipWatchAppInstall](v5, "skipWatchAppInstall"))
                                  {
                                    BOOL v36 = -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned");
                                    if (v36 == -[MIInstallOptions allowLocalProvisioned](v5, "allowLocalProvisioned"))
                                    {
                                      BOOL v37 = -[MIInstallOptions performAPFSClone](self, "performAPFSClone");
                                      if (v37 == -[MIInstallOptions performAPFSClone](v5, "performAPFSClone"))
                                      {
                                        unint64_t v38 = -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride");
                                        if (v38 == -[MIInstallOptions autoInstallOverride](v5, "autoInstallOverride"))
                                        {
                                          -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
                                          id v39 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[MIInstallOptions linkedParentBundleID](v5, "linkedParentBundleID");
                                          id v40 = (void *)objc_claimAutoreleasedReturnValue();
                                          BOOL v41 = MICompareObjects(v39, v40);

                                          if (v41)
                                          {
                                            BOOL v42 = -[MIInstallOptions provisioningProfileInstallFailureIsFatal]( self,  "provisioningProfileInstallFailureIsFatal");
                                            if (v42 == -[MIInstallOptions provisioningProfileInstallFailureIsFatal]( v5,  "provisioningProfileInstallFailureIsFatal"))
                                            {
                                              unint64_t v43 = -[MIInstallOptions stashMode](self, "stashMode");
                                              if (v43 == -[MIInstallOptions stashMode](v5, "stashMode"))
                                              {
                                                v44 = -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
                                                v45 = -[MIInstallOptions personaUniqueString](v5, "personaUniqueString");
                                                BOOL v46 = MICompareObjects(v44, v45);

                                                if (v46)
                                                {
                                                  BOOL v47 = -[MIInstallOptions preservePlaceholderAsParallel]( self,  "preservePlaceholderAsParallel");
                                                  if (v47 == -[MIInstallOptions preservePlaceholderAsParallel]( v5,  "preservePlaceholderAsParallel"))
                                                  {
                                                    unint64_t v48 = -[MIInstallOptions installIntent](self, "installIntent");
                                                    if (v48 == -[MIInstallOptions installIntent](v5, "installIntent"))
                                                    {
                                                      id v49 = -[MIInstallOptions installationRequestorAuditToken]( self, "installationRequestorAuditToken");
                                                      v50 = -[MIInstallOptions installationRequestorAuditToken]( v5, "installationRequestorAuditToken");
                                                      if ((v49 != 0LL) == (v50 != 0LL))
                                                      {
                                                        if (!v49
                                                          || !v50
                                                          || (*(void *)v49->var0 == *(void *)v50->var0
                                                            ? (BOOL v51 = *(void *)&v49->var0[2] == *(void *)&v50->var0[2])
                                                            : (BOOL v51 = 0),
                                                              v51
                                                            ? (BOOL v52 = *(void *)&v49->var0[4] == *(void *)&v50->var0[4])
                                                            : (BOOL v52 = 0),
                                                              v52
                                                            ? (BOOL v53 = *(void *)&v49->var0[6] == *(void *)&v50->var0[6])
                                                            : (BOOL v53 = 0),
                                                              v53))
                                                        {
                                                          BOOL v11 = 1;
LABEL_117:

                                                          goto LABEL_118;
                                                        }
                                                      }

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MIInstallOptions installationRequestorAuditToken]( self, "installationRequestorAuditToken");
  if (v5)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:v5 length:32 freeWhenDone:0];
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 description];
    __int128 v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v7 = @"NULL";
  }

  [NSString stringWithFormat:@"%@ installationRequestorAuditToken: %@", v4, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)installTypeSummaryString
{
  unint64_t v3 = -[MIInstallOptions installTargetType](self, "installTargetType");
  if (v3 == 3) {
    return (NSString *)@"Offload";
  }
  if (v3 == 2) {
    return (NSString *)@"Placeholder";
  }
  if (v3 != 1) {
    return (NSString *)@"Unknown";
  }
  if (-[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall")) {
    return (NSString *)@"Developer";
  }
  if (-[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall")) {
    return (NSString *)@"System";
  }
  return (NSString *)@"Customer";
}

- (unint64_t)installTargetType
{
  return self->_installTargetType;
}

- (void)setInstallTargetType:(unint64_t)a3
{
  self->_installTargetType = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isDeveloperInstall
{
  return self->_developerInstall;
}

- (void)setDeveloperInstall:(BOOL)a3
{
  self->_developerInstall = a3;
}

- (BOOL)isSystemAppInstall
{
  return self->_systemAppInstall;
}

- (void)setSystemAppInstall:(BOOL)a3
{
  self->_systemAppInstall = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_waitForDeletion = a3;
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unint64_t)stashMode
{
  return self->_stashMode;
}

- (void)setStashMode:(unint64_t)a3
{
  self->_stashMode = a3;
}

- (unint64_t)installLocation
{
  return self->_installLocation;
}

- (void)setInstallLocation:(unint64_t)a3
{
  self->_installLocation = a3;
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (NSData)iTunesArtworkData
{
  return self->_iTunesArtworkData;
}

- (void)setITunesArtworkData:(id)a3
{
}

- (NSData)geoJSONData
{
  return self->_geoJSONData;
}

- (void)setGeoJSONData:(id)a3
{
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)skipWatchAppInstall
{
  return self->_skipWatchAppInstall;
}

- (void)setSkipWatchAppInstall:(BOOL)a3
{
  self->_skipWatchAppInstall = a3;
}

- (BOOL)skipBlacklist
{
  return self->_skipBlacklist;
}

- (void)setSkipBlacklist:(BOOL)a3
{
  self->_skipBlacklist = a3;
}

- (BOOL)installForMigrator
{
  return self->_installForMigrator;
}

- (void)setInstallForMigrator:(BOOL)a3
{
  self->_installForMigrator = a3;
}

- (BOOL)allowLocalProvisioned
{
  return self->_allowLocalProvisioned;
}

- (void)setAllowLocalProvisioned:(BOOL)a3
{
  self->_allowLocalProvisioned = a3;
}

- (BOOL)performAPFSClone
{
  return self->_performAPFSClone;
}

- (void)setPerformAPFSClone:(BOOL)a3
{
  self->_performAPFSClone = a3;
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (BOOL)provisioningProfileInstallFailureIsFatal
{
  return self->_provisioningProfileInstallFailureIsFatal;
}

- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3
{
  self->_provisioningProfileInstallFailureIsFatal = a3;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (BOOL)preservePlaceholderAsParallel
{
  return self->_preservePlaceholderAsParallel;
}

- (void)setPreservePlaceholderAsParallel:(BOOL)a3
{
  self->_preservePlaceholderAsParallel = a3;
}

- (unint64_t)installIntent
{
  return self->_installIntent;
}

- (void)setInstallIntent:(unint64_t)a3
{
  self->_installIntent = a3;
}

- (void).cxx_destruct
{
}

@end