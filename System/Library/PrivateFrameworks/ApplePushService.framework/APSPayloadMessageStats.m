@interface APSPayloadMessageStats
- (APSPayloadMessageStats)init;
- (APSPayloadMessageStatsCounts)incomingCounts;
- (APSPayloadMessageStatsCounts)outgoingCounts;
- (NSMutableDictionary)incomingCountsByTopic;
- (NSMutableDictionary)outgoingCountsByTopic;
- (id)incomingCountsForTopic:(id)a3;
- (id)outgoingCountsForTopic:(id)a3;
- (void)payloadMessageReceived:(id)a3;
- (void)payloadMessageSent:(id)a3;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)setIncomingCounts:(id)a3;
- (void)setIncomingCountsByTopic:(id)a3;
- (void)setOutgoingCounts:(id)a3;
- (void)setOutgoingCountsByTopic:(id)a3;
@end

@implementation APSPayloadMessageStats

- (APSPayloadMessageStats)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___APSPayloadMessageStats;
  v2 = -[APSPayloadMessageStats init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCounts);
    incomingCounts = v2->_incomingCounts;
    v2->_incomingCounts = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    incomingCountsByTopic = v2->_incomingCountsByTopic;
    v2->_incomingCountsByTopic = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCounts);
    outgoingCounts = v2->_outgoingCounts;
    v2->_outgoingCounts = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    outgoingCountsByTopic = v2->_outgoingCountsByTopic;
    v2->_outgoingCountsByTopic = v9;
  }

  return v2;
}

- (void)payloadMessageReceived:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 topic]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  -[APSPayloadMessageStatsCounts countTopic:now:](self->_incomingCounts, "countTopic:now:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats incomingCountsForTopic:](self, "incomingCountsForTopic:", v7));
  [v6 countTopic:v7 now:v5];
}

- (void)payloadMessageSent:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 topic]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  -[APSPayloadMessageStatsCounts countTopic:now:](self->_outgoingCounts, "countTopic:now:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats outgoingCountsForTopic:](self, "outgoingCountsForTopic:", v7));
  [v6 countTopic:v7 now:v5];
}

- (id)incomingCountsForTopic:(id)a3
{
  id v4 = a3;
  double v5 = (APSPayloadMessageStatsCounts *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_incomingCountsByTopic,  "objectForKey:",  v4));
  if (!v5)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCounts);
    -[NSMutableDictionary setObject:forKey:](self->_incomingCountsByTopic, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)outgoingCountsForTopic:(id)a3
{
  id v4 = a3;
  double v5 = (APSPayloadMessageStatsCounts *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_outgoingCountsByTopic,  "objectForKey:",  v4));
  if (!v5)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCounts);
    -[NSMutableDictionary setObject:forKey:](self->_outgoingCountsByTopic, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)prepareForDarkWake
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_incomingCountsByTopic, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) prepareForDarkWake];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  -[APSPayloadMessageStatsCounts prepareForDarkWake](self->_outgoingCounts, "prepareForDarkWake");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_outgoingCountsByTopic, "allValues", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) prepareForDarkWake];
        objc_super v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }
}

- (void)prepareForFullWake
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_incomingCountsByTopic, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) prepareForFullWake];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  -[APSPayloadMessageStatsCounts prepareForFullWake](self->_outgoingCounts, "prepareForFullWake");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_outgoingCountsByTopic, "allValues", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) prepareForFullWake];
        objc_super v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }
}

- (APSPayloadMessageStatsCounts)incomingCounts
{
  return self->_incomingCounts;
}

- (void)setIncomingCounts:(id)a3
{
}

- (NSMutableDictionary)incomingCountsByTopic
{
  return self->_incomingCountsByTopic;
}

- (void)setIncomingCountsByTopic:(id)a3
{
}

- (APSPayloadMessageStatsCounts)outgoingCounts
{
  return self->_outgoingCounts;
}

- (void)setOutgoingCounts:(id)a3
{
}

- (NSMutableDictionary)outgoingCountsByTopic
{
  return self->_outgoingCountsByTopic;
}

- (void)setOutgoingCountsByTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end