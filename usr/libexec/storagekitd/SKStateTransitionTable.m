@interface SKStateTransitionTable
+ (id)tableWithTransitionEntries:(id)a3;
+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4;
- (NSMutableDictionary)entriesMap;
- (id)entryForState:(id)a3 event:(id)a4;
- (id)selectorTarget;
- (void)setEntriesMap:(id)a3;
- (void)setSelectorTarget:(id)a3;
@end

@implementation SKStateTransitionTable

+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v7 = objc_alloc_init((Class)objc_opt_class(a1));
  v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
  [v7 setEntriesMap:v9];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v31 = *(void *)v33;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v33 != v31) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 entriesMap]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

        if (!v16)
        {
          v16 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v7 entriesMap]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
          [v18 setObject:v16 forKeyedSubscript:v19];
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v13 event]);
        if (objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v20])) {
          sub_10002D518();
        }

        if ([v13 selector])
        {
          if ((objc_opt_respondsToSelector(v30, [v13 selector]) & 1) == 0) {
            sub_10002D4F0();
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 event]);
          id v23 = [v13 selector];
          v24 = (void *)objc_claimAutoreleasedReturnValue([v13 nextState]);
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateTransitionEntry entryWithState:event:selector:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:nextState:",  v21,  v22,  v23,  v24));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v13 event]);
          [v16 setObject:v25 forKeyedSubscript:v26];
        }

        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 event]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v13 action]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v13 nextState]);
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateTransitionEntry entryWithState:event:action:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:action:nextState:",  v21,  v22,  v24,  v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v13 event]);
          [v16 setObject:v26 forKeyedSubscript:v27];
        }

        v12 = (char *)v12 + 1;
      }

      while (v11 != v12);
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v11);
  }

  [v7 setSelectorTarget:v30];
  return v7;
}

+ (id)tableWithTransitionEntries:(id)a3
{
  return [a1 tableWithTransitionEntries:a3 selectorTarget:0];
}

- (id)entryForState:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateTransitionTable entriesMap](self, "entriesMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if (v9) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
}

- (id)selectorTarget
{
  return self->_selectorTarget;
}

- (void)setSelectorTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end