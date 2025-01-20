@interface TFGetImageUploadUrlsResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFGetImageUploadUrlsResponse

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFGetImageUploadUrlsResponse;
  id v3 = -[TFGetImageUploadUrlsResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFGetImageUploadUrlsResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  uploadUrls = self->_uploadUrls;
  if (uploadUrls) {
    [v3 setObject:uploadUrls forKey:@"uploadUrls"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_expiresTimeMillis));
    [v4 setObject:v6 forKey:@"expiresTimeMillis"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      BOOL v10 = v6++ >= 9;
      if (v10)
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
      break;
    }
    if ((v7 >> 3) == 2)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v17 = 0LL;
      *(_BYTE *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v19 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_32;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          unint64_t v17 = 0LL;
          goto LABEL_34;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v17 = 0LL;
      }
LABEL_34:
      self->_expiresTimeMillis = v17;
    }

    else if ((v7 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(String);
      if (v14) {
        sub_1001ADD3C((uint64_t)self, v14);
      }
    }

    else
    {
      int v20 = PBReaderSkipValueWithTag(a3);
      if (!v20) {
        return v20;
      }
    }
  }

  LOBYTE(v20) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  char v5 = self->_uploadUrls;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9), 1LL);
        char v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v4, self->_expiresTimeMillis, 2LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_uploadUrls;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        sub_1001ADD3C((uint64_t)v5, v11);

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_expiresTimeMillis;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uploadUrls = self->_uploadUrls;
  if ((unint64_t)uploadUrls | *((void *)v4 + 2))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_expiresTimeMillis == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_uploadUrls, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v4 = 2654435761u * self->_expiresTimeMillis;
  }
  else {
    unint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
}

@end