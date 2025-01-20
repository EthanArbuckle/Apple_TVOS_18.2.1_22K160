@interface CSDMessagingLinkSyncRecoverMessage
+ (Class)pseudonymType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pseudonyms;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pseudonymAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pseudonymsCount;
- (unsigned)version;
- (void)addPseudonym:(id)a3;
- (void)clearPseudonyms;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPseudonyms:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncRecoverMessage

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

- (void)clearPseudonyms
{
}

- (void)addPseudonym:(id)a3
{
  id v4 = a3;
  pseudonyms = self->_pseudonyms;
  id v8 = v4;
  if (!pseudonyms)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_pseudonyms;
    self->_pseudonyms = v6;

    id v4 = v8;
    pseudonyms = self->_pseudonyms;
  }

  -[NSMutableArray addObject:](pseudonyms, "addObject:", v4);
}

- (unint64_t)pseudonymsCount
{
  return (unint64_t)-[NSMutableArray count](self->_pseudonyms, "count");
}

- (id)pseudonymAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_pseudonyms, "objectAtIndex:", a3);
}

+ (Class)pseudonymType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingLinkSyncRecoverMessage;
  id v3 = -[CSDMessagingLinkSyncRecoverMessage description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncRecoverMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  pseudonyms = self->_pseudonyms;
  if (pseudonyms) {
    [v3 setObject:pseudonyms forKey:@"pseudonym"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000709C((uint64_t)self, (uint64_t)a3);
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
  v6 = self->_pseudonyms;
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
        PBDataWriterWriteStringField(v5, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), 2LL);
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
  if (-[CSDMessagingLinkSyncRecoverMessage pseudonymsCount](self, "pseudonymsCount"))
  {
    [v9 clearPseudonyms];
    unint64_t v5 = -[CSDMessagingLinkSyncRecoverMessage pseudonymsCount](self, "pseudonymsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncRecoverMessage pseudonymAtIndex:](self, "pseudonymAtIndex:", i));
        [v9 addPseudonym:v8];
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
  id v7 = self->_pseudonyms;
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
        [v6 addPseudonym:v12];

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

  pseudonyms = self->_pseudonyms;
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
  return (unint64_t)-[NSMutableArray hash](self->_pseudonyms, "hash") ^ v2;
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
        -[CSDMessagingLinkSyncRecoverMessage addPseudonym:]( self,  "addPseudonym:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
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

- (NSMutableArray)pseudonyms
{
  return self->_pseudonyms;
}

- (void)setPseudonyms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end