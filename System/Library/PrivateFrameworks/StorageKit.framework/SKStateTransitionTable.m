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
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v27 = a4;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = (void *)objc_opt_new();
  [v6 setEntriesMap:v7];

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v28 = *(void *)v30;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        [v6 entriesMap];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 state];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKeyedSubscript:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = (void *)objc_opt_new();
          [v6 entriesMap];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 state];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 setObject:v14 forKeyedSubscript:v16];
        }

        [v11 event];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 objectForKeyedSubscript:v17];
        if (objc_claimAutoreleasedReturnValue()) {
          +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:].cold.2();
        }

        if ([v11 selector])
        {
          [v11 selector];
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:].cold.1();
          }
          [v11 state];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 event];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v11 selector];
          [v11 nextState];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[SKStateTransitionEntry entryWithState:event:selector:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:nextState:",  v18,  v19,  v20,  v21);
          [v11 event];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 setObject:v22 forKeyedSubscript:v23];
        }

        else
        {
          [v11 state];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 event];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 action];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 nextState];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = +[SKStateTransitionEntry entryWithState:event:action:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:action:nextState:",  v18,  v19,  v21,  v22);
          [v11 event];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 setObject:v23 forKeyedSubscript:v24];
        }

        ++v10;
      }

      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v9);
  }

  [v6 setSelectorTarget:v27];
  return v6;
}

+ (id)tableWithTransitionEntries:(id)a3
{
  return (id)[a1 tableWithTransitionEntries:a3 selectorTarget:0];
}

- (id)entryForState:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SKStateTransitionTable entriesMap](self, "entriesMap");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v9 objectForKeyedSubscript:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = 0LL;
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

+ (void)tableWithTransitionEntries:selectorTarget:.cold.1()
{
}

+ (void)tableWithTransitionEntries:selectorTarget:.cold.2()
{
  __assert_rtn( "+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]",  "SKStateMachine.m",  83,  "events[entry.event] == nil");
}

@end