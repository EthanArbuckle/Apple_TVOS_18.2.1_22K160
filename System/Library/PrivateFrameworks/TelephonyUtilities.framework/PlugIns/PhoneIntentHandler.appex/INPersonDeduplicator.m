@interface INPersonDeduplicator
+ (id)dedupeINPersons:(id)a3;
@end

@implementation INPersonDeduplicator

+ (id)dedupeINPersons:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v45;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[INPersonWrapper initWithINPerson:]( objc_alloc(&OBJC_CLASS___INPersonWrapper),  "initWithINPerson:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)v10));
          -[NSMutableOrderedSet addObject:](v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }

      while (v8);
    }

    id v12 = IntentHandlerDefaultLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 count];
      id v15 = -[NSMutableOrderedSet count](v5, "count");
      *(_DWORD *)buf = 134218240;
      id v52 = v14;
      __int16 v53 = 2048;
      id v54 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Before deduping: %ld, After deduping: %ld",  buf,  0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](v5, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 tuHandle]);

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    v18 = v5;
    id v19 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v41;
      while (2)
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v40 + 1) + 8 * (void)v22) tuHandle]);
          int v24 = TUHandlesAreCanonicallyEqual(v23, v17);

          if (!v24)
          {

            v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            v29 = v18;
            id v30 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v37;
              do
              {
                v33 = 0LL;
                do
                {
                  if (*(void *)v37 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  v34 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v36 + 1) + 8 * (void)v33),  "inPerson",  (void)v36));
                  -[NSMutableArray addObject:](v27, "addObject:", v34);

                  v33 = (char *)v33 + 1;
                }

                while (v31 != v33);
                id v31 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
              }

              while (v31);
            }

            id v4 = -[NSMutableArray copy](v27, "copy");
            goto LABEL_31;
          }

          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v25 = IntentHandlerDefaultLog();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "All persons have equivalent handle values",  buf,  2u);
    }

    v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](v18, "firstObject"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray inPerson](v27, "inPerson"));
    v49 = v28;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));

LABEL_31:
  }

  else
  {
    id v4 = v3;
  }

  return v4;
}

@end