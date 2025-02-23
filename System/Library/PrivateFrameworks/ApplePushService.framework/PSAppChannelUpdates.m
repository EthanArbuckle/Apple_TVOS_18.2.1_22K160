@interface PSAppChannelUpdates
+ (Class)channelUpdatesType;
- (BOOL)hasAppId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)channelUpdates;
- (NSString)appId;
- (id)channelUpdatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)channelUpdatesCount;
- (unint64_t)hash;
- (void)addChannelUpdates:(id)a3;
- (void)clearChannelUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setChannelUpdates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSAppChannelUpdates

- (BOOL)hasAppId
{
  return self->_appId != 0LL;
}

- (void)clearChannelUpdates
{
}

- (void)addChannelUpdates:(id)a3
{
  id v4 = a3;
  channelUpdates = self->_channelUpdates;
  id v8 = v4;
  if (!channelUpdates)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_channelUpdates;
    self->_channelUpdates = v6;

    id v4 = v8;
    channelUpdates = self->_channelUpdates;
  }

  -[NSMutableArray addObject:](channelUpdates, "addObject:", v4);
}

- (unint64_t)channelUpdatesCount
{
  return (unint64_t)-[NSMutableArray count](self->_channelUpdates, "count");
}

- (id)channelUpdatesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_channelUpdates, "objectAtIndex:", a3);
}

+ (Class)channelUpdatesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSChannelUpdate, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSAppChannelUpdates;
  id v3 = -[PSAppChannelUpdates description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSAppChannelUpdates dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if (-[NSMutableArray count](self->_channelUpdates, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_channelUpdates, "count"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v7 = self->_channelUpdates;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v14));
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"channel_updates"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000447C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  appId = self->_appId;
  if (appId) {
    PBDataWriterWriteStringField(v4, appId, 1LL);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = self->_channelUpdates;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_appId) {
    objc_msgSend(v8, "setAppId:");
  }
  if (-[PSAppChannelUpdates channelUpdatesCount](self, "channelUpdatesCount"))
  {
    [v8 clearChannelUpdates];
    unint64_t v4 = -[PSAppChannelUpdates channelUpdatesCount](self, "channelUpdatesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PSAppChannelUpdates channelUpdatesAtIndex:](self, "channelUpdatesAtIndex:", i));
        [v8 addChannelUpdates:v7];
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

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_channelUpdates;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v15);
        [v5 addChannelUpdates:v13];

        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((appId = self->_appId, !((unint64_t)appId | v4[1]))
     || -[NSString isEqual:](appId, "isEqual:")))
  {
    channelUpdates = self->_channelUpdates;
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
  NSUInteger v3 = -[NSString hash](self->_appId, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_channelUpdates, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PSAppChannelUpdates setAppId:](self, "setAppId:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PSAppChannelUpdates addChannelUpdates:]( self,  "addChannelUpdates:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSMutableArray)channelUpdates
{
  return self->_channelUpdates;
}

- (void)setChannelUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end