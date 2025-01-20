@interface _DASPredictionManager
+ (BOOL)predictionNeedsUpdating:(id)a3 atDate:(id)a4 lastUpdatedAt:(id)a5;
+ (id)cacheDetailsForPredictionWithKey:(id)a3;
+ (id)currentPredictions;
+ (id)getValuesForPrediction:(id)a3 tillEndDate:(id)a4 withIntervals:(double)a5;
+ (id)lowLikelihoodPeriodEndForPredictionWithKey:(id)a3;
+ (id)lowLikelihoodPeriodStartForPredictionWithKey:(id)a3;
+ (id)predictionForKey:(id)a3;
+ (id)predictionGenerationQueue;
+ (id)sharedKnowledgeStore;
+ (id)sharedPredictor;
+ (void)asyncDo:(id)a3;
+ (void)initialize;
+ (void)setPrediction:(id)a3 forKey:(id)a4;
@end

@implementation _DASPredictionManager

+ (id)sharedKnowledgeStore
{
  if (qword_100157AC0 != -1) {
    dispatch_once(&qword_100157AC0, &stru_1001161F0);
  }
  return (id)qword_100157AC8;
}

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000547A8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157AD0 != -1) {
    dispatch_once(&qword_100157AD0, block);
  }
  return (id)qword_100157AB8;
}

+ (id)predictionGenerationQueue
{
  if (qword_100157AD8 != -1) {
    dispatch_once(&qword_100157AD8, &stru_100116210);
  }
  return (id)qword_100157AE0;
}

+ (void)asyncDo:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.predictionManager.asyncDo");
  v6 = objc_autoreleasePoolPush();
  id v7 = [(id)objc_opt_class(a1) predictionGenerationQueue];
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100054984;
  v11[3] = &unk_100116238;
  id v9 = v5;
  id v12 = v9;
  id v10 = v4;
  id v13 = v10;
  dispatch_async(v8, v11);

  objc_autoreleasePoolPop(v6);
}

+ (void)initialize
{
  if (qword_100157AE8 != -1) {
    dispatch_once(&qword_100157AE8, &stru_100116258);
  }
}

+ (id)currentPredictions
{
  id v2 = (id)qword_100157AA8;
  objc_sync_enter(v2);
  id v3 = [(id)qword_100157AA8 copy];
  objc_sync_exit(v2);

  return v3;
}

+ (void)setPrediction:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = objc_autoreleasePoolPush();
  id v7 = (id)qword_100157AA8;
  objc_sync_enter(v7);
  [(id)qword_100157AA8 setObject:v9 forKeyedSubscript:v5];
  objc_sync_exit(v7);

  id v8 = (id)qword_100157AB0;
  objc_sync_enter(v8);
  [(id)qword_100157AB0 removeObjectForKey:v5];
  objc_sync_exit(v8);

  objc_autoreleasePoolPop(v6);
}

+ (id)cacheDetailsForPredictionWithKey:(id)a3
{
  id v33 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager predictionForKey:](&OBJC_CLASS____DASPredictionManager, "predictionForKey:"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  if (!v3) {
    goto LABEL_5;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  [v4 timeIntervalSinceNow];
  if (v5 > 604800.0)
  {

LABEL_5:
    id v9 = 0LL;
    goto LABEL_6;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 endDate]);
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  if (v8 > 604800.0) {
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v34));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionDates]);
  [v11 addObjectsFromArray:v12];

  if ([v11 count] == (id)1)
  {
    id v13 = 0LL;
    v14 = 0LL;
    v35 = 0LL;
    id v9 = &__NSDictionary0__struct;
    goto LABEL_30;
  }

  v15 = 0LL;
  v35 = 0LL;
  v14 = 0LL;
  id v13 = 0LL;
  double v16 = 0.0;
  double v17 = 0.0;
  do
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v15++]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v15]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 valueAtDate:v18]);
    [v20 doubleValue];
    if (v21 < 0.05)
    {
      [v19 timeIntervalSinceDate:v18];
      double v16 = v16 + v22;
      v23 = v18;
      v24 = v35;
      if (v14) {
        goto LABEL_19;
      }
LABEL_18:
      id v26 = v18;
      v14 = v23;
      v35 = v24;
      goto LABEL_19;
    }

    if (v14)
    {
      if (v16 > v17)
      {
        id v25 = v14;

        id v13 = v25;
        double v17 = v16;
      }

      double v16 = 0.0;
    }

    v23 = 0LL;
    v14 = 0LL;
    v24 = v18;
    if (!v35) {
      goto LABEL_18;
    }
LABEL_19:
  }

  while (v15 < (char *)[v11 count] - 1);
  BOOL v27 = v16 <= 0.0 || v35 == 0LL;
  if (v27 || ([v35 timeIntervalSinceDate:v34], double v29 = v16 + v28, v29 <= v17))
  {
    double v29 = v17;
  }

  else
  {
    id v30 = v14;

    id v13 = v30;
  }

  id v9 = &__NSDictionary0__struct;
  if (v29 >= 7200.0 && v13)
  {
    v36[0] = @"periodStart";
    v36[1] = @"periodEnd";
    v37[0] = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:v29]);
    v37[1] = v31;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
  }

+ (id)lowLikelihoodPeriodStartForPredictionWithKey:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_100157AB0;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157AB0 objectForKeyedSubscript:v4]);
  double v7 = v6;
  if (v6) {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"periodStart"]);
  }
  else {
    double v8 = 0LL;
  }

  objc_sync_exit(v5);
  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    id v10 = [(id)objc_opt_class(a1) cacheDetailsForPredictionWithKey:v4];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"periodStart"]);
  }

  return v9;
}

+ (id)lowLikelihoodPeriodEndForPredictionWithKey:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_100157AB0;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157AB0 objectForKeyedSubscript:v4]);
  double v7 = v6;
  if (v6) {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"periodEnd"]);
  }
  else {
    double v8 = 0LL;
  }

  objc_sync_exit(v5);
  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    id v10 = [(id)objc_opt_class(a1) cacheDetailsForPredictionWithKey:v4];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"periodEnd"]);
  }

  return v9;
}

+ (id)predictionForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = (id)qword_100157AA8;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157AA8 objectForKeyedSubscript:v3]);
  objc_sync_exit(v5);

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (BOOL)predictionNeedsUpdating:(id)a3 atDate:(id)a4 lastUpdatedAt:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    [v8 timeIntervalSinceDate:v9];
    if (v10 >= 900.0)
    {
      [v8 timeIntervalSinceDate:v9];
      unsigned __int8 v11 = 1;
      if (v7 && v12 <= 10800.0) {
        unsigned __int8 v11 = [v7 isUnavailable];
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

+ (id)getValuesForPrediction:(id)a3 tillEndDate:(id)a4 withIntervals:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSinceDate:v8];
  if (v10 >= 0.0) {
    goto LABEL_3;
  }
  [v8 timeIntervalSinceDate:v9];
  if (v11 > 86400.0) {
    goto LABEL_3;
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue([v7 startDate]);
  [v8 timeIntervalSinceDate:v14];
  if (v15 <= 0.0)
  {
    double v12 = 0LL;
LABEL_23:

    goto LABEL_4;
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
  [v16 timeIntervalSinceDate:v9];
  double v18 = v17;

  if (v18 > 0.0)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v19 = v9;
    id v20 = v8;
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
    [v21 timeIntervalSinceDate:v19];
    double v23 = v22;

    if (v23 <= 0.0)
    {
      unint64_t v24 = 0LL;
    }

    else
    {
      unint64_t v24 = (unint64_t)(v23 / a5);
      if (v24)
      {
        for (uint64_t i = 0LL; i != v24; ++i)
          [v12 setObject:&off_100121E70 atIndexedSubscript:i];
      }

      uint64_t v26 = objc_claimAutoreleasedReturnValue([v7 startDate]);

      id v19 = (id)v26;
    }

    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
    [v20 timeIntervalSinceDate:v27];
    double v29 = v28;

    id v30 = v20;
    if (v29 > 0.0)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
    }

    [v30 timeIntervalSinceDate:v19];
    double v32 = v31;
    id v14 = v19;
    unint64_t v33 = (unint64_t)(v32 / a5);
    v44 = v30;
    v34 = v14;
    if (v24 < v33)
    {
      do
      {
        v35 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAtDate:v34]);
        [v12 setObject:v36 atIndexedSubscript:v24];

        v34 = (void *)objc_claimAutoreleasedReturnValue([v35 dateByAddingTimeInterval:a5]);
        ++v24;
      }

      while (v33 != v24);
      unint64_t v24 = (unint64_t)(v32 / a5);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
    [v20 timeIntervalSinceDate:v37];
    double v39 = v38;

    if (v39 > 0.0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
      [v20 timeIntervalSinceDate:v40];
      double v42 = v41;

      unint64_t v43 = (unint64_t)(v42 / a5);
      if (v24 < v43)
      {
        do
          [v12 setObject:&off_100121E70 atIndexedSubscript:v24++];
        while (v43 != v24);
      }
    }

    goto LABEL_23;
  }

@end