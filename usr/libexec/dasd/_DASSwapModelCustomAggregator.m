@interface _DASSwapModelCustomAggregator
- (_DASSwapModelCustomAggregator)initWithAlgorithms:(id)a3;
- (_DASSwapModeling)applicationUsageModeling;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)setApplicationUsageModeling:(id)a3;
@end

@implementation _DASSwapModelCustomAggregator

- (_DASSwapModelCustomAggregator)initWithAlgorithms:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____DASSwapModelCustomAggregator;
  v3 = -[_DASSwapModelAbstractAggregator initWithAlgorithms:](&v17, "initWithAlgorithms:", a3);
  v4 = v3;
  if (v3)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](v3, "algorithms", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v9);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS____DASSwapModelApplicationUsage);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
            objc_storeStrong((id *)&v4->_applicationUsageModeling, v10);
          }
          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v7);
    }
  }

  return v4;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v70 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v6 = [v5 count];

  if (!v6) {
    goto LABEL_4;
  }
  if (v6 == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v8 scoresForAllApplicationsAtDate:v70]);

LABEL_4:
    objc_autoreleasePoolPop(v4);
    id v9 = 0LL;
    goto LABEL_5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASSwapModeling scoresForAllApplicationsAtDate:]( self->_applicationUsageModeling,  "scoresForAllApplicationsAtDate:",  v70));
  id v14 = [v13 count];
  [v12 addObject:v13];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  v69 = v11;
  [v11 addObjectsFromArray:v15];

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v17 = [v16 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v17)
  {
    id v18 = v17;
    id v65 = v14;
    obuint64_t j = v16;
    id v60 = v6;
    v62 = v13;
    v63 = v4;
    id v6 = *(id *)v76;
    char v19 = 1;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(id *)v76 != v6) {
          objc_enumerationMutation(obj);
        }
        v21 = *(_DASSwapModeling **)(*((void *)&v75 + 1) + 8LL * (void)i);
        v22 = objc_autoreleasePoolPush();
        if (v21 != self->_applicationUsageModeling)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( -[_DASSwapModeling scoresForAllApplicationsAtDate:]( v21,  "scoresForAllApplicationsAtDate:",  v70));
          v19 &= [v23 count] == 0;
          [v12 addObject:v23];
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allKeys]);
          [v69 addObjectsFromArray:v24];
        }

        objc_autoreleasePoolPop(v22);
      }

      id v18 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }

    while (v18);

    __int128 v13 = v62;
    v4 = v63;
    if ((v19 & 1) == 0)
    {
      if (!v65 && (unint64_t)[v69 count] < 0xA)
      {
        int v25 = 0;
        id v9 = 0LL;
        id v6 = &__NSDictionary0__struct;
        goto LABEL_40;
      }

      id obja = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v60));
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      id v66 = v69;
      id v26 = [v66 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (!v26) {
        goto LABEL_39;
      }
      id v6 = v26;
      uint64_t v27 = *(void *)v72;
      v28 = &AnalyticsSendEventLazy_ptr;
LABEL_23:
      uint64_t v29 = 0LL;
      id v64 = v6;
      while (1)
      {
        if (*(void *)v72 != v27) {
          objc_enumerationMutation(v66);
        }
        uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * v29);
        if (v61 == 3) {
          break;
        }
        if (v61 != 2)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
          v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v30]);
          [v53 doubleValue];
          double v55 = v54;

          if (v61 >= 2)
          {
            for (uint64_t j = 1LL; j != v61; ++j)
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:j]);
              v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:v30]);
              [v58 doubleValue];
              double v55 = v55 + v59;
            }
          }

          v50 = v28[90];
          double v51 = v55 / (double)v61;
          goto LABEL_36;
        }

        v31 = v28[90];
        v32 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v30]);
        [v33 doubleValue];
        double v35 = v34;
        uint64_t v36 = v27;
        v37 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v30]);
        [v38 doubleValue];
        v40 = (void *)objc_claimAutoreleasedReturnValue([v31 numberWithDouble:v39 * 0.75 + v35 * 0.25]);
        [obja setObject:v40 forKeyedSubscript:v30];

        uint64_t v27 = v36;
        id v6 = v64;

        v28 = &AnalyticsSendEventLazy_ptr;
LABEL_37:

        if ((id)++v29 == v6)
        {
          id v6 = [v66 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (!v6)
          {
LABEL_39:

            id v9 = [obja copy];
            int v25 = 1;
            __int128 v13 = v62;
            v4 = v63;
            goto LABEL_40;
          }

          goto LABEL_23;
        }
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v30]);
      [v42 doubleValue];
      double v44 = v43;

      double v45 = 0.0;
      for (uint64_t k = 1LL; k != 3; ++k)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:k]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v30]);
        [v48 doubleValue];
        double v45 = v45 + v49;
      }

      v50 = v28[90];
      double v51 = v45 * 0.75 * 0.5 + v44 * 0.25;
LABEL_36:
      v32 = (void *)objc_claimAutoreleasedReturnValue([v50 numberWithDouble:v51]);
      [obja setObject:v32 forKeyedSubscript:v30];
      goto LABEL_37;
    }
  }

  else
  {
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject", v60));
  int v25 = 0;
  id v9 = 0LL;
LABEL_40:

  objc_autoreleasePoolPop(v4);
  if (v25)
  {
    id v9 = v9;
    id v6 = v9;
  }

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  id v9 = [v8 count];

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      [v11 scoreForApplication:v6 atDate:v7];
      double v13 = v12;
    }

    else
    {
      -[_DASSwapModeling scoreForApplication:atDate:]( self->_applicationUsageModeling,  "scoreForApplication:atDate:",  v6,  v7);
      double v13 = v14;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms", 0LL));
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        double v19 = 0.0;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v21 = *(_DASSwapModeling **)(*((void *)&v25 + 1) + 8LL * (void)i);
            if (v21 != self->_applicationUsageModeling)
            {
              -[_DASSwapModeling scoreForApplication:atDate:](v21, "scoreForApplication:atDate:", v6, v7);
              double v19 = v19 + v22;
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v17);

        if (v19 != 0.0)
        {
          if (v9 == (id)3)
          {
            double v23 = v19 * 0.5 * 0.75;
          }

          else
          {
            if (v9 != (id)2)
            {
              double v13 = (v13 + v19) / (double)(unint64_t)v9;
              goto LABEL_22;
            }

            double v23 = v19 * 0.75;
          }

          double v13 = v23 + v13 * 0.25;
        }
      }

      else
      {
      }
    }
  }

  else
  {
    double v13 = 0.0;
  }

- (_DASSwapModeling)applicationUsageModeling
{
  return (_DASSwapModeling *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApplicationUsageModeling:(id)a3
{
}

- (void).cxx_destruct
{
}

@end