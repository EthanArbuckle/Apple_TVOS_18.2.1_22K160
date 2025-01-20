@interface ScoreBasedResolver
- (BOOL)confirmationEnabled;
- (BOOL)includeAllEntitiesInDisambiguation;
- (NSArray)entities;
- (NSMutableDictionary)scoreByEntity;
- (NSMutableDictionary)scoreReasonsByEntity;
- (ScoreBasedResolutionResult)cachedResult;
- (ScoreBasedResolutionResult)result;
- (ScoreBasedResolver)initWithEntities:(id)a3;
- (id)nameForResolutionResultType:(unint64_t)a3;
- (int64_t)confirmationMargin;
- (int64_t)successfulResolutionMargin;
- (void)addScore:(int64_t)a3 forEntities:(id)a4 reason:(id)a5;
- (void)addScore:(int64_t)a3 forEntity:(id)a4 reason:(id)a5;
- (void)setCachedResult:(id)a3;
- (void)setConfirmationEnabled:(BOOL)a3;
- (void)setConfirmationMargin:(int64_t)a3;
- (void)setEntities:(id)a3;
- (void)setIncludeAllEntitiesInDisambiguation:(BOOL)a3;
- (void)setScoreByEntity:(id)a3;
- (void)setScoreReasonsByEntity:(id)a3;
- (void)setSuccessfulResolutionMargin:(int64_t)a3;
@end

@implementation ScoreBasedResolver

- (ScoreBasedResolver)initWithEntities:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ScoreBasedResolver;
  v5 = -[ScoreBasedResolver init](&v24, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    entities = v5->_entities;
    v5->_entities = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    scoreByEntity = v5->_scoreByEntity;
    v5->_scoreByEntity = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    scoreReasonsByEntity = v5->_scoreReasonsByEntity;
    v5->_scoreReasonsByEntity = v10;

    *(_OWORD *)&v5->_successfulResolutionMargin = xmmword_100026760;
    v5->_confirmationEnabled = 1;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16);
          v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_scoreReasonsByEntity,  "setObject:forKeyedSubscript:",  v18,  v17,  (void)v20);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_scoreByEntity,  "setObject:forKeyedSubscript:",  &off_100035CC8,  v17);
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v14);
    }
  }

  return v5;
}

- (void)addScore:(int64_t)a3 forEntity:(id)a4 reason:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  cachedResult = self->_cachedResult;
  self->_cachedResult = 0LL;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_scoreByEntity, "objectForKeyedSubscript:", v16));
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Attempting to add a score for an entity not part of original entity set",  0LL));
    [v11 raise];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v10 integerValue] + a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scoreByEntity, "setObject:forKeyedSubscript:", v12, v16);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_scoreReasonsByEntity,  "objectForKeyedSubscript:",  v16));
  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Attempting to add a score reason for an entity not part of the original entity set",  0LL));
    [v14 raise];
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld: %@", a3, v8));
  [v13 addObject:v15];
}

- (void)addScore:(int64_t)a3 forEntities:(id)a4 reason:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v8);
        }
        -[ScoreBasedResolver addScore:forEntity:reason:]( self,  "addScore:forEntity:reason:",  a3,  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13),  v9);
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (void)setSuccessfulResolutionMargin:(int64_t)a3
{
  if (self->_successfulResolutionMargin != a3)
  {
    cachedResult = self->_cachedResult;
    self->_cachedResult = 0LL;

    self->_successfulResolutionMargin = a3;
  }

- (void)setConfirmationMargin:(int64_t)a3
{
  if (self->_confirmationMargin != a3)
  {
    cachedResult = self->_cachedResult;
    self->_cachedResult = 0LL;

    self->_confirmationMargin = a3;
  }

- (void)setConfirmationEnabled:(BOOL)a3
{
  if (self->_confirmationEnabled != a3)
  {
    cachedResult = self->_cachedResult;
    self->_cachedResult = 0LL;

    self->_confirmationEnabled = a3;
  }

- (ScoreBasedResolutionResult)result
{
  v2 = self;
  cachedResult = self->_cachedResult;
  if (cachedResult) {
    return cachedResult;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver entities](v2, "entities"));
  id v6 = [v5 countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v87;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v87 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver scoreByEntity](v2, "scoreByEntity"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

        id v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12));
        if (!v13)
        {
          id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, v12);
        }

        -[NSMutableArray addObject:](v13, "addObject:", v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v86 objects:v94 count:16];
    }

    while (v7);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sortedArrayUsingSelector:"compare:"]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 reverseObjectEnumerator]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
  v19 = [v18 integerValue];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v20));
  id v22 = [v21 count];

  if ((unint64_t)[v17 count] < 2)
  {
    objc_super v24 = 0LL;
  }

  else
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:1]);
    objc_super v24 = [v23 integerValue];
  }

  if (v22 != (id)1) {
    goto LABEL_18;
  }
  if (v19 - v24 >= -[ScoreBasedResolver successfulResolutionMargin](v2, "successfulResolutionMargin"))
  {
    uint64_t v34 = 1LL;
  }

  else
  {
    if (!-[ScoreBasedResolver confirmationEnabled](v2, "confirmationEnabled")
      || v19 - v24 < -[ScoreBasedResolver confirmationMargin](v2, "confirmationMargin"))
    {
LABEL_18:
      v66 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v25 = -[ScoreBasedResolver confirmationMargin](v2, "confirmationMargin");
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      id v26 = v17;
      id v27 = [v26 countByEnumeratingWithState:&v82 objects:v93 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = v19 - v25;
        uint64_t v30 = *(void *)v83;
LABEL_20:
        uint64_t v31 = 0LL;
        while (1)
        {
          if (*(void *)v83 != v30) {
            objc_enumerationMutation(v26);
          }
          v32 = *(void **)(*((void *)&v82 + 1) + 8 * v31);
          if (!-[ScoreBasedResolver includeAllEntitiesInDisambiguation](v2, "includeAllEntitiesInDisambiguation")
            && (uint64_t)[v32 integerValue] < v29)
          {
            break;
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v32));
          -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v33);

          if (v28 == (id)++v31)
          {
            id v28 = [v26 countByEnumeratingWithState:&v82 objects:v93 count:16];
            if (v28) {
              goto LABEL_20;
            }
            break;
          }
        }
      }

      uint64_t v34 = 3LL;
      goto LABEL_31;
    }

    uint64_t v34 = 2LL;
  }

  id v26 = (id)objc_claimAutoreleasedReturnValue([v17 firstObject]);
  v66 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v26));
LABEL_31:

  v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver entities](v2, "entities"));
  id v37 = [v36 count];
  uint64_t v60 = v34;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver nameForResolutionResultType:](v2, "nameForResolutionResultType:", v34));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Resolved %ld entities. Result = %@",  v37,  v38));
  -[NSMutableArray addObject:](v35, "addObject:", v39);

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = v17;
  id v63 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v79;
    do
    {
      uint64_t v40 = 0LL;
      do
      {
        if (*(void *)v79 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v40;
        v41 = *(void **)(*((void *)&v78 + 1) + 8 * v40);
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        v68 = v41;
        id v65 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:"));
        id v69 = [v65 countByEnumeratingWithState:&v74 objects:v91 count:16];
        if (v69)
        {
          uint64_t v67 = *(void *)v75;
          do
          {
            for (j = 0LL; j != v69; j = (char *)j + 1)
            {
              if (*(void *)v75 != v67) {
                objc_enumerationMutation(v65);
              }
              uint64_t v43 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)j);
              unsigned int v44 = -[NSMutableArray containsObject:](v66, "containsObject:", v43);
              id v45 = [v68 integerValue];
              v46 = &stru_100034C18;
              if (v44) {
                v46 = @" (chosen)";
              }
              v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld%@: %@",  v45,  v46,  v43));
              -[NSMutableArray addObject:](v35, "addObject:", v47);

              __int128 v72 = 0u;
              __int128 v73 = 0u;
              __int128 v70 = 0u;
              __int128 v71 = 0u;
              v48 = v2;
              v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_scoreReasonsByEntity,  "objectForKeyedSubscript:",  v43));
              id v50 = [v49 countByEnumeratingWithState:&v70 objects:v90 count:16];
              if (v50)
              {
                id v51 = v50;
                uint64_t v52 = *(void *)v71;
                do
                {
                  for (k = 0LL; k != v51; k = (char *)k + 1)
                  {
                    if (*(void *)v71 != v52) {
                      objc_enumerationMutation(v49);
                    }
                    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\t%@",  *(void *)(*((void *)&v70 + 1) + 8LL * (void)k)));
                    -[NSMutableArray addObject:](v35, "addObject:", v54);
                  }

                  id v51 = [v49 countByEnumeratingWithState:&v70 objects:v90 count:16];
                }

                while (v51);
              }

              v2 = v48;
            }

            id v69 = [v65 countByEnumeratingWithState:&v74 objects:v91 count:16];
          }

          while (v69);
        }

        uint64_t v40 = v64 + 1;
      }

      while ((id)(v64 + 1) != v63);
      id v63 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
    }

    while (v63);
  }

  v55 = objc_alloc(&OBJC_CLASS___ScoreBasedResolutionResult);
  id v56 = -[NSMutableArray copy](v35, "copy");
  v57 = -[ScoreBasedResolutionResult initWithType:resolvedEntities:resolutionSummary:]( v55,  "initWithType:resolvedEntities:resolutionSummary:",  v60,  v66,  v56);
  v58 = v2->_cachedResult;
  v2->_cachedResult = v57;

  cachedResult = v2->_cachedResult;
  return cachedResult;
}

- (id)nameForResolutionResultType:(unint64_t)a3
{
  if (a3 > 3) {
    return 0LL;
  }
  else {
    return off_1000346B8[a3];
  }
}

- (int64_t)successfulResolutionMargin
{
  return self->_successfulResolutionMargin;
}

- (int64_t)confirmationMargin
{
  return self->_confirmationMargin;
}

- (BOOL)confirmationEnabled
{
  return self->_confirmationEnabled;
}

- (BOOL)includeAllEntitiesInDisambiguation
{
  return self->_includeAllEntitiesInDisambiguation;
}

- (void)setIncludeAllEntitiesInDisambiguation:(BOOL)a3
{
  self->_includeAllEntitiesInDisambiguation = a3;
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (NSMutableDictionary)scoreByEntity
{
  return self->_scoreByEntity;
}

- (void)setScoreByEntity:(id)a3
{
}

- (NSMutableDictionary)scoreReasonsByEntity
{
  return self->_scoreReasonsByEntity;
}

- (void)setScoreReasonsByEntity:(id)a3
{
}

- (ScoreBasedResolutionResult)cachedResult
{
  return self->_cachedResult;
}

- (void)setCachedResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end