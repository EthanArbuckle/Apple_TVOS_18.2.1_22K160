@interface NSDictionary
- (BOOL)fp_isContainer;
- (id)fp_jsonRepresentation;
- (id)fp_mergeAuxDatum:(id)a3 withDatum:(id)a4 forceAggregate:(BOOL)a5;
- (id)fp_mergeWithData:(id)a3;
- (id)fp_mergeWithData:(id)a3 forceAggregate:(BOOL)a4;
@end

@implementation NSDictionary

- (BOOL)fp_isContainer
{
  return 1;
}

- (id)fp_mergeAuxDatum:(id)a3 withDatum:(id)a4 forceAggregate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    unsigned int v9 = [v7 fp_isContainer];
    if (v9 != objc_msgSend(v8, "fp_isContainer")) {
      __assert_rtn( "-[NSDictionary(FPAuxData) fp_mergeAuxDatum:withDatum:forceAggregate:]",  "FPAuxData.m",  18,  "!datum2 || datum1.fp_isContainer == datum2.fp_isContainer");
    }
  }

  if (objc_msgSend(v7, "fp_isContainer"))
  {
    v10 = (FPAuxData *)objc_claimAutoreleasedReturnValue([v7 fp_mergeWithData:v8 forceAggregate:v5]);
  }

  else
  {
    if (!v5 && ![v7 shouldAggregate])
    {
      v11 = 0LL;
      goto LABEL_11;
    }

    if (v8) {
      v10 = -[FPAuxData initWithValue:shouldAggregate:]( [FPAuxData alloc],  "initWithValue:shouldAggregate:",  (char *)[v7 value] + (void)objc_msgSend(v8, "value"),  objc_msgSend(v7, "shouldAggregate"));
    }
    else {
      v10 = (FPAuxData *)v7;
    }
  }

  v11 = v10;
LABEL_11:

  return v11;
}

- (id)fp_mergeWithData:(id)a3
{
  return -[NSDictionary fp_mergeWithData:forceAggregate:](self, "fp_mergeWithData:forceAggregate:", a3, 0LL);
}

- (id)fp_mergeWithData:(id)a3 forceAggregate:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  if (v27 || !v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v8 = self;
    id v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v13]);
          v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary fp_mergeAuxDatum:withDatum:forceAggregate:]( v8,  "fp_mergeAuxDatum:withDatum:forceAggregate:",  v14,  v15,  v4));
          [v7 setObject:v16 forKeyedSubscript:v13];
        }

        id v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
      }

      while (v10);
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v17 = v27;
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v22));

          if (!v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v22]);
            v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary fp_mergeAuxDatum:withDatum:forceAggregate:]( v8,  "fp_mergeAuxDatum:withDatum:forceAggregate:",  v24,  0LL,  v4));
            [v7 setObject:v25 forKeyedSubscript:v22];
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }

      while (v19);
    }

    if ([v7 count]) {
      v6 = v7;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = self;
  }

  return v6;
}

- (id)fp_jsonRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v4 = self;
  id v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9, (void)v13));
        uint64_t v11 = (void *)[v10 fp_jsonRepresentation];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }

      id v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  return v3;
}

@end