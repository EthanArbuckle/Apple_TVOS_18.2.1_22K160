@interface MTSafeUuidQueryObserver
- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)addResultsChangedHandler:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerWillChangeContent:(id)a3;
- (void)notifyObservers;
- (void)startObserving;
@end

@implementation MTSafeUuidQueryObserver

- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  currentItems = self->currentItems;
  self->currentItems = v8;

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTSafeUuidQueryObserver;
  v10 = -[MTSafeUuidQueryObserver initWithFetchRequest:managedObjectContext:]( &v12,  "initWithFetchRequest:managedObjectContext:",  v7,  v6);

  return v10;
}

- (id)addResultsChangedHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTSafeUuidQueryObserver;
  id v5 = -[MTSafeUuidQueryObserver addResultsChangedHandler:](&v8, "addResultsChangedHandler:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)startObserving
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTSafeUuidQueryObserver;
  -[MTSafeUuidQueryObserver startObserving](&v4, "startObserving");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100026E3C;
  v3[3] = &unk_100240D18;
  v3[4] = self;
  -[MTSafeUuidQueryObserver results:](self, "results:", v3);
}

- (void)notifyObservers
{
  id v10 = -[NSMutableSet mutableCopy](self->currentItems, "mutableCopy");
  [v10 intersectSet:self->currentInserts];
  -[NSMutableSet minusSet:](self->currentInserts, "minusSet:", v10);
  -[NSMutableSet unionSet:](self->currentUpdates, "unionSet:", v10);
  -[NSMutableSet intersectSet:](self->currentDeletes, "intersectSet:", self->currentItems);
  -[NSMutableSet intersectSet:](self->currentUpdates, "intersectSet:", self->currentItems);
  -[NSMutableSet unionSet:](self->currentItems, "unionSet:", self->currentInserts);
  -[NSMutableSet minusSet:](self->currentItems, "minusSet:", self->currentDeletes);
  id v3 = -[NSMutableSet copy](self->currentInserts, "copy");
  id v4 = -[NSMutableSet copy](self->currentDeletes, "copy");
  id v5 = -[NSMutableSet copy](self->currentUpdates, "copy");
  currentInserts = self->currentInserts;
  self->currentInserts = 0LL;

  currentDeletes = self->currentDeletes;
  self->currentDeletes = 0LL;

  currentUpdates = self->currentUpdates;
  self->currentUpdates = 0LL;

  if ([v5 count] || objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSafeUuidQueryObserver handlers](self, "handlers"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000270A0;
    v11[3] = &unk_100240D40;
    id v12 = v4;
    id v13 = v3;
    id v14 = v5;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  currentInserts = self->currentInserts;
  self->currentInserts = v4;

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  currentDeletes = self->currentDeletes;
  self->currentDeletes = v6;

  objc_super v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  currentUpdates = self->currentUpdates;
  self->currentUpdates = v8;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"uuid"]);
  if (v10)
  {
    if (a6 == 2)
    {
      uint64_t v11 = 16LL;
    }

    else if (a6 == 1)
    {
      uint64_t v11 = 8LL;
    }

    else
    {
      uint64_t v11 = 24LL;
    }

    [*(id *)&self->MTBaseQueryObserver_opaque[v11] addObject:v10];
  }

  else
  {
    uint64_t v12 = _MTLogCategoryDatabase(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "MTSafeUUIDQueryObserver has no UUID for object %@",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end