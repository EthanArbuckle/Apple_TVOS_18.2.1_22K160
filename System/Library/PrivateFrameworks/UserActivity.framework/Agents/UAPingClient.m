@interface UAPingClient
- (BOOL)active;
- (BOOL)hasBeenUsedAtLeastOnce;
- (UAPingClient)initWithController:(id)a3;
- (UAPingController)controller;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (int64_t)priority;
- (void)pushItem:(id)a3;
- (void)removeItem:(id)a3;
- (void)setHasBeenUsedAtLeastOnce:(BOOL)a3;
@end

@implementation UAPingClient

- (UAPingClient)initWithController:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 manager]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UAPingClient;
  v7 = -[UAClientController initWithManager:name:](&v11, "initWithManager:name:", v6, @"PingCreator");

  if (v7)
  {
    objc_storeStrong((id *)&v7->_controller, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    items = v7->_items;
    v7->_items = (NSMutableArray *)v8;
  }

  return v7;
}

- (id)items
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2->_items));
  objc_sync_exit(v2);

  return v3;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableArray copy](v2->_items, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)pushItem:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[UAPingClient setHasBeenUsedAtLeastOnce:](v4, "setHasBeenUsedAtLeastOnce:", 1LL);
  if ((-[NSMutableArray containsObject:](v4->_items, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableArray insertObject:atIndex:](v4->_items, "insertObject:atIndex:", v6, 0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v4, "manager"));
    [v5 scheduleUpdatingAdvertisableItems];
  }

  objc_sync_exit(v4);
}

- (void)removeItem:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v6)
  {
  }

  else
  {
    -[NSMutableArray removeAllObjects](v4->_items, "removeAllObjects");
  }

  objc_sync_exit(v4);
}

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingClient items](self, "items"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 anyObject]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (int64_t)priority
{
  return 1000LL;
}

- (id)statusString
{
  if (-[UAPingClient hasBeenUsedAtLeastOnce](self, "hasBeenUsedAtLeastOnce"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingClient items](self, "items"));
    id v4 = [v3 count];
    if (v4) {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_items, "firstObject"));
    }
    else {
      id v5 = @"-";
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PingCreator:%@\n",  v5));
    if (v4) {
  }
    }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (UAPingController)controller
{
  return (UAPingController *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)hasBeenUsedAtLeastOnce
{
  return self->_hasBeenUsedAtLeastOnce;
}

- (void)setHasBeenUsedAtLeastOnce:(BOOL)a3
{
  self->_hasBeenUsedAtLeastOnce = a3;
}

- (void).cxx_destruct
{
}

@end