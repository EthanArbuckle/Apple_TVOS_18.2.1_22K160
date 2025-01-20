@interface CSDMessagingLinkSyncUpdateMessage
+ (Class)linkType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)links;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)linkAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)linksCount;
- (unsigned)version;
- (void)addLink:(id)a3;
- (void)clearLinks;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLinks:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncUpdateMessage

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearLinks
{
}

- (void)addLink:(id)a3
{
  id v4 = a3;
  links = self->_links;
  id v8 = v4;
  if (!links)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_links;
    self->_links = v6;

    id v4 = v8;
    links = self->_links;
  }

  -[NSMutableArray addObject:](links, "addObject:", v4);
}

- (unint64_t)linksCount
{
  return (unint64_t)-[NSMutableArray count](self->_links, "count");
}

- (id)linkAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_links, "objectAtIndex:", a3);
}

+ (Class)linkType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationLink, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingLinkSyncUpdateMessage;
  id v3 = -[CSDMessagingLinkSyncUpdateMessage description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncUpdateMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  if (-[NSMutableArray count](self->_links, "count"))
  {
    v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_links, "count"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v6 = self->_links;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v10),  "dictionaryRepresentation",  (void)v13));
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v5 forKey:@"link"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B349C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v6 = self->_links;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), 2LL);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 20) |= 1u;
  }

  id v9 = v4;
  if (-[CSDMessagingLinkSyncUpdateMessage linksCount](self, "linksCount"))
  {
    [v9 clearLinks];
    unint64_t v5 = -[CSDMessagingLinkSyncUpdateMessage linksCount](self, "linksCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncUpdateMessage linkAtIndex:](self, "linkAtIndex:", i));
        [v9 addLink:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = self->_links;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
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
        id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "copyWithZone:", a3, (void)v14);
        [v6 addLink:v12];

        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    unsigned __int8 v7 = 0;
    goto LABEL_10;
  }

  links = self->_links;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return (unint64_t)-[NSMutableArray hash](self->_links, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CSDMessagingLinkSyncUpdateMessage addLink:]( self,  "addLink:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end