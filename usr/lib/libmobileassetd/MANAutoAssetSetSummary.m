@interface MANAutoAssetSetSummary
+ (BOOL)supportsSecureCoding;
+ (id)assetSetRepresentationName:(int64_t)a3;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MANAutoAssetSetStatus)setJobStatus;
- (MANAutoAssetSetSummary)initWithCoder:(id)a3;
- (MANAutoAssetSetSummary)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetRepresentation:(int64_t)a5 withSetJobStatus:(id)a6 withScheduledIntervalSecs:(int64_t)a7 withScheduledRemainingSecs:(int64_t)a8 withPushDelaySecs:(int64_t)a9 withActiveClientCount:(int64_t)a10 withActiveMonitorCount:(int64_t)a11 withMaximumClientCount:(int64_t)a12 withTotalClientCount:(int64_t)a13;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)assetSetRepresentationName;
- (id)description;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)assetSetRepresentation;
- (int64_t)maximumClientCount;
- (int64_t)pushDelaySecs;
- (int64_t)scheduledIntervalSecs;
- (int64_t)scheduledRemainingSecs;
- (int64_t)totalClientCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAssetSetRepresentation:(int64_t)a3;
- (void)setClientDomainName:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setScheduledIntervalSecs:(int64_t)a3;
- (void)setScheduledRemainingSecs:(int64_t)a3;
- (void)setSetJobStatus:(id)a3;
- (void)setTotalClientCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MANAutoAssetSetSummary

- (MANAutoAssetSetSummary)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetRepresentation:(int64_t)a5 withSetJobStatus:(id)a6 withScheduledIntervalSecs:(int64_t)a7 withScheduledRemainingSecs:(int64_t)a8 withPushDelaySecs:(int64_t)a9 withActiveClientCount:(int64_t)a10 withActiveMonitorCount:(int64_t)a11 withMaximumClientCount:(int64_t)a12 withTotalClientCount:(int64_t)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetSummary;
  v23 = -[MANAutoAssetSetSummary init](&v26, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_clientDomainName, a3);
    objc_storeStrong((id *)&v24->_assetSetIdentifier, a4);
    v24->_assetSetRepresentation = a5;
    objc_storeStrong((id *)&v24->_setJobStatus, a6);
    v24->_scheduledIntervalSecs = a7;
    v24->_scheduledRemainingSecs = a8;
    v24->_pushDelaySecs = a9;
    v24->_activeClientCount = a10;
    v24->_activeMonitorCount = a11;
    v24->_maximumClientCount = a12;
    v24->_totalClientCount = a13;
  }

  return v24;
}

- (MANAutoAssetSetSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetSummary;
  v5 = -[MANAutoAssetSetSummary init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v10;

    v5->_assetSetRepresentation = (int64_t)[v4 decodeInt64ForKey:@"assetSetRepresentation"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetStatus) forKey:@"setJobStatus"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    setJobStatus = v5->_setJobStatus;
    v5->_setJobStatus = (MANAutoAssetSetStatus *)v13;

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
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary clientDomainName](self, "clientDomainName"));
  [v7 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier"));
  [v7 encodeObject:v5 forKey:@"assetSetIdentifier"];

  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary assetSetRepresentation](self, "assetSetRepresentation"),  @"assetSetRepresentation");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
  [v7 encodeObject:v6 forKey:@"setJobStatus"];

  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"),  @"scheduledIntervalSecs");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"),  @"pushDelaySecs");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"),  @"scheduledRemainingSecs");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary activeClientCount](self, "activeClientCount"),  @"activeClientCount");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"),  @"activeMonitorCount");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"),  @"maximumClientCount");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetSummary totalClientCount](self, "totalClientCount"),  @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary clientDomainName](self, "clientDomainName"));
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName"));
  int64_t v21 = -[MANAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs");
  int64_t v4 = -[MANAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs");
  int64_t v5 = -[MANAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs");
  int64_t v6 = -[MANAutoAssetSetSummary activeClientCount](self, "activeClientCount");
  int64_t v7 = -[MANAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount");
  int64_t v8 = -[MANAutoAssetSetSummary maximumClientCount](self, "maximumClientCount");
  int64_t v9 = -[MANAutoAssetSetSummary totalClientCount](self, "totalClientCount");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    int64_t v19 = v9;
    int64_t v17 = v7;
    uint64_t v13 = (void *)v22;
    v14 = (void *)v23;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]",  v23,  v22,  v3,  v21,  v4,  v5,  v6,  v17,  v8,  v19,  v12));
  }

  else
  {
    int64_t v20 = v9;
    int64_t v18 = v7;
    uint64_t v13 = (void *)v22;
    v14 = (void *)v23;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]",  v23,  v22,  v3,  v21,  v4,  v5,  v6,  v18,  v8,  v20,  @"                    setJobStatus: N\n"));
  }

  return v15;
}

- (id)summary
{
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary clientDomainName](self, "clientDomainName"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
  if (v3)
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 summary]);
  }

  else
  {
    v14 = @"NONE";
  }

  int64_t v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  int64_t v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  int64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clientDomain:%@|asset(%@)[%@]|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@",  v17,  v16,  v15,  v14,  v5,  v6,  v12,  v7,  v8,  v9,  v10));

  return v13;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v51 = a3;
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary clientDomainName](self, "clientDomainName"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
  if (v5)
  {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 summary]);
  }

  else
  {
    v48 = @"NONE";
  }

  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  int64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  v47 = v4;
  id v14 = [v4 length];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"assetSetIdentifier"]);
  id v16 = [v15 length];

  if (v14 > v16) {
    [v51 setSafeObject:v47 forKey:@"assetSetIdentifier"];
  }
  id v17 = [v50 length];
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"assetSetIdentifier"]);
  id v19 = [v18 length];

  if (v17 > v19) {
    [v51 setSafeObject:v50 forKey:@"assetSetIdentifier"];
  }
  id v20 = [v49 length];
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"assetSetRepresentation"]);
  id v22 = [v21 length];

  if (v20 > v22) {
    [v51 setSafeObject:v49 forKey:@"assetSetRepresentation"];
  }
  id v23 = -[__CFString length](v48, "length");
  v24 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"setJobStatus"]);
  id v25 = [v24 length];

  if (v23 > v25) {
    [v51 setSafeObject:v48 forKey:@"setJobStatus"];
  }
  id v26 = -[NSString length](v7, "length");
  v27 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"scheduledIntervalSecs"]);
  id v28 = [v27 length];

  if (v26 > v28) {
    [v51 setSafeObject:v7 forKey:@"scheduledIntervalSecs"];
  }
  id v29 = -[NSString length](v8, "length");
  v30 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"scheduledRemainingSecs"]);
  id v31 = [v30 length];

  if (v29 > v31) {
    [v51 setSafeObject:v8 forKey:@"scheduledRemainingSecs"];
  }
  id v32 = -[NSString length](v9, "length");
  v33 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"pushDelaySecs"]);
  id v34 = [v33 length];

  if (v32 > v34) {
    [v51 setSafeObject:v9 forKey:@"pushDelaySecs"];
  }
  id v35 = -[NSString length](v10, "length");
  v36 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"activeClientCount"]);
  id v37 = [v36 length];

  if (v35 > v37) {
    [v51 setSafeObject:v10 forKey:@"activeClientCount"];
  }
  id v38 = -[NSString length](v11, "length");
  v39 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"activeMonitorCount"]);
  id v40 = [v39 length];

  if (v38 > v40) {
    [v51 setSafeObject:v11 forKey:@"activeMonitorCount"];
  }
  id v41 = -[NSString length](v12, "length");
  v42 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"maximumClientCount"]);
  id v43 = [v42 length];

  if (v41 > v43) {
    [v51 setSafeObject:v12 forKey:@"maximumClientCount"];
  }
  id v44 = -[NSString length](v13, "length");
  v45 = (void *)objc_claimAutoreleasedReturnValue([v51 safeStringForKey:@"totalClientCount"]);
  id v46 = [v45 length];

  if (v44 > v46) {
    [v51 setSafeObject:v13 forKey:@"totalClientCount"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary clientDomainName](self, "clientDomainName"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetSummary setJobStatus](self, "setJobStatus"));
    id v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 summary]);
  }

  else
  {
    id v41 = @"NONE";
  }

  id v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  id v31 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  id v40 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  v39 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  id v25 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  id v37 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  v36 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"clientDomainName"]);
  v27 = (void *)v5;
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v5,  v34,  @" ",  0LL));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetSetIdentifier"]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v6,  v33,  @" ",  0LL));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetSetRepresentation"]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v42,  v32,  @" ",  0LL));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"setJobStatus"]);
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v41,  v30,  @" ",  0LL));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"scheduledIntervalSecs"]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v28,  @" ",  1LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"scheduledRemainingSecs"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v31,  v24,  @" ",  1LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"pushDelaySecs"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v40,  v22,  @" ",  1LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"activeClientCount"]);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v39,  v19,  @" ",  1LL));
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"activeMonitorCount"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v25,  v18,  @" ",  1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"maximumClientCount"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v37,  v11,  @" ",  1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"totalClientCount"]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v36,  v13,  @" ",  1LL));
  id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v35,  v26,  v23,  v21,  v20,  v17,  v16,  v9,  v10,  v12,  v14));

  return v29;
}

- (id)assetSetRepresentationName
{
  return +[MAAutoAssetSummary assetRepresentationName:]( &OBJC_CLASS___MAAutoAssetSummary,  "assetRepresentationName:",  -[MANAutoAssetSetSummary assetSetRepresentation](self, "assetSetRepresentation"));
}

+ (id)assetSetRepresentationName:(int64_t)a3
{
  return +[MAAutoAssetSummary assetRepresentationName:]( &OBJC_CLASS___MAAutoAssetSummary,  "assetRepresentationName:",  a3);
}

+ (id)summaryNewMaxColumnStrings
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"clientDomainName",  @"clientDomainName");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetSetIdentifier",  @"assetSetIdentifier");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"assetSetRepresentation",  @"assetSetRepresentation");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"setJobStatus",  @"setJobStatus");
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
  id v14 = (NSString *)v12;
  if (v13 < [v10 length])
  {
    v15 = [v10 length];
    int64_t v16 = v15 - (_BYTE *)[v12 length];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0]);

    id v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (v6) {
      id v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v18, v12);
    }
    else {
      id v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v12, v18);
    }
    id v14 = v20;
  }

  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v3 = a3;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"clientDomainName"]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientDomainName",  v23,  @" ",  0LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSetIdentifier"]);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSetIdentifier",  v22,  @" ",  0LL));
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSetRepresentation"]);
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSetRepresentation",  v21,  @" ",  0LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"setJobStatus"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"setJobStatus",  v19,  @" ",  0LL));
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledIntervalSecs"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledIntervalSecs",  v18,  @" ",  0LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledRemainingSecs"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"scheduledRemainingSecs",  v17,  @" ",  0LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeClientCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeClientCount",  v14,  @" ",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeMonitorCount"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeMonitorCount",  v12,  @" ",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumClientCount"]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumClientCount",  v6,  @" ",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalClientCount"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalClientCount",  v8,  @" ",  0LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v25,  v24,  v16,  v15,  v13,  v11,  v4,  v5,  v7,  v9));

  return v20;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v3 = a3;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"clientDomainName"]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v24,  @"=",  0LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSetIdentifier"]);
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v23,  @"=",  0LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetSetRepresentation"]);
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v22,  @"=",  0LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"setJobStatus"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v20,  @"=",  0LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledIntervalSecs"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v19,  @"=",  0LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"scheduledRemainingSecs"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v17,  @"=",  0LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeClientCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v14,  @"=",  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeMonitorCount"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v13,  @"=",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumClientCount"]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v6,  @"=",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalClientCount"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSummary,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v8,  @"=",  0LL));
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@",  v25,  v18,  v16,  v15,  v11,  v12,  v4,  v5,  v7,  v9));

  return v21;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (int64_t)assetSetRepresentation
{
  return self->_assetSetRepresentation;
}

- (void)setAssetSetRepresentation:(int64_t)a3
{
  self->_assetSetRepresentation = a3;
}

- (MANAutoAssetSetStatus)setJobStatus
{
  return self->_setJobStatus;
}

- (void)setSetJobStatus:(id)a3
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

@end