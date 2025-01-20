@interface GTObservableService
- (GTObservableService)init;
- (unint64_t)count;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyAll:(id)a3;
@end

@implementation GTObservableService

- (GTObservableService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTObservableService;
  v2 = -[GTObservableService init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    observerIdToObserver = v2->_observerIdToObserver;
    v2->_observerIdToObserver = v3;

    v2->_nextObserverId = 1LL;
  }

  return v2;
}

- (unint64_t)registerObserver:(id)a3
{
  observerIdToObserver = self->_observerIdToObserver;
  unint64_t nextObserverId = self->_nextObserverId;
  self->_unint64_t nextObserverId = nextObserverId + 1;
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  nextObserverId));
  -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToObserver, "setObject:forKeyedSubscript:", v5, v6);

  return nextObserverId;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToObserver = self->_observerIdToObserver;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](observerIdToObserver, "removeObjectForKey:", v4);
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  v7 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v8 = -[NSMutableDictionary count](self->_observerIdToObserver, "count");
  v9 = v7;
  v10 = v6;
  v27 = -[NSMutableArray initWithCapacity:](v9, "initWithCapacity:", v8);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  obj = self->_observerIdToObserver;
  id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  v29 = v6;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observerIdToObserver,  "objectForKeyedSubscript:",  v15,  v27));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 connection]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 connection]);
        if (v17 == v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v16 replyPath]);
          int v21 = MessagePathEndsWith(v20, v28);

          v10 = v29;
          if (v21) {
            -[NSMutableArray addObject:](v27, "addObject:", v15);
          }
        }

        else
        {
        }
      }

      id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    }

    while (v12);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v22 = v27;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        -[GTObservableService deregisterObserver:]( self,  "deregisterObserver:",  objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)j), "unsignedLongValue", v27));
      }

      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    }

    while (v24);
  }
}

- (void)notifyAll:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_observerIdToObserver;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observerIdToObserver,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9),  (void)v11));
        v4[2](v4, v10);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_observerIdToObserver, "count");
}

- (void).cxx_destruct
{
}

@end