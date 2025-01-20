@interface AMPMusicArtistContent
+ (Class)catalogContentType;
- (BOOL)hasAdamId;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)catalogContents;
- (NSString)name;
- (id)catalogContentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)adamId;
- (unint64_t)catalogContentsCount;
- (unint64_t)hash;
- (void)addCatalogContent:(id)a3;
- (void)clearCatalogContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCatalogContents:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicArtistContent

- (void)setAdamId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (void)clearCatalogContents
{
}

- (void)addCatalogContent:(id)a3
{
  id v4 = a3;
  catalogContents = self->_catalogContents;
  id v8 = v4;
  if (!catalogContents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_catalogContents;
    self->_catalogContents = v6;

    id v4 = v8;
    catalogContents = self->_catalogContents;
  }

  -[NSMutableArray addObject:](catalogContents, "addObject:", v4);
}

- (unint64_t)catalogContentsCount
{
  return (unint64_t)-[NSMutableArray count](self->_catalogContents, "count");
}

- (id)catalogContentAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_catalogContents, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AMPMusicArtistContent;
  id v3 = -[AMPMusicArtistContent description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicArtistContent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_adamId));
    [v3 setObject:v4 forKey:@"adamId"];
  }

  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (-[NSMutableArray count](self->_catalogContents, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_catalogContents, "count"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v7 = self->_catalogContents;
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

    [v3 setObject:v6 forKey:@"catalogContent"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A99AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt64Field(v4, self->_adamId, 1LL);
  }
  name = self->_name;
  if (name) {
    PBDataWriterWriteStringField(v5, name, 2LL);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = self->_catalogContents;
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
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11), 3LL);
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
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_adamId;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  id v9 = v4;
  if (self->_name) {
    objc_msgSend(v4, "setName:");
  }
  if (-[AMPMusicArtistContent catalogContentsCount](self, "catalogContentsCount"))
  {
    [v9 clearCatalogContents];
    unint64_t v5 = -[AMPMusicArtistContent catalogContentsCount](self, "catalogContentsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicArtistContent catalogContentAtIndex:](self, "catalogContentAtIndex:", i));
        [v9 addCatalogContent:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_adamId;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  id v8 = (void *)v6[3];
  v6[3] = v7;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_catalogContents;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "copyWithZone:", a3, (void)v16);
        [v6 addCatalogContent:v14];

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  name = self->_name;
  catalogContents = self->_catalogContents;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_adamId;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSMutableArray hash](self->_catalogContents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_adamId = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3)) {
    -[AMPMusicArtistContent setName:](self, "setName:");
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5[2];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[AMPMusicArtistContent addCatalogContent:]( self,  "addCatalogContent:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)catalogContents
{
  return self->_catalogContents;
}

- (void)setCatalogContents:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)catalogContentType
{
  return (Class)objc_opt_class(&OBJC_CLASS___AMPMusicCatalogContent, a2);
}

@end