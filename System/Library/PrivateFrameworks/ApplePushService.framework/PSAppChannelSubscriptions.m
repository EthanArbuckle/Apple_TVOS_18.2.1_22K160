@interface PSAppChannelSubscriptions
+ (Class)attributesType;
+ (Class)subscriptionChannelsType;
+ (Class)unsubscriptionChannelsType;
- (BOOL)hasAppId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)attributes;
- (NSMutableArray)subscriptionChannels;
- (NSMutableArray)unsubscriptionChannels;
- (NSString)appId;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionChannelsAtIndex:(unint64_t)a3;
- (id)unsubscriptionChannelsAtIndex:(unint64_t)a3;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (unint64_t)subscriptionChannelsCount;
- (unint64_t)unsubscriptionChannelsCount;
- (void)addAttributes:(id)a3;
- (void)addSubscriptionChannels:(id)a3;
- (void)addUnsubscriptionChannels:(id)a3;
- (void)clearAttributes;
- (void)clearSubscriptionChannels;
- (void)clearUnsubscriptionChannels;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setSubscriptionChannels:(id)a3;
- (void)setUnsubscriptionChannels:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSAppChannelSubscriptions

- (BOOL)hasAppId
{
  return self->_appId != 0LL;
}

- (void)clearSubscriptionChannels
{
}

- (void)addSubscriptionChannels:(id)a3
{
  id v4 = a3;
  subscriptionChannels = self->_subscriptionChannels;
  id v8 = v4;
  if (!subscriptionChannels)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_subscriptionChannels;
    self->_subscriptionChannels = v6;

    id v4 = v8;
    subscriptionChannels = self->_subscriptionChannels;
  }

  -[NSMutableArray addObject:](subscriptionChannels, "addObject:", v4);
}

- (unint64_t)subscriptionChannelsCount
{
  return (unint64_t)-[NSMutableArray count](self->_subscriptionChannels, "count");
}

- (id)subscriptionChannelsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_subscriptionChannels, "objectAtIndex:", a3);
}

+ (Class)subscriptionChannelsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSChannelSubscription, a2);
}

- (void)clearUnsubscriptionChannels
{
}

- (void)addUnsubscriptionChannels:(id)a3
{
  id v4 = a3;
  unsubscriptionChannels = self->_unsubscriptionChannels;
  id v8 = v4;
  if (!unsubscriptionChannels)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_unsubscriptionChannels;
    self->_unsubscriptionChannels = v6;

    id v4 = v8;
    unsubscriptionChannels = self->_unsubscriptionChannels;
  }

  -[NSMutableArray addObject:](unsubscriptionChannels, "addObject:", v4);
}

- (unint64_t)unsubscriptionChannelsCount
{
  return (unint64_t)-[NSMutableArray count](self->_unsubscriptionChannels, "count");
}

- (id)unsubscriptionChannelsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_unsubscriptionChannels, "objectAtIndex:", a3);
}

+ (Class)unsubscriptionChannelsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSChannelUnsubscription, a2);
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }

  -[NSMutableArray addObject:](attributes, "addObject:", v4);
}

- (unint64_t)attributesCount
{
  return (unint64_t)-[NSMutableArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSAttribute, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSAppChannelSubscriptions;
  id v3 = -[PSAppChannelSubscriptions description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSAppChannelSubscriptions dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  appId = self->_appId;
  if (appId) {
    [v3 setObject:appId forKey:@"app_id"];
  }
  if (-[NSMutableArray count](self->_subscriptionChannels, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_subscriptionChannels, "count"));
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    v7 = self->_subscriptionChannels;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v36,  v42,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v36 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v36,  v42,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"subscription_channels"];
  }

  if (-[NSMutableArray count](self->_unsubscriptionChannels, "count"))
  {
    v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_unsubscriptionChannels, "count"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v14 = self->_unsubscriptionChannels;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)j) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v13, "addObject:", v19);
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      }

      while (v16);
    }

    [v4 setObject:v13 forKey:@"unsubscription_channels"];
  }

  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v20 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_attributes, "count"));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v21 = self->_attributes;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v40,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (k = 0LL; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v28 + 1) + 8 * (void)k),  "dictionaryRepresentation",  (void)v28));
          -[NSMutableArray addObject:](v20, "addObject:", v26);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v40,  16LL);
      }

      while (v23);
    }

    [v4 setObject:v20 forKey:@"attributes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100064A38(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  appId = self->_appId;
  if (appId) {
    PBDataWriterWriteStringField(v4, appId, 1LL);
  }
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v7 = self->_subscriptionChannels;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v30 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
    }

    while (v9);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v12 = self->_unsubscriptionChannels;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v26 + 1) + 8LL * (void)v16), 3LL);
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
    }

    while (v14);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v17 = self->_attributes;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v22 + 1) + 8LL * (void)v21), 4LL);
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
    }

    while (v19);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_appId) {
    objc_msgSend(v16, "setAppId:");
  }
  if (-[PSAppChannelSubscriptions subscriptionChannelsCount](self, "subscriptionChannelsCount"))
  {
    [v16 clearSubscriptionChannels];
    unint64_t v4 = -[PSAppChannelSubscriptions subscriptionChannelsCount](self, "subscriptionChannelsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( -[PSAppChannelSubscriptions subscriptionChannelsAtIndex:]( self,  "subscriptionChannelsAtIndex:",  i));
        [v16 addSubscriptionChannels:v7];
      }
    }
  }

  if (-[PSAppChannelSubscriptions unsubscriptionChannelsCount](self, "unsubscriptionChannelsCount"))
  {
    [v16 clearUnsubscriptionChannels];
    unint64_t v8 = -[PSAppChannelSubscriptions unsubscriptionChannelsCount](self, "unsubscriptionChannelsCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[PSAppChannelSubscriptions unsubscriptionChannelsAtIndex:]( self,  "unsubscriptionChannelsAtIndex:",  j));
        [v16 addUnsubscriptionChannels:v11];
      }
    }
  }

  if (-[PSAppChannelSubscriptions attributesCount](self, "attributesCount"))
  {
    [v16 clearAttributes];
    unint64_t v12 = -[PSAppChannelSubscriptions attributesCount](self, "attributesCount");
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0LL; k != v13; ++k)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PSAppChannelSubscriptions attributesAtIndex:](self, "attributesAtIndex:", k));
        [v16 addAttributes:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  unint64_t v8 = self->_subscriptionChannels;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      unint64_t v12 = 0LL;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addSubscriptionChannels:v13];

        unint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
    }

    while (v10);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v14 = self->_unsubscriptionChannels;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v18) copyWithZone:a3];
        [v5 addUnsubscriptionChannels:v19];

        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
    }

    while (v16);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v20 = self->_attributes;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v27,  v39,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      __int128 v24 = 0LL;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v24), "copyWithZone:", a3, (void)v27);
        [v5 addAttributes:v25];

        __int128 v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v27,  v39,  16LL);
    }

    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((appId = self->_appId, !((unint64_t)appId | v4[1]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((subscriptionChannels = self->_subscriptionChannels, !((unint64_t)subscriptionChannels | v4[3]))
     || -[NSMutableArray isEqual:](subscriptionChannels, "isEqual:"))
    && ((unsubscriptionChannels = self->_unsubscriptionChannels, !((unint64_t)unsubscriptionChannels | v4[4]))
     || -[NSMutableArray isEqual:](unsubscriptionChannels, "isEqual:")))
  {
    attributes = self->_attributes;
    else {
      unsigned __int8 v10 = 1;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_appId, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_subscriptionChannels, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSMutableArray hash](self->_unsubscriptionChannels, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_attributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PSAppChannelSubscriptions setAppId:](self, "setAppId:");
  }
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PSAppChannelSubscriptions addSubscriptionChannels:]( self,  "addSubscriptionChannels:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v7);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PSAppChannelSubscriptions addUnsubscriptionChannels:]( self,  "addUnsubscriptionChannels:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)j));
      }

      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }

    while (v12);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v15 = *((id *)v4 + 2);
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0LL; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PSAppChannelSubscriptions addAttributes:]( self,  "addAttributes:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)k),  (void)v20);
      }

      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }

    while (v17);
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSMutableArray)subscriptionChannels
{
  return self->_subscriptionChannels;
}

- (void)setSubscriptionChannels:(id)a3
{
}

- (NSMutableArray)unsubscriptionChannels
{
  return self->_unsubscriptionChannels;
}

- (void)setUnsubscriptionChannels:(id)a3
{
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end