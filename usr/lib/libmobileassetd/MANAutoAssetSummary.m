@interface MANAutoAssetSummary
+ (BOOL)supportsSecureCoding;
+ (id)assetRepresentationName:(int64_t)a3;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (BOOL)assetIsStaged;
- (BOOL)assetWasPatched;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetStatus)jobStatus;
- (MANAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14;
- (MANAutoAssetSummary)initWithCoder:(id)a3;
- (id)assetRepresentationName;
- (id)description;
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
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetIsStaged:(BOOL)a3;
- (void)setAssetRepresentation:(int64_t)a3;
- (void)setAssetSelector:(id)a3;
- (void)setAssetWasPatched:(BOOL)a3;
- (void)setJobStatus:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setScheduledIntervalSecs:(int64_t)a3;
- (void)setScheduledRemainingSecs:(int64_t)a3;
- (void)setTotalClientCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MANAutoAssetSummary

- (MANAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14
{
  id v21 = a3;
  id v22 = a7;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MANAutoAssetSummary;
  v23 = -[MANAutoAssetSummary init](&v30, "init");
  if (v23)
  {
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus);
    if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
    {
      BOOL v28 = a6;
      int64_t v29 = a8;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MANAutoAssetSummary initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:].cold.1(v26);
      }

      a8 = v29;
      a6 = v28;
    }

    objc_storeStrong((id *)&v23->_assetSelector, a3);
    v23->_assetRepresentation = a4;
    v23->_assetWasPatched = a5;
    v23->_assetIsStaged = a6;
    objc_storeStrong((id *)&v23->_jobStatus, a7);
    v23->_scheduledIntervalSecs = a8;
    v23->_scheduledRemainingSecs = a9;
    v23->_pushDelaySecs = a10;
    v23->_activeClientCount = a11;
    v23->_activeMonitorCount = a12;
    v23->_maximumClientCount = a13;
    v23->_totalClientCount = a14;
  }

  return v23;
}

- (MANAutoAssetSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MANAutoAssetSummary;
  v5 = -[MANAutoAssetSummary init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v7;

    v5->_assetRepresentation = (int64_t)[v4 decodeInt64ForKey:@"assetRepresentation"];
    v5->_assetWasPatched = [v4 decodeBoolForKey:@"assetWasPatched"];
    v5->_assetIsStaged = [v4 decodeBoolForKey:@"assetIsStaged"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetStatus) forKey:@"jobStatus"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    jobStatus = v5->_jobStatus;
    v5->_jobStatus = (MAAutoAssetStatus *)v10;

    v5->_scheduledIntervalSecs = (int64_t)[v4 decodeIntegerForKey:@"scheduledIntervalSecs"];
    v5->_scheduledRemainingSecs = (int64_t)[v4 decodeIntegerForKey:@"scheduledRemainingSecs"];
    v5->_pushDelaySecs = (int64_t)[v4 decodeIntegerForKey:@"pushDelaySecs"];
    v5->_activeClientCount = (int64_t)[v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = (int64_t)[v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = (int64_t)[v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = (int64_t)[v4 decodeIntegerForKey:@"totalClientCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetSelector](self, "assetSelector"));
  [v6 encodeObject:v4 forKey:@"assetSelector"];

  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary assetRepresentation](self, "assetRepresentation"),  @"assetRepresentation");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetSummary assetWasPatched](self, "assetWasPatched"),  @"assetWasPatched");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetSummary assetIsStaged](self, "assetIsStaged"),  @"assetIsStaged");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
  [v6 encodeObject:v5 forKey:@"jobStatus"];

  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"),  @"scheduledIntervalSecs");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"),  @"pushDelaySecs");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"),  @"scheduledRemainingSecs");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary activeClientCount](self, "activeClientCount"),  @"activeClientCount");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"),  @"activeMonitorCount");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary maximumClientCount](self, "maximumClientCount"),  @"maximumClientCount");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSummary totalClientCount](self, "totalClientCount"),  @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetSelector](self, "assetSelector"));
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v3 summary]);
  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetRepresentationName](self, "assetRepresentationName"));
  if (-[MANAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v26 = v4;
  if (-[MANAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  v25 = v5;
  int64_t v24 = -[MANAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs");
  int64_t v6 = -[MANAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs");
  int64_t v7 = -[MANAutoAssetSummary pushDelaySecs](self, "pushDelaySecs");
  int64_t v8 = -[MANAutoAssetSummary activeClientCount](self, "activeClientCount");
  int64_t v9 = -[MANAutoAssetSummary activeMonitorCount](self, "activeMonitorCount");
  int64_t v10 = -[MANAutoAssetSummary maximumClientCount](self, "maximumClientCount");
  int64_t v11 = -[MANAutoAssetSummary totalClientCount](self, "totalClientCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
  if (v12)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
    v14 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
    int64_t v22 = v11;
    int64_t v20 = v9;
    v16 = (void *)v27;
    v17 = (void *)v28;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]",  v28,  v27,  v26,  v25,  v24,  v6,  v7,  v8,  v20,  v10,  v22,  v15));

    v3 = v14;
  }

  else
  {
    int64_t v23 = v11;
    int64_t v21 = v9;
    v16 = (void *)v27;
    v17 = (void *)v28;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]",  v28,  v27,  v26,  v25,  v24,  v6,  v7,  v8,  v21,  v10,  v23,  @"                       jobStatus: N\n"));
  }

  return v18;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetSelector](self, "assetSelector"));
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetRepresentationName](self, "assetRepresentationName"));
  if (-[MANAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v18 = v4;
  if (-[MANAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  v17 = v5;
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
  if (v6)
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
    int64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
  }

  else
  {
    int64_t v21 = @"NONE";
  }

  v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  int64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeClientCount](self, "activeClientCount"));
  int64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  int64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary totalClientCount](self, "totalClientCount"));
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"asset(%@)[%@]|patched:%@|staged:%@|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@",  v20,  v19,  v18,  v17,  v21,  v14,  v16,  v8,  v9,  v10,  v11,  v12));

  return v15;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v57 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetSelector](self, "assetSelector"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetRepresentationName](self, "assetRepresentationName"));
  if (-[MANAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  v56 = v5;
  if (-[MANAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    int64_t v6 = @"Y";
  }
  else {
    int64_t v6 = @"N";
  }
  v52 = v6;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 summary]);
  }

  else
  {
    v53 = @"NONE";
  }

  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  int64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  int64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeClientCount](self, "activeClientCount"));
  objc_super v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary totalClientCount](self, "totalClientCount"));
  id v16 = [v55 length];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"assetSelector"]);
  id v18 = [v17 length];

  if (v16 > v18) {
    [v57 setSafeObject:v55 forKey:@"assetSelector"];
  }
  id v19 = [v54 length];
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"assetRepresentation"]);
  id v21 = [v20 length];

  if (v19 > v21) {
    [v57 setSafeObject:v54 forKey:@"assetRepresentation"];
  }
  id v22 = -[__CFString length](v56, "length");
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"assetWasPatched"]);
  id v24 = [v23 length];

  if (v22 > v24) {
    [v57 setSafeObject:v56 forKey:@"assetWasPatched"];
  }
  id v25 = -[__CFString length](v52, "length");
  v26 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"assetIsStaged"]);
  id v27 = [v26 length];

  if (v25 > v27) {
    [v57 setSafeObject:v56 forKey:@"assetIsStaged"];
  }
  id v28 = -[__CFString length](v53, "length");
  int64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"jobStatus"]);
  id v30 = [v29 length];

  if (v28 > v30) {
    [v57 setSafeObject:v53 forKey:@"jobStatus"];
  }
  id v31 = -[NSString length](v9, "length");
  v32 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"scheduledIntervalSecs"]);
  id v33 = [v32 length];

  if (v31 > v33) {
    [v57 setSafeObject:v9 forKey:@"scheduledIntervalSecs"];
  }
  id v34 = -[NSString length](v10, "length");
  v35 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"scheduledRemainingSecs"]);
  id v36 = [v35 length];

  if (v34 > v36) {
    [v57 setSafeObject:v10 forKey:@"scheduledRemainingSecs"];
  }
  id v37 = -[NSString length](v11, "length");
  v38 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"pushDelaySecs"]);
  id v39 = [v38 length];

  if (v37 > v39) {
    [v57 setSafeObject:v11 forKey:@"pushDelaySecs"];
  }
  id v40 = -[NSString length](v12, "length");
  v41 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"activeClientCount"]);
  id v42 = [v41 length];

  if (v40 > v42) {
    [v57 setSafeObject:v12 forKey:@"activeClientCount"];
  }
  id v43 = -[NSString length](v13, "length");
  v44 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"activeMonitorCount"]);
  id v45 = [v44 length];

  if (v43 > v45) {
    [v57 setSafeObject:v13 forKey:@"activeMonitorCount"];
  }
  id v46 = -[NSString length](v14, "length");
  v47 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"maximumClientCount"]);
  id v48 = [v47 length];

  if (v46 > v48) {
    [v57 setSafeObject:v14 forKey:@"maximumClientCount"];
  }
  id v49 = -[NSString length](v15, "length");
  v50 = (void *)objc_claimAutoreleasedReturnValue([v57 safeStringForKey:@"totalClientCount"]);
  id v51 = [v50 length];

  if (v49 > v51) {
    [v57 setSafeObject:v15 forKey:@"totalClientCount"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetSelector](self, "assetSelector"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 summary]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary assetRepresentationName](self, "assetRepresentationName"));
  if (-[MANAutoAssetSummary assetWasPatched](self, "assetWasPatched")) {
    int64_t v8 = @"Y";
  }
  else {
    int64_t v8 = @"N";
  }
  id v48 = v8;
  if (-[MANAutoAssetSummary assetIsStaged](self, "assetIsStaged")) {
    int64_t v9 = @"Y";
  }
  else {
    int64_t v9 = @"N";
  }
  id v34 = v9;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
  if (v10)
  {
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSummary jobStatus](self, "jobStatus"));
    id v49 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
  }

  else
  {
    id v49 = @"NONE";
  }

  id v36 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v32 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v47 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  id v46 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeClientCount](self, "activeClientCount"));
  id v45 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v44 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  id v43 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSummary totalClientCount](self, "totalClientCount"));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetSelector"]);
  id v30 = (void *)v6;
  id v42 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v6,  v39,  @" ",  0LL));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetRepresentation"]);
  int64_t v29 = (void *)v7;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v7,  v38,  @" ",  0LL));
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetWasPatched"]);
  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v48,  v37,  @" ",  0LL));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetIsStaged"]);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v34,  v33,  @" ",  0LL));

  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"jobStatus"]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v49,  v35,  @" ",  0LL));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"scheduledIntervalSecs"]);
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v36,  v28,  @" ",  1LL));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"scheduledRemainingSecs"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v32,  v27,  @" ",  1LL));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"pushDelaySecs"]);
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v47,  v25,  @" ",  1LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"activeClientCount"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v46,  v22,  @" ",  1LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"activeMonitorCount"]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v45,  v21,  @" ",  1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"maximumClientCount"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v44,  v14,  @" ",  1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"totalClientCount"]);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v43,  v16,  @" ",  1LL));
  id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v42,  v41,  v40,  v26,  v24,  v23,  v19,  v20,  v12,  v13,  v15,  v17));

  return v31;
}

- (id)assetRepresentationName
{
  return +[MANAutoAssetSummary assetRepresentationName:]( &OBJC_CLASS___MANAutoAssetSummary,  "assetRepresentationName:",  -[MANAutoAssetSummary assetRepresentation](self, "assetRepresentation"));
}

+ (id)assetRepresentationName:(int64_t)a3
{
  v3 = @"UNKNOWN";
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
          v3 = @"VersionDownloaded";
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
    v5 = @"Active";
    uint64_t v6 = @"Scheduled";
    if (a3 != 400) {
      uint64_t v6 = @"UNKNOWN";
    }
    if (a3 != 300) {
      v5 = v6;
    }
    if (a3 != 201) {
      id v4 = v5;
    }
    if (a3 == 200) {
      v3 = @"AwaitingSync";
    }
    if (a3 == 100) {
      v3 = @"Monitor";
    }
    if (!a3) {
      v3 = @"None";
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
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetSelector",  @"assetSelector");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetRepresentation",  @"assetRepresentation");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetWasPatched",  @"assetWasPatched");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetIsStaged",  @"assetIsStaged");
  -[NSMutableDictionary setSafeObject:forKey:](v2, "setSafeObject:forKey:", @"jobStatus", @"jobStatus");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"scheduledIntervalSecs",  @"scheduledIntervalSecs");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"scheduledRemainingSecs",  @"scheduledRemainingSecs");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"activeClientCount",  @"activeClientCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"activeMonitorCount",  @"activeMonitorCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"maximumClientCount",  @"maximumClientCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"totalClientCount",  @"totalClientCount");
  return v2;
}

+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  id v13 = [v12 length];
  v14 = (NSString *)v12;
  if (v13 < [v10 length])
  {
    id v15 = [v10 length];
    int64_t v16 = v15 - (_BYTE *)[v12 length];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0]);

    id v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (v6) {
      int64_t v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v18, v12);
    }
    else {
      int64_t v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v12, v18);
    }
    v14 = v20;
  }

  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v3 = a3;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSelector"]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSelector",  v25,  @" ",  0LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetRepresentation"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetRepresentation",  v24,  @" ",  0LL));
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetWasPatched"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetWasPatched",  v23,  @" ",  0LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetIsStaged"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetIsStaged",  v21,  @" ",  0LL));
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"jobStatus"]);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"jobStatus",  v20,  @" ",  0LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledIntervalSecs"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledIntervalSecs",  v18,  @" ",  0LL));
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledRemainingSecs"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledRemainingSecs",  v16,  @" ",  0LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeClientCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeClientCount",  v14,  @" ",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeMonitorCount"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeMonitorCount",  v12,  @" ",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumClientCount"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumClientCount",  v6,  @" ",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalClientCount"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalClientCount",  v8,  @" ",  0LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v27,  v19,  v17,  v15,  v26,  v13,  v11,  v4,  v5,  v7,  v9));

  return v22;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v3 = a3;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSelector"]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v25,  @"=",  0LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetRepresentation"]);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v24,  @"=",  0LL));
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetWasPatched"]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v23,  @"=",  0LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetIsStaged"]);
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v21,  @"=",  0LL));
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"jobStatus"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v20,  @"=",  0LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledIntervalSecs"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v19,  @"=",  0LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledRemainingSecs"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v17,  @"=",  0LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeClientCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v15,  @"=",  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeMonitorCount"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v13,  @"=",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumClientCount"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v6,  @"=",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalClientCount"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v8,  @"=",  0LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v27,  v26,  v18,  v16,  v11,  v14,  v12,  v4,  v5,  v7,  v9));

  return v22;
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

- (void).cxx_destruct
{
}

- (void)initWithAssetSelector:(os_log_t)log withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:.cold.1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{MANAutoAssetSummary-initWithAssetSelector} WARNING: wrong class provided as jobStatus",  v1,  2u);
}

@end