@interface CPLBGSTActivityReport
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForPhase:(int64_t)a3;
+ (id)simplifiedTaskIdentifierForTaskIdentifier:(id)a3;
- (CPLBGSTActivityReport)initWithCoder:(id)a3;
- (CPLBGSTActivityReport)initWithTaskIdentifier:(id)a3;
- (NSString)taskIdentifier;
- (id)statusWithNow:(id)a3;
- (int64_t)phase;
- (void)_didReportPhase:(int64_t)a3;
- (void)didAcquire;
- (void)didCancel;
- (void)didDefer;
- (void)didError;
- (void)didExpire;
- (void)didFinish;
- (void)didSubmit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLBGSTActivityReport

- (CPLBGSTActivityReport)initWithTaskIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLBGSTActivityReport;
  v5 = -[CPLBGSTActivityReport init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLBGSTActivityReport)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"taskIdentifier"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = -[CPLBGSTActivityReport initWithTaskIdentifier:](self, "initWithTaskIdentifier:", v6);
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"dates"]);

      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDate);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
            {
              objc_storeStrong((id *)v7->_phaseDates, v18);
              v7->_phase = 0LL;
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v15);
      }
    }

    self = v7;
    v20 = self;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_taskIdentifier forKey:@"taskIdentifier"];
  uint64_t v5 = 0LL;
  uint64_t v15 = 0LL;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  phaseDates = self->_phaseDates;
  do
  {
    v7 = phaseDates[v5];
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v12, v13, v14, v15));
    }
    objc_super v9 = *(void **)((char *)&v12 + v5 * 8);
    *(void *)((char *)&v12 + v5 * 8) = v8;

    ++v5;
  }

  while (v5 != 7);
  v10 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", &v12, 7LL);
  [v4 encodeObject:v10 forKey:@"dates"];

  for (uint64_t i = 48LL; i != -8; i -= 8LL)
}

- (void)_didReportPhase:(int64_t)a3
{
  if (a3 == 2 && self->_phase == 4) {
    objc_storeStrong((id *)self->_phaseDates, self->_phaseDates[4]);
  }
  uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  phaseDates = self->_phaseDates;
  v7 = self->_phaseDates[a3];
  self->_phaseDates[a3] = v5;

  if (a3 == 4 && self->_phase == 3)
  {
    uint64_t v8 = self->_phaseDates[3];
    if (v8)
    {
      -[NSDate timeIntervalSinceDate:](self->_phaseDates[4], "timeIntervalSinceDate:", v8);
      if (v9 < 0.0) {
        double v9 = -v9;
      }
      if (v9 < 1.0)
      {
        int64_t phase = self->_phase;
        v11 = phaseDates[phase];
        phaseDates[phase] = 0LL;
      }
    }
  }

  if (self->_phase > a3)
  {
    __int128 v12 = &self->_phaseDates[1];
    int64_t v13 = a3;
    do
    {
      int64_t v14 = v13 + 1;
      uint64_t v15 = v12[v13];
      v12[v13] = 0LL;

      int64_t v13 = v14;
    }

    while (v14 < self->_phase);
  }

  self->_int64_t phase = a3;
}

- (void)didSubmit
{
}

- (void)didCancel
{
}

- (void)didAcquire
{
}

- (void)didExpire
{
}

- (void)didDefer
{
}

- (void)didError
{
}

- (void)didFinish
{
}

+ (id)descriptionForPhase:(int64_t)a3
{
  return *(&off_10023EE50 + a3);
}

+ (id)simplifiedTaskIdentifierForTaskIdentifier:(id)a3
{
  id v3 = a3;
  else {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)statusWithNow:(id)a3
{
  id v4 = a3;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLBGSTActivityReport simplifiedTaskIdentifierForTaskIdentifier:]( &OBJC_CLASS___CPLBGSTActivityReport,  "simplifiedTaskIdentifierForTaskIdentifier:",  self->_taskIdentifier));
  uint64_t v5 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@: ",  v15);
  v6 = 0LL;
  for (uint64_t i = 0LL; i != 7; ++i)
  {
    uint64_t v8 = self->_phaseDates[i];
    if (!v8) {
      goto LABEL_10;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLBGSTActivityReport descriptionForPhase:]( &OBJC_CLASS___CPLBGSTActivityReport,  "descriptionForPhase:",  i));
    if (v6)
    {
      -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v6);
      if (v10 <= 1.0)
      {
        -[NSMutableString appendFormat:](v5, "appendFormat:", @" ... %@", v9);
        goto LABEL_9;
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeInterval:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeInterval:"));
      -[NSMutableString appendFormat:](v5, "appendFormat:", @" ... %@ ... %@", v11, v9);
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v8,  v4));
      -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ [%@]", v9, v11);
    }

LABEL_9:
    __int128 v12 = v8;

    v6 = v12;
LABEL_10:
  }

  if (!v6) {
    -[NSMutableString appendString:](v5, "appendString:", @"never");
  }
  id v13 = -[NSMutableString copy](v5, "copy");

  return v13;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  uint64_t v3 = 7LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

@end