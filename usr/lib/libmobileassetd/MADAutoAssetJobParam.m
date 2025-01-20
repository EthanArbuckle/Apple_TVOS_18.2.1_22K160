@interface MADAutoAssetJobParam
+ (BOOL)supportsSecureCoding;
- (BOOL)catalogFromLookupCache;
- (MAAutoAssetProgress)downloadProgress;
- (MAAutoAssetSelector)autoAssetSelector;
- (MADAutoAssetClientRequest)clientRequest;
- (MADAutoAssetDescriptor)autoAssetDescriptor;
- (MADAutoAssetJobParam)initWithAssetTargetOSVersion:(id)a3 withAssetTargetBuildVersion:(id)a4 withAssetTargetTrainName:(id)a5 withAssetTargetRestoreVersion:(id)a6 withControlInformation:(id)a7;
- (MADAutoAssetJobParam)initWithClientRequest:(id)a3 withControlInformation:(id)a4;
- (MADAutoAssetJobParam)initWithCoder:(id)a3;
- (MADAutoAssetJobParam)initWithControlInformation:(id)a3;
- (MADAutoAssetJobParam)initWithDescriptor:(id)a3 withControlInformation:(id)a4;
- (MADAutoAssetJobParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withClientRequest:(id)a5 withAutoAssetSelector:(id)a6 withAutoAssetJobID:(id)a7 withAutoAssetCatalog:(id)a8 whereCatalogFromLookupCache:(BOOL)a9 withFinishedError:(id)a10 withDownloadProgress:(id)a11 withAssetTargetOSVersion:(id)a12 withAssetTargetBuildVersion:(id)a13 withAssetTargetTrainName:(id)a14 withAssetTargetRestoreVersion:(id)a15 withAutoAssetDescriptor:(id)a16 withControlInformation:(id)a17;
- (MADAutoAssetJobParam)initWithSafeSummary:(id)a3;
- (MADAutoAssetJobParam)initWithSelector:(id)a3 withControlInformation:(id)a4;
- (MANAutoAssetInfoControl)controlInformation;
- (NSDictionary)autoAssetCatalog;
- (NSError)finishedError;
- (NSString)assetTargetBuildVersion;
- (NSString)assetTargetOSVersion;
- (NSString)assetTargetRestoreVersion;
- (NSString)assetTargetTrainName;
- (NSString)autoAssetJobID;
- (NSString)paramSafeSummary;
- (id)_summary;
- (id)initForCurrentJobID:(id)a3 withProgress:(id)a4;
- (id)initForFinishedJobID:(id)a3 withCatalog:(id)a4 whereCatalogFromLookupCache:(BOOL)a5 withError:(id)a6;
- (id)initForFinishedJobID:(id)a3 withError:(id)a4;
- (int64_t)paramType;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetTargetRestoreVersion:(id)a3;
- (void)setAssetTargetTrainName:(id)a3;
- (void)setClientRequest:(id)a3;
- (void)setParamSafeSummary:(id)a3;
- (void)updateSafeSummary;
@end

@implementation MADAutoAssetJobParam

- (MADAutoAssetJobParam)initWithSafeSummary:(id)a3
{
  LOBYTE(v4) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetJobParam)initWithControlInformation:(id)a3
{
  LOBYTE(v4) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  8LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3);
}

- (MADAutoAssetJobParam)initWithClientRequest:(id)a3 withControlInformation:(id)a4
{
  LOBYTE(v5) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  1LL,  0LL,  a3,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4);
}

- (id)initForFinishedJobID:(id)a3 withError:(id)a4
{
  LOBYTE(v5) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  2LL,  0LL,  0LL,  0LL,  a3,  0LL,  v5,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForFinishedJobID:(id)a3 withCatalog:(id)a4 whereCatalogFromLookupCache:(BOOL)a5 withError:(id)a6
{
  LOBYTE(v7) = a5;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  3LL,  0LL,  0LL,  0LL,  a3,  a4,  v7,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForCurrentJobID:(id)a3 withProgress:(id)a4
{
  LOBYTE(v5) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  4LL,  0LL,  0LL,  0LL,  a3,  0LL,  v5,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetJobParam)initWithSelector:(id)a3 withControlInformation:(id)a4
{
  LOBYTE(v5) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  5LL,  0LL,  0LL,  a3,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4);
}

- (MADAutoAssetJobParam)initWithAssetTargetOSVersion:(id)a3 withAssetTargetBuildVersion:(id)a4 withAssetTargetTrainName:(id)a5 withAssetTargetRestoreVersion:(id)a6 withControlInformation:(id)a7
{
  LOBYTE(v8) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  6LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  a3,  a4,  a5,  a6,  0LL,  a7);
}

- (MADAutoAssetJobParam)initWithDescriptor:(id)a3 withControlInformation:(id)a4
{
  LOBYTE(v5) = 0;
  return -[MADAutoAssetJobParam initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCatalog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:]( self,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:",  7LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4);
}

- (MADAutoAssetJobParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withClientRequest:(id)a5 withAutoAssetSelector:(id)a6 withAutoAssetJobID:(id)a7 withAutoAssetCatalog:(id)a8 whereCatalogFromLookupCache:(BOOL)a9 withFinishedError:(id)a10 withDownloadProgress:(id)a11 withAssetTargetOSVersion:(id)a12 withAssetTargetBuildVersion:(id)a13 withAssetTargetTrainName:(id)a14 withAssetTargetRestoreVersion:(id)a15 withAutoAssetDescriptor:(id)a16 withControlInformation:(id)a17
{
  id v46 = a4;
  id v33 = a5;
  id v45 = a5;
  id obj = a6;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  id v41 = a10;
  id v40 = a11;
  id v39 = a12;
  id v38 = a13;
  id v37 = a14;
  id v36 = a15;
  id v21 = a16;
  v22 = v45;
  id v23 = a17;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___MADAutoAssetJobParam;
  v24 = -[MADAutoAssetJobParam init](&v47, "init");
  v25 = v24;
  if (v24)
  {
    v24->_paramType = a3;
    objc_storeStrong((id *)&v24->_clientRequest, v33);
    objc_storeStrong((id *)&v25->_autoAssetSelector, obj);
    objc_storeStrong((id *)&v25->_autoAssetJobID, a7);
    objc_storeStrong((id *)&v25->_autoAssetCatalog, a8);
    v25->_catalogFromLookupCache = a9;
    objc_storeStrong((id *)&v25->_finishedError, a10);
    objc_storeStrong((id *)&v25->_downloadProgress, a11);
    objc_storeStrong((id *)&v25->_assetTargetOSVersion, a12);
    objc_storeStrong((id *)&v25->_assetTargetBuildVersion, a13);
    objc_storeStrong((id *)&v25->_assetTargetTrainName, a14);
    objc_storeStrong((id *)&v25->_assetTargetRestoreVersion, a15);
    objc_storeStrong((id *)&v25->_autoAssetDescriptor, a16);
    objc_storeStrong((id *)&v25->_controlInformation, a17);
    if (v46)
    {
      v26 = objc_alloc(&OBJC_CLASS___NSString);
      v27 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam _summary](v25, "_summary"));
      v28 = -[NSString initWithFormat:](v26, "initWithFormat:", @"%@+++%@", v46, v27);
      paramSafeSummary = v25->_paramSafeSummary;
      v25->_paramSafeSummary = v28;
    }

    else
    {
      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam _summary](v25, "_summary"));
      v27 = v25->_paramSafeSummary;
      v25->_paramSafeSummary = (NSString *)v30;
    }

    v22 = v45;
  }

  return v25;
}

- (MADAutoAssetJobParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___MADAutoAssetJobParam;
  uint64_t v5 = -[MADAutoAssetJobParam init](&v48, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"paramSafeSummary"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    paramSafeSummary = v5->_paramSafeSummary;
    v5->_paramSafeSummary = (NSString *)v7;

    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientRequest"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    clientRequest = v5->_clientRequest;
    v5->_clientRequest = (MADAutoAssetClientRequest *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"autoAssetSelector"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    autoAssetSelector = v5->_autoAssetSelector;
    v5->_autoAssetSelector = (MAAutoAssetSelector *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetJobID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    autoAssetJobID = v5->_autoAssetJobID;
    v5->_autoAssetJobID = (NSString *)v16;

    v18 = objc_alloc(&OBJC_CLASS___NSSet);
    v49[0] = objc_opt_class(&OBJC_CLASS___NSData);
    v49[1] = objc_opt_class(&OBJC_CLASS___NSDate);
    v49[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v49[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v49[4] = objc_opt_class(&OBJC_CLASS___NSArray);
    v49[5] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v49[6] = objc_opt_class(&OBJC_CLASS___NSSet);
    v49[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v49[8] = objc_opt_class(&OBJC_CLASS___NSMutableData);
    v49[9] = objc_opt_class(&OBJC_CLASS___NSMutableString);
    v49[10] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v49[11] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    v49[12] = objc_opt_class(&OBJC_CLASS___NSMutableSet);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 13LL));
    v20 = -[NSSet initWithArray:](v18, "initWithArray:", v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"autoAssetCatalog"]);
    autoAssetCatalog = v5->_autoAssetCatalog;
    v5->_autoAssetCatalog = (NSDictionary *)v21;

    v5->_catalogFromLookupCache = [v4 decodeBoolForKey:@"catalogFromLookupCache"];
    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"finishedError"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    finishedError = v5->_finishedError;
    v5->_finishedError = (NSError *)v24;

    id v26 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetProgress) forKey:@"downloadProgress"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v27;

    id v29 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetOSVersion"];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    assetTargetOSVersion = v5->_assetTargetOSVersion;
    v5->_assetTargetOSVersion = (NSString *)v30;

    id v32 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetBuildVersion"];
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    assetTargetBuildVersion = v5->_assetTargetBuildVersion;
    v5->_assetTargetBuildVersion = (NSString *)v33;

    id v35 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetTrainName"];
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    assetTargetTrainName = v5->_assetTargetTrainName;
    v5->_assetTargetTrainName = (NSString *)v36;

    id v38 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetRestoreVersion"];
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    assetTargetRestoreVersion = v5->_assetTargetRestoreVersion;
    v5->_assetTargetRestoreVersion = (NSString *)v39;

    id v41 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetDescriptor) forKey:@"autoAssetDescriptor"];
    uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
    autoAssetDescriptor = v5->_autoAssetDescriptor;
    v5->_autoAssetDescriptor = (MADAutoAssetDescriptor *)v42;

    id v44 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetInfoControl) forKey:@"controlInformation"];
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    controlInformation = v5->_controlInformation;
    v5->_controlInformation = (MANAutoAssetInfoControl *)v45;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam paramSafeSummary](self, "paramSafeSummary"));
  [v4 encodeObject:v5 forKey:@"paramSafeSummary"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[MADAutoAssetJobParam paramType](self, "paramType"), @"paramType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam clientRequest](self, "clientRequest"));
  [v4 encodeObject:v6 forKey:@"clientRequest"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam autoAssetSelector](self, "autoAssetSelector"));
  [v4 encodeObject:v7 forKey:@"autoAssetSelector"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam autoAssetJobID](self, "autoAssetJobID"));
  [v4 encodeObject:v8 forKey:@"autoAssetJobID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam autoAssetCatalog](self, "autoAssetCatalog"));
  [v4 encodeObject:v9 forKey:@"autoAssetCatalog"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetJobParam catalogFromLookupCache](self, "catalogFromLookupCache"),  @"catalogFromLookupCache");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam finishedError](self, "finishedError"));
  [v4 encodeObject:v10 forKey:@"finishedError"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam downloadProgress](self, "downloadProgress"));
  [v4 encodeObject:v11 forKey:@"downloadProgress"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam assetTargetOSVersion](self, "assetTargetOSVersion"));
  [v4 encodeObject:v12 forKey:@"assetTargetOSVersion"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam assetTargetBuildVersion](self, "assetTargetBuildVersion"));
  [v4 encodeObject:v13 forKey:@"assetTargetBuildVersion"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam assetTargetTrainName](self, "assetTargetTrainName"));
  [v4 encodeObject:v14 forKey:@"assetTargetTrainName"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam assetTargetRestoreVersion](self, "assetTargetRestoreVersion"));
  [v4 encodeObject:v15 forKey:@"assetTargetRestoreVersion"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam autoAssetDescriptor](self, "autoAssetDescriptor"));
  [v4 encodeObject:v16 forKey:@"autoAssetDescriptor"];

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam controlInformation](self, "controlInformation"));
  [v4 encodeObject:v17 forKey:@"controlInformation"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_summary
{
  controlInformation = self->_controlInformation;
  if (controlInformation) {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl summary](controlInformation, "summary"));
  }
  else {
    id v4 = &stru_355768;
  }
  uint64_t v5 = @"SUMMARY";
  switch(self->_paramType)
  {
    case 0LL:
      goto LABEL_30;
    case 1LL:
      id v6 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest summary](self->_clientRequest, "summary"));
      uint64_t v8 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"CLIENT_REQUEST|clientRequest:%@|%@",  v7,  v4,  v28,  v29);
      goto LABEL_23;
    case 2LL:
      id v9 = objc_alloc(&OBJC_CLASS___NSString);
      autoAssetJobID = self->_autoAssetJobID;
      if (self->_finishedError)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
        uint64_t v8 = -[NSString initWithFormat:]( v9,  "initWithFormat:",  @"FINISHED|job:%@|finished:%@",  autoAssetJobID,  v7,  v28,  v29);
        goto LABEL_23;
      }

      v25 = (const __CFString *)self->_autoAssetJobID;
      uint64_t v27 = @"SUCCESS";
      id v23 = @"FINISHED|job:%@|finished:%@";
      goto LABEL_28;
    case 3LL:
      id v9 = objc_alloc(&OBJC_CLASS___NSString);
      v11 = self->_autoAssetJobID;
      NSUInteger v12 = -[NSDictionary count](self->_autoAssetCatalog, "count");
      NSUInteger v13 = v12;
      if (self->_catalogFromLookupCache) {
        v14 = @"Y";
      }
      else {
        v14 = @"N";
      }
      if (self->_finishedError)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
        uint64_t v8 = -[NSString initWithFormat:]( v9,  "initWithFormat:",  @"CATALOG|job:%@|count:%lu|fromLookupCache:%@|finished:%@",  v11,  v13,  v14,  v7);
        goto LABEL_23;
      }

      v28 = v14;
      id v29 = @"SUCCESS";
      v25 = (const __CFString *)v11;
      uint64_t v27 = (const __CFString *)v12;
      id v23 = @"CATALOG|job:%@|count:%lu|fromLookupCache:%@|finished:%@";
      goto LABEL_28;
    case 4LL:
      id v15 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v16 = self->_autoAssetJobID;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAAutoAssetProgress summary](self->_downloadProgress, "summary"));
      uint64_t v8 = -[NSString initWithFormat:](v15, "initWithFormat:", @"PROGRESS|job:%@|progress:%@", v16, v7, v28, v29);
      goto LABEL_23;
    case 5LL:
      id v9 = objc_alloc(&OBJC_CLASS___NSString);
      autoAssetSelector = self->_autoAssetSelector;
      if (autoAssetSelector)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAAutoAssetSelector summary](autoAssetSelector, "summary"));
        uint64_t v8 = -[NSString initWithFormat:](v9, "initWithFormat:", @"SCHEDULER|selector:%@|%@", v7, v4, v28, v29);
LABEL_23:
        uint64_t v5 = v8;
      }

      else
      {
        v25 = @"N";
        uint64_t v27 = v4;
        id v23 = @"SCHEDULER|selector:%@|%@";
LABEL_28:
        uint64_t v21 = -[NSString initWithFormat:](v9, "initWithFormat:", v23, v25, v27, v28, v29, v30);
LABEL_29:
        uint64_t v5 = (__CFString *)v21;
      }

- (void)updateSafeSummary
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam _summary](self, "_summary"));
  -[MADAutoAssetJobParam setParamSafeSummary:](self, "setParamSafeSummary:", v3);
}

- (NSString)paramSafeSummary
{
  return self->_paramSafeSummary;
}

- (void)setParamSafeSummary:(id)a3
{
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (MADAutoAssetClientRequest)clientRequest
{
  return self->_clientRequest;
}

- (void)setClientRequest:(id)a3
{
}

- (MAAutoAssetSelector)autoAssetSelector
{
  return self->_autoAssetSelector;
}

- (NSString)autoAssetJobID
{
  return self->_autoAssetJobID;
}

- (NSDictionary)autoAssetCatalog
{
  return self->_autoAssetCatalog;
}

- (BOOL)catalogFromLookupCache
{
  return self->_catalogFromLookupCache;
}

- (NSError)finishedError
{
  return self->_finishedError;
}

- (MAAutoAssetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (NSString)assetTargetOSVersion
{
  return self->_assetTargetOSVersion;
}

- (NSString)assetTargetBuildVersion
{
  return self->_assetTargetBuildVersion;
}

- (NSString)assetTargetTrainName
{
  return self->_assetTargetTrainName;
}

- (void)setAssetTargetTrainName:(id)a3
{
}

- (NSString)assetTargetRestoreVersion
{
  return self->_assetTargetRestoreVersion;
}

- (void)setAssetTargetRestoreVersion:(id)a3
{
}

- (MADAutoAssetDescriptor)autoAssetDescriptor
{
  return self->_autoAssetDescriptor;
}

- (MANAutoAssetInfoControl)controlInformation
{
  return self->_controlInformation;
}

- (void).cxx_destruct
{
}

@end