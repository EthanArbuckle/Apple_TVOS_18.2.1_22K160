@interface TaskingCriteriaRange
- (BOOL)_checkForWholeCriteriaArray:(id)a3;
- (BOOL)_elementExistsInStats:(id)a3 statsProvider:(id)a4 forCriteriaDict:(id)a5;
- (BOOL)_elementPassesWhiteListCheck:(id)a3 whiteListRef:(id)a4 forCriteriaDict:(id)a5;
- (BOOL)_evaluateWholeCriteriaArray:(id)a3;
- (BOOL)_validateElement:(id)a3 isOptional:(BOOL)isKindOfClass forCriteriaDict:(id)a5;
- (BOOL)allStatIdsExistInStatsProvider:(id)a3;
- (BOOL)evaluateCriteriaUsingStatsProvider:(id)a3 doWhiteListCheck:(BOOL)a4;
- (BOOL)passWhiteListCheck;
- (BOOL)validateCriteria;
- (NSArray)myTaskingCriteria;
- (float)_getElementValue:(id)a3 forElementName:(id)a4 criteriaDict:(id)a5;
- (float)getCriteriaValueUsingStatsProvider:(id)a3 forCriteriaDict:(id)a4;
- (id)initFromTaskingCrit:(id)a3;
- (void)setMyTaskingCriteria:(id)a3;
@end

@implementation TaskingCriteriaRange

- (id)initFromTaskingCrit:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TaskingCriteriaRange;
  v6 = -[TaskingCriteriaRange init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_myTaskingCriteria, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)validateCriteria
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  v4 = (char *)[v3 count];

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    objc_super v10 = &AnalyticsIsEventUsed_ptr;
    uint64_t v11 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(id *)(*((void *)&v33 + 1) + 8LL * (void)i);

        uint64_t v14 = objc_opt_class(v10[34]);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0
          || (char *)[v13 count] - 5 < (char *)0xFFFFFFFFFFFFFFFCLL)
        {
          BOOL v5 = 0;
          goto LABEL_32;
        }

        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v9 = v13;
        id v15 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          id v16 = v15;
          v25 = i;
          uint64_t v26 = v11;
          id v27 = v8;
          v28 = v6;
          id v17 = 0LL;
          uint64_t v18 = *(void *)v30;
          while (2)
          {
            v19 = 0LL;
            v20 = v17;
            do
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v9);
              }
              id v17 = *(id *)(*((void *)&v29 + 1) + 8LL * (void)v19);

              uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v17, v21) & 1) == 0) {
                goto LABEL_31;
              }
              v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"START_RANGE"]);

              if (v22)
              {
                if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:]( self,  "_validateElement:isOptional:forCriteriaDict:",  @"START_RANGE",  0LL,  v17)) {
                  goto LABEL_31;
                }
              }

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", @"END_RANGE", v25, v26, v27));

              if (v23)
              {
                if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:]( self,  "_validateElement:isOptional:forCriteriaDict:",  @"END_RANGE",  0LL,  v17)) {
                  goto LABEL_31;
                }
              }

              else if (!v22)
              {
                goto LABEL_31;
              }

              if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:]( self,  "_validateElement:isOptional:forCriteriaDict:",  @"A",  0LL,  v17)
                || !-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:]( self,  "_validateElement:isOptional:forCriteriaDict:",  @"B",  0LL,  v17)
                || !-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:]( self,  "_validateElement:isOptional:forCriteriaDict:",  @"C",  1LL,  v17))
              {
LABEL_31:

                BOOL v5 = 0;
                v6 = v28;
                goto LABEL_32;
              }

              v19 = (char *)v19 + 1;
              v20 = v17;
            }

            while (v16 != v19);
            id v16 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v16) {
              continue;
            }
            break;
          }

          id v8 = v27;
          v6 = v28;
          objc_super v10 = &AnalyticsIsEventUsed_ptr;
          i = v25;
          uint64_t v11 = v26;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    BOOL v5 = 1;
LABEL_32:
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_validateElement:(id)a3 isOptional:(BOOL)isKindOfClass forCriteriaDict:(id)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:a3]);
  id v7 = v6;
  if (!v6)
  {
    id v8 = 0LL;
    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TYPE"]);
  if (![v8 isEqualToString:@"TYPE_STAT"])
  {
    if ([v8 isEqualToString:@"TYPE_CONST"])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"VALUE"]);
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v20, v21);

      goto LABEL_11;
    }

    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"STAT_ID"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {

    goto LABEL_10;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"STAT_TIME_DELTA"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char v13 = objc_opt_isKindOfClass(v11, v12);

  if ((v13 & 1) == 0)
  {
LABEL_10:
    isKindOfClass = 0;
    goto LABEL_11;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"START_IDX"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
  int v16 = objc_opt_isKindOfClass(v14, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"END_IDX"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
  int v19 = v16 ^ objc_opt_isKindOfClass(v17, v18);

  isKindOfClass = v19 ^ 1;
LABEL_11:

  return isKindOfClass;
}

- (BOOL)_checkForWholeCriteriaArray:(id)a3
{
  v4 = (unsigned int (**)(id, id))a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v26;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v25 + 1) + 8LL * (void)i);

        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v8 = v11;
        id v12 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          id v13 = v12;
          id v14 = 0LL;
          uint64_t v15 = *(void *)v22;
          while (2)
          {
            int v16 = 0LL;
            id v17 = v14;
            do
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v8);
              }
              id v14 = *(id *)(*((void *)&v21 + 1) + 8LL * (void)v16);

              if (!v4[2](v4, v14))
              {

                BOOL v18 = 0;
                goto LABEL_19;
              }

              int v16 = (char *)v16 + 1;
              id v17 = v14;
            }

            while (v13 != v16);
            id v13 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }

          uint64_t v9 = v20;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v7);
    BOOL v18 = 1;
LABEL_19:
  }

  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)_evaluateWholeCriteriaArray:(id)a3
{
  v4 = (uint64_t (**)(id, id))a3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  id v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    id v5 = 0LL;
    char v6 = 0;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v24 + 1) + 8LL * (void)i);

        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v5 = v8;
        id v9 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          id v10 = v9;
          id v11 = 0LL;
          uint64_t v12 = *(void *)v21;
          int v13 = 1;
          do
          {
            id v14 = 0LL;
            uint64_t v15 = v11;
            do
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v5);
              }
              id v11 = *(id *)(*((void *)&v20 + 1) + 8LL * (void)v14);

              v13 &= v4[2](v4, v11);
              id v14 = (char *)v14 + 1;
              uint64_t v15 = v11;
            }

            while (v10 != v14);
            id v10 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v10);
        }

        else
        {
          LOBYTE(v13) = 1;
        }

        v6 |= v13;
      }

      id v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v19);
  }

  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (float)_getElementValue:(id)a3 forElementName:(id)a4 criteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TYPE"]);
  if ([v9 isEqualToString:@"TYPE_CONST"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"VALUE"]);
    [v10 floatValue];
    float v12 = v11;
  }

  else
  {
    float v12 = 1.0;
    if ([v9 isEqualToString:@"TYPE_STAT"])
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"STAT_ID"]);
      id v14 = [v13 integerValue];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"STAT_TIME_DELTA"]);
      id v16 = [v15 unsignedIntValue];

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"START_IDX"]);
      if (v17)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"START_IDX"]);
        id v19 = [v18 unsignedIntValue];

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"END_IDX"]);
        id v21 = [v20 unsignedIntValue];

        [v7 getStatsDeltaForArr:v14 startIdx:v19 endIdx:v21 :v16];
      }

      else
      {
        [v7 getStatsDelta:v14 :v16];
      }

      float v12 = v22;
    }
  }

  return v12;
}

- (float)getCriteriaValueUsingStatsProvider:(id)a3 forCriteriaDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:]( self,  "_getElementValue:forElementName:criteriaDict:",  v6,  @"A",  v7);
  float v9 = v8;
  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:]( self,  "_getElementValue:forElementName:criteriaDict:",  v6,  @"B",  v7);
  float v11 = v10;
  float v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"C"]);

  if (!v12)
  {
    float v13 = 1.0;
LABEL_5:
    float v14 = (float)(v9 - v11) / v13;
    goto LABEL_6;
  }

  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:]( self,  "_getElementValue:forElementName:criteriaDict:",  v6,  @"C",  v7);
  float v14 = 0.0;
  if (v13 != 0.0) {
    goto LABEL_5;
  }
LABEL_6:

  return v14;
}

- (BOOL)_elementPassesWhiteListCheck:(id)a3 whiteListRef:(id)a4 forCriteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
  if (v10
    && (float v11 = (void *)v10,
        float v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]),
        float v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TYPE"]),
        unsigned int v14 = [v13 isEqualToString:@"TYPE_STAT"],
        v13,
        v12,
        v11,
        v14))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"STAT_ID"]);
    unsigned __int8 v17 = [v8 containsObject:v16];
  }

  else
  {
    unsigned __int8 v17 = 1;
  }

  return v17;
}

- (BOOL)passWhiteListCheck
{
  v3 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_100012764;
  v5[3] = &unk_10008C970;
  v5[1] = 3221225472LL;
  id v6 = &off_1000BD300;
  id v7 = self;
  id v8 = &off_1000BD2E8;
  LOBYTE(self) = -[TaskingCriteriaRange _checkForWholeCriteriaArray:](self, "_checkForWholeCriteriaArray:", v5);

  objc_autoreleasePoolPop(v3);
  return (char)self;
}

- (BOOL)_elementExistsInStats:(id)a3 statsProvider:(id)a4 forCriteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
  if (v10
    && (float v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]),
        float v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"TYPE"]),
        unsigned int v13 = [v12 isEqualToString:@"TYPE_STAT"],
        v12,
        v11,
        v13))
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"STAT_ID"]);
    id v15 = [v14 integerValue];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"STAT_TIME_DELTA"]);
    id v17 = [v16 unsignedIntValue];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"START_IDX"]);
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"START_IDX"]);
      id v20 = [v19 unsignedIntValue];

      uint64_t v22 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"END_IDX"]);
      id v21 = [(id)v22 unsignedIntValue];

      LOBYTE(v22) = [v8 doesStatIdExistOnDeviceForArr:v15 startIdx:v20 endIdx:v21 timeAgo:0];
      if ((_DWORD)v17)
      {
        unsigned __int8 v23 = [v8 doesStatIdExistOnDeviceForArr:v15 startIdx:v20 endIdx:v21 timeAgo:v17];
LABEL_9:
        LOBYTE(v22) = v22 & v23;
      }
    }

    else
    {
      uint64_t v22 = [v8 doesStatIdExistOnDevice:v15 timeAgo:0];
      if ((_DWORD)v17)
      {
        unsigned __int8 v23 = [v8 doesStatIdExistOnDevice:v15 timeAgo:v17];
        goto LABEL_9;
      }
    }
  }

  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (BOOL)allStatIdsExistInStatsProvider:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100012B28;
  v6[3] = &unk_10008C970;
  id v7 = &off_1000BD318;
  id v8 = self;
  id v9 = a3;
  id v3 = v9;
  unsigned __int8 v4 = -[TaskingCriteriaRange _checkForWholeCriteriaArray:](v8, "_checkForWholeCriteriaArray:", v6);

  return v4;
}

- (BOOL)evaluateCriteriaUsingStatsProvider:(id)a3 doWhiteListCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[TaskingCriteriaRange validateCriteria](self, "validateCriteria"))
  {
    if (v4 && !-[TaskingCriteriaRange passWhiteListCheck](self, "passWhiteListCheck"))
    {
      id v11 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"NonWhitelistedStatsKey", @"Non-whitelisted key exists in tasking information", 0LL));
      objc_exception_throw(v11);
    }

    else
    {
      if (-[TaskingCriteriaRange allStatIdsExistInStatsProvider:](self, "allStatIdsExistInStatsProvider:", v6))
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100012F38;
        v12[3] = &unk_10008C998;
        v12[4] = self;
        id v13 = v6;
        BOOL v7 = -[TaskingCriteriaRange _evaluateWholeCriteriaArray:](self, "_evaluateWholeCriteriaArray:", v12);

        return v7;
      }

      id v10 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"StatsKeyNotOnDevice", @"Stat key absent from device stats exists in tasking information", 0LL));
      objc_exception_throw(v10);
    }
  }

  else
  {
    id v9 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"CriteriaValidationFail", @"Tasking criteria failed basic validation", 0LL));
    objc_exception_throw(v9);
  }

  __break(1u);
  return result;
}

- (NSArray)myTaskingCriteria
{
  return self->_myTaskingCriteria;
}

- (void)setMyTaskingCriteria:(id)a3
{
}

- (void).cxx_destruct
{
}

@end