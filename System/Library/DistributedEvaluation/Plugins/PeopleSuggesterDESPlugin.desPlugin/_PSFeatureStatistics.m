@interface _PSFeatureStatistics
- (NSDictionary)percentiles;
- (NSMutableArray)list;
- (_PSFeatureStatistics)initWithList:(id)a3;
- (double)avg;
- (double)max;
- (double)min;
- (double)mode;
- (double)stdev;
- (void)addValue:(id)a3;
- (void)calculateStats;
- (void)setAvg:(double)a3;
- (void)setList:(id)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setMode:(double)a3;
- (void)setPercentiles:(id)a3;
- (void)setStdev:(double)a3;
@end

@implementation _PSFeatureStatistics

- (_PSFeatureStatistics)initWithList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____PSFeatureStatistics;
  v5 = -[_PSFeatureStatistics init](&v8, "init");
  if (v5)
  {
    v6 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v4);
    -[_PSFeatureStatistics setList:](v5, "setList:", v6);

    -[_PSFeatureStatistics calculateStats](v5, "calculateStats");
  }

  return v5;
}

- (void)calculateStats
{
  double v3 = 0.0;
  -[_PSFeatureStatistics setMax:](self, "setMax:", 0.0);
  -[_PSFeatureStatistics setMin:](self, "setMin:", 100.0);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  id v5 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * (void)i) doubleValue];
        double v11 = v10;
        -[_PSFeatureStatistics max](self, "max");
        if (v11 > v12) {
          -[_PSFeatureStatistics setMax:](self, "setMax:", v11);
        }
        -[_PSFeatureStatistics min](self, "min");
        if (v11 < v13) {
          -[_PSFeatureStatistics setMin:](self, "setMin:", v11);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.01f",  *(void *)&v11));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v4, "valueForKey:", v14));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v16 intValue] + 1));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, v14);
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
          -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v16, v14);
        }

        double v6 = v6 + v11;
        double v3 = v3 + v11 * v11;
      }

      id v7 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }

    while (v7);
  }

  -[_PSFeatureStatistics setMode:](self, "setMode:", 0.0);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  v18 = v4;
  id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
  if (v19)
  {
    id v20 = v19;
    signed int v21 = 0;
    uint64_t v22 = *(void *)v59;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v59 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v18, "valueForKey:", v24));
        signed int v26 = [v25 intValue];

        if (v26 > v21)
        {
          [v24 doubleValue];
          -[_PSFeatureStatistics setMode:](self, "setMode:");
          signed int v21 = v26;
        }
      }

      id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
    }

    while (v20);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  id v28 = [v27 count];

  if (!v28)
  {
    -[_PSFeatureStatistics setMax:](self, "setMax:", 0.0);
    -[_PSFeatureStatistics setMin:](self, "setMin:", 0.0);
  }

  -[_PSFeatureStatistics setAvg:](self, "setAvg:", 0.0);
  -[_PSFeatureStatistics setStdev:](self, "setStdev:", 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  id v30 = [v29 count];

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    -[_PSFeatureStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)[v31 count]);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    double v33 = v3 - v6 * v6 / (double)(unint64_t)[v32 count];
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    double v35 = v33 / (double)((unint64_t)[v34 count] - 1);

    -[_PSFeatureStatistics setStdev:](self, "setStdev:", sqrt(v35));
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sortedArrayUsingSelector:"compare:"]);
  id v38 = [v37 mutableCopy];
  -[_PSFeatureStatistics setList:](self, "setList:", v38);

  v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  id v41 = [v40 count];

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v44 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v42,  "objectAtIndexedSubscript:",  (int)(ceil((double)(unint64_t)objc_msgSend(v43, "count") * 0.1) + -1.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v44, @"10%");

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v47 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v45,  "objectAtIndexedSubscript:",  (int)(ceil((double)(unint64_t)objc_msgSend(v46, "count") * 0.25) + -1.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v47, @"25%");

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v50 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v48,  "objectAtIndexedSubscript:",  (int)(ceil((double)(unint64_t)objc_msgSend(v49, "count") * 0.5) + -1.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v50, @"50%");

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v53 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v51,  "objectAtIndexedSubscript:",  (int)(ceil((double)(unint64_t)objc_msgSend(v52, "count") * 0.75) + -1.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v53, @"75%");

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
    v56 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v54,  "objectAtIndexedSubscript:",  (int)(ceil((double)(unint64_t)objc_msgSend(v55, "count") * 0.9) + -1.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v56, @"90%");
  }

  -[_PSFeatureStatistics setPercentiles:](self, "setPercentiles:", v39);
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PSFeatureStatistics list](self, "list"));
  [v5 addObject:v4];

  -[_PSFeatureStatistics calculateStats](self, "calculateStats");
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stdev
{
  return self->_stdev;
}

- (void)setStdev:(double)a3
{
  self->_stdev = a3;
}

- (double)mode
{
  return self->_mode;
}

- (void)setMode:(double)a3
{
  self->_mode = a3;
}

- (NSDictionary)percentiles
{
  return self->_percentiles;
}

- (void)setPercentiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end