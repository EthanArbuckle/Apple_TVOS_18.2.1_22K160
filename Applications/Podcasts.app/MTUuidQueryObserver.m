@interface MTUuidQueryObserver
- (NSArray)uuidOrder;
- (NSSet)uuidSet;
- (id)addResultsChangedHandler:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)notifyObservers;
- (void)setUuidOrder:(id)a3;
- (void)setUuidSet:(id)a3;
- (void)startObserving;
@end

@implementation MTUuidQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTUuidQueryObserver;
  id v5 = -[MTUuidQueryObserver addResultsChangedHandler:](&v8, "addResultsChangedHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)startObserving
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTUuidQueryObserver;
  -[MTUuidQueryObserver startObserving](&v3, "startObserving");
  -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
}

- (void)notifyObservers
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10006EE14;
  v18 = sub_10006EE24;
  id v19 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006EE2C;
  v13[3] = &unk_1002424F8;
  v13[4] = &v14;
  -[MTUuidQueryObserver results:](self, "results:", v13);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver uuidOrder](self, "uuidOrder"));
  id v4 = objc_alloc(&OBJC_CLASS___NSSet);
  id v5 = -[NSSet initWithArray:](v4, "initWithArray:", v15[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver uuidSet](self, "uuidSet"));
  id v7 = [v6 mutableCopy];
  [v7 minusSet:v5];
  id v8 = -[NSSet mutableCopy](v5, "mutableCopy");
  [v8 minusSet:v6];
  -[MTUuidQueryObserver setUuidSet:](self, "setUuidSet:", v5);
  -[MTUuidQueryObserver setUuidOrder:](self, "setUuidOrder:", v15[5]);
  if ([v7 count]
    || [v8 count]
    || ([v3 isEqual:v15[5]] & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver handlers](self, "handlers"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10006EE74;
    v10[3] = &unk_100242520;
    id v11 = v7;
    id v12 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }

  _Block_object_dispose(&v14, 8);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 delegate]);

  if (v4) {
    -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
  }
}

- (NSSet)uuidSet
{
  return self->_uuidSet;
}

- (void)setUuidSet:(id)a3
{
}

- (NSArray)uuidOrder
{
  return self->_uuidOrder;
}

- (void)setUuidOrder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end