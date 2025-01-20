@interface UARPAssetID
+ (BOOL)supportsSecureCoding;
- (BOOL)analyticsIsEqual:(id)a3;
- (BOOL)deploymentAllowed;
- (BOOL)isDeploymentAllowed;
- (BOOL)isDynamicAsset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStagingInProgressOnAccessoryID:(id)a3;
- (BOOL)isUrgentUpdate;
- (BOOL)reportProgressToDelegates;
- (BOOL)signatureValidationNeeded;
- (NSArray)deploymentRules;
- (NSDate)assetReleaseDate;
- (NSNumber)firmwareFileSize;
- (NSNumber)releaseNotesFileSize;
- (NSString)assetVersion;
- (NSString)firmwareHash;
- (NSString)localPath;
- (NSString)modelNumber;
- (NSString)releaseDate;
- (NSString)releaseNotesLocalPath;
- (NSString)releaseNotesRemotePath;
- (NSString)remotePath;
- (NSURL)localURL;
- (NSURL)releaseNotesLocalURL;
- (NSURL)releaseNotesRemoteURL;
- (NSURL)remoteURL;
- (NSURL)tatsuServerURL;
- (UARPAssetID)initWithCoder:(id)a3;
- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 filePath:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 url:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4 releaseNotesRemotePath:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4 releaseNotesRemoteURL:(id)a5;
- (UARPAssetTag)tag;
- (const)typeString;
- (id)_createUARPDeploymentRules:(id)a3;
- (id)assetVersionNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentDay;
- (id)deploymentPercent;
- (id)description;
- (id)downstreamAssetIDs;
- (id)rawDescription;
- (id)remoteBuildManifestPlistPath;
- (int64_t)downloadStatus;
- (int64_t)releaseNotesAvailabilityStatus;
- (int64_t)releaseNotesDownloadStatus;
- (int64_t)type;
- (int64_t)updateAvailabilityStatus;
- (int64_t)validationStatus;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)processUARPDeploymentRules:(id)a3;
- (void)restoreDefaultStatus;
- (void)setAssetReleaseDate:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setAssetVersionNumber:(id)a3;
- (void)setDeploymentAllowed:(BOOL)a3;
- (void)setDeploymentDay:(id)a3;
- (void)setDeploymentPercent:(id)a3;
- (void)setDeploymentRules:(id)a3;
- (void)setDownloadStatus:(int64_t)a3;
- (void)setFirmwareFileSize:(id)a3;
- (void)setFirmwareHash:(id)a3;
- (void)setIsUrgentUpdate:(BOOL)a3;
- (void)setLocalPath:(id)a3;
- (void)setLocalURL:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseNotesAvailabilityStatus:(int64_t)a3;
- (void)setReleaseNotesDownloadStatus:(int64_t)a3;
- (void)setReleaseNotesFileSize:(id)a3;
- (void)setReleaseNotesLocalPath:(id)a3;
- (void)setReleaseNotesLocalURL:(id)a3;
- (void)setReleaseNotesRemotePath:(id)a3;
- (void)setReleaseNotesRemoteURL:(id)a3;
- (void)setRemoteBuildManifestPlistPath:(id)a3;
- (void)setRemotePath:(id)a3;
- (void)setRemoteURL:(id)a3;
- (void)setReportProgressToDelegates:(BOOL)a3;
- (void)setSignatureValidationNeeded:(BOOL)a3;
- (void)setTag:(id)a3;
- (void)setTatsuServerURL:(id)a3;
- (void)setUpdateAvailabilityStatus:(int64_t)a3;
- (void)setValidationStatus:(int64_t)a3;
- (void)stagingCompleteOnAccessoryID:(id)a3;
- (void)stagingStartedOnAccessoryID:(id)a3;
@end

@implementation UARPAssetID

- (BOOL)analyticsIsEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[UARPAssetID type](self, "type");
  if (v5 == [v4 type])
  {
    v6 = -[UARPAssetID remoteURL](self, "remoteURL");
    [v4 remoteURL];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqual:v7])
    {
      v8 = -[UARPAssetID assetVersion](self, "assetVersion");
      [v4 assetVersion];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v8 isEqual:v9];
    }

    else
    {
      char v10 = 0;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, v6);

  return v7;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 filePath:(id)a5
{
  v8 = (void *)MEMORY[0x189604030];
  id v9 = a4;
  [v8 URLWithString:a5];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UARPAssetID initWithLocationType:assetTag:url:](self, "initWithLocationType:assetTag:url:", a3, v9, v10);

  return v11;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 url:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tag, a4);
    uint64_t v13 = [v10 copy];
    localURL = v12->_localURL;
    v12->_localURL = (NSURL *)v13;
  }

  return v12;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___UARPAssetID;
  v7 = -[UARPAssetID init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_downloadStatus = 0LL;
    v7->_updateAvailabilityStatus = 0LL;
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "assetID");
    log = v8->_log;
    v8->_log = v9;

    v8->_signatureValidationNeeded = 1;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    activeAccessoriesForStaging = v8->_activeAccessoriesForStaging;
    v8->_activeAccessoriesForStaging = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    downstreamAssetIDs = v8->_downstreamAssetIDs;
    v8->_downstreamAssetIDs = v13;

    v8->_reportProgressToDelegates = 1;
    v8->_deploymentAllowed = 1;
    uint64_t v15 = [v6 copy];
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = (NSURL *)v15;

    if (!v6)
    {
      uint64_t v17 = UARPAssetLocationTypeToURL(v8->_type);
      v18 = v8->_remoteURL;
      v8->_remoteURL = (NSURL *)v17;
    }
  }

  return v8;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4 releaseNotesRemotePath:(id)a5
{
  id v8 = a5;
  os_log_t v9 = -[UARPAssetID initWithLocationType:remotePath:](self, "initWithLocationType:remotePath:", a3, a4);
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [MEMORY[0x189604030] URLWithString:v8];
    releaseNotesRemoteURL = v10->_releaseNotesRemoteURL;
    v10->_releaseNotesRemoteURL = (NSURL *)v11;
  }

  return v10;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4 releaseNotesRemoteURL:(id)a5
{
  id v8 = a5;
  os_log_t v9 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, a4);
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    releaseNotesRemoteURL = v9->_releaseNotesRemoteURL;
    v9->_releaseNotesRemoteURL = (NSURL *)v10;
  }

  return v9;
}

- (UARPAssetID)initWithCoder:(id)a3
{
  v53[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___UARPAssetID;
  int64_t v5 = -[UARPAssetID init](&v50, sel_init);
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteURL"];
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersionNumber"];
    assetVersionNumber = v5->_assetVersionNumber;
    v5->_assetVersionNumber = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteBuildManifestPlistPath"];
    remoteBuildManifestPlistPath = v5->_remoteBuildManifestPlistPath;
    v5->_remoteBuildManifestPlistPath = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localURL"];
    localURL = v5->_localURL;
    v5->_localURL = (NSURL *)v14;

    v5->_downloadStatus = [v4 decodeIntegerForKey:@"downloadStatus"];
    v5->_updateAvailabilityStatus = [v4 decodeIntegerForKey:@"updateAvailabilityStatus"];
    v5->_releaseNotesDownloadStatus = [v4 decodeIntegerForKey:@"releaseNotesDownloadStatus"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesRemoteURL"];
    releaseNotesRemoteURL = v5->_releaseNotesRemoteURL;
    v5->_releaseNotesRemoteURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesLocalURL"];
    releaseNotesLocalURL = v5->_releaseNotesLocalURL;
    v5->_releaseNotesLocalURL = (NSURL *)v18;

    v5->_releaseNotesAvailabilityStatus = [v4 decodeIntegerForKey:@"releaseNotesAvailabilityStatus"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesFileSize"];
    releaseNotesFileSize = v5->_releaseNotesFileSize;
    v5->_releaseNotesFileSize = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareFileSize"];
    firmwareFileSize = v5->_firmwareFileSize;
    v5->_firmwareFileSize = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetReleaseDate"];
    assetReleaseDate = v5->_assetReleaseDate;
    v5->_assetReleaseDate = (NSDate *)v24;

    v5->_deploymentAllowed = [v4 decodeBoolForKey:@"deploymentAllowed"];
    v5->_signatureValidationNeeded = [v4 decodeBoolForKey:@"signatureValidationNeeded"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (UARPAssetTag *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareHash"];
    firmwareHash = v5->_firmwareHash;
    v5->_firmwareHash = (NSString *)v28;

    v5->_reportProgressToDelegates = [v4 decodeBoolForKey:@"reportProgressToDelegates"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelNumber"];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v30;

    v32 = (void *)MEMORY[0x189604010];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v53 count:2];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 setWithArray:v33];
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"downstreamAssetIDs"];
    downstreamAssetIDs = v5->_downstreamAssetIDs;
    v5->_downstreamAssetIDs = (NSMutableArray *)v35;

    if (!v5->_downstreamAssetIDs)
    {
      v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      v38 = v5->_downstreamAssetIDs;
      v5->_downstreamAssetIDs = v37;
    }

    v39 = (void *)MEMORY[0x189604010];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v52 count:2];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 setWithArray:v40];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"activeAccessoriesForStaging"];
    activeAccessoriesForStaging = v5->_activeAccessoriesForStaging;
    v5->_activeAccessoriesForStaging = (NSMutableArray *)v42;

    v44 = (void *)MEMORY[0x189604010];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v51 count:2];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 setWithArray:v45];
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"deploymentRules"];
    deploymentRules = v5->_deploymentRules;
    v5->_deploymentRules = (NSArray *)v47;

    v5->_isUrgentUpdate = [v4 decodeBoolForKey:@"isUrgentUpdate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_remoteURL forKey:@"remoteURL"];
  [v5 encodeObject:self->_assetVersion forKey:@"assetVersion"];
  [v5 encodeObject:self->_assetVersionNumber forKey:@"assetVersionNumber"];
  [v5 encodeObject:self->_remoteBuildManifestPlistPath forKey:@"remoteBuildManifestPlistPath"];
  [v5 encodeObject:self->_localURL forKey:@"localURL"];
  [v5 encodeInteger:self->_downloadStatus forKey:@"downloadStatus"];
  [v5 encodeInteger:self->_updateAvailabilityStatus forKey:@"updateAvailabilityStatus"];
  [v5 encodeInteger:self->_releaseNotesDownloadStatus forKey:@"releaseNotesDownloadStatus"];
  [v5 encodeObject:self->_releaseNotesRemoteURL forKey:@"releaseNotesRemoteURL"];
  [v5 encodeObject:self->_releaseNotesLocalURL forKey:@"releaseNotesLocalURL"];
  [v5 encodeInteger:self->_releaseNotesAvailabilityStatus forKey:@"releaseNotesAvailabilityStatus"];
  [v5 encodeObject:self->_releaseNotesFileSize forKey:@"releaseNotesFileSize"];
  [v5 encodeObject:self->_firmwareFileSize forKey:@"firmwareFileSize"];
  [v5 encodeObject:self->_assetReleaseDate forKey:@"assetReleaseDate"];
  [v5 encodeObject:self->_deploymentRules forKey:@"deploymentRules"];
  [v5 encodeBool:self->_deploymentAllowed forKey:@"deploymentAllowed"];
  [v5 encodeBool:self->_signatureValidationNeeded forKey:@"signatureValidationNeeded"];
  [v5 encodeObject:self->_tag forKey:@"tag"];
  [v5 encodeObject:self->_firmwareHash forKey:@"firmwareHash"];
  [v5 encodeObject:self->_activeAccessoriesForStaging forKey:@"activeAccessoriesForStaging"];
  [v5 encodeBool:self->_reportProgressToDelegates forKey:@"reportProgressToDelegates"];
  [v5 encodeBool:self->_isUrgentUpdate forKey:@"isUrgentUpdate"];
  [v5 encodeObject:self->_modelNumber forKey:@"modelNumber"];
  [v5 encodeObject:self->_downstreamAssetIDs forKey:@"downstreamAssetIDs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  self->_type,  self->_remoteURL);
  -[UARPAssetID setRemoteBuildManifestPlistPath:]( v4,  "setRemoteBuildManifestPlistPath:",  self->_remoteBuildManifestPlistPath);
  -[UARPAssetID setLocalURL:](v4, "setLocalURL:", self->_localURL);
  -[UARPAssetID setDownloadStatus:](v4, "setDownloadStatus:", self->_downloadStatus);
  -[UARPAssetID setUpdateAvailabilityStatus:](v4, "setUpdateAvailabilityStatus:", self->_updateAvailabilityStatus);
  -[UARPAssetID setAssetVersion:](v4, "setAssetVersion:", self->_assetVersion);
  -[UARPAssetID setAssetVersionNumber:](v4, "setAssetVersionNumber:", self->_assetVersionNumber);
  -[UARPAssetID setReleaseNotesLocalURL:](v4, "setReleaseNotesLocalURL:", self->_releaseNotesLocalURL);
  -[UARPAssetID setReleaseNotesRemoteURL:](v4, "setReleaseNotesRemoteURL:", self->_releaseNotesRemoteURL);
  -[UARPAssetID setReleaseNotesDownloadStatus:](v4, "setReleaseNotesDownloadStatus:", self->_releaseNotesDownloadStatus);
  -[UARPAssetID setReleaseNotesAvailabilityStatus:]( v4,  "setReleaseNotesAvailabilityStatus:",  self->_releaseNotesAvailabilityStatus);
  -[UARPAssetID setReleaseNotesFileSize:](v4, "setReleaseNotesFileSize:", self->_releaseNotesFileSize);
  -[UARPAssetID setFirmwareFileSize:](v4, "setFirmwareFileSize:", self->_firmwareFileSize);
  -[UARPAssetID setAssetReleaseDate:](v4, "setAssetReleaseDate:", self->_assetReleaseDate);
  -[UARPAssetID setDeploymentRules:](v4, "setDeploymentRules:", self->_deploymentRules);
  -[UARPAssetID setDeploymentAllowed:](v4, "setDeploymentAllowed:", self->_deploymentAllowed);
  -[UARPAssetID setSignatureValidationNeeded:](v4, "setSignatureValidationNeeded:", self->_signatureValidationNeeded);
  -[UARPAssetID setTag:](v4, "setTag:", self->_tag);
  -[UARPAssetID setFirmwareHash:](v4, "setFirmwareHash:", self->_firmwareHash);
  objc_storeStrong((id *)&v4->_activeAccessoriesForStaging, self->_activeAccessoriesForStaging);
  -[UARPAssetID setIsUrgentUpdate:](v4, "setIsUrgentUpdate:", self->_isUrgentUpdate);
  -[UARPAssetID setModelNumber:](v4, "setModelNumber:", self->_modelNumber);
  uint64_t v5 = -[NSMutableArray mutableCopy](self->_downstreamAssetIDs, "mutableCopy");
  downstreamAssetIDs = v4->_downstreamAssetIDs;
  v4->_downstreamAssetIDs = (NSMutableArray *)v5;

  return v4;
}

- (void)setRemoteBuildManifestPlistPath:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  remoteBuildManifestPlistPath = self->_remoteBuildManifestPlistPath;
  self->_remoteBuildManifestPlistPath = v4;
}

- (id)remoteBuildManifestPlistPath
{
  return self->_remoteBuildManifestPlistPath;
}

- (id)downstreamAssetIDs
{
  return self->_downstreamAssetIDs;
}

- (void)restoreDefaultStatus
{
  self->_releaseNotesAvailabilityStatus = 0LL;
  self->_updateAvailabilityStatus = 0LL;
  self->_releaseNotesDownloadStatus = 0LL;
  self->_downloadStatus = 0LL;
  modelNumber = self->_modelNumber;
  self->_modelNumber = 0LL;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAssetID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      char v37 = 1;
    }

    else
    {
      uint64_t v5 = v4;
      int64_t type = self->_type;
      if (type == -[UARPAssetID type](v5, "type"))
      {
        remoteURL = self->_remoteURL;
        -[UARPAssetID remoteURL](v5, "remoteURL");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (nullableObjectsEqual(remoteURL, (uint64_t)v8))
        {
          assetVersion = self->_assetVersion;
          -[UARPAssetID assetVersion](v5, "assetVersion");
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (nullableObjectsEqual(assetVersion, (uint64_t)v10))
          {
            assetVersionNumber = self->_assetVersionNumber;
            -[UARPAssetID assetVersionNumber](v5, "assetVersionNumber");
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (nullableObjectsEqual(assetVersionNumber, (uint64_t)v12))
            {
              localURL = self->_localURL;
              -[UARPAssetID localURL](v5, "localURL");
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (nullableObjectsEqual(localURL, (uint64_t)v14)
                && (int64_t downloadStatus = self->_downloadStatus,
                    downloadStatus == -[UARPAssetID downloadStatus](v5, "downloadStatus"))
                && (int64_t updateAvailabilityStatus = self->_updateAvailabilityStatus,
                    updateAvailabilityStatus == -[UARPAssetID updateAvailabilityStatus](v5, "updateAvailabilityStatus"))
                && (int64_t releaseNotesDownloadStatus = self->_releaseNotesDownloadStatus,
                    releaseNotesDownloadStatus == -[UARPAssetID releaseNotesDownloadStatus]( v5,  "releaseNotesDownloadStatus")))
              {
                releaseNotesRemoteURL = self->_releaseNotesRemoteURL;
                v19 = -[UARPAssetID releaseNotesRemoteURL](v5, "releaseNotesRemoteURL");
                if (nullableObjectsEqual(releaseNotesRemoteURL, (uint64_t)v19))
                {
                  releaseNotesLocalURL = self->_releaseNotesLocalURL;
                  v21 = -[UARPAssetID releaseNotesLocalURL](v5, "releaseNotesLocalURL");
                  if (nullableObjectsEqual(releaseNotesLocalURL, (uint64_t)v21)
                    && (int64_t releaseNotesAvailabilityStatus = self->_releaseNotesAvailabilityStatus,
                        releaseNotesAvailabilityStatus == -[UARPAssetID releaseNotesAvailabilityStatus]( v5,  "releaseNotesAvailabilityStatus")))
                  {
                    remoteBuildManifestPlistPath = self->_remoteBuildManifestPlistPath;
                    uint64_t v24 = -[UARPAssetID remoteBuildManifestPlistPath](v5, "remoteBuildManifestPlistPath");
                    v25 = remoteBuildManifestPlistPath;
                    uint64_t v26 = (void *)v24;
                    if (nullableObjectsEqual(v25, v24))
                    {
                      v46 = v26;
                      assetReleaseDate = self->_assetReleaseDate;
                      v45 = -[UARPAssetID assetReleaseDate](v5, "assetReleaseDate");
                      if (nullableObjectsEqual(assetReleaseDate, (uint64_t)v45))
                      {
                        releaseNotesFileSize = self->_releaseNotesFileSize;
                        v44 = -[UARPAssetID releaseNotesFileSize](v5, "releaseNotesFileSize");
                        if (nullableObjectsEqual(releaseNotesFileSize, (uint64_t)v44))
                        {
                          firmwareFileSize = self->_firmwareFileSize;
                          v43 = -[UARPAssetID firmwareFileSize](v5, "firmwareFileSize");
                          if (nullableObjectsEqual(firmwareFileSize, (uint64_t)v43))
                          {
                            deploymentRules = self->_deploymentRules;
                            -[UARPAssetID deploymentRules](v5, "deploymentRules");
                            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                            if (nullableObjectsEqual(deploymentRules, (uint64_t)v42)
                              && (BOOL deploymentAllowed = self->_deploymentAllowed,
                                  deploymentAllowed == -[UARPAssetID deploymentAllowed](v5, "deploymentAllowed")))
                            {
                              tag = self->_tag;
                              v41 = -[UARPAssetID tag](v5, "tag");
                              if (nullableObjectsEqual(tag, (uint64_t)v41))
                              {
                                firmwareHash = self->_firmwareHash;
                                v40 = -[UARPAssetID firmwareHash](v5, "firmwareHash");
                                if (nullableObjectsEqual(firmwareHash, (uint64_t)v40))
                                {
                                  modelNumber = self->_modelNumber;
                                  v39 = -[UARPAssetID modelNumber](v5, "modelNumber");
                                  if (nullableObjectsEqual(modelNumber, (uint64_t)v39))
                                  {
                                    downstreamAssetIDs = self->_downstreamAssetIDs;
                                    v36 = -[UARPAssetID downstreamAssetIDs]( v5,  "downstreamAssetIDs",  v39,  v40,  v41,  v42,  v43,  v44,  v45);
                                    char v37 = nullableObjectsEqual(downstreamAssetIDs, (uint64_t)v36);
                                  }

                                  else
                                  {
                                    char v37 = 0;
                                  }
                                }

                                else
                                {
                                  char v37 = 0;
                                }
                              }

                              else
                              {
                                char v37 = 0;
                              }
                            }

                            else
                            {
                              char v37 = 0;
                            }
                          }

                          else
                          {
                            char v37 = 0;
                          }
                        }

                        else
                        {
                          char v37 = 0;
                        }
                      }

                      else
                      {
                        char v37 = 0;
                      }

                      uint64_t v26 = v46;
                    }

                    else
                    {
                      char v37 = 0;
                    }
                  }

                  else
                  {
                    char v37 = 0;
                  }
                }

                else
                {
                  char v37 = 0;
                }
              }

              else
              {
                char v37 = 0;
              }
            }

            else
            {
              char v37 = 0;
            }
          }

          else
          {
            char v37 = 0;
          }
        }

        else
        {
          char v37 = 0;
        }
      }

      else
      {
        char v37 = 0;
      }
    }
  }

  else
  {
    char v37 = 0;
  }

  return v37;
}

- (void)setReleaseNotesAvailabilityStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t releaseNotesAvailabilityStatus = a3;
  objc_sync_exit(obj);
}

- (void)setReleaseNotesRemotePath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [MEMORY[0x189604030] URLWithString:v6];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setReleaseNotesRemoteURL:](v4, "setReleaseNotesRemoteURL:", v5);

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [MEMORY[0x189604030] URLWithString:v6];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setReleaseNotesLocalURL:](v4, "setReleaseNotesLocalURL:", v5);

  objc_sync_exit(v4);
}

- (NSString)releaseNotesLocalPath
{
  return -[NSURL path](self->_releaseNotesLocalURL, "path");
}

- (void)setReleaseNotesRemoteURL:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  releaseNotesRemoteURL = v4->_releaseNotesRemoteURL;
  v4->_releaseNotesRemoteURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalURL:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  releaseNotesLocalURL = v4->_releaseNotesLocalURL;
  v4->_releaseNotesLocalURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesDownloadStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t releaseNotesDownloadStatus = a3;
  objc_sync_exit(obj);
}

- (void)setReleaseDate:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v8)
  {
    uint64_t v5 = (NSDate *)objc_alloc_init(MEMORY[0x189607848]);
    -[NSDate setDateFormat:](v5, "setDateFormat:", @"MM/dd/yyyy");
    uint64_t v6 = -[NSDate dateFromString:](v5, "dateFromString:", v8);
    assetReleaseDate = v4->_assetReleaseDate;
    v4->_assetReleaseDate = (NSDate *)v6;
  }

  else
  {
    uint64_t v5 = v4->_assetReleaseDate;
    v4->_assetReleaseDate = 0LL;
  }

  objc_sync_exit(v4);
}

- (NSString)releaseDate
{
  if (self->_assetReleaseDate)
  {
    id v3 = objc_alloc_init(MEMORY[0x189607848]);
    [v3 setDateFormat:@"MM/dd/yyyy"];
    [v3 stringFromDate:self->_assetReleaseDate];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (void)setAssetReleaseDate:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetReleaseDate = v4->_assetReleaseDate;
  v4->_assetReleaseDate = (NSDate *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesFileSize:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  releaseNotesFileSize = obj->_releaseNotesFileSize;
  obj->_releaseNotesFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setFirmwareFileSize:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  firmwareFileSize = obj->_firmwareFileSize;
  obj->_firmwareFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setAssetVersion:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetVersion = v4->_assetVersion;
  v4->_assetVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)assetVersionNumber
{
  return self->_assetVersionNumber;
}

- (void)setAssetVersionNumber:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetVersionNumber = v4->_assetVersionNumber;
  v4->_assetVersionNumber = (NSNumber *)v5;

  objc_sync_exit(v4);
}

- (void)setLocalPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [MEMORY[0x189604030] URLWithString:v6];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setLocalURL:](v4, "setLocalURL:", v5);

  objc_sync_exit(v4);
}

- (NSString)localPath
{
  return -[NSURL path](self->_localURL, "path");
}

- (void)setLocalURL:(id)a3
{
  id v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  localURL = obj->_localURL;
  obj->_localURL = v4;

  objc_sync_exit(obj);
}

- (void)setIsUrgentUpdate:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isUrgentUpdate = a3;
  objc_sync_exit(obj);
}

- (void)setDownloadStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t downloadStatus = a3;
  objc_sync_exit(obj);
}

- (void)setUpdateAvailabilityStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t updateAvailabilityStatus = a3;
  objc_sync_exit(obj);
}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_signatureValidationNeeded = a3;
  objc_sync_exit(obj);
}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setValidationStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_validationStatus = a3;
  objc_sync_exit(obj);
}

- (int64_t)validationStatus
{
  return self->_validationStatus;
}

- (void)setDeploymentDay:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentDay = obj->_deploymentDay;
  obj->_deploymentDay = v4;

  objc_sync_exit(obj);
}

- (id)deploymentDay
{
  return self->_deploymentDay;
}

- (void)setDeploymentPercent:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentPercent = obj->_deploymentPercent;
  obj->_deploymentPercent = v4;

  objc_sync_exit(obj);
}

- (id)deploymentPercent
{
  return self->_deploymentPercent;
}

- (void)setDeploymentAllowed:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL deploymentAllowed = a3;
  objc_sync_exit(obj);
}

- (void)setDeploymentRules:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  deploymentRules = v4->_deploymentRules;
  v4->_deploymentRules = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (void)setFirmwareHash:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  firmwareHash = v4->_firmwareHash;
  v4->_firmwareHash = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setTatsuServerURL:(id)a3
{
  id v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  tatsuServerURL = obj->_tatsuServerURL;
  obj->_tatsuServerURL = v4;

  objc_sync_exit(obj);
}

- (void)setModelNumber:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  modelNumber = obj->_modelNumber;
  obj->_modelNumber = v4;

  objc_sync_exit(obj);
}

- (NSString)firmwareHash
{
  return self->_firmwareHash;
}

- (void)stagingStartedOnAccessoryID:(id)a3
{
}

- (void)stagingCompleteOnAccessoryID:(id)a3
{
}

- (BOOL)isStagingInProgressOnAccessoryID:(id)a3
{
  return -[NSMutableArray containsObject:](self->_activeAccessoriesForStaging, "containsObject:", a3);
}

- (void)processUARPDeploymentRules:(id)a3
{
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  deploymentRules = self->_deploymentRules;
  self->_deploymentRules = v4;

  self->_BOOL deploymentAllowed = -[UARPAssetID isDeploymentAllowed](self, "isDeploymentAllowed");
}

- (void)setReportProgressToDelegates:(BOOL)a3
{
  self->_reportProgressToDelegates = a3;
}

- (BOOL)reportProgressToDelegates
{
  return self->_reportProgressToDelegates;
}

- (const)typeString
{
  unint64_t type = self->_type;
  if (type > 0x10) {
    return "unrecognized";
  }
  else {
    return off_18A143840[type];
  }
}

- (id)rawDescription
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"type=%s, assetVersion=%@/%@", -[UARPAssetID typeString](self, "typeString"), self->_assetVersion, self->_assetVersionNumber];
  if (self->_modelNumber) {
    [v3 appendFormat:@", downstream=%@", self->_modelNumber];
  }
  if (self->_remoteURL) {
    [v3 appendFormat:@", remoteURL=%@", self->_remoteURL];
  }
  if (self->_localURL) {
    [v3 appendFormat:@", localURL=%@", self->_localURL];
  }
  if (self->_releaseNotesRemoteURL) {
    [v3 appendFormat:@", releaseNotesRemotePath=%@", self->_releaseNotesRemoteURL];
  }
  if (-[NSMutableArray count](self->_downstreamAssetIDs, "count")) {
    objc_msgSend( v3,  "appendFormat:",  @", downstreamAssetIDs=%lu",  -[NSMutableArray count](self->_downstreamAssetIDs, "count"));
  }
  updated = UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus);
  objc_msgSend( v3,  "appendFormat:",  @", updateAvailablity=%s, releaseNotesAvailability=%s, ",  updated,  UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus));
  if (self->_tag) {
    [v3 appendFormat:@", tag=%@", self->_tag];
  }
  [NSString stringWithString:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  id v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID rawDescription](self, "rawDescription");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %@>", v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createUARPDeploymentRules:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if ([v3 count])
  {
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v20 = objc_alloc_init(MEMORY[0x189607848]);
    [v20 setDateFormat:@"MM/dd/yyyy"];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = v3;
    id obj = v3;
    uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v5 objectForKey:@"rampPeriod"];
          id v6 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 objectForKey:@"deploymentLimit"];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 objectForKey:@"countryList"];
          id v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 objectForKey:@"goLiveDate"];
          os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 dateFromString:v9];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = objc_alloc_init(&OBJC_CLASS___UARPDeploymentRuleConfig);
          -[UARPDeploymentRuleConfig setGoLiveDate:](v11, "setGoLiveDate:", v10);
          -[UARPDeploymentRuleConfig setCountryList:](v11, "setCountryList:", v8);
          -[UARPDeploymentRuleConfig setRampPeriod:](v11, "setRampPeriod:", v6);
          -[UARPDeploymentRuleConfig setDeploymentLimit:](v11, "setDeploymentLimit:", v7);
          uint64_t v12 = -[UARPDeploymentRule initWithConfig:]( objc_alloc(&OBJC_CLASS___UARPDeploymentRule),  "initWithConfig:",  v11);
          if (v12)
          {
            [v18 addObject:v12];
          }

          else
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v5;
              _os_log_error_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_ERROR,  "Error: Invalid rule combination not allowed %@",  buf,  0xCu);
            }
          }
        }

        uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }

      while (v21);
    }

    id v3 = v15;
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (BOOL)isDeploymentAllowed
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!-[NSArray count](self->_deploymentRules, "count")) {
    return 1;
  }
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v3 = self->_deploymentRules;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v25;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v22 = v5;
LABEL_4:
    uint64_t v9 = 0LL;
    uint64_t v10 = v7;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v22;
        uint64_t v29 = v11;
        _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Checking Rule %@", buf, 0xCu);
      }

      id v23 = v10;
      char v13 = objc_msgSend(v11, "isDeploymentAllowed:", &v23, v22);
      id v7 = v23;

      [v11 deploymentDay];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        [v11 deploymentDay];
        id v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        deploymentDay = self->_deploymentDay;
        self->_deploymentDay = v15;
      }

      [v11 deploymentPercent];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v11 deploymentPercent];
        id v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        deploymentPercent = self->_deploymentPercent;
        self->_deploymentPercent = v18;
      }

      if ((v13 & 1) != 0) {
        break;
      }
      ++v9;
      uint64_t v10 = v7;
      if (v6 == v9)
      {
        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
        if (v6) {
          goto LABEL_4;
        }
        BOOL v20 = 0;
        goto LABEL_20;
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)isDynamicAsset
{
  return self->_tag != 0LL;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [v6 appendWithTabDepth:a3 format:@"Asset ID:\n"];
  unint64_t v7 = a3 + 1;
  objc_msgSend( v6,  "appendWithTabDepth:format:",  a3 + 1,  @"Type: %s\n",  UARPAssetLocationTypeToString(self->_type));
  if (self->_remoteURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Remote URL: %@\n", self->_remoteURL format];
  }
  if (self->_assetVersion) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Version: %@\n", self->_assetVersion format];
  }
  if (self->_assetVersionNumber) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Version Number: %@\n", self->_assetVersionNumber format];
  }
  if (self->_localURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Local URL: %@\n", self->_localURL format];
  }
  if (self->_tag) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Tag: %@\n", self->_tag format];
  }
  objc_msgSend( v6,  "appendWithTabDepth:format:",  a3 + 1,  @"Download Status: %s\n",  UARPAssetDownloadStatusToString(self->_downloadStatus));
  objc_msgSend( v6,  "appendWithTabDepth:format:",  a3 + 1,  @"Update Availability Status: %s\n",  UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus));
  objc_msgSend( v6,  "appendWithTabDepth:format:",  a3 + 1,  @"Release Notes Download Status: %s\n",  UARPAssetDownloadStatusToString(self->_releaseNotesDownloadStatus));
  if (self->_releaseNotesRemoteURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes Remote URL: %@\n", self->_releaseNotesRemoteURL format];
  }
  if (self->_releaseNotesLocalURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes Local URL: %@\n", self->_releaseNotesLocalURL format];
  }
  objc_msgSend( v6,  "appendWithTabDepth:format:",  a3 + 1,  @"Release Notes Availability Status: %s\n",  UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus));
  if (self->_assetReleaseDate) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Date: %@\n", self->_assetReleaseDate format];
  }
  if (self->_releaseNotesFileSize) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes File Size: %@\n", self->_releaseNotesFileSize format];
  }
  if (self->_firmwareFileSize) {
    [v6 appendWithTabDepth:a3 + 1, @"Firmware File Size: %@\n", self->_firmwareFileSize format];
  }
  if (-[NSArray count](self->_deploymentRules, "count"))
  {
    [v6 appendWithTabDepth:a3 + 1 format:@"Deployment Rules:\n"];
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v8 = self->_deploymentRules;
    uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      unint64_t v12 = a3 + 2;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v13++) dumpWithTabDepth:v12 dumpString:v6];
        }

        while (v10 != v13);
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v10);
    }
  }

  if (self->_deploymentAllowed) {
    uint64_t v14 = "yes";
  }
  else {
    uint64_t v14 = "no";
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, @"Deployment allowed: %s\n", v14);
  if (self->_signatureValidationNeeded) {
    id v15 = "yes";
  }
  else {
    id v15 = "no";
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, @"Signature Validation Needed: %s\n", v15);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)remotePath
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setRemotePath:(id)a3
{
}

- (NSString)assetVersion
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (int64_t)downloadStatus
{
  return self->_downloadStatus;
}

- (int64_t)updateAvailabilityStatus
{
  return self->_updateAvailabilityStatus;
}

- (int64_t)releaseNotesDownloadStatus
{
  return self->_releaseNotesDownloadStatus;
}

- (NSString)releaseNotesRemotePath
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (int64_t)releaseNotesAvailabilityStatus
{
  return self->_releaseNotesAvailabilityStatus;
}

- (NSDate)assetReleaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168LL, 1);
}

- (NSNumber)releaseNotesFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 176LL, 1);
}

- (NSNumber)firmwareFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 184LL, 1);
}

- (NSArray)deploymentRules
{
  return (NSArray *)objc_getProperty(self, a2, 192LL, 1);
}

- (BOOL)deploymentAllowed
{
  return self->_deploymentAllowed;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 200LL, 1);
}

- (NSURL)remoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setRemoteURL:(id)a3
{
}

- (NSURL)localURL
{
  return (NSURL *)objc_getProperty(self, a2, 216LL, 1);
}

- (NSURL)releaseNotesRemoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 224LL, 1);
}

- (NSURL)releaseNotesLocalURL
{
  return (NSURL *)objc_getProperty(self, a2, 232LL, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 240LL, 1);
}

- (BOOL)isUrgentUpdate
{
  return self->_isUrgentUpdate;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void).cxx_destruct
{
}

@end