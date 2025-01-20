@interface SignpostReporterAggregation
- (NSDictionary)aggregationDictionary;
- (SignpostReporterAggregation)init;
- (id)keysInDescendingCountOrder;
- (unint64_t)countForSubsystem:(id)a3 category:(id)a4;
- (unint64_t)totalCount;
- (void)incrementSubsystem:(id)a3 category:(id)a4;
@end

@implementation SignpostReporterAggregation

- (SignpostReporterAggregation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SignpostReporterAggregation;
  v2 = -[SignpostReporterAggregation init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    aggregationDictionary = v2->_aggregationDictionary;
    v2->_aggregationDictionary = (NSDictionary *)v3;
  }

  return v2;
}

- (unint64_t)countForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[SignpostReporterAggregationKey initWithSubsystem:category:]( objc_alloc(&OBJC_CLASS___SignpostReporterAggregationKey),  "initWithSubsystem:category:",  v7,  v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

  if (v10) {
    id v11 = [v10 unsignedLongLongValue];
  }
  else {
    id v11 = 0LL;
  }

  return (unint64_t)v11;
}

- (id)keysInDescendingCountOrder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keysSortedByValueUsingComparator:&stru_100010968]);

  return v3;
}

- (void)incrementSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  v8 = -[SignpostReporterAggregationKey initWithSubsystem:category:]( objc_alloc(&OBJC_CLASS___SignpostReporterAggregationKey),  "initWithSubsystem:category:",  v7,  v6);

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);
  if (v9) {
    v10 = (_UNKNOWN **)v9;
  }
  else {
    v10 = &off_100012120;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v10 unsignedLongLongValue] + 1));
  [v12 setObject:v11 forKeyedSubscript:v8];

  ++self->_totalCount;
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (NSDictionary)aggregationDictionary
{
  return self->_aggregationDictionary;
}

- (void).cxx_destruct
{
}

@end