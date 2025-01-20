@interface MAAutoAssetSummary
+ (BOOL)supportsSecureCoding;
+ (id)assetRepresentationName:(int64_t)a3;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (BOOL)assetIsSecureMobileAsset;
- (BOOL)assetIsStaged;
- (BOOL)assetWasPatched;
- (BOOL)getStringsForSummaryProps:(id *)a3 isPersonalized:(id *)a4 isPrePersonalized:(id *)a5 isGrafted:(id *)a6 graftPoint:(id *)a7 stageGroup:(id *)a8 targetOS:(id *)a9;
- (BOOL)secureMobileAssetIsGrafted;
- (BOOL)secureMobileAssetIsPersonalized;
- (BOOL)secureMobileAssetIsPrePersonalized;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetStatus)jobStatus;
- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14;
- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14 withIsSecureMobileAsset:(BOOL)a15 withPersonalizationStatus:(BOOL)a16 withPrePersonalizationStatus:(BOOL)a17 withGraftStatus:(BOOL)a18 withGraftPoint:(id)a19 withStageGroupType:(unint64_t)a20 withTargetOS:(id)a21;
- (MAAutoAssetSummary)initWithCoder:(id)a3;
- (NSString)secureMobileAssetGraftPoint;
- (NSString)targetOS;
- (id)assetRepresentationName;
- (id)description;
- (id)newSummaryDictionary;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)assetRepresentation;
- (int64_t)maximumClientCount;
- (int64_t)pushDelaySecs;
- (int64_t)scheduledIntervalSecs;
- (int64_t)scheduledRemainingSecs;
- (int64_t)totalClientCount;
- (unint64_t)stageGroup;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetIsSecureMobileAsset:(BOOL)a3;
- (void)setAssetIsStaged:(BOOL)a3;
- (void)setAssetRepresentation:(int64_t)a3;
- (void)setAssetSelector:(id)a3;
- (void)setAssetWasPatched:(BOOL)a3;
- (void)setJobStatus:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setScheduledIntervalSecs:(int64_t)a3;
- (void)setScheduledRemainingSecs:(int64_t)a3;
- (void)setSecureMobileAssetGraftPoint:(id)a3;
- (void)setSecureMobileAssetIsGrafted:(BOOL)a3;
- (void)setSecureMobileAssetIsPersonalized:(BOOL)a3;
- (void)setSecureMobileAssetIsPrePersonalized:(BOOL)a3;
- (void)setStageGroup:(unint64_t)a3;
- (void)setTargetOS:(id)a3;
- (void)setTotalClientCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetSummary

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14
{
  id v21 = a3;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MAAutoAssetSummary;
  v23 = -[MAAutoAssetSummary init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_assetSelector, a3);
    v24->_assetRepresentation = a4;
    v24->_assetWasPatched = a5;
    v24->_assetIsStaged = a6;
    objc_storeStrong((id *)&v24->_jobStatus, a7);
    v24->_scheduledIntervalSecs = a8;
    v24->_scheduledRemainingSecs = a9;
    v24->_pushDelaySecs = a10;
    v24->_activeClientCount = a11;
    v24->_activeMonitorCount = a12;
    v24->_maximumClientCount = a13;
    v24->_totalClientCount = a14;
  }

  return v24;
}

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14 withIsSecureMobileAsset:(BOOL)a15 withPersonalizationStatus:(BOOL)a16 withPrePersonalizationStatus:(BOOL)a17 withGraftStatus:(BOOL)a18 withGraftPoint:(id)a19 withStageGroupType:(unint64_t)a20 withTargetOS:(id)a21
{
  id v25 = a3;
  id v26 = a7;
  id v27 = a19;
  id v28 = a21;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MAAutoAssetSummary;
  v29 = -[MAAutoAssetSummary init](&v35, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_assetSelector, a3);
    v30->_assetRepresentation = a4;
    v30->_assetWasPatched = a5;
    v30->_assetIsStaged = a6;
    objc_storeStrong((id *)&v30->_jobStatus, a7);
    v30->_scheduledIntervalSecs = a8;
    v30->_scheduledRemainingSecs = a9;
    v30->_pushDelaySecs = a10;
    v30->_activeClientCount = a11;
    v30->_activeMonitorCount = a12;
    v30->_maximumClientCount = a13;
    v30->_totalClientCount = a14;
    v30->_assetIsSecureMobileAsset = a15;
    v30->_secureMobileAssetIsPersonalized = a16;
    v30->_secureMobileAssetIsPrePersonalized = a17;
    v30->_secureMobileAssetIsGrafted = a18;
    objc_storeStrong((id *)&v30->_secureMobileAssetGraftPoint, a19);
    v30->_stageGroup = a20;
    objc_storeStrong((id *)&v30->_targetOS, a21);
  }

  return v30;
}

- (MAAutoAssetSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAAutoAssetSummary;
  v5 = -[MAAutoAssetSummary init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetRepresentation = [v4 decodeInt64ForKey:@"assetRepresentation"];
    v5->_assetWasPatched = [v4 decodeBoolForKey:@"assetWasPatched"];
    v5->_assetIsStaged = [v4 decodeBoolForKey:@"assetIsStaged"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jobStatus"];
    jobStatus = v5->_jobStatus;
    v5->_jobStatus = (MAAutoAssetStatus *)v8;

    v5->_scheduledIntervalSecs = [v4 decodeIntegerForKey:@"scheduledIntervalSecs"];
    v5->_scheduledRemainingSecs = [v4 decodeIntegerForKey:@"scheduledRemainingSecs"];
    v5->_pushDelaySecs = [v4 decodeIntegerForKey:@"pushDelaySecs"];
    v5->_activeClientCount = [v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = [v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = [v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = [v4 decodeIntegerForKey:@"totalClientCount"];
    v5->_assetIsSecureMobileAsset = [v4 decodeBoolForKey:@"assetIsSecureMobileAsset"];
    v5->_secureMobileAssetIsPersonalized = [v4 decodeBoolForKey:@"secureMobileAssetIsPersonalized"];
    v5->_secureMobileAssetIsPrePersonalized = [v4 decodeBoolForKey:@"secureMobileAssetIsPrePersonalized"];
    v5->_secureMobileAssetIsGrafted = [v4 decodeBoolForKey:@"secureMobileAssetIsGrafted"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureMobileAssetGraftPoint"];
    secureMobileAssetGraftPoint = v5->_secureMobileAssetGraftPoint;
    v5->_secureMobileAssetGraftPoint = (NSString *)v10;

    v5->_stageGroup = [v4 decodeIntegerForKey:@"stageGroup"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetOSKey"];
    targetOS = v5->_targetOS;
    v5->_targetOS = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  [v4 encodeObject:v5 forKey:@"assetSelector"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary assetRepresentation](self, "assetRepresentation"),  @"assetRepresentation");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"),  @"assetWasPatched");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"),  @"assetIsStaged");
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"jobStatus"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"),  @"scheduledIntervalSecs");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"),  @"pushDelaySecs");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"),  @"scheduledRemainingSecs");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"),  @"activeClientCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"),  @"activeMonitorCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"),  @"maximumClientCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"),  @"totalClientCount");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary assetIsSecureMobileAsset](self, "assetIsSecureMobileAsset"),  @"assetIsSecureMobileAsset");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary secureMobileAssetIsPersonalized](self, "secureMobileAssetIsPersonalized"),  @"secureMobileAssetIsPersonalized");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary secureMobileAssetIsPrePersonalized](self, "secureMobileAssetIsPrePersonalized"),  @"secureMobileAssetIsPrePersonalized");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSummary secureMobileAssetIsGrafted](self, "secureMobileAssetIsGrafted"),  @"secureMobileAssetIsGrafted");
  v7 = -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
  [v4 encodeObject:v7 forKey:@"secureMobileAssetGraftPoint"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary stageGroup](self, "stageGroup"), @"stageGroup");
  -[MAAutoAssetSummary targetOS](self, "targetOS");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"targetOSKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)getStringsForSummaryProps:(id *)a3 isPersonalized:(id *)a4 isPrePersonalized:(id *)a5 isGrafted:(id *)a6 graftPoint:(id *)a7 stageGroup:(id *)a8 targetOS:(id *)a9
{
  if (a3) {
    BOOL v9 = a4 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v14 = v9 || a5 == 0LL || a6 == 0LL || a7 == 0LL || a8 == 0LL || a9 == 0LL;
  BOOL v15 = !v14;
  if (v14)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:].cold.1(v25);
    }
  }

  else
  {
    *a3 = @"N/A";
    *a4 = @"N/A";
    *a5 = @"N/A";
    *a6 = @"N/A";
    *a7 = @"N/A";
    *a8 = @"N/A";
    *a9 = @"N/A";
    if (-[MAAutoAssetSummary assetIsSecureMobileAsset](self, "assetIsSecureMobileAsset"))
    {
      *a3 = @"YES";
      if (-[MAAutoAssetSummary secureMobileAssetIsPersonalized](self, "secureMobileAssetIsPersonalized"))
      {
        *a4 = @"YES";
        if (-[MAAutoAssetSummary secureMobileAssetIsGrafted](self, "secureMobileAssetIsGrafted"))
        {
          *a6 = @"YES";
          v23 = -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
          if (v23)
          {
            -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            *a7 = @"Unknown(error)";
          }
        }

        else
        {
          *a6 = @"NO";
        }
      }

      else
      {
        *a4 = @"NO";
      }

      if (-[MAAutoAssetSummary secureMobileAssetIsPrePersonalized](self, "secureMobileAssetIsPrePersonalized")) {
        *a5 = @"YES";
      }
    }

    else
    {
      *a3 = @"NO";
    }

    if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    {
      if (-[MAAutoAssetSummary stageGroup](self, "stageGroup") == 1)
      {
        id v26 = @"REQUIRED";
      }

      else
      {
        unint64_t v27 = -[MAAutoAssetSummary stageGroup](self, "stageGroup");
        id v26 = @"UNKNOWN";
        if (v27 == 2) {
          id v26 = @"OPTIONAL";
        }
      }

      *a8 = v26;
      -[MAAutoAssetSummary targetOS](self, "targetOS");
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        id v29 = -[MAAutoAssetSummary targetOS](self, "targetOS");
        *a9 = v29;
      }

      else
      {
        *a9 = @"Unknown";
      }
    }
  }

  return v15;
}

- (id)description
{
  v3 = @"N";
  v54 = @"N/A";
  v55[0] = @"N";
  v52 = @"N/A";
  v53 = @"N/A";
  v50 = @"N/A";
  v51 = @"N/A";
  v49 = @"N/A";
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:]( self,  "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:",  v55,  &v54,  &v53,  &v52,  &v51,  &v50,  &v49);
  v45 = (__CFString *)v55[0];
  v44 = v54;
  v43 = v53;
  v42 = v52;
  v41 = v51;
  v48 = v50;
  v47 = v49;
  v38 = (void *)NSString;
  v40 = -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  uint64_t v39 = [v40 summary];
  v46 = -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v37 = v4;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    v3 = @"Y";
  }
  int64_t v5 = -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs");
  int64_t v6 = -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs");
  int64_t v7 = -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs");
  int64_t v8 = -[MAAutoAssetSummary activeClientCount](self, "activeClientCount");
  int64_t v9 = -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount");
  int64_t v10 = -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount");
  int64_t v11 = -[MAAutoAssetSummary totalClientCount](self, "totalClientCount");
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    uint64_t v14 = [v13 description];
    BOOL v15 = v3;
    v16 = (void *)v14;
    int64_t v35 = v11;
    int64_t v31 = v9;
    int64_t v33 = v10;
    int64_t v27 = v7;
    int64_t v29 = v8;
    int64_t v25 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    id v21 = v45;
    id v22 = (void *)v39;
    [v38 stringWithFormat:@">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]", v39, v46, v37, v15, v45, v44, v43, v42, v41, v5, v25, v27, v29, v31, v33, v35, v48, v47, v14];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v36 = v11;
    int64_t v32 = v9;
    int64_t v34 = v10;
    int64_t v28 = v7;
    int64_t v30 = v8;
    int64_t v26 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    id v21 = v45;
    id v22 = (void *)v39;
    [v38 stringWithFormat:@">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]", v39, v46, v37, v3, v45, v44, v43, v42, v41, v5, v26, v28, v30, v32, v34, v36, v48, v47, @"                       jobStatus: N\n"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 summary];
  int64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  int64_t v26 = v4;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    int64_t v5 = @"Y";
  }
  else {
    int64_t v5 = @"N";
  }
  id v21 = v5;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 summary];
    int64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v25 = @"NONE";
  }

  v24 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v23 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  id v22 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v20 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v19 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v17 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v16 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  int64_t v34 = @"N/A";
  v35[0] = @"N";
  int64_t v32 = @"N/A";
  int64_t v33 = @"N/A";
  int64_t v30 = @"N/A";
  int64_t v31 = @"N/A";
  int64_t v29 = @"N/A";
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:]( self,  "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:",  v35,  &v34,  &v33,  &v32,  &v31,  &v30,  &v29);
  int64_t v8 = (__CFString *)v35[0];
  int64_t v9 = v34;
  int64_t v10 = v33;
  int64_t v11 = v32;
  uint64_t v12 = v31;
  v13 = v30;
  uint64_t v14 = v29;
  [NSString stringWithFormat:@"asset(%@)[%@]|patched:%@|staged:%@|secureMobileAsset:%@|personalized:%@|prePersonalized:%@|grafted:%@|graftPoint:%@|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@|stageGroup:%@|targetOSVersion:%@", v28, v27, v26, v21, v8, v9, v10, v11, v12, v25, v24, v23, v22, v20, v19, v17, v16, v13, v14];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  int64_t v32 = @"NO";
  int64_t v33 = @"NO";
  int64_t v30 = @"NO";
  int64_t v31 = @"NO";
  int64_t v28 = @"N/A";
  int64_t v29 = @"N/A";
  int64_t v27 = @"N/A";
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:]( self,  "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:",  &v33,  &v32,  &v31,  &v30,  &v29,  &v28,  &v27);
  id v4 = v33;
  int64_t v5 = v32;
  int64_t v6 = v31;
  int64_t v7 = v30;
  int64_t v8 = v29;
  int64_t v26 = v28;
  int64_t v25 = v27;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v10 = (void *)[v9 newSummaryDictionary];
  [v3 setSafeObject:v10 forKey:@"assetSelector"];

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v11 forKey:@"assetRepresentation"];

  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  [v3 setSafeObject:v12 forKey:@"assetWasPatched"];
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 setSafeObject:v13 forKey:@"assetIsStaged"];
  [v3 setSafeObject:v4 forKey:@"assetIsSecureMobileAsset"];
  [v3 setSafeObject:v5 forKey:@"secureMobileAssetIsPersonalized"];
  [v3 setSafeObject:v6 forKey:@"secureMobileAssetIsPrePersonalized"];
  [v3 setSafeObject:v7 forKey:@"secureMobileAssetIsGrafted"];
  [v3 setSafeObject:v8 forKey:@"secureMobileAssetGraftPoint"];
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)[v15 newSummaryDictionary];
    [v3 setSafeObject:v16 forKey:@"jobStatus"];
  }

  else
  {
    id v15 = objc_alloc_init(MEMORY[0x189603F68]);
    [v3 setSafeObject:v15 forKey:@"jobStatus"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v17 forKey:@"scheduledIntervalSecs"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v18 forKey:@"scheduledRemainingSecs"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v19 forKey:@"pushDelaySecs"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v20 forKey:@"activeClientCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v21 forKey:@"activeMonitorCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v22 forKey:@"maximumClientCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v23 forKey:@"totalClientCount"];

  [v3 setSafeObject:v26 forKey:@"stageGroup"];
  [v3 setSafeObject:v25 forKey:@"targetOSKey"];

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v4 = a3;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 summary];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    int64_t v7 = @"Y";
  }
  else {
    int64_t v7 = @"N";
  }
  v86 = v7;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    int64_t v8 = @"Y";
  }
  else {
    int64_t v8 = @"N";
  }
  v75 = v8;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 summary];
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v84 = @"NONE";
  }

  v83 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v82 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v81 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v80 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v79 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v78 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v77 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v92 = @"NO";
  v93[0] = @"NO";
  v90 = @"NO";
  v91 = @"NO";
  v88 = @"N/A";
  v89 = @"N/A";
  v87 = @"N/A";
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:]( self,  "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:",  v93,  &v92,  &v91,  &v90,  &v89,  &v88,  &v87);
  v76 = (__CFString *)v93[0];
  int64_t v11 = v92;
  uint64_t v12 = v91;
  v13 = v90;
  uint64_t v14 = v89;
  id v15 = v88;
  v16 = v87;
  v74 = v6;
  unint64_t v17 = [v6 length];
  [v4 safeStringForKey:@"assetSelector"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v19 = [v18 length];

  if (v17 > v19) {
    [v4 setSafeObject:v74 forKey:@"assetSelector"];
  }
  unint64_t v20 = [v85 length];
  [v4 safeStringForKey:@"assetRepresentation"];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v22 = [v21 length];

  if (v20 > v22) {
    [v4 setSafeObject:v85 forKey:@"assetRepresentation"];
  }
  unint64_t v23 = -[__CFString length](v86, "length");
  [v4 safeStringForKey:@"assetWasPatched"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v25 = [v24 length];

  if (v23 > v25) {
    [v4 setSafeObject:v86 forKey:@"assetWasPatched"];
  }
  unint64_t v26 = -[__CFString length](v75, "length");
  [v4 safeStringForKey:@"assetIsStaged"];
  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v28 = [v27 length];

  if (v26 > v28) {
    [v4 setSafeObject:v86 forKey:@"assetIsStaged"];
  }
  unint64_t v29 = -[__CFString length](v76, "length");
  [v4 safeStringForKey:@"assetIsSecureMobileAsset"];
  int64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = [v30 length];

  if (v29 > v31) {
    [v4 setSafeObject:v76 forKey:@"assetIsSecureMobileAsset"];
  }
  unint64_t v32 = -[__CFString length](v11, "length");
  [v4 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  int64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v34 = [v33 length];

  if (v32 > v34) {
    [v4 setSafeObject:v11 forKey:@"secureMobileAssetIsPersonalized"];
  }
  unint64_t v35 = -[__CFString length](v12, "length");
  [v4 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  int64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v37 = [v36 length];

  if (v35 > v37) {
    [v4 setSafeObject:v12 forKey:@"secureMobileAssetIsPrePersonalized"];
  }
  unint64_t v38 = -[__CFString length](v13, "length");
  [v4 safeStringForKey:@"secureMobileAssetIsGrafted"];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v40 = [v39 length];

  if (v38 > v40) {
    [v4 setSafeObject:v13 forKey:@"secureMobileAssetIsGrafted"];
  }
  unint64_t v41 = -[__CFString length](v14, "length");
  [v4 safeStringForKey:@"secureMobileAssetGraftPoint"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v43 = [v42 length];

  if (v41 > v43) {
    [v4 setSafeObject:v14 forKey:@"secureMobileAssetGraftPoint"];
  }
  unint64_t v44 = -[__CFString length](v84, "length");
  [v4 safeStringForKey:@"jobStatus"];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v46 = [v45 length];

  if (v44 > v46) {
    [v4 setSafeObject:v84 forKey:@"jobStatus"];
  }
  unint64_t v47 = [v83 length];
  [v4 safeStringForKey:@"scheduledIntervalSecs"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v49 = [v48 length];

  if (v47 > v49) {
    [v4 setSafeObject:v83 forKey:@"scheduledIntervalSecs"];
  }
  unint64_t v50 = [v82 length];
  [v4 safeStringForKey:@"scheduledRemainingSecs"];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v52 = [v51 length];

  if (v50 > v52) {
    [v4 setSafeObject:v82 forKey:@"scheduledRemainingSecs"];
  }
  unint64_t v53 = [v81 length];
  [v4 safeStringForKey:@"pushDelaySecs"];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v55 = [v54 length];

  if (v53 > v55) {
    [v4 setSafeObject:v81 forKey:@"pushDelaySecs"];
  }
  unint64_t v56 = [v80 length];
  [v4 safeStringForKey:@"activeClientCount"];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v58 = [v57 length];

  if (v56 > v58) {
    [v4 setSafeObject:v80 forKey:@"activeClientCount"];
  }
  unint64_t v59 = [v79 length];
  [v4 safeStringForKey:@"activeMonitorCount"];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v61 = [v60 length];

  if (v59 > v61) {
    [v4 setSafeObject:v79 forKey:@"activeMonitorCount"];
  }
  unint64_t v62 = [v78 length];
  [v4 safeStringForKey:@"maximumClientCount"];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v64 = [v63 length];

  if (v62 > v64) {
    [v4 setSafeObject:v78 forKey:@"maximumClientCount"];
  }
  unint64_t v65 = [v77 length];
  [v4 safeStringForKey:@"totalClientCount"];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v67 = [v66 length];

  if (v65 > v67) {
    [v4 setSafeObject:v77 forKey:@"totalClientCount"];
  }
  unint64_t v68 = -[__CFString length](v15, "length");
  [v4 safeStringForKey:@"stageGroup"];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v70 = [v69 length];

  if (v68 < v70) {
    [v4 setSafeObject:v15 forKey:@"stageGroup"];
  }
  unint64_t v71 = -[__CFString length](v16, "length");
  [v4 safeStringForKey:@"targetOSKey"];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v73 = [v72 length];

  if (v71 < v73) {
    [v4 setSafeObject:v16 forKey:@"targetOSKey"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 summary];
  v60 = -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    int64_t v7 = @"Y";
  }
  else {
    int64_t v7 = @"N";
  }
  unint64_t v61 = v7;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    int64_t v8 = @"Y";
  }
  else {
    int64_t v8 = @"N";
  }
  v69 = v8;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 summary];
    unint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v70 = @"NONE";
  }

  v63 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  unint64_t v68 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  unint64_t v67 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v66 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  unint64_t v65 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  unint64_t v64 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  unint64_t v62 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v76 = @"NO";
  v77[0] = @"NO";
  v74 = @"NO";
  v75 = @"NO";
  v72 = @"N/A";
  unint64_t v73 = @"N/A";
  unint64_t v71 = @"N/A";
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:]( self,  "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:",  v77,  &v76,  &v75,  &v74,  &v73,  &v72,  &v71);
  unint64_t v46 = (__CFString *)v77[0];
  unint64_t v44 = v76;
  v42 = v75;
  unint64_t v40 = v74;
  unint64_t v38 = v73;
  unint64_t v59 = v72;
  unint64_t v34 = v71;
  id v36 = (id)NSString;
  [v4 safeStringForKey:@"assetSelector"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v32 = (void *)v6;
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v6,  v48,  @" ",  0LL);
  unint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"assetRepresentation"];
  unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v60,  v47,  @" ",  0LL);
  [v4 safeStringForKey:@"assetWasPatched"];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v61,  v45,  @" ",  0LL);
  unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"assetIsStaged"];
  unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v69,  v43,  @" ",  0LL);
  unint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v46,  v41,  @" ",  0LL);
  [v4 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v44,  v39,  @" ",  0LL);
  unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v42,  v35,  @" ",  0LL);
  unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"secureMobileAssetIsGrafted"];
  int64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v40,  v33,  @" ",  0LL);
  unint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v31,  @" ",  0LL);
  [v4 safeStringForKey:@"jobStatus"];
  int64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v70,  v30,  @" ",  0LL);
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"scheduledIntervalSecs"];
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v63,  v29,  @" ",  1LL);
  [v4 safeStringForKey:@"scheduledRemainingSecs"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v68,  v28,  @" ",  1LL);
  unint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"pushDelaySecs"];
  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v67,  v27,  @" ",  1LL);
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeClientCount"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v66,  v25,  @" ",  1LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeMonitorCount"];
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v65,  v23,  @" ",  1LL);
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"maximumClientCount"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v64,  v22,  @" ",  1LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"totalClientCount"];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v62,  v20,  @" ",  1LL);
  [v4 safeStringForKey:@"stageGroup"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v59,  v14,  @" ",  1LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"targetOSKey"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v34,  v16,  @" ",  1LL);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v36 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v58, v57, v56, v55, v54, v53, v52, v50, v51, v26, v24, v49, v19, v21, v11, v12, v13, v15, v17];
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)assetRepresentationName
{
  return +[MAAutoAssetSummary assetRepresentationName:]( &OBJC_CLASS___MAAutoAssetSummary,  "assetRepresentationName:",  -[MAAutoAssetSummary assetRepresentation](self, "assetRepresentation"));
}

+ (id)assetRepresentationName:(int64_t)a3
{
  id v3 = @"UNKNOWN";
  if (a3 > 400)
  {
    switch(a3)
    {
      case 600LL:
        id result = @"CandidateForStaging";
        break;
      case 601LL:
        id result = @"AvailableForStaging";
        break;
      case 602LL:
        id result = @"BeingStaged";
        break;
      case 603LL:
        id result = @"Staged";
        break;
      default:
        if (a3 == 500) {
          id v3 = @"VersionDownloaded";
        }
        if (a3 == 401) {
          id result = @"ScheduledPushed";
        }
        else {
          id result = v3;
        }
        break;
    }
  }

  else
  {
    id v4 = @"AwaitingUnlock";
    int64_t v5 = @"Active";
    uint64_t v6 = @"Scheduled";
    if (a3 != 400) {
      uint64_t v6 = @"UNKNOWN";
    }
    if (a3 != 300) {
      int64_t v5 = v6;
    }
    if (a3 != 201) {
      id v4 = v5;
    }
    if (a3 == 200) {
      id v3 = @"AwaitingSync";
    }
    if (a3 == 100) {
      id v3 = @"Monitor";
    }
    if (!a3) {
      id v3 = @"None";
    }
    if (a3 <= 200) {
      return v3;
    }
    else {
      return (id)v4;
    }
  }

  return result;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:@"assetSelector" forKey:@"assetSelector"];
  [v2 setSafeObject:@"assetRepresentation" forKey:@"assetRepresentation"];
  [v2 setSafeObject:@"assetWasPatched" forKey:@"assetWasPatched"];
  [v2 setSafeObject:@"assetIsStaged" forKey:@"assetIsStaged"];
  [v2 setSafeObject:@"assetIsSecureMobileAsset" forKey:@"assetIsSecureMobileAsset"];
  [v2 setSafeObject:@"secureMobileAssetIsPersonalized" forKey:@"secureMobileAssetIsPersonalized"];
  [v2 setSafeObject:@"secureMobileAssetIsPrePersonalized" forKey:@"secureMobileAssetIsPrePersonalized"];
  [v2 setSafeObject:@"secureMobileAssetIsGrafted" forKey:@"secureMobileAssetIsGrafted"];
  [v2 setSafeObject:@"secureMobileAssetGraftPoint" forKey:@"secureMobileAssetGraftPoint"];
  [v2 setSafeObject:@"jobStatus" forKey:@"jobStatus"];
  [v2 setSafeObject:@"scheduledIntervalSecs" forKey:@"scheduledIntervalSecs"];
  [v2 setSafeObject:@"scheduledRemainingSecs" forKey:@"scheduledRemainingSecs"];
  [v2 setSafeObject:@"activeClientCount" forKey:@"activeClientCount"];
  [v2 setSafeObject:@"activeMonitorCount" forKey:@"activeMonitorCount"];
  [v2 setSafeObject:@"maximumClientCount" forKey:@"maximumClientCount"];
  [v2 setSafeObject:@"totalClientCount" forKey:@"totalClientCount"];
  [v2 setSafeObject:@"stageGroup" forKey:@"stageGroup"];
  [v2 setSafeObject:@"targetOSKey" forKey:@"targetOSKey"];
  return v2;
}

+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  uint64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    [NSString string];
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    id v19 = objc_alloc(NSString);
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    uint64_t v14 = (void *)v20;
  }

  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  unint64_t v26 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"assetSelector"];
  int64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSelector",  v33,  @" ",  0LL);
  [v3 safeStringForKey:@"assetRepresentation"];
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetRepresentation",  v32,  @" ",  0LL);
  unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetWasPatched"];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetWasPatched",  v31,  @" ",  0LL);
  unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetIsStaged"];
  int64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetIsStaged",  v30,  @" ",  0LL);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetIsSecureMobileAsset",  v29,  @" ",  0LL);
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"secureMobileAssetIsPersonalized",  v28,  @" ",  0LL);
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"secureMobileAssetIsPrePersonalized",  v25,  @" ",  0LL);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsGrafted"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"secureMobileAssetIsGrafted",  v24,  @" ",  0LL);
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"secureMobileAssetGraftPoint",  v23,  @" ",  0LL);
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"jobStatus"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"jobStatus",  v22,  @" ",  0LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"scheduledIntervalSecs"];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledIntervalSecs",  v21,  @" ",  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"scheduledRemainingSecs"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledRemainingSecs",  v20,  @" ",  0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeClientCount"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeClientCount",  v19,  @" ",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeMonitorCount"];
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeMonitorCount",  v17,  @" ",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumClientCount"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumClientCount",  v15,  @" ",  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalClientCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalClientCount",  v12,  @" ",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"stageGroup"];
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"stageGroup",  v5,  @" ",  0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"targetOSKey"];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"targetOSKey",  v7,  @" ",  0LL);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v42, v41, v40, v39, v38, v37, v36, v35, v34, v18, v16, v14, v13, v11, v10, v4, v6, v8];
  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)summaryPaddedBanner:(id)a3
{
  unint64_t v25 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"assetSelector"];
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v32,  @"=",  0LL);
  [v3 safeStringForKey:@"assetRepresentation"];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v31,  @"=",  0LL);
  unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetWasPatched"];
  int64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v30,  @"=",  0LL);
  unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetIsStaged"];
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v29,  @"=",  0LL);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetIsSecureMobileAsset"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v28,  @"=",  0LL);
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsPersonalized"];
  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v27,  @"=",  0LL);
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsPrePersonalized"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v24,  @"=",  0LL);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetIsGrafted"];
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v23,  @"=",  0LL);
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"secureMobileAssetGraftPoint"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v22,  @"=",  0LL);
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"jobStatus"];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v21,  @"=",  0LL);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"scheduledIntervalSecs"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v20,  @"=",  0LL);
  int64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"scheduledRemainingSecs"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v19,  @"=",  0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeClientCount"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v18,  @"=",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeMonitorCount"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v16,  @"=",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumClientCount"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v15,  @"=",  0LL);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalClientCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v12,  @"=",  0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"stageGroup"];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v7,  @"=",  0LL);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"targetOSKey"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v9,  @"=",  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v42, v41, v40, v39, v38, v37, v36, v35, v34, v17, v33, v14, v13, v4, v5, v6, v8, v10];
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (int64_t)assetRepresentation
{
  return self->_assetRepresentation;
}

- (void)setAssetRepresentation:(int64_t)a3
{
  self->_assetRepresentation = a3;
}

- (BOOL)assetWasPatched
{
  return self->_assetWasPatched;
}

- (void)setAssetWasPatched:(BOOL)a3
{
  self->_assetWasPatched = a3;
}

- (BOOL)assetIsStaged
{
  return self->_assetIsStaged;
}

- (void)setAssetIsStaged:(BOOL)a3
{
  self->_assetIsStaged = a3;
}

- (BOOL)assetIsSecureMobileAsset
{
  return self->_assetIsSecureMobileAsset;
}

- (void)setAssetIsSecureMobileAsset:(BOOL)a3
{
  self->_assetIsSecureMobileAsset = a3;
}

- (BOOL)secureMobileAssetIsPersonalized
{
  return self->_secureMobileAssetIsPersonalized;
}

- (void)setSecureMobileAssetIsPersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPersonalized = a3;
}

- (BOOL)secureMobileAssetIsPrePersonalized
{
  return self->_secureMobileAssetIsPrePersonalized;
}

- (void)setSecureMobileAssetIsPrePersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPrePersonalized = a3;
}

- (BOOL)secureMobileAssetIsGrafted
{
  return self->_secureMobileAssetIsGrafted;
}

- (void)setSecureMobileAssetIsGrafted:(BOOL)a3
{
  self->_secureMobileAssetIsGrafted = a3;
}

- (NSString)secureMobileAssetGraftPoint
{
  return self->_secureMobileAssetGraftPoint;
}

- (void)setSecureMobileAssetGraftPoint:(id)a3
{
}

- (MAAutoAssetStatus)jobStatus
{
  return self->_jobStatus;
}

- (void)setJobStatus:(id)a3
{
}

- (int64_t)scheduledIntervalSecs
{
  return self->_scheduledIntervalSecs;
}

- (void)setScheduledIntervalSecs:(int64_t)a3
{
  self->_scheduledIntervalSecs = a3;
}

- (int64_t)scheduledRemainingSecs
{
  return self->_scheduledRemainingSecs;
}

- (void)setScheduledRemainingSecs:(int64_t)a3
{
  self->_scheduledRemainingSecs = a3;
}

- (int64_t)pushDelaySecs
{
  return self->_pushDelaySecs;
}

- (void)setPushDelaySecs:(int64_t)a3
{
  self->_pushDelaySecs = a3;
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (unint64_t)stageGroup
{
  return self->_stageGroup;
}

- (void)setStageGroup:(unint64_t)a3
{
  self->_stageGroup = a3;
}

- (NSString)targetOS
{
  return self->_targetOS;
}

- (void)setTargetOS:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getStringsForSummaryProps:(os_log_t)log isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:.cold.1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_18718F000,  log,  OS_LOG_TYPE_ERROR,  "Invalid arguments passed to getStringsForSummaryProps",  v1,  2u);
}

@end