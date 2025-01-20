@interface MADAutoAssetDescriptor
+ (BOOL)doesMetatadaIndicateEmptyEntry:(id)a3;
+ (BOOL)isAutoAssetMetadata:(id)a3;
+ (BOOL)isMorePreferredAssetFormat:(id)a3 comparedTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (int64_t)totalFilesystemSpaceForAutoAssetDescriptors:(id)a3;
- (BOOL)downloadUserInitiated;
- (BOOL)foundAsPreInstalled;
- (BOOL)foundByLookupWithoutAssetVersion;
- (BOOL)isBlankEntry;
- (BOOL)isEqualSelector:(id)a3;
- (BOOL)isMAAutoAsset;
- (BOOL)isOnFilesystem;
- (BOOL)isPatch;
- (BOOL)isPreSUStagingRequired;
- (BOOL)isRamped;
- (BOOL)neverBeenLocked;
- (BOOL)patchingAttempted;
- (BOOL)preSoftwareUpdateAssetStaging;
- (BOOL)secureOperationEliminating;
- (BOOL)secureOperationInProgress;
- (BOOL)stagedPriorToAvailable;
- (MAAutoAssetSelector)patchedFromBaseSelector;
- (MADAutoAssetDescriptor)initWithCoder:(id)a3;
- (NSArray)prerequisiteAssetBuilds;
- (NSDictionary)metadata;
- (NSError)patchingAttemptError;
- (NSString)assetFormat;
- (NSString)assetId;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (NSString)build;
- (NSString)maxOSVersion;
- (NSString)minOSVersion;
- (NSString)stagedFromBuildVersion;
- (NSString)stagedFromOSVersion;
- (id)description;
- (id)initBlankEntry;
- (id)initForAssetType:(id)a3 fromMetadata:(id)a4 fromBaseDescriptor:(id)a5 invalidReasons:(id *)a6;
- (id)initForAssetType:(id)a3 fromMetadata:(id)a4 invalidReasons:(id *)a5;
- (id)newSummaryWithoutSelector;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (int64_t)patchedFromBaseFilesystemBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setFoundAsPreInstalled:(BOOL)a3;
- (void)setFoundByLookupWithoutAssetVersion:(BOOL)a3;
- (void)setIsOnFilesystem:(BOOL)a3;
- (void)setIsPatch:(BOOL)a3;
- (void)setNeverBeenLocked:(BOOL)a3;
- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3;
- (void)setPatchedFromBaseSelector:(id)a3;
- (void)setPatchingAttemptError:(id)a3;
- (void)setPatchingAttempted:(BOOL)a3;
- (void)setPreSoftwareUpdateAssetStaging:(BOOL)a3;
- (void)setSecureOperationEliminating:(BOOL)a3;
- (void)setSecureOperationInProgress:(BOOL)a3;
- (void)setStagedFromBuildVersion:(id)a3;
- (void)setStagedFromOSVersion:(id)a3;
- (void)setStagedPriorToAvailable:(BOOL)a3;
@end

@implementation MADAutoAssetDescriptor

- (id)initForAssetType:(id)a3 fromMetadata:(id)a4 invalidReasons:(id *)a5
{
  return -[MADAutoAssetDescriptor initForAssetType:fromMetadata:fromBaseDescriptor:invalidReasons:]( self,  "initForAssetType:fromMetadata:fromBaseDescriptor:invalidReasons:",  a3,  a4,  0LL,  a5);
}

- (id)initForAssetType:(id)a3 fromMetadata:(id)a4 fromBaseDescriptor:(id)a5 invalidReasons:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v67.receiver = self;
  v67.super_class = (Class)&OBJC_CLASS___MADAutoAssetDescriptor;
  v14 = -[MADAutoAssetDescriptor init](&v67, "init");
  if (!v14) {
    goto LABEL_31;
  }
  id obj = a4;
  v15 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"|INVALID_METADATA:");
  objc_storeStrong((id *)v14 + 3, a3);
  uint64_t v16 = *((void *)v14 + 3);
  BOOL v17 = v16 != 0;
  if (!v16) {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"MISSING:%@|", @"assetType");
  }
  AssetIdFromDict = getAssetIdFromDict(v11, v12);
  uint64_t v19 = objc_claimAutoreleasedReturnValue(AssetIdFromDict);
  v20 = (void *)*((void *)v14 + 4);
  *((void *)v14 + 4) = v19;

  if (*((void *)v14 + 4))
  {
    if (v13)
    {
LABEL_6:
      v14[13] = [v13 isOnFilesystem];
      v14[14] = [v13 neverBeenLocked];
      v14[15] = [v13 secureOperationInProgress];
      v14[16] = [v13 secureOperationEliminating];
      v14[17] = [v13 downloadUserInitiated];
      *((void *)v14 + 13) = [v13 downloadedNetworkBytes];
      *((void *)v14 + 14) = [v13 downloadedFilesystemBytes];
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v13 patchedFromBaseSelector]);
      v22 = (void *)*((void *)v14 + 15);
      *((void *)v14 + 15) = v21;

      *((void *)v14 + 16) = [v13 patchedFromBaseFilesystemBytes];
      v14[18] = [v13 patchingAttempted];
      v14[19] = [v13 stagedPriorToAvailable];
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v13 stagedFromOSVersion]);
      v24 = (void *)*((void *)v14 + 17);
      *((void *)v14 + 17) = v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v13 stagedFromBuildVersion]);
      v26 = (void *)*((void *)v14 + 18);
      *((void *)v14 + 18) = v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue([v13 patchingAttemptError]);
      v28 = (void *)*((void *)v14 + 19);
      *((void *)v14 + 19) = v27;
      goto LABEL_9;
    }
  }

  else
  {
    -[NSMutableString appendString:](v15, "appendString:", @"FORMAT:assetId|");
    BOOL v17 = 0;
    if (v13) {
      goto LABEL_6;
    }
  }

  *(_DWORD *)(v14 + 13) = 256;
  v14[17] = 0;
  *((void *)v14 + 13) = -1LL;
  *((void *)v14 + 14) = -1LL;
  v29 = (void *)*((void *)v14 + 15);
  *((void *)v14 + 15) = 0LL;

  *((_WORD *)v14 + 9) = 0;
  v30 = (void *)*((void *)v14 + 17);
  *((void *)v14 + 16) = -1LL;
  *((void *)v14 + 17) = 0LL;

  v31 = (void *)*((void *)v14 + 18);
  *((void *)v14 + 18) = 0LL;

  v28 = (void *)*((void *)v14 + 19);
  *((void *)v14 + 19) = 0LL;
LABEL_9:

  unsigned __int8 v32 = [v12 safeBooleanForKey:@"_IsMAAutoAsset"];
  v14[8] = v32;
  if ((v32 & 1) == 0)
  {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"NOT:%@|", @"_IsMAAutoAsset");
    BOOL v17 = 0;
  }

  *(_WORD *)(v14 + 9) = 0;
  uint64_t v33 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"AssetSpecifier"]);
  v34 = (void *)*((void *)v14 + 5);
  *((void *)v14 + 5) = v33;

  if (!*((void *)v14 + 5))
  {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"MISSING:%@|", @"AssetSpecifier");
    BOOL v17 = 0;
  }

  uint64_t v35 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"AssetVersion"]);
  v36 = (void *)*((void *)v14 + 6);
  *((void *)v14 + 6) = v35;

  if (!*((void *)v14 + 6))
  {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"MISSING:%@|", @"AssetVersion");
    BOOL v17 = 0;
  }

  uint64_t v37 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"AssetFormat"]);
  v38 = (void *)*((void *)v14 + 7);
  *((void *)v14 + 7) = v37;

  if (!*((void *)v14 + 7))
  {
    *((void *)v14 + 7) = @"StreamingZip";
  }

  uint64_t v39 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"Build"]);
  v40 = (void *)*((void *)v14 + 8);
  *((void *)v14 + 8) = v39;

  uint64_t v41 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"_MinOSVersion"]);
  v42 = (void *)*((void *)v14 + 9);
  *((void *)v14 + 9) = v41;

  uint64_t v43 = objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"_MaxOSVersion"]);
  v44 = (void *)*((void *)v14 + 10);
  *((void *)v14 + 10) = v43;

  id v45 = [v12 safeObjectForKey:@"PrerequisiteAssetBuilds" ofClass:objc_opt_class(NSArray)];
  uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)*((void *)v14 + 11);
  *((void *)v14 + 11) = v46;

  v48 = (void *)*((void *)v14 + 11);
  if (v48)
  {
    v58 = a6;
    v59 = v14;
    id v60 = v13;
    id v61 = v12;
    v14[12] = 1;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v49 = v48;
    id v50 = [v49 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)i);
          uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v54, v55) & 1) == 0)
          {
            -[NSMutableString appendFormat:]( v15,  "appendFormat:",  @"INVALID:%@:non-string|",  @"PrerequisiteAssetBuilds");
            BOOL v17 = 0;
          }
        }

        id v51 = [v49 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }

      while (v51);
    }

    id v12 = v61;
    v14 = v59;
    id v13 = v60;
    a6 = v58;
  }

  else
  {
    v14[12] = 0;
  }

  v14[11] = [v12 safeBooleanForKey:@"_PreSoftwareUpdateAssetStaging"];
  objc_storeStrong((id *)v14 + 12, obj);
  if (v17)
  {

LABEL_31:
    v56 = v14;
    goto LABEL_35;
  }

  if (a6) {
    *a6 = v15;
  }

  v56 = 0LL;
LABEL_35:

  return v56;
}

- (id)initBlankEntry
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADAutoAssetDescriptor;
  v2 = -[MADAutoAssetDescriptor init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    assetType = v2->_assetType;
    v2->_assetType = (NSString *)@"Empty";

    assetId = v3->_assetId;
    v3->_assetId = (NSString *)@"Empty";

    v3->_isPatch = 0;
    *(_DWORD *)&v3->_isMAAutoAsset = 0;
    assetSpecifier = v3->_assetSpecifier;
    v3->_assetSpecifier = (NSString *)@"Empty";

    assetVersion = v3->_assetVersion;
    v3->_assetVersion = (NSString *)@"Empty";

    assetFormat = v3->_assetFormat;
    v3->_assetFormat = (NSString *)@"Empty";

    build = v3->_build;
    v3->_build = (NSString *)@"Empty";

    minOSVersion = v3->_minOSVersion;
    v3->_minOSVersion = (NSString *)@"Empty";

    maxOSVersion = v3->_maxOSVersion;
    v3->_maxOSVersion = (NSString *)@"Empty";

    prerequisiteAssetBuilds = v3->_prerequisiteAssetBuilds;
    v3->_prerequisiteAssetBuilds = 0LL;

    uint64_t v21 = @"__Empty";
    v22 = @"Empty";
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    metadata = v3->_metadata;
    v3->_metadata = (NSDictionary *)v13;

    *(_DWORD *)&v3->_isOnFilesystem = 256;
    v3->_downloadUserInitiated = 0;
    v3->_downloadedNetworkBytes = -1LL;
    v3->_downloadedFilesystemBytes = -1LL;
    patchedFromBaseSelector = v3->_patchedFromBaseSelector;
    v3->_patchedFromBaseSelector = 0LL;

    *(_WORD *)&v3->_patchingAttempted = 0;
    stagedFromOSVersion = v3->_stagedFromOSVersion;
    v3->_patchedFromBaseFilesystemBytes = -1LL;
    v3->_stagedFromOSVersion = (NSString *)@"Empty";

    stagedFromBuildVersion = v3->_stagedFromBuildVersion;
    v3->_stagedFromBuildVersion = (NSString *)@"Empty";

    patchingAttemptError = v3->_patchingAttemptError;
    v3->_patchingAttemptError = 0LL;
  }

  return v3;
}

- (MADAutoAssetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___MADAutoAssetDescriptor;
  v5 = -[MADAutoAssetDescriptor init](&v52, "init");
  if (v5)
  {
    v55[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v55[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
    id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v54[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v54[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v54[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v54[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v54[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v54[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v54[6] = objc_opt_class(&OBJC_CLASS___NSData);
    v54[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 8LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

    v53[0] = objc_opt_class(&OBJC_CLASS___NSError);
    v53[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v53[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    v53[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v53[4] = objc_opt_class(&OBJC_CLASS___NSString);
    v53[5] = objc_opt_class(&OBJC_CLASS___NSURL);
    v53[6] = objc_opt_class(&OBJC_CLASS___NSDate);
    v53[7] = objc_opt_class(&OBJC_CLASS___NSData);
    v53[8] = objc_opt_class(&OBJC_CLASS___NSNull);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 9LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetType"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetID"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v15;

    v5->_isMAAutoAsset = [v4 decodeBoolForKey:@"_IsMAAutoAsset"];
    v5->_foundByLookupWithoutAssetVersion = [v4 decodeBoolForKey:@"foundByLookupWithoutAssetVersion"];
    v5->_foundAsPreInstalled = [v4 decodeBoolForKey:@"foundAsPreInstalled"];
    v5->_preSoftwareUpdateAssetStaging = [v4 decodeBoolForKey:@"_PreSoftwareUpdateAssetStaging"];
    v5->_isPatch = [v4 decodeBoolForKey:@"isPatch"];
    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"AssetSpecifier"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"AssetVersion"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"AssetFormat"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    assetFormat = v5->_assetFormat;
    v5->_assetFormat = (NSString *)v24;

    id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"Build"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    build = v5->_build;
    v5->_build = (NSString *)v27;

    id v29 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_MinOSVersion"];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    minOSVersion = v5->_minOSVersion;
    v5->_minOSVersion = (NSString *)v30;

    id v32 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_MaxOSVersion"];
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    maxOSVersion = v5->_maxOSVersion;
    v5->_maxOSVersion = (NSString *)v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v51 forKey:@"PrerequisiteAssetBuilds"]);
    prerequisiteAssetBuilds = v5->_prerequisiteAssetBuilds;
    v5->_prerequisiteAssetBuilds = (NSArray *)v35;

    uint64_t v37 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"metadata"]);
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v37;

    v5->_isOnFilesystem = [v4 decodeBoolForKey:@"isOnFilesystem"];
    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_secureOperationInProgress = [v4 decodeBoolForKey:@"secureOperationInProgress"];
    v5->_secureOperationEliminating = [v4 decodeBoolForKey:@"secureOperationEliminating"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    v5->_downloadedNetworkBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    id v39 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"patchedFromBaseSelector"];
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    patchedFromBaseSelector = v5->_patchedFromBaseSelector;
    v5->_patchedFromBaseSelector = (MAAutoAssetSelector *)v40;

    v5->_patchedFromBaseFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"patchedFromBaseFilesystemBytes"];
    v5->_patchingAttempted = [v4 decodeBoolForKey:@"patchingAttempted"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
    id v42 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"stagedFromOSVersion"];
    uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
    stagedFromOSVersion = v5->_stagedFromOSVersion;
    v5->_stagedFromOSVersion = (NSString *)v43;

    id v45 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"stagedFromBuildVersion"];
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    stagedFromBuildVersion = v5->_stagedFromBuildVersion;
    v5->_stagedFromBuildVersion = (NSString *)v46;

    uint64_t v48 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"patchingAttemptError"]);
    patchingAttemptError = v5->_patchingAttemptError;
    v5->_patchingAttemptError = (NSError *)v48;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetType](self, "assetType"));
  [v4 encodeObject:v5 forKey:@"assetType"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetId](self, "assetId"));
  [v4 encodeObject:v6 forKey:@"assetID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor isMAAutoAsset](self, "isMAAutoAsset"),  @"_IsMAAutoAsset");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor foundByLookupWithoutAssetVersion](self, "foundByLookupWithoutAssetVersion"),  @"foundByLookupWithoutAssetVersion");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor foundAsPreInstalled](self, "foundAsPreInstalled"),  @"foundAsPreInstalled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor preSoftwareUpdateAssetStaging](self, "preSoftwareUpdateAssetStaging"),  @"_PreSoftwareUpdateAssetStaging");
  objc_msgSend(v4, "encodeBool:forKey:", -[MADAutoAssetDescriptor isPatch](self, "isPatch"), @"isPatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetSpecifier](self, "assetSpecifier"));
  [v4 encodeObject:v7 forKey:@"AssetSpecifier"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetVersion](self, "assetVersion"));
  [v4 encodeObject:v8 forKey:@"AssetVersion"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetFormat](self, "assetFormat"));
  [v4 encodeObject:v9 forKey:@"AssetFormat"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor build](self, "build"));
  [v4 encodeObject:v10 forKey:@"Build"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor minOSVersion](self, "minOSVersion"));
  [v4 encodeObject:v11 forKey:@"_MinOSVersion"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor maxOSVersion](self, "maxOSVersion"));
  [v4 encodeObject:v12 forKey:@"_MaxOSVersion"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor prerequisiteAssetBuilds](self, "prerequisiteAssetBuilds"));
  [v4 encodeObject:v13 forKey:@"PrerequisiteAssetBuilds"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor metadata](self, "metadata"));
  [v4 encodeObject:v14 forKey:@"metadata"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor isOnFilesystem](self, "isOnFilesystem"),  @"isOnFilesystem");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor neverBeenLocked](self, "neverBeenLocked"),  @"neverBeenLocked");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor secureOperationInProgress](self, "secureOperationInProgress"),  @"secureOperationInProgress");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor secureOperationEliminating](self, "secureOperationEliminating"),  @"secureOperationEliminating");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MADAutoAssetDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MADAutoAssetDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  [v4 encodeObject:v15 forKey:@"patchedFromBaseSelector"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MADAutoAssetDescriptor patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"),  @"patchedFromBaseFilesystemBytes");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor patchingAttempted](self, "patchingAttempted"),  @"patchingAttempted");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"),  @"stagedPriorToAvailable");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromOSVersion](self, "stagedFromOSVersion"));
  [v4 encodeObject:v16 forKey:@"stagedFromOSVersion"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  [v4 encodeObject:v17 forKey:@"stagedFromBuildVersion"];

  id v18 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor patchingAttemptError](self, "patchingAttemptError"));
  [v4 encodeObject:v18 forKey:@"patchingAttemptError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor prerequisiteAssetBuilds](self, "prerequisiteAssetBuilds"));

  if (v3)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor prerequisiteAssetBuilds](self, "prerequisiteAssetBuilds"));
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0LL;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (v7)
          {
            id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@, %@",  v7,  v10);

            v7 = (__CFString *)v11;
          }

          else
          {
            v7 = v10;
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v6);
    }

    else
    {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = @"NONE";
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor summary](self, "summary"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor metadata](self, "metadata"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 safeSummary]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[AutoAsset(%@)>>>\n[patch] prerequisistedBuilds: %@\n[metadata]       rawMetadata: %@\n<<<]",  v12,  v7,  v14));

  return v15;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetType](self, "assetType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetSpecifier](self, "assetSpecifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetVersion](self, "assetVersion"));
  id v6 = -[MADAutoAssetDescriptor newSummaryWithoutSelector](self, "newSummaryWithoutSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[assetType:%@|specifier:%@|version:%@|%@]",  v3,  v4,  v5,  v6));

  return v7;
}

- (id)newSummaryWithoutSelector
{
  uint64_t v43 = objc_alloc(&OBJC_CLASS___NSString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetId](self, "assetId"));
  id v4 = @"N";
  if (-[MADAutoAssetDescriptor foundByLookupWithoutAssetVersion](self, "foundByLookupWithoutAssetVersion")) {
    id v5 = @"Y";
  }
  else {
    id v5 = @"N";
  }
  uint64_t v40 = v5;
  if (-[MADAutoAssetDescriptor foundAsPreInstalled](self, "foundAsPreInstalled")) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  id v39 = v6;
  if (-[MADAutoAssetDescriptor isPatch](self, "isPatch")) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  v38 = v7;
  if (-[MADAutoAssetDescriptor isOnFilesystem](self, "isOnFilesystem")) {
    uint64_t v8 = @"Y";
  }
  else {
    uint64_t v8 = @"N";
  }
  uint64_t v37 = v8;
  if (-[MADAutoAssetDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v36 = v9;
  if (-[MADAutoAssetDescriptor secureOperationInProgress](self, "secureOperationInProgress")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  v34 = v10;
  if (-[MADAutoAssetDescriptor secureOperationEliminating](self, "secureOperationEliminating")) {
    id v11 = @"Y";
  }
  else {
    id v11 = @"N";
  }
  uint64_t v33 = v11;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetFormat](self, "assetFormat"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor build](self, "build"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor minOSVersion](self, "minOSVersion"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor maxOSVersion](self, "maxOSVersion"));
  if (-[MADAutoAssetDescriptor preSoftwareUpdateAssetStaging](self, "preSoftwareUpdateAssetStaging")) {
    id v14 = @"Y";
  }
  else {
    id v14 = @"N";
  }
  id v32 = v14;
  if (-[MADAutoAssetDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v15 = @"Y";
  }
  else {
    uint64_t v15 = @"N";
  }
  v31 = v15;
  int64_t v30 = -[MADAutoAssetDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v28 = -[MADAutoAssetDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor patchedFromBaseSelector](self, "patchedFromBaseSelector"));
  id v42 = (void *)v12;
  if (v35)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor patchedFromBaseSelector](self, "patchedFromBaseSelector"));
    id v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 summary]);
  }

  else
  {
    id v45 = &stru_355768;
  }

  int64_t v27 = -[MADAutoAssetDescriptor patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  if (-[MADAutoAssetDescriptor patchingAttempted](self, "patchingAttempted")) {
    uint64_t v16 = @"Y";
  }
  else {
    uint64_t v16 = @"N";
  }
  id v26 = v16;
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor patchingAttemptError](self, "patchingAttemptError"));
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
  if (-[MADAutoAssetDescriptor isPreSUStagingRequired](self, "isPreSUStagingRequired")) {
    __int128 v17 = @"REQUIRED";
  }
  else {
    __int128 v17 = @"OPTIONAL";
  }
  if (-[MADAutoAssetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    __int128 v18 = @"Y";
  }
  else {
    __int128 v18 = @"N";
  }
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromOSVersion](self, "stagedFromOSVersion"));
  if (v19) {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromOSVersion](self, "stagedFromOSVersion"));
  }
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  if (v20) {
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor stagedFromBuildVersion](self, "stagedFromBuildVersion"));
  }
  else {
    uint64_t v21 = @"N";
  }
  if (-[MADAutoAssetDescriptor isBlankEntry](self, "isBlankEntry")) {
    v22 = @"Y";
  }
  else {
    v22 = @"N";
  }
  id v23 = -[NSString initWithFormat:]( v43,  "initWithFormat:",  @"ID:%@|lookupWithoutAssetVersion:%@|preInstalled:%@|patch:%@|filesystem:%@|neverBeenLocked:%@|(secureOperation)inProgress:%@,eliminating:%@|format:%@|build:%@|[OS]min:%@,max:%@|preStaging:%@|(downloaded)user:%@,network:%ld,filesystem:%ld|(patched)base:%@,baseBytes:%ld,attempted:%@,error:%@|(staged)required:%@,prior:%@,fromOSVersion:%@,fromBuild:%@|isBlankEntry:%@",  v3,  v40,  v39,  v38,  v37,  v36,  v34,  v33,  v44,  v42,  v41,  v13,  v32,  v31,  v30,  v28,  v45,  v27,  v26,  v46,  v17,  v18,  v4,  v21,  v22);
  if (v20) {

  }
  if (v19) {
  if (v35)
  }
  {
  }

  return v23;
}

- (BOOL)isBlankEntry
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetType](self, "assetType"));
  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"Empty"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetId](self, "assetId"));
    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v4, @"Empty"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetSpecifier](self, "assetSpecifier"));
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v5, @"Empty"))
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetVersion](self, "assetVersion"));
        if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v6, @"Empty"))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetFormat](self, "assetFormat"));
          if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v7, @"Empty"))
          {
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor build](self, "build"));
            if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v8,  @"Empty"))
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor minOSVersion](self, "minOSVersion"));
              if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"Empty"))
              {
                v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor maxOSVersion](self, "maxOSVersion"));
                unsigned __int8 v11 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v10,  @"Empty");
              }

              else
              {
                unsigned __int8 v11 = 0;
              }
            }

            else
            {
              unsigned __int8 v11 = 0;
            }
          }

          else
          {
            unsigned __int8 v11 = 0;
          }
        }

        else
        {
          unsigned __int8 v11 = 0;
        }
      }

      else
      {
        unsigned __int8 v11 = 0;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (BOOL)doesMetatadaIndicateEmptyEntry:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 safeStringForKey:@"__Empty"]);
  if (v3) {
    unsigned __int8 v4 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"Empty");
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isEqualSelector:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetType](self, "assetType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v5, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetSpecifier](self, "assetSpecifier"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 assetSpecifier]);
    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v7, v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor assetVersion](self, "assetVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 assetVersion]);
      unsigned __int8 v11 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v9, v10);
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)isRamped
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor metadata](self, "metadata"));
  unsigned __int8 v3 = [v2 safeBooleanForKey:@"Ramp"];

  return v3;
}

- (BOOL)isPreSUStagingRequired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor metadata](self, "metadata"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"_PreSoftwareUpdateAssetStagingPolicy"]);

  LOBYTE(v2) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"Required");
  return (char)v2;
}

+ (int64_t)totalFilesystemSpaceForAutoAssetDescriptors:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = objc_autoreleasePoolPush();
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeObjectForKey:ofClass:", v9, v11, (void)v16));
        uint64_t v13 = v12;
        if (v12)
        {
          if ((uint64_t)[v12 downloadedFilesystemBytes] < 1)
          {
            id v14 = [v13 downloadedNetworkBytes];
          }

          else
          {
            id v14 = [v13 downloadedFilesystemBytes];
          }

          v6 += (int64_t)v14;
        }

+ (BOOL)isAutoAssetMetadata:(id)a3
{
  return [a3 safeBooleanForKey:@"_IsMAAutoAsset"];
}

+ (BOOL)isMorePreferredAssetFormat:(id)a3 comparedTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = supportedAssetFormatsArray();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned __int8 v14 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v6,  v13,  (void)v17);
        if ((v14 & 1) != 0
          || (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v5, v13) & 1) != 0)
        {
          char v15 = v14 ^ 1;
          goto LABEL_13;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      char v15 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    char v15 = 0;
  }

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (BOOL)isMAAutoAsset
{
  return self->_isMAAutoAsset;
}

- (BOOL)foundByLookupWithoutAssetVersion
{
  return self->_foundByLookupWithoutAssetVersion;
}

- (void)setFoundByLookupWithoutAssetVersion:(BOOL)a3
{
  self->_foundByLookupWithoutAssetVersion = a3;
}

- (BOOL)foundAsPreInstalled
{
  return self->_foundAsPreInstalled;
}

- (void)setFoundAsPreInstalled:(BOOL)a3
{
  self->_foundAsPreInstalled = a3;
}

- (BOOL)preSoftwareUpdateAssetStaging
{
  return self->_preSoftwareUpdateAssetStaging;
}

- (void)setPreSoftwareUpdateAssetStaging:(BOOL)a3
{
  self->_preSoftwareUpdateAssetStaging = a3;
}

- (BOOL)isPatch
{
  return self->_isPatch;
}

- (void)setIsPatch:(BOOL)a3
{
  self->_isPatch = a3;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSString)assetFormat
{
  return self->_assetFormat;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)minOSVersion
{
  return self->_minOSVersion;
}

- (NSString)maxOSVersion
{
  return self->_maxOSVersion;
}

- (NSArray)prerequisiteAssetBuilds
{
  return self->_prerequisiteAssetBuilds;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isOnFilesystem
{
  return self->_isOnFilesystem;
}

- (void)setIsOnFilesystem:(BOOL)a3
{
  self->_isOnFilesystem = a3;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (BOOL)secureOperationInProgress
{
  return self->_secureOperationInProgress;
}

- (void)setSecureOperationInProgress:(BOOL)a3
{
  self->_secureOperationInProgress = a3;
}

- (BOOL)secureOperationEliminating
{
  return self->_secureOperationEliminating;
}

- (void)setSecureOperationEliminating:(BOOL)a3
{
  self->_secureOperationEliminating = a3;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
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
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setStagedFromOSVersion:(id)a3
{
}

- (NSString)stagedFromBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setStagedFromBuildVersion:(id)a3
{
}

- (NSError)patchingAttemptError
{
  return self->_patchingAttemptError;
}

- (void)setPatchingAttemptError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end