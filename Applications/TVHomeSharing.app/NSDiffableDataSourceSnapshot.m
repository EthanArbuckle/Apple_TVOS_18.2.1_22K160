@interface NSDiffableDataSourceSnapshot
+ (id)tvh_diffableDataSourceSnapshotWithContentProvider:(id)a3 itemIdentifiersOfAmendedItems:(id)a4 itemIdentifiersToReloadBlock:(id)a5;
@end

@implementation NSDiffableDataSourceSnapshot

+ (id)tvh_diffableDataSourceSnapshotWithContentProvider:(id)a3 itemIdentifiersOfAmendedItems:(id)a4 itemIdentifiersToReloadBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v26 = (uint64_t (**)(id, id))a5;
  v9 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sectionIdentifiers]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 array]);
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v9, "appendSectionsWithIdentifiers:", v11);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v7 itemIdentifiersInSectionWithIdentifier:v17]);
        v19 = v18;
        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 array]);
          -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v9,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v20,  v17);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v14);
  }

  if ([v8 count])
  {
    if (v26)
    {
      uint64_t v21 = v26[2](v26, v8);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      id v22 = v8;
    }

    v23 = v22;
    if ([v22 count])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);
      -[NSDiffableDataSourceSnapshot reloadItemsWithIdentifiers:](v9, "reloadItemsWithIdentifiers:", v24);
    }
  }

  return v9;
}

@end