@interface MAAutoAssetLockTracker
+ (BOOL)supportsSecureCoding;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetLockReason)clientLockReason;
- (MAAutoAssetLockTracker)initWithCoder:(id)a3;
- (MAAutoAssetPolicy)lockUsagePolicy;
- (NSDate)firstLockTimestamp;
- (NSDate)lastRefreshTimestamp;
- (NSString)clientProcessName;
- (id)_initForClientLockReason:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingWithUsagePolicy:(id)a6;
- (id)copy;
- (id)description;
- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4;
- (id)newSummaryDictionary;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeLockCount;
- (int64_t)clientProcessID;
- (int64_t)continueCount;
- (int64_t)maximumLockCount;
- (int64_t)totalLockCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveLockCount:(int64_t)a3;
- (void)setClientProcessID:(int64_t)a3;
- (void)setClientProcessName:(id)a3;
- (void)setContinueCount:(int64_t)a3;
- (void)setFirstLockTimestamp:(id)a3;
- (void)setLastRefreshTimestamp:(id)a3;
- (void)setLockUsagePolicy:(id)a3;
- (void)setMaximumLockCount:(int64_t)a3;
- (void)setTotalLockCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  return -[MAAutoAssetLockTracker _initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:]( self,  "_initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:",  a3,  0LL,  0LL,  a4);
}

- (id)_initForClientLockReason:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingWithUsagePolicy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MAAutoAssetLockTracker;
  v14 = -[MAAutoAssetLockTracker init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_clientLockReason, a3);
    objc_storeStrong((id *)&v15->_clientProcessName, a4);
    v15->_clientProcessID = a5;
    objc_storeStrong((id *)&v15->_lockUsagePolicy, a6);
    *(int64x2_t *)&v15->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v15->_totalLockCount = xmmword_18720F590;
    uint64_t v16 = [MEMORY[0x189603F50] date];
    firstLockTimestamp = v15->_firstLockTimestamp;
    v15->_firstLockTimestamp = (NSDate *)v16;

    objc_storeStrong((id *)&v15->_lastRefreshTimestamp, v15->_firstLockTimestamp);
  }

  return v15;
}

- (MAAutoAssetLockTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MAAutoAssetLockTracker;
  v5 = -[MAAutoAssetLockTracker init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLockReason"];
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockUsagePolicy"];
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetPolicy *)v10;

    v5->_activeLockCount = [v4 decodeIntegerForKey:@"activeLockCount"];
    v5->_maximumLockCount = [v4 decodeIntegerForKey:@"maximumLockCount"];
    v5->_totalLockCount = [v4 decodeIntegerForKey:@"totalLockCount"];
    v5->_continueCount = [v4 decodeIntegerForKey:@"continueLockCount"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstLockTimestamp"];
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRefreshTimestamp"];
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  [v4 encodeObject:v5 forKey:@"clientLockReason"];

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"clientProcessName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"),  @"clientProcessID");
  v7 = -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  [v4 encodeObject:v7 forKey:@"lockUsagePolicy"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"),  @"activeLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"),  @"maximumLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"),  @"totalLockCount");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetLockTracker continueCount](self, "continueCount"),  @"continueLockCount");
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"firstLockTimestamp"];

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"lastRefreshTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetLockTracker);
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  id v6 = -[MAAutoAssetLockTracker initForClientLockReason:lockingWithUsagePolicy:]( v3,  "initForClientLockReason:lockingWithUsagePolicy:",  v4,  v5);
  v7 = -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  [v6 setClientProcessName:v7];

  objc_msgSend(v6, "setClientProcessID:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 copy];
  [v6 setFirstLockTimestamp:v9];

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 copy];
  [v6 setLastRefreshTimestamp:v11];

  return v6;
}

- (id)description
{
  objc_super v17 = (void *)NSString;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 summary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v18 = @"N";
  }

  int64_t v16 = -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID");
  v5 = -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  if (v5)
  {
    v15 = -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    [v15 summary];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = @"NONE";
  }

  int64_t v7 = -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount");
  int64_t v8 = -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount");
  int64_t v9 = -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount");
  int64_t v10 = -[MAAutoAssetLockTracker continueCount](self, "continueCount");
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@">>>\n        clientLockReason: %@\n       clientProcessName: %@\n         clientProcessID: %ld\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]", v3, v18, v16, v6, v7, v8, v9, v10, v11, v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
  }

  if (v4) {
  return v13;
  }
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 summary];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = objc_alloc(NSString);
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)[v5 initWithFormat:@"%@(%ld)", v6, -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID")];
  }

  else
  {
    v22 = @"N";
  }

  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 summary];
    int64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v9 = @"NONE";
  }

  int64_t v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  id v11 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  uint64_t v12 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  id v13 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v14 = objc_alloc(NSString);
  v15 = -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  int64_t v16 = (void *)[v14 initWithFormat:@"%@", v15];

  id v17 = objc_alloc(NSString);
  v18 = -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  objc_super v19 = (void *)[v17 initWithFormat:@"%@", v18];

  [NSString stringWithFormat:@"clientReason:%@|clientProcess:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@", v23, v22, v9, v10, v11, v12, v13, v16, v19];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = objc_alloc_init(MEMORY[0x189607848]);
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v5 newSummaryDictionary];
  [v3 setSafeObject:v6 forKey:@"clientLockReason"];

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v7 forKey:@"clientProcessName"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v8 forKey:@"clientProcessID"];

  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v10 = (void *)[v9 newSummaryDictionary];
  [v3 setSafeObject:v10 forKey:@"lockUsagePolicy"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v11 forKey:@"activeLockCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v12 forKey:@"maximumLockCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v13 forKey:@"totalLockCount"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v14 forKey:@"continueLockCount"];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v15 = -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  [v4 stringFromDate:v15];
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v16 forKey:@"firstLockTimestamp"];

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringFromDate:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v18 forKey:@"lastRefreshTimestamp"];

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v53 = a3;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 summary];

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v5;
  if (v6)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v52 = @"NONE";
  }

  v51 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%ld",  -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 summary];
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v50 = @"NONE";
  }

  int64_t v9 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  id v11 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  uint64_t v12 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v13 = objc_alloc(NSString);
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)[v13 initWithFormat:@"%@", v14];

  id v16 = objc_alloc(NSString);
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)[v16 initWithFormat:@"%@", v17];

  unint64_t v19 = [v49 length];
  [v53 safeStringForKey:@"clientLockReason"];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v53 setSafeObject:v49 forKey:@"clientLockReason"];
  }
  unint64_t v22 = -[__CFString length](v52, "length");
  [v53 safeStringForKey:@"clientProcessName"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v53 setSafeObject:v52 forKey:@"clientProcessName"];
  }
  unint64_t v25 = [v51 length];
  [v53 safeStringForKey:@"clientProcessID"];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v53 setSafeObject:v51 forKey:@"clientProcessID"];
  }
  unint64_t v28 = -[__CFString length](v50, "length");
  [v53 safeStringForKey:@"lockUsagePolicy"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v53 setSafeObject:v50 forKey:@"lockUsagePolicy"];
  }
  unint64_t v31 = [v9 length];
  [v53 safeStringForKey:@"activeLockCount"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v53 setSafeObject:v9 forKey:@"activeLockCount"];
  }
  unint64_t v34 = [v10 length];
  [v53 safeStringForKey:@"maximumLockCount"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v53 setSafeObject:v10 forKey:@"maximumLockCount"];
  }
  unint64_t v37 = [v11 length];
  [v53 safeStringForKey:@"totalLockCount"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v53 setSafeObject:v11 forKey:@"totalLockCount"];
  }
  unint64_t v40 = [v12 length];
  [v53 safeStringForKey:@"continueLockCount"];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v53 setSafeObject:v12 forKey:@"continueLockCount"];
  }
  unint64_t v43 = [v15 length];
  [v53 safeStringForKey:@"firstLockTimestamp"];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v45 = [v44 length];

  if (v43 > v45) {
    [v53 setSafeObject:v15 forKey:@"firstLockTimestamp"];
  }
  unint64_t v46 = [v18 length];
  [v53 safeStringForKey:@"lastRefreshTimestamp"];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v48 = [v47 length];

  if (v46 > v48) {
    [v53 setSafeObject:v18 forKey:@"lastRefreshTimestamp"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 summary];
  unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v44 = @"NONE";
  }

  unint64_t v43 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%ld",  -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 summary];
    unint64_t v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v42 = @"NONE";
  }

  v41 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  unint64_t v37 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v29 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  unint64_t v40 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v9 = objc_alloc(NSString);
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v39 = (void *)[v9 initWithFormat:@"%@", v10];

  id v11 = objc_alloc(NSString);
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)[v11 initWithFormat:@"%@", v12];

  id v31 = (id)NSString;
  [v4 safeStringForKey:@"clientLockReason"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v45,  v35,  @" ",  0LL);
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"clientProcessName"];
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v44,  v34,  @" ",  0LL);
  unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"clientProcessID"];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v43,  v33,  @" ",  0LL);
  [v4 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v42,  v30,  @" ",  0LL);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeLockCount"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v41,  v28,  @" ",  1LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"maximumLockCount"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v37,  v25,  @" ",  1LL);
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"totalLockCount"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v29,  v23,  @" ",  1LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"continueLockCount"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v40,  v22,  @" ",  1LL);
  [v4 safeStringForKey:@"firstLockTimestamp"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v39,  v16,  @" ",  1LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"lastRefreshTimestamp"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v18,  @" ",  1LL);
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v36, v27, v26, v24, v13, v21, v14, v15, v17, v19];
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:@"clientLockReason" forKey:@"clientLockReason"];
  [v2 setSafeObject:@"clientProcessName" forKey:@"clientProcessName"];
  [v2 setSafeObject:@"clientProcessID" forKey:@"clientProcessID"];
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
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

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
  uint64_t v20 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientLockReason"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientLockReason",  v24,  @" ",  0LL);
  [v3 safeStringForKey:@"clientProcessName"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientProcessName",  v23,  @" ",  0LL);
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"clientProcessID"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientProcessID",  v22,  @" ",  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lockUsagePolicy"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lockUsagePolicy",  v19,  @" ",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeLockCount"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeLockCount",  v18,  @" ",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumLockCount"];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumLockCount",  v17,  @" ",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalLockCount"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalLockCount",  v14,  @" ",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"continueLockCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"continueLockCount",  v12,  @" ",  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"firstLockTimestamp"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"firstLockTimestamp",  v6,  @" ",  0LL);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lastRefreshTimestamp"];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"lastRefreshTimestamp",  v8,  @" ",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v25, v16, v15, v13, v11, v4, v5, v7, v9];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)summaryPaddedBanner:(id)a3
{
  unint64_t v21 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientLockReason"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v25,  @"=",  0LL);
  [v3 safeStringForKey:@"clientProcessName"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v24,  @"=",  0LL);
  [v3 safeStringForKey:@"clientProcessID"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v23,  @"=",  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lockUsagePolicy"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v20,  @"=",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeLockCount"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v19,  @"=",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumLockCount"];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v17,  @"=",  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"totalLockCount"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v14,  @"=",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"continueLockCount"];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v13,  @"=",  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"firstLockTimestamp"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v6,  @"=",  0LL);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"lastRefreshTimestamp"];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetLockTracker,  "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v8,  @"=",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v18, v16, v15, v11, v12, v4, v5, v7, v9];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (void)setClientProcessID:(int64_t)a3
{
  self->_clientProcessID = a3;
}

- (MAAutoAssetPolicy)lockUsagePolicy
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