@interface DMDEventSubscriptionManager
- (BOOL)setEventSubscriptionRegistrations:(id)a3 error:(id *)a4;
- (DMDEventSubscriptionManager)init;
- (NSMutableDictionary)eventSubscriptionsByIdentifier;
- (id)eventStatusesByPayloadIdentifierSinceStartDate:(id)a3 organizationIdentifier:(id)a4;
- (id)eventsHandler;
- (void)setEventSubscriptionsByIdentifier:(id)a3;
- (void)setEventsHandler:(id)a3;
@end

@implementation DMDEventSubscriptionManager

- (DMDEventSubscriptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDEventSubscriptionManager;
  v2 = -[DMDEventSubscriptionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    eventSubscriptionsByIdentifier = v2->_eventSubscriptionsByIdentifier;
    v2->_eventSubscriptionsByIdentifier = v3;
  }

  return v2;
}

- (BOOL)setEventSubscriptionRegistrations:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v24 = [v7 mutableCopy];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 payloadMetadata]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 organization]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEventSubscriptionManager eventSubscriptionsByIdentifier]( self,  "eventSubscriptionsByIdentifier"));
        v17 = (DMDEventSubscriptionRegistrationController *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

        if (v17)
        {
          -[DMDEventSubscriptionRegistrationController updateWithSubscriptionRegistration:]( v17,  "updateWithSubscriptionRegistration:",  v10);
        }

        else
        {
          objc_initWeak(&location, self);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_100039844;
          v25[3] = &unk_10009EA30;
          objc_copyWeak(&v28, &location);
          id v26 = v14;
          id v27 = v13;
          v18 = objc_retainBlock(v25);
          v17 = -[DMDEventSubscriptionRegistrationController initWithSubscriptionRegistration:streamEventsHandler:]( objc_alloc(&OBJC_CLASS___DMDEventSubscriptionRegistrationController),  "initWithSubscriptionRegistration:streamEventsHandler:",  v10,  v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEventSubscriptionManager eventSubscriptionsByIdentifier]( self,  "eventSubscriptionsByIdentifier"));
          [v19 setObject:v17 forKeyedSubscript:v15];

          objc_destroyWeak(&v28);
          objc_destroyWeak(&location);
        }

        [v24 removeObject:v15];
      }

      id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v8);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  [v20 removeObjectsForKeys:v24];

  return 1;
}

- (id)eventStatusesByPayloadIdentifierSinceStartDate:(id)a3 organizationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  id v9 = [v8 copy];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000399CC;
  v16[3] = &unk_10009EA58;
  id v17 = v7;
  v10 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v9 count]);
  v18 = v10;
  id v19 = v6;
  id v11 = v6;
  id v12 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)eventsHandler
{
  return self->_eventsHandler;
}

- (void)setEventsHandler:(id)a3
{
}

- (NSMutableDictionary)eventSubscriptionsByIdentifier
{
  return self->_eventSubscriptionsByIdentifier;
}

- (void)setEventSubscriptionsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end