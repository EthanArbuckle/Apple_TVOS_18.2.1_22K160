@interface PSChannelSubscriptionsUpdatePayload
+ (Class)appChannelUpdatesType;
+ (Class)subscriptionUpdatesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appChannelUpdates;
- (NSMutableArray)subscriptionUpdates;
- (id)appChannelUpdatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionUpdatesAtIndex:(unint64_t)a3;
- (unint64_t)appChannelUpdatesCount;
- (unint64_t)hash;
- (unint64_t)subscriptionUpdatesCount;
- (void)addAppChannelUpdates:(id)a3;
- (void)addSubscriptionUpdates:(id)a3;
- (void)clearAppChannelUpdates;
- (void)clearSubscriptionUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppChannelUpdates:(id)a3;
- (void)setSubscriptionUpdates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsUpdatePayload

- (void)clearAppChannelUpdates
{
}

- (void)addAppChannelUpdates:(id)a3
{
  id v4 = a3;
  appChannelUpdates = self->_appChannelUpdates;
  id v8 = v4;
  if (!appChannelUpdates)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_appChannelUpdates;
    self->_appChannelUpdates = v6;

    id v4 = v8;
    appChannelUpdates = self->_appChannelUpdates;
  }

  -[NSMutableArray addObject:](appChannelUpdates, "addObject:", v4);
}

- (unint64_t)appChannelUpdatesCount
{
  return (unint64_t)-[NSMutableArray count](self->_appChannelUpdates, "count");
}

- (id)appChannelUpdatesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_appChannelUpdates, "objectAtIndex:", a3);
}

+ (Class)appChannelUpdatesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSAppChannelUpdates, a2);
}

- (void)clearSubscriptionUpdates
{
}

- (void)addSubscriptionUpdates:(id)a3
{
  id v4 = a3;
  subscriptionUpdates = self->_subscriptionUpdates;
  id v8 = v4;
  if (!subscriptionUpdates)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_subscriptionUpdates;
    self->_subscriptionUpdates = v6;

    id v4 = v8;
    subscriptionUpdates = self->_subscriptionUpdates;
  }

  -[NSMutableArray addObject:](subscriptionUpdates, "addObject:", v4);
}

- (unint64_t)subscriptionUpdatesCount
{
  return (unint64_t)-[NSMutableArray count](self->_subscriptionUpdates, "count");
}

- (id)subscriptionUpdatesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_subscriptionUpdates, "objectAtIndex:", a3);
}

+ (Class)subscriptionUpdatesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSSubscriptionUpdate, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSChannelSubscriptionsUpdatePayload;
  id v3 = -[PSChannelSubscriptionsUpdatePayload description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscriptionsUpdatePayload dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_appChannelUpdates, "count"))
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_appChannelUpdates, "count"));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v5 = self->_appChannelUpdates;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"app_channel_updates"];
  }

  if (-[NSMutableArray count](self->_subscriptionUpdates, "count"))
  {
    v11 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_subscriptionUpdates, "count"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v12 = self->_subscriptionUpdates;
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v19 + 1) + 8 * (void)v16),  "dictionaryRepresentation",  (void)v19));
          -[NSMutableArray addObject:](v11, "addObject:", v17);

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
      }

      while (v14);
    }

    [v3 setObject:v11 forKey:@"subscription_updates"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000789B4(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v5 = self->_appChannelUpdates;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v19 + 1) + 8LL * (void)v9), 1LL);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v10 = self->_subscriptionUpdates;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14), 2LL);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (-[PSChannelSubscriptionsUpdatePayload appChannelUpdatesCount](self, "appChannelUpdatesCount"))
  {
    [v12 clearAppChannelUpdates];
    unint64_t v4 = -[PSChannelSubscriptionsUpdatePayload appChannelUpdatesCount](self, "appChannelUpdatesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PSChannelSubscriptionsUpdatePayload appChannelUpdatesAtIndex:]( self,  "appChannelUpdatesAtIndex:",  i));
        [v12 addAppChannelUpdates:v7];
      }
    }
  }

  if (-[PSChannelSubscriptionsUpdatePayload subscriptionUpdatesCount](self, "subscriptionUpdatesCount"))
  {
    [v12 clearSubscriptionUpdates];
    unint64_t v8 = -[PSChannelSubscriptionsUpdatePayload subscriptionUpdatesCount](self, "subscriptionUpdatesCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PSChannelSubscriptionsUpdatePayload subscriptionUpdatesAtIndex:]( self,  "subscriptionUpdatesAtIndex:",  j));
        [v12 addSubscriptionUpdates:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = self->_appChannelUpdates;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addAppChannelUpdates:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v8);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v12 = self->_subscriptionUpdates;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v19);
        [v5 addSubscriptionUpdates:v17];

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    }

    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((appChannelUpdates = self->_appChannelUpdates, !((unint64_t)appChannelUpdates | v4[1]))
     || -[NSMutableArray isEqual:](appChannelUpdates, "isEqual:")))
  {
    subscriptionUpdates = self->_subscriptionUpdates;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_appChannelUpdates, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_subscriptionUpdates, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PSChannelSubscriptionsUpdatePayload addAppChannelUpdates:]( self,  "addAppChannelUpdates:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v9));
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v4[2];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PSChannelSubscriptionsUpdatePayload addSubscriptionUpdates:]( self,  "addSubscriptionUpdates:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14),  (void)v15);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }
}

- (NSMutableArray)appChannelUpdates
{
  return self->_appChannelUpdates;
}

- (void)setAppChannelUpdates:(id)a3
{
}

- (NSMutableArray)subscriptionUpdates
{
  return self->_subscriptionUpdates;
}

- (void)setSubscriptionUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end