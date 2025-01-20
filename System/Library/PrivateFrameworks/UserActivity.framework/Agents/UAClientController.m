@interface UAClientController
- (UAClientController)initWithManager:(id)a3 name:(id)a4;
- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)recentEligibleItemsInOrder:(double)a3;
- (id)userActivityInfoForUUID:(id)a3;
@end

@implementation UAClientController

- (UAClientController)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UAClientController;
  return -[UACornerActionManagerHandler initWithManager:name:](&v5, "initWithManager:name:", a3, a4);
}

- (id)items
{
  return 0LL;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAClientController items](self, "items", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAClientController items](self, "items"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAClientController items](self, "items"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  }

  else
  {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)recentEligibleItemsInOrder:(double)a3
{
  return 0LL;
}

- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3
{
  return 0.0;
}

@end