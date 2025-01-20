@interface RMStatusSubscriptionItem
- (id)reportDetails;
- (void)prepareForDeletion;
@end

@implementation RMStatusSubscriptionItem

- (void)prepareForDeletion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem managedObjectContext](self, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem subscribedStatusKeyPaths](self, "subscribedStatusKeyPaths"));
  id v6 = [v5 copy];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 statusSubscriptionItems]);
        unsigned int v14 = [v13 isEqualToSet:v4];

        if (v14) {
          [v3 deleteObject:v12];
        }
        [v12 removeStatusSubscriptionItemsObject:self];
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RMStatusSubscriptionItem;
  -[RMStatusSubscriptionItem prepareForDeletion](&v15, "prepareForDeletion");
}

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem keyPath](self, "keyPath"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"keyPath");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem predicate](self, "predicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 predicateFormat]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"predicate");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem properties](self, "properties"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"properties");

  return v3;
}

@end