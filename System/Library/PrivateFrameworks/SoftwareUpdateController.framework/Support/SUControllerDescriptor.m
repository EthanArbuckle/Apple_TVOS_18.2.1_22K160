@interface SUControllerDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)fullReplacement;
- (BOOL)hasBeenAbandoned;
- (BOOL)isAwaitingAdmissionControlForInstallation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupervisedPolicy;
- (BOOL)mandatoryUpdateEligible;
- (BOOL)mandatoryUpdateOptional;
- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox;
- (BOOL)rampEnabled;
- (BOOL)userDidAcceptTermsAndConditions;
- (BOOL)willProceedWithInstallation;
- (MAAsset)documentationAsset;
- (MAAsset)softwareUpdateAsset;
- (NSDate)releaseDate;
- (NSError)denialReasons;
- (NSString)documentationID;
- (NSString)fullProductVersion;
- (NSString)humanReadableUpdateName;
- (NSString)mandatoryUpdateVersionMax;
- (NSString)mandatoryUpdateVersionMin;
- (NSString)marketingVersion;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productVersion;
- (NSString)publisher;
- (NSString)releaseType;
- (NSString)requestedPMV;
- (SUControllerDescriptor)init;
- (SUControllerDescriptor)initWithCoder:(id)a3;
- (SUControllerDocumentation)documentation;
- (SUCoreDescriptor)coreDescriptor;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)compare:(id)a3;
- (int64_t)delayPeriod;
- (int64_t)downloadSize;
- (int64_t)installationSize;
- (int64_t)msuPrepareSize;
- (int64_t)preparationSize;
- (int64_t)totalRequiredFreeSpace;
- (int64_t)unarchivedSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreDescriptor:(id)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setDenialReasons:(id)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationAsset:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setDownloadSize:(int64_t)a3;
- (void)setFullProductVersion:(id)a3;
- (void)setFullReplacement:(BOOL)a3;
- (void)setHasBeenAbandoned:(BOOL)a3;
- (void)setInstallationSize:(int64_t)a3;
- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3;
- (void)setIsSupervisedPolicy:(BOOL)a3;
- (void)setMandatoryUpdateEligible:(BOOL)a3;
- (void)setMandatoryUpdateOptional:(BOOL)a3;
- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3;
- (void)setMandatoryUpdateVersionMax:(id)a3;
- (void)setMandatoryUpdateVersionMin:(id)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setMsuPrepareSize:(int64_t)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setSoftwareUpdateAsset:(id)a3;
- (void)setTotalRequiredFreeSpace:(int64_t)a3;
- (void)setUnarchivedSize:(int64_t)a3;
- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3;
- (void)setWillProceedWithInstallation:(BOOL)a3;
@end

@implementation SUControllerDescriptor

- (SUControllerDescriptor)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SUControllerDescriptor;
  v2 = -[SUControllerDescriptor init](&v22, "init");
  v3 = v2;
  if (v2)
  {
    documentation = v2->_documentation;
    v2->_documentation = 0LL;

    productVersion = v3->_productVersion;
    v3->_productVersion = 0LL;

    productBuildVersion = v3->_productBuildVersion;
    v3->_productBuildVersion = 0LL;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0LL;

    marketingVersion = v3->_marketingVersion;
    v3->_marketingVersion = 0LL;

    publisher = v3->_publisher;
    v3->_publisher = 0LL;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = 0LL;

    fullProductVersion = v3->_fullProductVersion;
    v3->_fullProductVersion = 0LL;

    denialReasons = v3->_denialReasons;
    v3->_denialReasons = 0LL;

    *(_WORD *)&v3->_userDidAcceptTermsAndConditions = 0;
    v3->_rampEnabled = 0;
    *(_WORD *)&v3->_willProceedWithInstallation = 0;
    v3->_installationSize = 0LL;
    v3->_totalRequiredFreeSpace = 0LL;
    v3->_downloadSize = 0LL;
    v3->_unarchivedSize = 0LL;
    v3->_msuPrepareSize = 0LL;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0LL;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0LL;

    coreDescriptor = v3->_coreDescriptor;
    v3->_coreDescriptor = 0LL;

    v3->_hasBeenAbandoned = 0;
    v3->_isSupervisedPolicy = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0LL;

    v3->_delayPeriod = 0LL;
    releaseType = v3->_releaseType;
    v3->_releaseType = 0LL;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0LL;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0LL;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0LL;

    *(_WORD *)&v3->_mandatoryUpdateOptional = 0;
  }

  return v3;
}

- (SUControllerDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___SUControllerDescriptor;
  v5 = -[SUControllerDescriptor init](&v52, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(SUControllerDocumentation) forKey:@"documentation"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    documentation = v5->_documentation;
    v5->_documentation = (SUControllerDocumentation *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productVersion"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productBuildVersion"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"documentationID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"MarketingVersion"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    marketingVersion = v5->_marketingVersion;
    v5->_marketingVersion = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"publisher"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productSystemName"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"denialReasons"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    denialReasons = v5->_denialReasons;
    v5->_denialReasons = (NSError *)v28;

    v5->_downloadSize = (int64_t)[v4 decodeInt64ForKey:@"downloadSize"];
    v5->_unarchivedSize = (int64_t)[v4 decodeInt64ForKey:@"unarchivedSize"];
    v5->_msuPrepareSize = (int64_t)[v4 decodeInt64ForKey:@"msuPrepareSize"];
    v5->_installationSize = (int64_t)[v4 decodeInt64ForKey:@"installationSize"];
    v5->_totalRequiredFreeSpace = (int64_t)[v4 decodeInt64ForKey:@"TotalRequiredFreeSpace"];
    v5->_userDidAcceptTermsAndConditions = [v4 decodeBoolForKey:@"userDidAcceptTermsAndConditions"];
    v5->_fullReplacement = [v4 decodeBoolForKey:@"fullReplacement"];
    v5->_rampEnabled = [v4 decodeBoolForKey:@"rampEnabled"];
    v5->_willProceedWithInstallation = [v4 decodeBoolForKey:@"willProceedWithInstallation"];
    v5->_isAwaitingAdmissionControlForInstallation = [v4 decodeBoolForKey:@"isAwaitingAdmissionControlForInstallation"];
    fullProductVersion = v5->_fullProductVersion;
    v5->_fullProductVersion = 0LL;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0LL;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0LL;

    id v33 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"coreDescriptor"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    coreDescriptor = v5->_coreDescriptor;
    v5->_coreDescriptor = (SUCoreDescriptor *)v34;

    v5->_hasBeenAbandoned = 0;
    v5->_isSupervisedPolicy = [v4 decodeBoolForKey:@"isSupervisedPolicy"];
    id v36 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"requestedPMV"];
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v37;

    v5->_delayPeriod = (int64_t)[v4 decodeIntegerForKey:@"delayPeriod"];
    id v39 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"releaseType"];
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v40;

    id v42 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"releaseDate"];
    uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v43;

    v5->_mandatoryUpdateEligible = [v4 decodeBoolForKey:@"mandatoryUpdateEligible"];
    id v45 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mandatoryUpdateVersionMin"];
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    mandatoryUpdateVersionMin = v5->_mandatoryUpdateVersionMin;
    v5->_mandatoryUpdateVersionMin = (NSString *)v46;

    id v48 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mandatoryUpdateVersionMax"];
    uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);
    mandatoryUpdateVersionMax = v5->_mandatoryUpdateVersionMax;
    v5->_mandatoryUpdateVersionMax = (NSString *)v49;

    v5->_mandatoryUpdateOptional = [v4 decodeBoolForKey:@"mandatoryUpdateOptional"];
    v5->_mandatoryUpdateRestrictedToOutOfTheBox = [v4 decodeBoolForKey:@"mandatoryUpdateRestrictedToOutOfTheBox"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor documentation](self, "documentation"));
  [v18 encodeObject:v4 forKey:@"documentation"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
  [v18 encodeObject:v5 forKey:@"productVersion"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
  [v18 encodeObject:v6 forKey:@"productBuildVersion"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor documentationID](self, "documentationID"));
  [v18 encodeObject:v7 forKey:@"documentationID"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor marketingVersion](self, "marketingVersion"));
  [v18 encodeObject:v8 forKey:@"MarketingVersion"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor publisher](self, "publisher"));
  [v18 encodeObject:v9 forKey:@"publisher"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productSystemName](self, "productSystemName"));
  [v18 encodeObject:v10 forKey:@"productSystemName"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor denialReasons](self, "denialReasons"));
  [v18 encodeObject:v11 forKey:@"denialReasons"];

  objc_msgSend( v18,  "encodeInt64:forKey:",  -[SUControllerDescriptor downloadSize](self, "downloadSize"),  @"downloadSize");
  objc_msgSend( v18,  "encodeInt64:forKey:",  -[SUControllerDescriptor unarchivedSize](self, "unarchivedSize"),  @"unarchivedSize");
  objc_msgSend( v18,  "encodeInt64:forKey:",  -[SUControllerDescriptor msuPrepareSize](self, "msuPrepareSize"),  @"msuPrepareSize");
  objc_msgSend( v18,  "encodeInt64:forKey:",  -[SUControllerDescriptor installationSize](self, "installationSize"),  @"installationSize");
  objc_msgSend( v18,  "encodeInt64:forKey:",  -[SUControllerDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"),  @"TotalRequiredFreeSpace");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor userDidAcceptTermsAndConditions](self, "userDidAcceptTermsAndConditions"),  @"userDidAcceptTermsAndConditions");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor fullReplacement](self, "fullReplacement"),  @"fullReplacement");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor rampEnabled](self, "rampEnabled"),  @"rampEnabled");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor willProceedWithInstallation](self, "willProceedWithInstallation"),  @"willProceedWithInstallation");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor isAwaitingAdmissionControlForInstallation]( self,  "isAwaitingAdmissionControlForInstallation"),  @"isAwaitingAdmissionControlForInstallation");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor coreDescriptor](self, "coreDescriptor"));
  [v18 encodeObject:v12 forKey:@"coreDescriptor"];

  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy"),  @"isSupervisedPolicy");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor requestedPMV](self, "requestedPMV"));
  [v18 encodeObject:v13 forKey:@"requestedPMV"];

  objc_msgSend( v18,  "encodeInteger:forKey:",  -[SUControllerDescriptor delayPeriod](self, "delayPeriod"),  @"delayPeriod");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor releaseType](self, "releaseType"));
  [v18 encodeObject:v14 forKey:@"releaseType"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor releaseDate](self, "releaseDate"));
  [v18 encodeObject:v15 forKey:@"releaseDate"];

  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"),  @"mandatoryUpdateEligible");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin"));
  [v18 encodeObject:v16 forKey:@"mandatoryUpdateVersionMin"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax"));
  [v18 encodeObject:v17 forKey:@"mandatoryUpdateVersionMax"];

  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"),  @"mandatoryUpdateOptional");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[SUControllerDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"),  @"mandatoryUpdateRestrictedToOutOfTheBox");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SUControllerDescriptor),  v2,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUControllerDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](v6, "productVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
      if ([v7 isEqualToString:v8])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](v6, "productBuildVersion"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
        if ([v9 isEqualToString:v10])
        {
          unsigned int v11 = -[SUControllerDescriptor isSupervisedPolicy](v6, "isSupervisedPolicy");
          unsigned int v12 = v11 ^ -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy") ^ 1;
        }

        else
        {
          LOBYTE(v12) = 0;
        }
      }

      else
      {
        LOBYTE(v12) = 0;
      }
    }

    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v3, v4));
  id v6 = [v5 hash];

  return (unint64_t)v6;
}

- (id)description
{
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor humanReadableUpdateName](self, "humanReadableUpdateName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productSystemName](self, "productSystemName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor publisher](self, "publisher"));
  int64_t v25 = -[SUControllerDescriptor downloadSize](self, "downloadSize");
  int64_t v24 = -[SUControllerDescriptor preparationSize](self, "preparationSize");
  int64_t v23 = -[SUControllerDescriptor installationSize](self, "installationSize");
  int64_t v22 = -[SUControllerDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor documentationID](self, "documentationID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor marketingVersion](self, "marketingVersion"));
  if (-[SUControllerDescriptor fullReplacement](self, "fullReplacement")) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  uint64_t v19 = v3;
  if (-[SUControllerDescriptor rampEnabled](self, "rampEnabled")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v18 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor denialReasons](self, "denialReasons"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor releaseType](self, "releaseType"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor releaseDate](self, "releaseDate"));
  if (-[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v15 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor requestedPMV](self, "requestedPMV"));
  int64_t v8 = -[SUControllerDescriptor delayPeriod](self, "delayPeriod");
  if (-[SUControllerDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible")) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax"));
  if (-[SUControllerDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional")) {
    unsigned int v12 = @"YES";
  }
  else {
    unsigned int v12 = @"NO";
  }
  if (-[SUControllerDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox")) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n            HumanReadableUpdateName: %@\n            ProductVersion: %@\n            ProductBuildVersion: %@\n            ProductSystemName: %@\n            Publisher: %@\n            DownloadSize: %lld\n            PreparationSize: %lld\n            InstallationSize: %lld\n            TotalRequiredFreeSpace: %lld\n            DocumentationID: %@\n            MarketingVersion: %@\n            FullReplacement: %@\n            RampEnabled: %@\n            CurrentDenialReasons: %@\n            ReleaseType: %@\n            ReleaseDate: %@\n            IsSupervisedPolicy: %@\n            RequestedPMV: %@\n            DelayPeriod: %d days\n            MandatoryUpdateEligible: %@\n            MandatoryUpdateVersionMin: %@\n            MandatoryUpdateVersionMax: %@\n            MandatoryUpdateOptional: %@\n            mandatoryUpdateRestrictedToOutOfTheBox: %@",  v30,  v29,  v28,  v27,  v26,  v25,  v24,  v23,  v22,  v21,  v20,  v19,  v18,  v17,  v5,  v16,  v15,  v7,  v8,  v9,  v10,  v11,  v12,  v13));

  return v31;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor humanReadableUpdateName](self, "humanReadableUpdateName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
  unsigned int v5 = -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy");
  id v6 = @"Not Supervised";
  if (v5) {
    id v6 = @"Supervised";
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ (%@)",  v3,  v4,  v6));

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = (SUControllerDescriptor *)a3;
  unsigned int v5 = v4;
  if (self == v4)
  {
    int64_t v8 = 0LL;
  }

  else if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](v5, "productVersion"));
    int64_t v8 = (int64_t)[v6 compare:v7 options:64];

    if (v8 != 1 && v8 != -1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](self, "productBuildVersion"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productBuildVersion](v5, "productBuildVersion"));
      int64_t v8 = (int64_t)[v9 compare:v10 options:64];
    }
  }

  else
  {
    int64_t v8 = 1LL;
  }

  return v8;
}

- (int64_t)preparationSize
{
  int64_t v3 = -[SUControllerDescriptor unarchivedSize](self, "unarchivedSize");
  return -[SUControllerDescriptor msuPrepareSize](self, "msuPrepareSize") + v3;
}

- (NSString)humanReadableUpdateName
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor documentation](self, "documentation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 humanReadableUpdateName]);

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor documentation](self, "documentation"));
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 humanReadableUpdateName]);
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productSystemName](self, "productSystemName"));
    if (!v7
      || (int64_t v8 = (void *)v7,
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion")),
          v9,
          v8,
          !v9))
    {
      id v6 = @"Software Update";
      return (NSString *)v6;
    }

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productSystemName](self, "productSystemName"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDescriptor productVersion](self, "productVersion"));
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v5,  v10));
  }

  return (NSString *)v6;
}

- (SUControllerDocumentation)documentation
{
  return self->_documentation;
}

- (void)setDocumentation:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
}

- (NSString)marketingVersion
{
  return self->_marketingVersion;
}

- (void)setMarketingVersion:(id)a3
{
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)productSystemName
{
  return self->_productSystemName;
}

- (void)setProductSystemName:(id)a3
{
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int64_t)a3
{
  self->_downloadSize = a3;
}

- (int64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(int64_t)a3
{
  self->_installationSize = a3;
}

- (int64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(int64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (BOOL)userDidAcceptTermsAndConditions
{
  return self->_userDidAcceptTermsAndConditions;
}

- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3
{
  self->_userDidAcceptTermsAndConditions = a3;
}

- (BOOL)fullReplacement
{
  return self->_fullReplacement;
}

- (void)setFullReplacement:(BOOL)a3
{
  self->_fullReplacement = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (NSError)denialReasons
{
  return self->_denialReasons;
}

- (void)setDenialReasons:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (BOOL)isSupervisedPolicy
{
  return self->_isSupervisedPolicy;
}

- (void)setIsSupervisedPolicy:(BOOL)a3
{
  self->_isSupervisedPolicy = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (NSString)fullProductVersion
{
  return self->_fullProductVersion;
}

- (void)setFullProductVersion:(id)a3
{
}

- (int64_t)unarchivedSize
{
  return self->_unarchivedSize;
}

- (void)setUnarchivedSize:(int64_t)a3
{
  self->_unarchivedSize = a3;
}

- (int64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(int64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (BOOL)willProceedWithInstallation
{
  return self->_willProceedWithInstallation;
}

- (void)setWillProceedWithInstallation:(BOOL)a3
{
  self->_willProceedWithInstallation = a3;
}

- (BOOL)isAwaitingAdmissionControlForInstallation
{
  return self->_isAwaitingAdmissionControlForInstallation;
}

- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3
{
  self->_isAwaitingAdmissionControlForInstallation = a3;
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
}

- (SUCoreDescriptor)coreDescriptor
{
  return self->_coreDescriptor;
}

- (void)setCoreDescriptor:(id)a3
{
}

- (BOOL)hasBeenAbandoned
{
  return self->_hasBeenAbandoned;
}

- (void)setHasBeenAbandoned:(BOOL)a3
{
  self->_hasBeenAbandoned = a3;
}

- (void).cxx_destruct
{
}

@end