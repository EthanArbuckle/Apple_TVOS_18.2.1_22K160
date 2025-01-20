@interface RMStatusSubscriptionQueryResult
- (NSDictionary)lastReceivedDateByKeyPath;
- (RMStatusSubscriptionQueryResult)init;
- (RMStatusSubscriptionQueryResult)initWithQueryResult:(id)a3 lastReceivedDateByKeyPath:(id)a4;
- (RMStatusSubscriptionQueryResult)initWithStatusKeyPaths:(id)a3 lastReceivedDateByKeyPath:(id)a4 statusByKeyPath:(id)a5 errorByKeyPath:(id)a6;
@end

@implementation RMStatusSubscriptionQueryResult

- (RMStatusSubscriptionQueryResult)init
{
  v3 = objc_opt_new(&OBJC_CLASS___NSSet);
  v4 = -[RMStatusSubscriptionQueryResult initWithStatusKeyPaths:lastReceivedDateByKeyPath:statusByKeyPath:errorByKeyPath:]( self,  "initWithStatusKeyPaths:lastReceivedDateByKeyPath:statusByKeyPath:errorByKeyPath:",  v3,  &__NSDictionary0__struct,  &__NSDictionary0__struct,  &__NSDictionary0__struct);

  return v4;
}

- (RMStatusSubscriptionQueryResult)initWithStatusKeyPaths:(id)a3 lastReceivedDateByKeyPath:(id)a4 statusByKeyPath:(id)a5 errorByKeyPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RMStatusSubscriptionQueryResult;
  v12 = -[RMStatusQueryResult initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:]( &v28,  "initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:",  v10,  a5,  a6);
  if (v12)
  {
    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v19, (void)v24));
          if (v20) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, v19);
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v16);
    }

    v21 = (NSDictionary *)-[NSMutableDictionary copy](v13, "copy");
    lastReceivedDateByKeyPath = v12->_lastReceivedDateByKeyPath;
    v12->_lastReceivedDateByKeyPath = v21;
  }

  return v12;
}

- (RMStatusSubscriptionQueryResult)initWithQueryResult:(id)a3 lastReceivedDateByKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 statusKeyPaths]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 statusByKeyPath]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 errorByKeyPath]);

  id v11 = -[RMStatusSubscriptionQueryResult initWithStatusKeyPaths:lastReceivedDateByKeyPath:statusByKeyPath:errorByKeyPath:]( self,  "initWithStatusKeyPaths:lastReceivedDateByKeyPath:statusByKeyPath:errorByKeyPath:",  v8,  v6,  v9,  v10);
  return v11;
}

- (NSDictionary)lastReceivedDateByKeyPath
{
  return self->_lastReceivedDateByKeyPath;
}

- (void).cxx_destruct
{
}

@end