@interface TFGetImageUploadUrlsRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFGetImageUploadUrlsRequest

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFGetImageUploadUrlsRequest;
  id v3 = -[TFGetImageUploadUrlsRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFGetImageUploadUrlsRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_dsid));
    [v3 setObject:v5 forKey:@"dsid"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_count));
    [v3 setObject:v6 forKey:@"count"];
  }

  contentType = self->_contentType;
  if (contentType) {
    [v3 setObject:contentType forKey:@"contentType"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_desiredUrlTTLMillis));
    [v3 setObject:v8 forKey:@"desiredUrlTTLMillis"];
  }

  return v3;
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
    switch((v7 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0LL;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            goto LABEL_43;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            uint64_t v15 = 0LL;
            goto LABEL_45;
          }
        }

        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v15 = 0LL;
        }
LABEL_45:
        uint64_t v31 = 16LL;
        goto LABEL_54;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1LL || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if (v23 < 0)
            {
              v19 += 7;
              BOOL v10 = v20++ >= 9;
              if (v10)
              {
                LODWORD(v21) = 0;
                goto LABEL_49;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v21) = 0;
        }
LABEL_49:
        self->_count = v21;
        continue;
      case 3u:
        uint64_t String = PBReaderReadString(a3);
        v25 = (NSString *)objc_claimAutoreleasedReturnValue(String);
        contentType = self->_contentType;
        self->_contentType = v25;

        continue;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v15 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        break;
      default:
        int v18 = PBReaderSkipValueWithTag(a3);
        if (!v18) {
          return v18;
        }
        continue;
    }

    while (1)
    {
      unint64_t v29 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v30 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
      v15 |= (unint64_t)(v30 & 0x7F) << v27;
      if ((v30 & 0x80) == 0) {
        goto LABEL_51;
      }
      v27 += 7;
      BOOL v10 = v28++ >= 9;
      if (v10)
      {
        uint64_t v15 = 0LL;
        goto LABEL_53;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_51:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v15 = 0LL;
    }
LABEL_53:
    uint64_t v31 = 8LL;
LABEL_54:
    *(void *)&self->PBRequest_opaque[v31] = v15;
  }

  LOBYTE(v18) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_dsid, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_count, 2LL);
  }
  contentType = self->_contentType;
  if (contentType) {
    PBDataWriterWriteStringField(v6, contentType, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v6, self->_desiredUrlTTLMillis, 4LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_dsid;
    *((_BYTE *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_count;
    *((_BYTE *)v5 + 36) |= 4u;
  }

  id v8 = -[NSString copyWithZone:](self->_contentType, "copyWithZone:", a3);
  char v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = self->_desiredUrlTTLMillis;
    *((_BYTE *)v6 + 36) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  char v7 = *((_BYTE *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_dsid != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_count != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }

  contentType = self->_contentType;
  if ((unint64_t)contentType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:"))
    {
LABEL_19:
      BOOL v9 = 0;
      goto LABEL_20;
    }

    char has = (char)self->_has;
    char v7 = *((_BYTE *)v4 + 36);
  }

  BOOL v9 = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_desiredUrlTTLMillis != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_dsid;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    unint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_count;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  NSUInteger v5 = -[NSString hash](self->_contentType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v6 = 2654435761u * self->_desiredUrlTTLMillis;
  }
  else {
    unint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void).cxx_destruct
{
}

@end