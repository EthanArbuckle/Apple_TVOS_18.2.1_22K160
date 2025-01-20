@interface RingtonePurchaseStore
- (RingtonePurchaseStore)init;
- (RingtonePurchaseStore)initWithMangedObjectContext:(id)a3;
- (id)ringtonesForAdamID:(unint64_t)a3 transactionID:(id)a4;
- (void)addRingtonesForPurchases:(id)a3;
- (void)dealloc;
- (void)finalizeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4 toneIdentifier:(id)a5;
- (void)prunePurchasedRingtones;
- (void)removeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4;
- (void)removeRingtonesForPurchases:(id)a3;
- (void)updateRingtonesForPurchases:(id)a3 withDownloads:(id)a4;
@end

@implementation RingtonePurchaseStore

- (RingtonePurchaseStore)init
{
  self->_ownsContext = 1;
  return -[RingtonePurchaseStore initWithMangedObjectContext:]( self,  "initWithMangedObjectContext:",  +[NSThread beginPrivateManagedContextSession](&OBJC_CLASS___NSThread, "beginPrivateManagedContextSession"));
}

- (RingtonePurchaseStore)initWithMangedObjectContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RingtonePurchaseStore;
  v4 = -[RingtonePurchaseStore init](&v6, "init");
  if (v4) {
    v4->_context = (NSManagedObjectContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_ownsContext) {
    +[NSThread endPrivateManagedContextSession](&OBJC_CLASS___NSThread, "endPrivateManagedContextSession");
  }

  self->_context = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RingtonePurchaseStore;
  -[RingtonePurchaseStore dealloc](&v3, "dealloc");
}

- (void)addRingtonesForPurchases:(id)a3
{
  id v5 = +[RingtonePurchase entityFromContext:](&OBJC_CLASS___RingtonePurchase, "entityFromContext:", self->_context);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        v10 = -[RingtonePurchase initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___RingtonePurchase),  "initWithEntity:insertIntoManagedObjectContext:",  v5,  self->_context);
        -[RingtonePurchase loadFromPurchase:](v10, "loadFromPurchase:", v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  sub_10003E244(self->_context);
}

- (void)finalizeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4 toneIdentifier:(id)a5
{
  id v7 = -[RingtonePurchaseStore ringtonesForAdamID:transactionID:](self, "ringtonesForAdamID:transactionID:", a3, a4);
  if ([v7 count])
  {
    id v8 = [v7 objectAtIndex:0];
    [v8 applyUserActionWithToneIdentifier:a5];
    -[NSManagedObjectContext deleteObject:](self->_context, "deleteObject:", v8);
  }

  sub_10003E244(self->_context);
}

- (void)prunePurchasedRingtones
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:]( v3,  "setEntity:",  +[RingtonePurchase entityFromContext:](&OBJC_CLASS___RingtonePurchase, "entityFromContext:", self->_context));
  -[NSFetchRequest setPredicate:]( v3,  "setPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"transactionID != %@",  +[NSNull null](&OBJC_CLASS___NSNull, "null")));
  v4 = -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v3, 0LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSManagedObjectContext deleteObject:]( self->_context,  "deleteObject:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)i));
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  sub_10003E244(self->_context);
}

- (void)removeRingtonesForPurchases:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = SSDownloadPropertyStoreItemIdentifier;
    do
    {
      __int128 v8 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a3);
        }
        id v9 = -[RingtonePurchaseStore ringtonesForAdamID:transactionID:]( self,  "ringtonesForAdamID:transactionID:",  SSGetItemIdentifierFromValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) valueForDownloadProperty:v7]),  0);
        if ([v9 count]) {
          -[NSManagedObjectContext deleteObject:]( self->_context,  "deleteObject:",  [v9 objectAtIndex:0]);
        }
        __int128 v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  sub_10003E244(self->_context);
  if ((_DWORD)v5)
  {
    objc_exception_rethrow();
    __break(1u);
  }

- (void)removeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4
{
  id v5 = -[RingtonePurchaseStore ringtonesForAdamID:transactionID:](self, "ringtonesForAdamID:transactionID:", a3, a4);
  if ([v5 count]) {
    -[NSManagedObjectContext deleteObject:](self->_context, "deleteObject:", [v5 objectAtIndex:0]);
  }
  sub_10003E244(self->_context);
}

- (id)ringtonesForAdamID:(unint64_t)a3 transactionID:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:]( v7,  "setEntity:",  +[RingtonePurchase entityFromContext:](&OBJC_CLASS___RingtonePurchase, "entityFromContext:", self->_context));
  if (!a4) {
    a4 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  }
  -[NSFetchRequest setPredicate:]( v7,  "setPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"adamID = %llu AND transactionID = %@",  a3,  a4));
  __int128 v8 = -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v7, 0LL);

  return v8;
}

- (void)updateRingtonesForPurchases:(id)a3 withDownloads:(id)a4
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v16 = *(void *)v23;
    uint64_t v6 = SSDownloadPropertyStoreItemIdentifier;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(a3);
        }
        id v8 = (id)SSGetItemIdentifierFromValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)i) valueForDownloadProperty:v6]);
        id v9 = -[RingtonePurchaseStore ringtonesForAdamID:transactionID:]( self,  "ringtonesForAdamID:transactionID:",  v8,  0LL);
        if ([v9 count])
        {
          id v10 = [v9 objectAtIndex:0];
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v11 = [a4 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v19;
            while (2)
            {
              for (j = 0LL; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v19 != v12) {
                  objc_enumerationMutation(a4);
                }
                __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
                if ([v14 itemIdentifier] == v8)
                {
                  objc_msgSend(v10, "setTransactionID:", objc_msgSend(v14, "transactionIdentifier"));
                  goto LABEL_17;
                }
              }

              id v11 = [a4 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }

@end