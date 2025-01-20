@interface PBSystemGestureDefaultSelectionPolicy
- (BOOL)performsSelectiveFiltering;
- (id)selectSystemGestureUsingActiveRecipeEnumerator:(id)a3;
@end

@implementation PBSystemGestureDefaultSelectionPolicy

- (BOOL)performsSelectiveFiltering
{
  return 0;
}

- (id)selectSystemGestureUsingActiveRecipeEnumerator:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextObject]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "level", (void)v14);
        if ((uint64_t)v11 > (uint64_t)[v4 level])
        {
          id v12 = v10;

          v4 = v12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

@end