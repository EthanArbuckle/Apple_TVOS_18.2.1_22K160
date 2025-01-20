@interface MANAutoAssetSetLockTracker
+ (BOOL)supportsSecureCoding;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetLockReason)clientLockReason;
- (MANAutoAssetSetLockTracker)initWithCoder:(id)a3;
- (MANAutoAssetSetPolicy)lockUsagePolicy;
- (NSDate)firstLockTimestamp;
- (NSDate)lastRefreshTimestamp;
- (id)copy;
- (id)description;
- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeLockCount;
- (int64_t)continueCount;
- (int64_t)maximumLockCount;
- (int64_t)totalLockCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveLockCount:(int64_t)a3;
- (void)setContinueCount:(int64_t)a3;
- (void)setFirstLockTimestamp:(id)a3;
- (void)setLastRefreshTimestamp:(id)a3;
- (void)setLockUsagePolicy:(id)a3;
- (void)setMaximumLockCount:(int64_t)a3;
- (void)setTotalLockCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MANAutoAssetSetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetLockTracker;
  v9 = -[MANAutoAssetSetLockTracker init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientLockReason, a3);
    objc_storeStrong((id *)&v10->_lockUsagePolicy, a4);
    *(int64x2_t *)&v10->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v10->_totalLockCount = xmmword_27E6A0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    firstLockTimestamp = v10->_firstLockTimestamp;
    v10->_firstLockTimestamp = (NSDate *)v11;

    objc_storeStrong((id *)&v10->_lastRefreshTimestamp, v10->_firstLockTimestamp);
  }

  return v10;
}

- (MANAutoAssetSetLockTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetLockTracker;
  v5 = -[MANAutoAssetSetLockTracker init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetLockReason) forKey:@"clientLockReason"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"lockUsagePolicy"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MANAutoAssetSetPolicy *)v10;

    v5->_activeLockCount = (int64_t)[v4 decodeIntegerForKey:@"activeLockCount"];
    v5->_maximumLockCount = (int64_t)[v4 decodeIntegerForKey:@"maximumLockCount"];
    v5->_totalLockCount = (int64_t)[v4 decodeIntegerForKey:@"totalLockCount"];
    v5->_continueCount = (int64_t)[v4 decodeIntegerForKey:@"continueLockCount"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"firstLockTimestamp"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"lastRefreshTimestamp"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  [v4 encodeObject:v5 forKey:@"clientLockReason"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  [v4 encodeObject:v6 forKey:@"lockUsagePolicy"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"),  @"activeLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"),  @"maximumLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"),  @"totalLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetLockTracker continueCount](self, "continueCount"),  @"continueLockCount");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  [v4 encodeObject:v7 forKey:@"firstLockTimestamp"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  [v4 encodeObject:v8 forKey:@"lastRefreshTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetLockTracker);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  id v6 = -[MANAutoAssetSetLockTracker initForClientLockReason:lockingWithUsagePolicy:]( v3,  "initForClientLockReason:lockingWithUsagePolicy:",  v4,  v5);

  objc_msgSend(v6, "setActiveLockCount:", -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MANAutoAssetSetLockTracker continueCount](self, "continueCount"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  id v8 = [v7 copy];
  [v6 setFirstLockTimestamp:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  id v10 = [v9 copy];
  [v6 setLastRefreshTimestamp:v10];

  return v6;
}

- (id)description
{
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  if (v4)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 summary]);
  }

  else
  {
    v5 = @"NONE";
  }

  int64_t v6 = -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount");
  int64_t v7 = -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount");
  int64_t v8 = -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount");
  int64_t v9 = -[MANAutoAssetSetLockTracker continueCount](self, "continueCount");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n        clientLockReason: %@\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]",  v3,  v5,  v6,  v7,  v8,  v9,  v10,  v11));

  if (v4)
  {
  }

  return v12;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
    int64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 summary]);
  }

  else
  {
    int64_t v6 = @"NONE";
  }

  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  id v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker continueCount](self, "continueCount"));
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSString);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  uint64_t v13 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@", v12);

  objc_super v14 = objc_alloc(&OBJC_CLASS___NSString);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  uint64_t v16 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clientReason:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@",  v19,  v6,  v7,  v8,  v9,  v10,  v13,  v16));
  return v17;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v43 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  if (v5)
  {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
    int64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 summary]);
  }

  else
  {
    int64_t v7 = @"NONE";
  }

  int64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  id v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  uint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v12 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  objc_super v14 = -[NSString initWithFormat:](v12, "initWithFormat:", @"%@", v13);

  id v15 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@", v16);

  id v18 = [v42 length];
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"clientLockReason"]);
  id v20 = [v19 length];

  if (v18 > v20) {
    [v43 setSafeObject:v42 forKey:@"clientLockReason"];
  }
  id v21 = -[__CFString length](v7, "length");
  v22 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"lockUsagePolicy"]);
  id v23 = [v22 length];

  if (v21 > v23) {
    [v43 setSafeObject:v7 forKey:@"lockUsagePolicy"];
  }
  id v24 = -[NSString length](v8, "length");
  v25 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"activeLockCount"]);
  id v26 = [v25 length];

  if (v24 > v26) {
    [v43 setSafeObject:v8 forKey:@"activeLockCount"];
  }
  id v27 = -[NSString length](v9, "length");
  v28 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"maximumLockCount"]);
  id v29 = [v28 length];

  if (v27 > v29) {
    [v43 setSafeObject:v9 forKey:@"maximumLockCount"];
  }
  id v30 = -[NSString length](v10, "length");
  v31 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"totalLockCount"]);
  id v32 = [v31 length];

  if (v30 > v32) {
    [v43 setSafeObject:v10 forKey:@"totalLockCount"];
  }
  id v33 = -[NSString length](v11, "length");
  v34 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"continueLockCount"]);
  id v35 = [v34 length];

  if (v33 > v35) {
    [v43 setSafeObject:v11 forKey:@"continueLockCount"];
  }
  id v36 = -[NSString length](v14, "length");
  v37 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"firstLockTimestamp"]);
  id v38 = [v37 length];

  if (v36 > v38) {
    [v43 setSafeObject:v14 forKey:@"firstLockTimestamp"];
  }
  id v39 = -[NSString length](v17, "length");
  v40 = (void *)objc_claimAutoreleasedReturnValue([v43 safeStringForKey:@"lastRefreshTimestamp"]);
  id v41 = [v40 length];

  if (v39 > v41) {
    [v43 setSafeObject:v17 forKey:@"lastRefreshTimestamp"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker clientLockReason](self, "clientLockReason"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
  if (v6)
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy"));
    id v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
  }

  else
  {
    id v36 = @"NONE";
  }

  id v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  id v29 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  id v26 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  v34 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[MANAutoAssetSetLockTracker continueCount](self, "continueCount"));
  int64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp"));
  id v33 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@", v9);

  id v10 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp"));
  id v32 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@", v11);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"clientLockReason"]);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v37,  v31,  @" ",  0LL));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"lockUsagePolicy"]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v36,  v30,  @" ",  0LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"activeLockCount"]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v35,  v28,  @" ",  1LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"maximumLockCount"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v29,  v24,  @" ",  1LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"totalLockCount"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v26,  v22,  @" ",  1LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"continueLockCount"]);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v34,  v20,  @" ",  1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"firstLockTimestamp"]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v33,  v15,  @" ",  1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"lastRefreshTimestamp"]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v32,  v17,  @" ",  1LL));
  id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@",  v25,  v23,  v21,  v12,  v13,  v14,  v16,  v18));

  return v27;
}

+ (id)summaryNewMaxColumnStrings
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"clientLockReason",  @"clientLockReason");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"lockUsagePolicy",  @"lockUsagePolicy");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"activeLockCount",  @"activeLockCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"maximumLockCount",  @"maximumLockCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"totalLockCount",  @"totalLockCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"continueLockCount",  @"continueLockCount");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"firstLockTimestamp",  @"firstLockTimestamp");
  -[NSMutableDictionary setSafeObject:forKey:]( v2,  "setSafeObject:forKey:",  @"lastRefreshTimestamp",  @"lastRefreshTimestamp");
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
  objc_super v14 = (NSString *)v12;
  if (v13 < [v10 length])
  {
    id v15 = [v10 length];
    int64_t v16 = v15 - (_BYTE *)[v12 length];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0]);

    objc_super v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (v6) {
      id v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v18, v12);
    }
    else {
      id v20 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@%@", v12, v18);
    }
    objc_super v14 = v20;
  }

  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v3 = a3;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"clientLockReason"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientLockReason",  v21,  @" ",  0LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"lockUsagePolicy"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lockUsagePolicy",  v20,  @" ",  0LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeLockCount"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeLockCount",  v18,  @" ",  0LL));
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumLockCount"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumLockCount",  v16,  @" ",  0LL));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalLockCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalLockCount",  v14,  @" ",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"continueLockCount"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"continueLockCount",  v12,  @" ",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"firstLockTimestamp"]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"firstLockTimestamp",  v6,  @" ",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"lastRefreshTimestamp"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lastRefreshTimestamp",  v8,  @" ",  0LL));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@",  v17,  v15,  v13,  v11,  v4,  v5,  v7,  v9));

  return v19;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v3 = a3;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"clientLockReason"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v21,  @"=",  0LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"lockUsagePolicy"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v20,  @"=",  0LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"activeLockCount"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v18,  @"=",  0LL));
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"maximumLockCount"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v16,  @"=",  0LL));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"totalLockCount"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v14,  @"=",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"continueLockCount"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v12,  @"=",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"firstLockTimestamp"]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v6,  @"=",  0LL));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"lastRefreshTimestamp"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MANAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_355768,  v8,  @"=",  0LL));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@|%@|%@",  v17,  v15,  v13,  v11,  v4,  v5,  v7,  v9));

  return v19;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (MANAutoAssetSetPolicy)lockUsagePolicy
{
  return self->_lockUsagePolicy;
}

- (void)setLockUsagePolicy:(id)a3
{
}

- (int64_t)activeLockCount
{
  return self->_activeLockCount;
}

- (void)setActiveLockCount:(int64_t)a3
{
  self->_activeLockCount = a3;
}

- (int64_t)maximumLockCount
{
  return self->_maximumLockCount;
}

- (void)setMaximumLockCount:(int64_t)a3
{
  self->_maximumLockCount = a3;
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (int64_t)continueCount
{
  return self->_continueCount;
}

- (void)setContinueCount:(int64_t)a3
{
  self->_continueCount = a3;
}

- (NSDate)firstLockTimestamp
{
  return self->_firstLockTimestamp;
}

- (void)setFirstLockTimestamp:(id)a3
{
}

- (NSDate)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end