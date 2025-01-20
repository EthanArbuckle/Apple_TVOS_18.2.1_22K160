@interface MANAutoAssetStatus
+ (BOOL)supportsSecureCoding;
+ (id)newCurrentLockUsageSummary:(id)a3;
- (BOOL)downloadUserInitiated;
- (BOOL)downloadedAsPatch;
- (BOOL)neverBeenLocked;
- (BOOL)patchingAttempted;
- (BOOL)stagedPriorToAvailable;
- (MAAutoAssetNotifications)notifications;
- (MAAutoAssetProgress)downloadProgress;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSelector)patchedFromBaseSelector;
- (MANAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadProgress:(id)a9 withDownloadedNetworkBytes:(int64_t)a10 withDownloadedFilesystemBytes:(int64_t)a11 withDownloadedAsPatch:(BOOL)a12 withPatchedFromBaseSelector:(id)a13 withPatchedFromBaseFilesystemBytes:(int64_t)a14 withPatchingAttempted:(BOOL)a15 withStagedPriorToAvailable:(BOOL)a16 withStagedFromOSVersion:(id)a17 withStagedFromBuildVersion:(id)a18 withCurrentLockUsage:(id)a19 withAvailableForUseError:(id)a20 withPatchingAttemptError:(id)a21 withNewerVersionError:(id)a22;
- (MANAutoAssetStatus)initWithCoder:(id)a3;
- (NSDictionary)availableForUseAttributes;
- (NSDictionary)currentLockUsage;
- (NSDictionary)newerVersionAttributes;
- (NSError)availableForUseError;
- (NSError)newerVersionError;
- (NSError)patchingAttemptError;
- (NSString)stagedFromBuildVersion;
- (NSString)stagedFromOSVersion;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (int64_t)patchedFromBaseFilesystemBytes;
- (void)encodeWithCoder:(id)a3;
- (void)getAvailableForUseAttributesAssetFormat:(id *)a3 assetBuild:(id *)a4 minOSVersion:(id *)a5 maxOSVersion:(id *)a6 prerequisiteBuilds:(id *)a7;
- (void)setAssetSelector:(id)a3;
- (void)setAvailableForUseAttributes:(id)a3;
- (void)setAvailableForUseError:(id)a3;
- (void)setCurrentLockUsage:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedAsPatch:(BOOL)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setNeverBeenLocked:(BOOL)a3;
- (void)setNewerVersionAttributes:(id)a3;
- (void)setNewerVersionError:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3;
- (void)setPatchedFromBaseSelector:(id)a3;
- (void)setPatchingAttemptError:(id)a3;
- (void)setPatchingAttempted:(BOOL)a3;
- (void)setStagedFromBuildVersion:(id)a3;
- (void)setStagedFromOSVersion:(id)a3;
- (void)setStagedPriorToAvailable:(BOOL)a3;
@end

@implementation MANAutoAssetStatus

- (MANAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadProgress:(id)a9 withDownloadedNetworkBytes:(int64_t)a10 withDownloadedFilesystemBytes:(int64_t)a11 withDownloadedAsPatch:(BOOL)a12 withPatchedFromBaseSelector:(id)a13 withPatchedFromBaseFilesystemBytes:(int64_t)a14 withPatchingAttempted:(BOOL)a15 withStagedPriorToAvailable:(BOOL)a16 withStagedFromOSVersion:(id)a17 withStagedFromBuildVersion:(id)a18 withCurrentLockUsage:(id)a19 withAvailableForUseError:(id)a20 withPatchingAttemptError:(id)a21 withNewerVersionError:(id)a22
{
  id v41 = a3;
  id v44 = a4;
  id v35 = a5;
  id v40 = a5;
  id v43 = a6;
  id v25 = a9;
  id v42 = a13;
  id v39 = a17;
  id v26 = a18;
  id v27 = a19;
  id v28 = a20;
  id v29 = a21;
  id v30 = a22;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___MANAutoAssetStatus;
  v31 = -[MANAutoAssetStatus init](&v45, "init");
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_assetSelector, a3);
    objc_storeStrong((id *)&v32->_notifications, a4);
    objc_storeStrong((id *)&v32->_availableForUseAttributes, v35);
    objc_storeStrong((id *)&v32->_newerVersionAttributes, a6);
    v32->_neverBeenLocked = a7;
    v32->_downloadUserInitiated = a8;
    objc_storeStrong((id *)&v32->_downloadProgress, a9);
    v32->_downloadedNetworkBytes = a10;
    v32->_downloadedFilesystemBytes = a11;
    v32->_downloadedAsPatch = a12;
    objc_storeStrong((id *)&v32->_patchedFromBaseSelector, a13);
    v32->_patchedFromBaseFilesystemBytes = a14;
    v32->_patchingAttempted = a15;
    v32->_stagedPriorToAvailable = a16;
    objc_storeStrong((id *)&v32->_stagedFromOSVersion, a17);
    objc_storeStrong((id *)&v32->_stagedFromBuildVersion, a18);
    objc_storeStrong((id *)&v32->_currentLockUsage, a19);
    objc_storeStrong((id *)&v32->_availableForUseError, a20);
    objc_storeStrong((id *)&v32->_patchingAttemptError, a21);
    objc_storeStrong((id *)&v32->_newerVersionError, a22);
  }

  return v32;
}

- (MANAutoAssetStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MANAutoAssetStatus;
  v5 = -[MANAutoAssetStatus init](&v44, "init");
  if (v5)
  {
    v46[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v46[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v46[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v46[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v46[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v46[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v46[6] = objc_opt_class(&OBJC_CLASS___NSData);
    v46[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 8LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v45[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v45[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v45[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetNotifications) forKey:@"notifications"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    notifications = v5->_notifications;
    v5->_notifications = (MAAutoAssetNotifications *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"availableForUseAttributes"]);
    availableForUseAttributes = v5->_availableForUseAttributes;
    v5->_availableForUseAttributes = (NSDictionary *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"newerVersionAttributes"]);
    newerVersionAttributes = v5->_newerVersionAttributes;
    v5->_newerVersionAttributes = (NSDictionary *)v18;

    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    id v20 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetProgress) forKey:@"downloadProgress"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v21;

    v5->_downloadedNetworkBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_downloadedAsPatch = [v4 decodeBoolForKey:@"downloadedAsPatch"];
    id v23 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"patchedFromBaseSelector"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    patchedFromBaseSelector = v5->_patchedFromBaseSelector;
    v5->_patchedFromBaseSelector = (MAAutoAssetSelector *)v24;

    v5->_patchedFromBaseFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"patchedFromBaseFilesystemBytes"];
    v5->_patchingAttempted = [v4 decodeBoolForKey:@"patchingAttempted"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
    id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"stagedFromOSVersion"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    stagedFromOSVersion = v5->_stagedFromOSVersion;
    v5->_stagedFromOSVersion = (NSString *)v27;

    id v29 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"stagedFromBuildVersion"];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    stagedFromBuildVersion = v5->_stagedFromBuildVersion;
    v5->_stagedFromBuildVersion = (NSString *)v30;

    if (__isPlatformVersionAtLeast(3, 16, 4, 0))
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"currentLockUsage"]);
      currentLockUsage = v5->_currentLockUsage;
      v5->_currentLockUsage = (NSDictionary *)v32;
    }

    else
    {
      currentLockUsage = v5->_currentLockUsage;
      v5->_currentLockUsage = 0LL;
    }

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"availableForUseError"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v35;

    id v37 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"patchingAttemptError"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    patchingAttemptError = v5->_patchingAttemptError;
    v5->_patchingAttemptError = (NSError *)v38;

    id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"newerVersionError"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v41;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus assetSelector](self, "assetSelector"));
  [v16 encodeObject:v4 forKey:@"assetSelector"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus notifications](self, "notifications"));
  [v16 encodeObject:v5 forKey:@"notifications"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  [v16 encodeObject:v6 forKey:@"availableForUseAttributes"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes"));
  [v16 encodeObject:v7 forKey:@"newerVersionAttributes"];

  objc_msgSend( v16,  "encodeBool:forKey:",  -[MANAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"),  @"neverBeenLocked");
  objc_msgSend( v16,  "encodeBool:forKey:",  -[MANAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
  [v16 encodeObject:v8 forKey:@"downloadProgress"];

  objc_msgSend( v16,  "encodeInteger:forKey:",  -[MANAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v16,  "encodeInteger:forKey:",  -[MANAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  objc_msgSend( v16,  "encodeBool:forKey:",  -[MANAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"),  @"downloadedAsPatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  [v16 encodeObject:v9 forKey:@"patchedFromBaseSelector"];

  objc_msgSend( v16,  "encodeInteger:forKey:",  -[MANAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"),  @"patchedFromBaseFilesystemBytes");
  objc_msgSend( v16,  "encodeBool:forKey:",  -[MANAutoAssetStatus patchingAttempted](self, "patchingAttempted"),  @"patchingAttempted");
  objc_msgSend( v16,  "encodeBool:forKey:",  -[MANAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"),  @"stagedPriorToAvailable");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  [v16 encodeObject:v10 forKey:@"stagedFromOSVersion"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  [v16 encodeObject:v11 forKey:@"stagedFromBuildVersion"];

  if (__isPlatformVersionAtLeast(3, 16, 4, 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus currentLockUsage](self, "currentLockUsage"));
    [v16 encodeObject:v12 forKey:@"currentLockUsage"];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
  [v16 encodeObject:v13 forKey:@"availableForUseError"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
  [v16 encodeObject:v14 forKey:@"patchingAttemptError"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
  [v16 encodeObject:v15 forKey:@"newerVersionError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  uint64_t v27 = objc_alloc(&OBJC_CLASS___MANAutoAssetStatus);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus assetSelector](self, "assetSelector"));
  id v26 = [v31 copy];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus notifications](self, "notifications"));
  id v25 = [v30 copy];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes"));
  unsigned int v21 = -[MANAutoAssetStatus neverBeenLocked](self, "neverBeenLocked");
  unsigned int v20 = -[MANAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated");
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
  id v32 = [v29 copy];
  int64_t v19 = -[MANAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v18 = -[MANAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  unsigned __int8 v17 = -[MANAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  id v15 = [v22 copy];
  int64_t v16 = -[MANAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  unsigned __int8 v3 = -[MANAutoAssetStatus patchingAttempted](self, "patchingAttempted");
  unsigned __int8 v4 = -[MANAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus currentLockUsage](self, "currentLockUsage"));
  id v7 = [v6 copy];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
  BYTE1(v13) = v4;
  LOBYTE(v13) = v3;
  LOBYTE(v12) = v17;
  id v28 = -[MANAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v27,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeen Locked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes :withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:wi thStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailable ForUseError:withPatchingAttemptError:withNewerVersionError:",  v26,  v25,  v24,  v23,  v21,  v20,  v32,  v19,  v18,  v12,  v15,  v16,  v13,  v14,  v5,  v7,  v8,  v9,  v10);

  return v28;
}

- (id)description
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus assetSelector](self, "assetSelector"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus notifications](self, "notifications"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  v6 = @"N";
  if (v5) {
    id v7 = @"Y";
  }
  else {
    id v7 = @"N";
  }
  v57 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes"));
  if (v8) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v56 = v9;
  if (-[MANAutoAssetStatus neverBeenLocked](self, "neverBeenLocked")) {
    id v10 = @"Y";
  }
  else {
    id v10 = @"N";
  }
  v54 = v10;
  if (-[MANAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  v53 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
  if (v12)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 summary]);
  }

  else
  {
    v64 = @"N";
  }

  int64_t v51 = -[MANAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v50 = -[MANAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MANAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch")) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  v49 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  if (v14)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v41 summary]);
  }

  else
  {
    v63 = @"N";
  }

  int64_t v48 = -[MANAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  if (-[MANAutoAssetStatus patchingAttempted](self, "patchingAttempted")) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  v46 = v15;
  if (-[MANAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    int64_t v16 = @"Y";
  }
  else {
    int64_t v16 = @"N";
  }
  objc_super v45 = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  if (v17) {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  if (v18) {
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  }
  else {
    v62 = @"N";
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus currentLockUsage](self, "currentLockUsage"));
  if (v65) {
    v61 = +[MANAutoAssetStatus newCurrentLockUsageSummary:]( &OBJC_CLASS___MANAutoAssetStatus,  "newCurrentLockUsageSummary:",  self);
  }
  else {
    v61 = @"N";
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
  v52 = (void *)v18;
  if (v47)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v40 checkedSummary]);
  }

  else
  {
    v60 = @"N";
  }

  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
  v55 = (void *)v17;
  if (v19)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 checkedSummary]);
  }

  else
  {
    v59 = @"N";
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
  if (v20)
  {
    objc_super v44 = v8;
    id v42 = v5;
    unsigned int v21 = v4;
    v22 = v3;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
    uint64_t v24 = v14;
    id v25 = v12;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 checkedSummary]);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n",  v67,  v66,  v57,  v56,  v54,  v53,  v64,  v51,  v50,  v49,  v63,  v48,  v46,  v45,  v6,  v62,  v61,  v60,  v59,  v26));

    uint64_t v12 = v25;
    uint64_t v14 = v24;

    unsigned __int8 v3 = v22;
    unsigned __int8 v4 = v21;
    v5 = v42;
    v8 = v44;
  }

  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n",  v67,  v66,  v57,  v56,  v54,  v53,  v64,  v51,  v50,  v49,  v63,  v48,  v46,  v45,  v6,  v62,  v61,  v60,  v59,  @"N"));
  }

  if (v19)
  {
  }

  if (v47)
  {
  }

  if (v65) {
  if (v52)
  }

  if (v55) {
  if (v14)
  }
  {
  }

  if (v12)
  {
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  if (v27)
  {
    id v71 = 0LL;
    v72[0] = 0LL;
    id v69 = 0LL;
    id v70 = 0LL;
    id v68 = 0LL;
    -[MANAutoAssetStatus getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:]( self,  "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:",  v72,  &v71,  &v70,  &v69,  &v68);
    id v28 = v72[0];
    id v29 = (__CFString *)v71;
    uint64_t v30 = (__CFString *)v70;
    v31 = (__CFString *)v69;
    id v32 = (const __CFString *)v68;
    v33 = (__CFString *)v32;
    id v34 = @"Missing";
    if (v29) {
      id v34 = v29;
    }
    uint64_t v35 = @"N";
    if (v30) {
      v36 = v30;
    }
    else {
      v36 = @"N";
    }
    if (v31) {
      id v37 = v31;
    }
    else {
      id v37 = @"N";
    }
    if (v32) {
      uint64_t v35 = v32;
    }
    [v58 appendFormat:@"                     assetFormat: %@\n                      assetBuild: %@\n                    minOSVersion: %@\n                    maxOSVersion: %@\n         prerequisiteAssetBuilds: %@\n", v28, v34, v36, v37, v35];
  }

  return v58;
}

- (id)summary
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus assetSelector](self, "assetSelector"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus notifications](self, "notifications"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  v6 = @"N";
  if (v5) {
    id v7 = @"Y";
  }
  else {
    id v7 = @"N";
  }
  v57 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes"));
  if (v8) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v56 = v9;
  if (-[MANAutoAssetStatus neverBeenLocked](self, "neverBeenLocked")) {
    id v10 = @"Y";
  }
  else {
    id v10 = @"N";
  }
  v54 = v10;
  if (-[MANAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  v53 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
  if (v12)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus downloadProgress](self, "downloadProgress"));
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 summary]);
  }

  else
  {
    v64 = @"N";
  }

  int64_t v51 = -[MANAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v50 = -[MANAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MANAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch")) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  v49 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  if (v14)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector"));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v41 summary]);
  }

  else
  {
    v63 = @"N";
  }

  int64_t v48 = -[MANAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  if (-[MANAutoAssetStatus patchingAttempted](self, "patchingAttempted")) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  v46 = v15;
  if (-[MANAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    int64_t v16 = @"Y";
  }
  else {
    int64_t v16 = @"N";
  }
  objc_super v45 = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  if (v17) {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion"));
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  if (v18) {
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  }
  else {
    v62 = @"N";
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus currentLockUsage](self, "currentLockUsage"));
  if (v65) {
    v61 = +[MANAutoAssetStatus newCurrentLockUsageSummary:]( &OBJC_CLASS___MANAutoAssetStatus,  "newCurrentLockUsageSummary:",  self);
  }
  else {
    v61 = @"N";
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
  v55 = (void *)v17;
  if (v47)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseError](self, "availableForUseError"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v40 checkedSummary]);
  }

  else
  {
    v60 = @"N";
  }

  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
  v52 = (void *)v18;
  if (v19)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus patchingAttemptError](self, "patchingAttemptError"));
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 checkedSummary]);
  }

  else
  {
    v59 = @"N";
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
  if (v20)
  {
    id v42 = v14;
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus newerVersionError](self, "newerVersionError"));
    objc_super v44 = v12;
    v22 = v8;
    id v23 = v5;
    uint64_t v24 = v4;
    id v25 = v3;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v21 checkedSummary]);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@",  v67,  v66,  v57,  v56,  v54,  v53,  v64,  v51,  v50,  v49,  v63,  v48,  v46,  v45,  v6,  v62,  v61,  v60,  v59,  v26));

    unsigned __int8 v3 = v25;
    unsigned __int8 v4 = v24;
    v5 = v23;
    v8 = v22;
    uint64_t v12 = v44;

    uint64_t v14 = v42;
  }

  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@",  v67,  v66,  v57,  v56,  v54,  v53,  v64,  v51,  v50,  v49,  v63,  v48,  v46,  v45,  v6,  v62,  v61,  v60,  v59,  @"N"));
  }

  if (v19)
  {
  }

  if (v47)
  {
  }

  if (v65) {
  if (v52)
  }

  if (v55) {
  if (v14)
  }
  {
  }

  if (v12)
  {
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
  if (v27)
  {
    id v71 = 0LL;
    v72[0] = 0LL;
    id v69 = 0LL;
    id v70 = 0LL;
    id v68 = 0LL;
    -[MANAutoAssetStatus getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:]( self,  "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:",  v72,  &v71,  &v70,  &v69,  &v68);
    id v28 = v72[0];
    id v29 = (__CFString *)v71;
    uint64_t v30 = (__CFString *)v70;
    v31 = (__CFString *)v69;
    id v32 = (const __CFString *)v68;
    v33 = (__CFString *)v32;
    id v34 = @"Missing";
    if (v29) {
      id v34 = v29;
    }
    uint64_t v35 = @"N";
    if (v30) {
      v36 = v30;
    }
    else {
      v36 = @"N";
    }
    if (v31) {
      id v37 = v31;
    }
    else {
      id v37 = @"N";
    }
    if (v32) {
      uint64_t v35 = v32;
    }
    [v58 appendFormat:@"|assetFormat:%@|assetBuild:%@|minOSVersion:%@|maxOSVersion:%@|prerequisiteAssetBuilds:%@", v28, v34, v36, v37, v35];
  }

  [v58 appendString:@"]"];
  return v58;
}

- (void)getAvailableForUseAttributesAssetFormat:(id *)a3 assetBuild:(id *)a4 minOSVersion:(id *)a5 maxOSVersion:(id *)a6 prerequisiteBuilds:(id *)a7
{
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));

  if (v13)
  {
    if (a3)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
      *a3 = (id)objc_claimAutoreleasedReturnValue([v14 safeStringForKey:@"AssetFormat"]);

      if (!*a3) {
        *a3 = @"StreamingZip";
      }
    }

    if (a4)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
      *a4 = (id)objc_claimAutoreleasedReturnValue([v15 safeStringForKey:@"Build"]);
    }

    if (a5)
    {
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
      *a5 = (id)objc_claimAutoreleasedReturnValue([v16 safeStringForKey:@"_MinOSVersion"]);
    }

    if (a6)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
      *a6 = (id)objc_claimAutoreleasedReturnValue([v17 safeStringForKey:@"_MaxOSVersion"]);
    }

    if (a7)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes"));
      id v19 = [v18 safeObjectForKey:@"PrerequisiteAssetBuilds" ofClass:objc_opt_class(NSArray)];
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (v20)
      {
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v21 = v20;
        id v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v30 = v20;
          uint64_t v24 = 0LL;
          uint64_t v25 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
              uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
              {
                if (v24) {
                  [v24 appendFormat:@",%@", v27];
                }
                else {
                  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@",  v27));
                }
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }

          while (v23);

          if (v24) {
            id v29 = v24;
          }
          else {
            id v29 = 0LL;
          }
          unsigned int v20 = v30;
        }

        else
        {

          id v29 = 0LL;
        }

        *a7 = v29;
      }

      else
      {
        *a7 = 0LL;
      }
    }
  }

+ (id)newCurrentLockUsageSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MANAutoAssetStatus);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MANAutoAssetStatus newCurrentLockUsageSummary:].cold.1(v6);
    }
  }

  id v7 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);

  if (v7)
  {
    id v7 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{");
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
    id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      char v11 = 1;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
          id v15 = [v14 safeIntegerForKey:v13];

          if ((v11 & 1) == 0) {
            -[NSMutableString appendString:](v7, "appendString:", @",");
          }
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0) {
            -[NSMutableString appendFormat:](v7, "appendFormat:", @"%@:%ld", v13, v15);
          }
          else {
            -[NSMutableString appendFormat:](v7, "appendFormat:", @"?:%ld", v15, v18);
          }
          char v11 = 0;
          uint64_t v12 = (char *)v12 + 1;
        }

        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        char v11 = 0;
      }

      while (v9);
    }

    -[NSMutableString appendString:](v7, "appendString:", @"}");
  }

  return v7;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (MAAutoAssetNotifications)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSDictionary)availableForUseAttributes
{
  return self->_availableForUseAttributes;
}

- (void)setAvailableForUseAttributes:(id)a3
{
}

- (NSDictionary)newerVersionAttributes
{
  return self->_newerVersionAttributes;
}

- (void)setNewerVersionAttributes:(id)a3
{
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (MAAutoAssetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (BOOL)downloadedAsPatch
{
  return self->_downloadedAsPatch;
}

- (void)setDownloadedAsPatch:(BOOL)a3
{
  self->_downloadedAsPatch = a3;
}

- (MAAutoAssetSelector)patchedFromBaseSelector
{
  return self->_patchedFromBaseSelector;
}

- (void)setPatchedFromBaseSelector:(id)a3
{
}

- (int64_t)patchedFromBaseFilesystemBytes
{
  return self->_patchedFromBaseFilesystemBytes;
}

- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3
{
  self->_patchedFromBaseFilesystemBytes = a3;
}

- (BOOL)patchingAttempted
{
  return self->_patchingAttempted;
}

- (void)setPatchingAttempted:(BOOL)a3
{
  self->_patchingAttempted = a3;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void)setStagedPriorToAvailable:(BOOL)a3
{
  self->_stagedPriorToAvailable = a3;
}

- (NSString)stagedFromOSVersion
{
  return self->_stagedFromOSVersion;
}

- (void)setStagedFromOSVersion:(id)a3
{
}

- (NSString)stagedFromBuildVersion
{
  return self->_stagedFromBuildVersion;
}

- (void)setStagedFromBuildVersion:(id)a3
{
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

- (void)setCurrentLockUsage:(id)a3
{
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (void)setAvailableForUseError:(id)a3
{
}

- (NSError)patchingAttemptError
{
  return self->_patchingAttemptError;
}

- (void)setPatchingAttemptError:(id)a3
{
}

- (NSError)newerVersionError
{
  return self->_newerVersionError;
}

- (void)setNewerVersionError:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)newCurrentLockUsageSummary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{MANAutoAssetStatus-newCurrentLockUsageSummary} WARNING: wrong class provided as autoAssetStatus",  v1,  2u);
}

@end