@interface PSAppChannelSubscriptionResponse
+ (Class)subscriptionChannelResponseType;
+ (Class)unsubscriptionChannelResponseType;
- (BOOL)hasAppId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)subscriptionChannelResponses;
- (NSMutableArray)unsubscriptionChannelResponses;
- (NSString)appId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionChannelResponseAtIndex:(unint64_t)a3;
- (id)unsubscriptionChannelResponseAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subscriptionChannelResponsesCount;
- (unint64_t)unsubscriptionChannelResponsesCount;
- (void)addSubscriptionChannelResponse:(id)a3;
- (void)addUnsubscriptionChannelResponse:(id)a3;
- (void)clearSubscriptionChannelResponses;
- (void)clearUnsubscriptionChannelResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setSubscriptionChannelResponses:(id)a3;
- (void)setUnsubscriptionChannelResponses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSAppChannelSubscriptionResponse

- (BOOL)hasAppId
{
  return self->_appId != 0LL;
}

- (void)clearSubscriptionChannelResponses
{
}

- (void)addSubscriptionChannelResponse:(id)a3
{
  id v4 = a3;
  subscriptionChannelResponses = self->_subscriptionChannelResponses;
  id v8 = v4;
  if (!subscriptionChannelResponses)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_subscriptionChannelResponses;
    self->_subscriptionChannelResponses = v6;

    id v4 = v8;
    subscriptionChannelResponses = self->_subscriptionChannelResponses;
  }

  -[NSMutableArray addObject:](subscriptionChannelResponses, "addObject:", v4);
}

- (unint64_t)subscriptionChannelResponsesCount
{
  return (unint64_t)-[NSMutableArray count](self->_subscriptionChannelResponses, "count");
}

- (id)subscriptionChannelResponseAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_subscriptionChannelResponses, "objectAtIndex:", a3);
}

+ (Class)subscriptionChannelResponseType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSChannelResponse, a2);
}

- (void)clearUnsubscriptionChannelResponses
{
}

- (void)addUnsubscriptionChannelResponse:(id)a3
{
  id v4 = a3;
  unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
  id v8 = v4;
  if (!unsubscriptionChannelResponses)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_unsubscriptionChannelResponses;
    self->_unsubscriptionChannelResponses = v6;

    id v4 = v8;
    unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
  }

  -[NSMutableArray addObject:](unsubscriptionChannelResponses, "addObject:", v4);
}

- (unint64_t)unsubscriptionChannelResponsesCount
{
  return (unint64_t)-[NSMutableArray count](self->_unsubscriptionChannelResponses, "count");
}

- (id)unsubscriptionChannelResponseAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_unsubscriptionChannelResponses, "objectAtIndex:", a3);
}

+ (Class)unsubscriptionChannelResponseType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSChannelResponse, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSAppChannelSubscriptionResponse;
  id v3 = -[PSAppChannelSubscriptionResponse description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSAppChannelSubscriptionResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if (-[NSMutableArray count](self->_subscriptionChannelResponses, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_subscriptionChannelResponses, "count"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v7 = self->_subscriptionChannelResponses;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"subscription_channel_response"];
  }

  if (-[NSMutableArray count](self->_unsubscriptionChannelResponses, "count"))
  {
    v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_unsubscriptionChannelResponses, "count"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v14 = self->_unsubscriptionChannelResponses;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)j),  "dictionaryRepresentation",  (void)v21));
          -[NSMutableArray addObject:](v13, "addObject:", v19);
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
      }

      while (v16);
    }

    [v4 setObject:v13 forKey:@"unsubscription_channel_response"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006CBEC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  appId = self->_appId;
  if (appId) {
    PBDataWriterWriteStringField(v4, appId, 1LL);
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v7 = self->_subscriptionChannelResponses;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v21 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v12 = self->_unsubscriptionChannelResponses;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v17 + 1) + 8LL * (void)v16), 3LL);
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    }

    while (v14);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_appId) {
    objc_msgSend(v12, "setAppId:");
  }
  if (-[PSAppChannelSubscriptionResponse subscriptionChannelResponsesCount](self, "subscriptionChannelResponsesCount"))
  {
    [v12 clearSubscriptionChannelResponses];
    unint64_t v4 = -[PSAppChannelSubscriptionResponse subscriptionChannelResponsesCount]( self,  "subscriptionChannelResponsesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( -[PSAppChannelSubscriptionResponse subscriptionChannelResponseAtIndex:]( self,  "subscriptionChannelResponseAtIndex:",  i));
        [v12 addSubscriptionChannelResponse:v7];
      }
    }
  }

  if (-[PSAppChannelSubscriptionResponse unsubscriptionChannelResponsesCount]( self,  "unsubscriptionChannelResponsesCount"))
  {
    [v12 clearUnsubscriptionChannelResponses];
    unint64_t v8 = -[PSAppChannelSubscriptionResponse unsubscriptionChannelResponsesCount]( self,  "unsubscriptionChannelResponsesCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[PSAppChannelSubscriptionResponse unsubscriptionChannelResponseAtIndex:]( self,  "unsubscriptionChannelResponseAtIndex:",  j));
        [v12 addUnsubscriptionChannelResponse:v11];
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

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  unint64_t v8 = self->_subscriptionChannelResponses;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addSubscriptionChannelResponse:v13];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v10);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v14 = self->_unsubscriptionChannelResponses;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      __int128 v18 = 0LL;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "copyWithZone:", a3, (void)v21);
        [v5 addUnsubscriptionChannelResponse:v19];

        __int128 v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((appId = self->_appId, !((unint64_t)appId | v4[1]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((subscriptionChannelResponses = self->_subscriptionChannelResponses,
         !((unint64_t)subscriptionChannelResponses | v4[2]))
     || -[NSMutableArray isEqual:](subscriptionChannelResponses, "isEqual:")))
  {
    unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_appId, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_subscriptionChannelResponses, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSMutableArray hash](self->_unsubscriptionChannelResponses, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PSAppChannelSubscriptionResponse setAppId:](self, "setAppId:");
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PSAppChannelSubscriptionResponse addSubscriptionChannelResponse:]( self,  "addSubscriptionChannelResponse:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = *((id *)v4 + 3);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PSAppChannelSubscriptionResponse addUnsubscriptionChannelResponse:]( self,  "addUnsubscriptionChannelResponse:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)j),  (void)v15);
      }

      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSMutableArray)subscriptionChannelResponses
{
  return self->_subscriptionChannelResponses;
}

- (void)setSubscriptionChannelResponses:(id)a3
{
}

- (NSMutableArray)unsubscriptionChannelResponses
{
  return self->_unsubscriptionChannelResponses;
}

- (void)setUnsubscriptionChannelResponses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end