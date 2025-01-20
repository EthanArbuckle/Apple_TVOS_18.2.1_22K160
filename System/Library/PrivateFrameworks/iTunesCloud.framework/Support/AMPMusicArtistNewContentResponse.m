@interface AMPMusicArtistNewContentResponse
+ (Class)artistContentType;
- (BOOL)hasModel;
- (BOOL)hasRecoId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)model;
- (NSMutableArray)artistContents;
- (NSString)recoId;
- (id)artistContentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)artistContentsCount;
- (unint64_t)hash;
- (void)addArtistContent:(id)a3;
- (void)clearArtistContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtistContents:(id)a3;
- (void)setModel:(id)a3;
- (void)setRecoId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicArtistNewContentResponse

- (void)clearArtistContents
{
}

- (void)addArtistContent:(id)a3
{
  id v4 = a3;
  artistContents = self->_artistContents;
  id v8 = v4;
  if (!artistContents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_artistContents;
    self->_artistContents = v6;

    id v4 = v8;
    artistContents = self->_artistContents;
  }

  -[NSMutableArray addObject:](artistContents, "addObject:", v4);
}

- (unint64_t)artistContentsCount
{
  return (unint64_t)-[NSMutableArray count](self->_artistContents, "count");
}

- (id)artistContentAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_artistContents, "objectAtIndex:", a3);
}

- (BOOL)hasRecoId
{
  return self->_recoId != 0LL;
}

- (BOOL)hasModel
{
  return self->_model != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AMPMusicArtistNewContentResponse;
  id v3 = -[AMPMusicArtistNewContentResponse description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicArtistNewContentResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_artistContents, "count"))
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_artistContents, "count"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v5 = self->_artistContents;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v14));
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"artistContent"];
  }

  recoId = self->_recoId;
  if (recoId) {
    [v3 setObject:recoId forKey:@"recoId"];
  }
  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        if (v6++ >= 9)
        {
          unint64_t v7 = 0LL;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((_DWORD)v13 == 2)
      {
        uint64_t String = PBReaderReadString(a3);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v17 = 24LL;
        goto LABEL_25;
      }

      if ((_DWORD)v13 == 1)
      {
        __int128 v14 = objc_alloc_init(&OBJC_CLASS___AMPMusicArtistContent);
        -[AMPMusicArtistNewContentResponse addArtistContent:](self, "addArtistContent:", v14);
        if (!PBReaderPlaceMark(a3, v20) || (sub_1000A99AC((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {

          return 0;
        }

        PBReaderRecallMark(a3, v20);
        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }

    uint64_t Data = PBReaderReadData(a3);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(Data);
    uint64_t v17 = 16LL;
LABEL_25:
    __int128 v14 = *(AMPMusicArtistContent **)&self->PBCodable_opaque[v17];
    *(void *)&self->PBCodable_opaque[v17] = v16;
LABEL_26:

    goto LABEL_28;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  char v5 = self->_artistContents;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)i), 1LL);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  recoId = self->_recoId;
  if (recoId) {
    PBDataWriterWriteStringField(v4, recoId, 2LL);
  }
  model = self->_model;
  if (model) {
    PBDataWriterWriteDataField(v4, model, 3LL);
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (-[AMPMusicArtistNewContentResponse artistContentsCount](self, "artistContentsCount"))
  {
    [v9 clearArtistContents];
    unint64_t v4 = -[AMPMusicArtistNewContentResponse artistContentsCount](self, "artistContentsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicArtistNewContentResponse artistContentAtIndex:](self, "artistContentAtIndex:", i));
        [v9 addArtistContent:v7];
      }
    }
  }

  if (self->_recoId) {
    objc_msgSend(v9, "setRecoId:");
  }
  uint64_t v8 = v9;
  if (self->_model)
  {
    objc_msgSend(v9, "setModel:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = self->_artistContents;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v17);
        [v5 addArtistContent:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  id v12 = -[NSString copyWithZone:](self->_recoId, "copyWithZone:", a3);
  __int128 v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = -[NSData copyWithZone:](self->_model, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((artistContents = self->_artistContents, !((unint64_t)artistContents | v4[1]))
     || -[NSMutableArray isEqual:](artistContents, "isEqual:"))
    && ((recoId = self->_recoId, !((unint64_t)recoId | v4[3]))
     || -[NSString isEqual:](recoId, "isEqual:")))
  {
    model = self->_model;
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
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_artistContents, "hash");
  unint64_t v4 = -[NSString hash](self->_recoId, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_model, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4[1];
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
        -[AMPMusicArtistNewContentResponse addArtistContent:]( self,  "addArtistContent:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  if (v4[3]) {
    -[AMPMusicArtistNewContentResponse setRecoId:](self, "setRecoId:");
  }
  if (v4[2]) {
    -[AMPMusicArtistNewContentResponse setModel:](self, "setModel:");
  }
}

- (NSMutableArray)artistContents
{
  return self->_artistContents;
}

- (void)setArtistContents:(id)a3
{
}

- (NSString)recoId
{
  return self->_recoId;
}

- (void)setRecoId:(id)a3
{
}

- (NSData)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)artistContentType
{
  return (Class)objc_opt_class(&OBJC_CLASS___AMPMusicArtistContent, a2);
}

@end