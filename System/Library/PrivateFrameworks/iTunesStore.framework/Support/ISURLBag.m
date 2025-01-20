@interface ISURLBag
+ (id)copyAllowedAutomaticDownloadKindsInBagContext:(id)a3;
@end

@implementation ISURLBag

+ (id)copyAllowedAutomaticDownloadKindsInBagContext:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", a3);
  id v6 = [v5 valueForKey:@"automatic-downloads2"];
  if (!v6) {
    id v6 = [v5 valueForKey:@"automatic-downloads"];
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = [v6 objectForKey:@"configurations"];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          v13 = 0LL;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v8);
            }
            id v14 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) objectForKey:@"media-types"];
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
              -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v14);
            }
            v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }

        while (v11);
      }
    }
  }

  return v4;
}

@end