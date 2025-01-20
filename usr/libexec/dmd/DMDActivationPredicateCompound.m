@interface DMDActivationPredicateCompound
- (DMDActivationPredicateCompound)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObservers:(id)a5 predicate:(id)a6;
- (NSArray)subPredicateObservers;
- (id)metadata;
- (void)invalidate;
- (void)reportActivationPredicateObserverDidTrigger;
- (void)updateObserverRegistration;
@end

@implementation DMDActivationPredicateCompound

- (DMDActivationPredicateCompound)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObservers:(id)a5 predicate:(id)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateCompound;
  v11 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v15,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  a6);
  if (v11)
  {
    v12 = (NSArray *)[v10 copy];
    subPredicateObservers = v11->_subPredicateObservers;
    v11->_subPredicateObservers = v12;
  }

  return v11;
}

- (void)updateObserverRegistration
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver updateObserverRegistration](&v12, "updateObserverRegistration");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) updateObserverRegistration];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)invalidate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers"));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) invalidate];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver invalidate](&v8, "invalidate");
}

- (id)metadata
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateCompound;
  id v3 = -[DMDActivationPredicateObserver metadata](&v18, "metadata");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) metadata]);
        if (v12) {
          [v6 addObject:v12];
        }

        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }

  if ([v6 count]) {
    [v4 setObject:v6 forKeyedSubscript:DMFDeclarationStatePredicateSubPredicatesKey];
  }

  return v4;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver reportActivationPredicateObserverDidTrigger]( &v12,  "reportActivationPredicateObserverDidTrigger");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) reportActivationPredicateObserverDidTrigger];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }

    while (v5);
  }
}

- (NSArray)subPredicateObservers
{
  return self->_subPredicateObservers;
}

- (void).cxx_destruct
{
}

@end