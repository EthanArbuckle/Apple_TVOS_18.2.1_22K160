@interface PKPaymentTransactionMapsUpdateProcessorRequest
- (BOOL)coalesceWithConfigurations:(id)a3;
- (NSArray)configurations;
- (PKPaymentTransactionMapsUpdateProcessorRequest)initWithConfigurations:(id)a3;
- (id)description;
- (id)mapIdentifiers;
@end

@implementation PKPaymentTransactionMapsUpdateProcessorRequest

- (PKPaymentTransactionMapsUpdateProcessorRequest)initWithConfigurations:(id)a3
{
  id v4 = a3;
  v5 = -[PKPaymentTransactionMapsUpdateProcessorRequest init](self, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)[v4 mutableCopy];
    configurations = v5->_configurations;
    v5->_configurations = v6;
  }

  return v5;
}

- (BOOL)coalesceWithConfigurations:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray count](self->_configurations, "count");
  uint64_t v6 = 100LL - (void)v5;
  if (v5 == (id)100 || v6 < 1)
  {
    BOOL v8 = 0;
  }

  else if ([v4 count])
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);
      -[NSMutableArray addObject:](self->_configurations, "addObject:", v9);
      [v4 removeObject:v9];

      --v6;
    }

    while (v6);
    BOOL v8 = [v4 count] == 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)mapIdentifiers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = self->_configurations;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "coordinate", (void)v16);
        double v11 = v10;
        [v9 coordinate];
        id v13 = objc_msgSend( objc_alloc((Class)off_100703680()),  "initWithMUID:resultProviderID:coordinate:",  objc_msgSend(v9, "muid"),  objc_msgSend(v9, "resultProviderID"),  v11,  v12);
        -[NSMutableArray addObject:](v3, "addObject:", v13);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v6);
  }

  id v14 = -[NSMutableArray copy](v3, "copy");
  return v14;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; ",
           objc_opt_class(self, a2),
           self);
}

- (NSArray)configurations
{
  return &self->_configurations->super;
}

- (void).cxx_destruct
{
}

@end