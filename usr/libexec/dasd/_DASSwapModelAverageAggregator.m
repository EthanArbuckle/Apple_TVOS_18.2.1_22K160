@interface _DASSwapModelAverageAggregator
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
@end

@implementation _DASSwapModelAverageAggregator

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v39 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v6 = [v5 count];

  if (!v6) {
    goto LABEL_4;
  }
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v8 scoresForAllApplicationsAtDate:v39]);

LABEL_4:
    v9 = v4;
    goto LABEL_23;
  }

  context = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v16);
        v18 = objc_autoreleasePoolPush();
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 scoresForAllApplicationsAtDate:v39]);
        [v11 addObject:v19];
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allKeys]);
        [v10 addObjectsFromArray:v20];

        objc_autoreleasePoolPop(v18);
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v14);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v10;
  id v22 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v26]);
        [v28 doubleValue];
        double v30 = v29;

        for (uint64_t i = 1LL; (id)i != v6; ++i)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:i]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v26]);
          [v33 doubleValue];
          double v30 = v30 + v34;
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v30 / (double)(unint64_t)v6));
        [v21 setObject:v35 forKeyedSubscript:v26];

        v25 = (char *)v25 + 1;
      }

      while (v25 != v23);
      id v23 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v23);
  }

  id v6 = [v21 copy];
  v9 = context;
LABEL_23:
  objc_autoreleasePoolPop(v9);

  return v6;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v9 = [v8 count];

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      [v11 scoreForApplication:v6 atDate:v7];
      double v13 = v12;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
      [v15 scoreForApplication:v6 atDate:v7];
      double v17 = v16;

      for (uint64_t i = 1LL; (id)i != v9; ++i)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:i]);
        [v20 scoreForApplication:v6 atDate:v7];
        double v17 = v17 + v21;
      }

      double v13 = v17 / (double)(unint64_t)v9;
    }
  }

  else
  {
    double v13 = 0.0;
  }

  return v13;
}

@end