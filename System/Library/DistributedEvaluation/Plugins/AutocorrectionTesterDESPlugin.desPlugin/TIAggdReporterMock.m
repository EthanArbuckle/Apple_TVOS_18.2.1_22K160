@interface TIAggdReporterMock
- (NSMutableDictionary)distributions;
- (NSMutableDictionary)scalars;
- (TIAggdReporterMock)init;
- (id)getDistributionObject:(id)a3;
- (id)toDictionary;
- (id)toJsonString;
- (int)commit;
- (int64_t)_getScalar:(id)a3;
- (int64_t)getScalar:(id)a3;
- (void)_setScalar:(id)a3 withValue:(int64_t)a4;
- (void)addValue:(int64_t)a3 forKey:(id)a4;
- (void)clear;
- (void)clearDistributionKey:(id)a3;
- (void)clearScalarKey:(id)a3;
- (void)decrementKey:(id)a3;
- (void)incrementKey:(id)a3;
- (void)pushValue:(double)a3 forKey:(id)a4;
- (void)setScalar:(id)a3 withValue:(int64_t)a4;
- (void)setValue:(double)a3 forDistributionKey:(id)a4;
- (void)setValue:(int64_t)a3 forScalarKey:(id)a4;
- (void)subtractValue:(int64_t)a3 forKey:(id)a4;
@end

@implementation TIAggdReporterMock

- (TIAggdReporterMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TIAggdReporterMock;
  v2 = -[TIAggdReporterMock init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    scalars = v2->_scalars;
    v2->_scalars = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    distributions = v2->_distributions;
    v2->_distributions = v5;
  }

  return v2;
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](obj, "scalars"));
  [v2 removeAllObjects];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](obj, "distributions"));
  [v3 removeAllObjects];

  objc_sync_exit(obj);
}

- (id)toDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  v7[0] = @"scalars";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](v2, "scalars"));
  v7[1] = @"distributions";
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v2, "distributions"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  objc_sync_exit(v2);
  return v5;
}

- (id)toJsonString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock toDictionary](self, "toDictionary"));
  uint64_t v6 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  1LL,  &v6));

  v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
  return v4;
}

- (int)commit
{
  return 0;
}

- (int64_t)getScalar:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = -[TIAggdReporterMock _getScalar:](v5, "_getScalar:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)_getScalar:(id)a3
{
  id v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](self, "scalars")),
        int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](self, "scalars"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    id v9 = [v8 longLongValue];
  }

  else
  {
    id v9 = 0LL;
  }

  return (int64_t)v9;
}

- (void)setScalar:(id)a3 withValue:(int64_t)a4
{
  id v7 = a3;
  int64_t v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, a4);
  objc_sync_exit(v6);
}

- (void)_setScalar:(id)a3 withValue:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](self, "scalars"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a4));
    [v8 setObject:v7 forKey:v6];
  }

- (void)clearScalarKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock scalars](v5, "scalars"));
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, a3);
  objc_sync_exit(v6);
}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:]( v6,  "_setScalar:withValue:",  v7,  (char *)-[TIAggdReporterMock getScalar:](v6, "getScalar:", v7) + a3);
  objc_sync_exit(v6);
}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:]( v6,  "_setScalar:withValue:",  v7,  (char *)-[TIAggdReporterMock getScalar:](v6, "getScalar:", v7) - a3);
  objc_sync_exit(v6);
}

- (void)incrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[TIAggdReporterMock _setScalar:withValue:]( v4,  "_setScalar:withValue:",  v5,  (char *)-[TIAggdReporterMock getScalar:](v4, "getScalar:", v5) + 1);
  objc_sync_exit(v4);
}

- (void)decrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[TIAggdReporterMock _setScalar:withValue:]( v4,  "_setScalar:withValue:",  v5,  (char *)-[TIAggdReporterMock getScalar:](v4, "getScalar:", v5) - 1);
  objc_sync_exit(v4);
}

- (void)clearDistributionKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v5, "distributions"));
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v7, "distributions"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));
    [v8 setObject:v11 forKey:v6];

    objc_sync_exit(v7);
  }
}

- (void)pushValue:(double)a3 forKey:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v6, "distributions"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v11]);

    if (!v8)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  &__NSArray0__struct));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v6, "distributions"));
      [v9 setObject:v8 forKey:v11];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 addObject:v10];

    objc_sync_exit(v6);
  }
}

- (id)getDistributionObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIAggdReporterMock distributions](v5, "distributions"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (NSMutableDictionary)scalars
{
  return self->_scalars;
}

- (NSMutableDictionary)distributions
{
  return self->_distributions;
}

- (void).cxx_destruct
{
}

@end