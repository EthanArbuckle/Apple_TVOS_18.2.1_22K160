@interface _DASActivityRateLimitTracker
- (BOOL)onlyExpiredOccurrencesAtDate:(id)a3;
- (BOOL)timewiseEligibleAtDate:(id)a3 withLPMWindowExtension:(BOOL)a4;
- (NSMutableArray)occurrences;
- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3;
- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3 andOccurrences:(id)a4;
- (double)window;
- (id)description;
- (id)nextTimewiseEligibleDateFromDate:(id)a3 withLPMWindowExtension:(BOOL)a4;
- (os_unfair_lock_s)lock;
- (unint64_t)maximum;
- (unint64_t)occurrencesInWindow:(double)a3 atDate:(id)a4;
- (void)executeAtDate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMaximum:(unint64_t)a3;
- (void)setOccurrences:(id)a3;
- (void)setWindow:(double)a3;
@end

@implementation _DASActivityRateLimitTracker

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASActivityRateLimitTracker;
  v5 = -[_DASActivityRateLimitTracker init](&v10, "init");
  if (v5)
  {
    v5->_maximum = (unint64_t)[v4 maximum];
    [v4 window];
    v5->_window = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    occurrences = v5->_occurrences;
    v5->_occurrences = (NSMutableArray *)v7;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3 andOccurrences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASActivityRateLimitTracker;
  v8 = -[_DASActivityRateLimitTracker init](&v14, "init");
  if (v8)
  {
    v8->_maximum = (unint64_t)[v6 maximum];
    [v6 window];
    v8->_window = v9;
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));
    occurrences = v8->_occurrences;
    v8->_occurrences = (NSMutableArray *)v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (unint64_t)occurrencesInWindow:(double)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));

  os_unfair_lock_unlock(&self->_lock);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    unint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        objc_msgSend(v16, "timeIntervalSinceDate:", v6, (void)v20);
        double v18 = (double)(int)-v17;
        if (v18 <= a3)
        {
          ++v13;
          objc_msgSend(v7, "addObject:", v16, v18);
        }
      }

      id v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18);
    }

    while (v12);
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  os_unfair_lock_lock(&self->_lock);
  -[_DASActivityRateLimitTracker setOccurrences:](self, "setOccurrences:", v7);
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (BOOL)timewiseEligibleAtDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    double v7 = 3600.0;
  }
  else {
    -[_DASActivityRateLimitTracker window](self, "window");
  }
  unint64_t v8 = -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:](self, "occurrencesInWindow:atDate:", v6, v7);
  BOOL v9 = v8 < -[_DASActivityRateLimitTracker maximum](self, "maximum");

  return v9;
}

- (void)executeAtDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_occurrences, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)nextTimewiseEligibleDateFromDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = -[NSMutableArray count](self->_occurrences, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (a4)
  {
    double v9 = 3600.0;
  }

  else
  {
    -[_DASActivityRateLimitTracker window](self, "window");
    double v9 = v10;
  }

  unint64_t v11 = -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:](self, "occurrencesInWindow:atDate:", v6, v9);
  if (v11 < -[_DASActivityRateLimitTracker maximum](self, "maximum")
    || (uint64_t v12 = v8 - v11, (v12 & 0x80000000) != 0))
  {
    id v15 = v6;
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v12]);

    os_unfair_lock_unlock(p_lock);
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v14,  v9));
  }

  return v15;
}

- (BOOL)onlyExpiredOccurrencesAtDate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitTracker occurrences](self, "occurrences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

  os_unfair_lock_unlock(&self->_lock);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "timeIntervalSinceDate:", v4, (void)v17);
        double v13 = (double)(int)-v12;
        -[_DASActivityRateLimitTracker window](self, "window");
        if (v14 >= v13)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)description
{
  double v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[_DASActivityRateLimitTracker occurrencesInWindow:atDate:]( self,  "occurrencesInWindow:atDate:",  v5,  v4)));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_maximum));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_window));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Rate Limit - Current:%@ Max:%@ Window:%@>",  v6,  v7,  v8));

  return v9;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(unint64_t)a3
{
  self->_maximum = a3;
}

- (double)window
{
  return self->_window;
}

- (void)setWindow:(double)a3
{
  self->_window = a3;
}

- (NSMutableArray)occurrences
{
  return self->_occurrences;
}

- (void)setOccurrences:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end