@interface BKMRUEventStatistics
+ (id)statisticsWithLabel:(id)a3 capacity:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)pushStatistics:(id)a3;
- (void)reset;
@end

@implementation BKMRUEventStatistics

+ (id)statisticsWithLabel:(id)a3 capacity:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 0)
  {
    v11 = [NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"BKEventStatisticsLoggingController.m", 262, @"Invalid parameter not satisfying: %@", @"capacity > 0" object file lineNumber description];
  }

  v12.receiver = a1;
  v12.super_class = [BKMRUEventStatistics class];
  id v8 = [super statisticWithLabel:v7];
  v9 = (void *)[v8 autorelease];
  v9[5] = a4;

  return v9;
}

- (unint64_t)hash
{
  return [self->_statistics hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  BKMRUEventStatistics *v6 = [BKMRUEventStatistics class];
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    unsigned __int8 v7 = [v4[4] isEqual:self->_statistics];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [self->_statistics bs_compactMap:&stru_1000B7248];
  if ([v5 count])
  {
    uint64_t v7 = [BSDescriptionStream class];
    id v8 = v4;
    v9 = v8;
    if (v7)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
        v10 = v9;
      }
      else {
        v10 = 0LL;
      }
    }

    else
    {
      v10 = 0LL;
    }

    id v11 = v10;

    BKEventStatistic *v12 = [self label];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004DD60;
    v15[3] = &unk_1000B72B0;
    id v13 = v9;
    id v16 = v13;
    [v11 appendCollection:v5 withName:v12 itemBlock:v15];

    v14.receiver = self;
    v14.super_class = [BKMRUEventStatistics class];
    [v14 appendDescriptionToFormatter:v13];
  }
}

- (void)pushStatistics:(id)a3
{
  id v9 = a3;
  [self setNeedsLogging:YES];
  statistics = self->_statistics;
  if (!statistics)
  {
    NSMutableOrderedSet *v5 = [[NSMutableOrderedSet alloc] init];
    uint64_t v6 = self->_statistics;
    self->_statistics = v5;

    statistics = self->_statistics;
  }

  uint64_t v7 = self->_statistics;
  id v8 = [v9 bs_map:&stru_1000B72F0];
  [v7 addObject:v8];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = [BKMRUEventStatistics class];
  [v3 reset];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = [BKMRUEventStatistics class];
  BKEventStatistic *v4 = [v8 copyWithZone:a3];
  NSMutableOrderedSet *v5 = [self->_statistics copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  v4[5] = self->_capacity;
  return v4;
}

- (void).cxx_destruct
{
}

@end