@interface MAAutoAssetSetLockTracker
+ (BOOL)supportsSecureCoding;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetLockReason)clientLockReason;
- (MAAutoAssetSetLockTracker)initWithCoder:(id)a3;
- (MAAutoAssetSetPolicy)lockUsagePolicy;
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

@implementation MAAutoAssetSetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetLockTracker;
  v9 = -[MAAutoAssetSetLockTracker init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientLockReason, a3);
    objc_storeStrong((id *)&v10->_lockUsagePolicy, a4);
    *(int64x2_t *)&v10->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v10->_totalLockCount = xmmword_18720F590;
    uint64_t v11 = [MEMORY[0x189603F50] date];
    firstLockTimestamp = v10->_firstLockTimestamp;
    v10->_firstLockTimestamp = (NSDate *)v11;

    objc_storeStrong((id *)&v10->_lastRefreshTimestamp, v10->_firstLockTimestamp);
  }

  return v10;
}

- (MAAutoAssetSetLockTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetLockTracker;
  v5 = -[MAAutoAssetSetLockTracker init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLockReason"];
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockUsagePolicy"];
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetSetPolicy *)v8;

    v5->_activeLockCount = [v4 decodeIntegerForKey:@"activeLockCount"];
    v5->_maximumLockCount = [v4 decodeIntegerForKey:@"maximumLockCount"];
    v5->_totalLockCount = [v4 decodeIntegerForKey:@"totalLockCount"];
    v5->_continueCount = [v4 decodeIntegerForKey:@"continueLockCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstLockTimestamp"];
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRefreshTimestamp"];
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  [v4 encodeObject:v5 forKey:@"clientLockReason"];

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"lockUsagePolicy"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"),  @"activeLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"),  @"maximumLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"),  @"totalLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"),  @"continueLockCount");
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"firstLockTimestamp"];

  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"lastRefreshTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetLockTracker);
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  id v6 = -[MAAutoAssetSetLockTracker initForClientLockReason:lockingWithUsagePolicy:]( v3,  "initForClientLockReason:lockingWithUsagePolicy:",  v4,  v5);

  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v7 copy];
  [v6 setFirstLockTimestamp:v8];
  v9 = -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  uint64_t v10 = (void *)[v9 copy];
  [v6 setLastRefreshTimestamp:v10];

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  v16 = -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  [v16 summary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  if (v5)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 summary];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = @"NONE";
  }

  int64_t v7 = -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount");
  int64_t v8 = -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount");
  int64_t v9 = -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount");
  int64_t v10 = -[MAAutoAssetSetLockTracker continueCount](self, "continueCount");
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@">>>\n        clientLockReason: %@\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]", v4, v6, v7, v8, v9, v10, v11, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
  }

  return v13;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 summary];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    [v5 summary];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = @"NONE";
  }

  int64_t v7 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  int64_t v9 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  int64_t v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v11 = objc_alloc(NSString);
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v11 initWithFormat:@"%@", v12];

  id v14 = objc_alloc(NSString);
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)[v14 initWithFormat:@"%@", v15];

  [NSString stringWithFormat:@"clientReason:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@", v19, v6, v7, v8, v9, v10, v13, v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v43 = a3;
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 summary];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  if (v5)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 summary];
    int64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v7 = @"NONE";
  }

  int64_t v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v9 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  int64_t v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  id v11 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v12 = objc_alloc(NSString);
  v13 = -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  id v14 = (void *)[v12 initWithFormat:@"%@", v13];

  id v15 = objc_alloc(NSString);
  v16 = -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v17 = (void *)[v15 initWithFormat:@"%@", v16];

  unint64_t v18 = [v42 length];
  [v43 safeStringForKey:@"clientLockReason"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v20 = [v19 length];

  if (v18 > v20) {
    [v43 setSafeObject:v42 forKey:@"clientLockReason"];
  }
  unint64_t v21 = -[__CFString length](v7, "length");
  [v43 safeStringForKey:@"lockUsagePolicy"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v23 = [v22 length];

  if (v21 > v23) {
    [v43 setSafeObject:v7 forKey:@"lockUsagePolicy"];
  }
  unint64_t v24 = [v8 length];
  [v43 safeStringForKey:@"activeLockCount"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v26 = [v25 length];

  if (v24 > v26) {
    [v43 setSafeObject:v8 forKey:@"activeLockCount"];
  }
  unint64_t v27 = [v9 length];
  [v43 safeStringForKey:@"maximumLockCount"];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v29 = [v28 length];

  if (v27 > v29) {
    [v43 setSafeObject:v9 forKey:@"maximumLockCount"];
  }
  unint64_t v30 = [v10 length];
  [v43 safeStringForKey:@"totalLockCount"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v32 = [v31 length];

  if (v30 > v32) {
    [v43 setSafeObject:v10 forKey:@"totalLockCount"];
  }
  unint64_t v33 = [v11 length];
  [v43 safeStringForKey:@"continueLockCount"];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v35 = [v34 length];

  if (v33 > v35) {
    [v43 setSafeObject:v11 forKey:@"continueLockCount"];
  }
  unint64_t v36 = [v14 length];
  [v43 safeStringForKey:@"firstLockTimestamp"];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v38 = [v37 length];

  if (v36 > v38) {
    [v43 setSafeObject:v14 forKey:@"firstLockTimestamp"];
  }
  unint64_t v39 = [v17 length];
  [v43 safeStringForKey:@"lastRefreshTimestamp"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v41 = [v40 length];

  if (v39 > v41) {
    [v43 setSafeObject:v17 forKey:@"lastRefreshTimestamp"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  [v5 summary];
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 summary];
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v37 = @"NONE";
  }

  unint64_t v36 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  unint64_t v30 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  unint64_t v26 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  unint64_t v35 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v8 = objc_alloc(NSString);
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)[v8 initWithFormat:@"%@", v9];

  id v10 = objc_alloc(NSString);
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v33 = (void *)[v10 initWithFormat:@"%@", v11];

  id v27 = (id)NSString;
  [v4 safeStringForKey:@"clientLockReason"];
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v32,  @" ",  0LL);
  [v4 safeStringForKey:@"lockUsagePolicy"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v37,  v31,  @" ",  0LL);
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeLockCount"];
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v36,  v29,  @" ",  1LL);
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"maximumLockCount"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v30,  v24,  @" ",  1LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"totalLockCount"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v26,  v22,  @" ",  1LL);
  [v4 safeStringForKey:@"continueLockCount"];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v35,  v20,  @" ",  1LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"firstLockTimestamp"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v34,  v15,  @" ",  1LL);
  [v4 safeStringForKey:@"lastRefreshTimestamp"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v33,  v17,  @" ",  1LL);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v25, v23, v21, v12, v13, v14, v16, v18];
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:@"clientLockReason" forKey:@"clientLockReason"];
  [v2 setSafeObject:@"lockUsagePolicy" forKey:@"lockUsagePolicy"];
  [v2 setSafeObject:@"activeLockCount" forKey:@"activeLockCount"];
  [v2 setSafeObject:@"maximumLockCount" forKey:@"maximumLockCount"];
  [v2 setSafeObject:@"totalLockCount" forKey:@"totalLockCount"];
  [v2 setSafeObject:@"continueLockCount" forKey:@"continueLockCount"];
  [v2 setSafeObject:@"firstLockTimestamp" forKey:@"firstLockTimestamp"];
  [v2 setSafeObject:@"lastRefreshTimestamp" forKey:@"lastRefreshTimestamp"];
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
  id v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    [NSString string];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    id v19 = objc_alloc(NSString);
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    id v14 = (void *)v20;
  }

  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v19 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientLockReason"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientLockReason",  v22,  @" ",  0LL);
  [v3 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lockUsagePolicy",  v21,  @" ",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeLockCount"];
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeLockCount",  v18,  @" ",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumLockCount"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumLockCount",  v16,  @" ",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalLockCount"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalLockCount",  v14,  @" ",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"continueLockCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"continueLockCount",  v12,  @" ",  0LL);
  [v3 safeStringForKey:@"firstLockTimestamp"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"firstLockTimestamp",  v6,  @" ",  0LL);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lastRefreshTimestamp"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lastRefreshTimestamp",  v8,  @" ",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v17, v15, v13, v11, v4, v5, v7, v9];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v19 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientLockReason"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v22,  @"=",  0LL);
  [v3 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v21,  @"=",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeLockCount"];
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v18,  @"=",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumLockCount"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v16,  @"=",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalLockCount"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v14,  @"=",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"continueLockCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v12,  @"=",  0LL);
  [v3 safeStringForKey:@"firstLockTimestamp"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v6,  @"=",  0LL);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lastRefreshTimestamp"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v8,  @"=",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v17, v15, v13, v11, v4, v5, v7, v9];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (MAAutoAssetSetPolicy)lockUsagePolicy
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