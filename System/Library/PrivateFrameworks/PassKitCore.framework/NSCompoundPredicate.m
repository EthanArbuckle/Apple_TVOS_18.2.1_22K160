@interface NSCompoundPredicate
- (id)passd_sqlPredicateForSelect;
@end

@implementation NSCompoundPredicate

- (id)passd_sqlPredicateForSelect
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSCompoundPredicate subpredicates](self, "subpredicates"));
  id v4 = [v3 count];

  if (v4)
  {
    NSCompoundPredicateType v5 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
    if (v5)
    {
      NSCompoundPredicateType v6 = v5;
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCompoundPredicate subpredicates](self, "subpredicates", 0LL));
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          v12 = 0LL;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v12),  "passd_sqlPredicateForSelect"));
            if (v13) {
              -[NSMutableArray addObject:](v7, "addObject:", v13);
            }

            v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v10);
      }

      if (v6 == NSOrPredicateType)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v7));
      }

      else
      {
        if (v6 != NSAndPredicateType)
        {

          id v4 = 0LL;
          return v4;
        }

        uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
      }
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCompoundPredicate subpredicates](self, "subpredicates"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "passd_sqlPredicateForSelect"));

      if (!v7)
      {
        id v4 = 0LL;
        goto LABEL_19;
      }

      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v7));
    }

    id v4 = (id)v14;
LABEL_19:
  }

  return v4;
}

@end