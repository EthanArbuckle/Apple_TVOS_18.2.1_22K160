@interface OTAccountMetadataClassCAccountSettings
- (BOOL)hasW;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)w;
- (BOOL)webAccess;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasW:(BOOL)a3;
- (void)setHasWebAccess:(BOOL)a3;
- (void)setW:(BOOL)a3;
- (void)setWebAccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountMetadataClassCAccountSettings

- (void)setW:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_w = a3;
}

- (void)setHasW:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasW
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWebAccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_webAccess = a3;
}

- (void)setHasWebAccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWebAccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTAccountMetadataClassCAccountSettings;
  id v3 = -[OTAccountMetadataClassCAccountSettings description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassCAccountSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_w));
    [v3 setObject:v5 forKey:@"w"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_webAccess));
    [v3 setObject:v6 forKey:@"webAccess"];
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
      if ((v7 >> 3) == 1)
      {
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1LL || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_37;
          }

          char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            break;
          }
          v13 += 7;
          BOOL v18 = v14++ > 8;
          if (v18)
          {
            uint64_t v15 = 0LL;
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_40;
          }
        }

        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
LABEL_38:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v15 = 0LL;
        }
LABEL_40:
        self->PBCodable_opaque[*v19] = v15 != 0;
        goto LABEL_41;
      }

      if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }

    char v20 = 0;
    unsigned int v21 = 0;
    uint64_t v15 = 0LL;
    *(_BYTE *)&self->_has |= 2u;
    while (1)
    {
      unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v15 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0)
      {
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_38;
      }

      v20 += 7;
      BOOL v18 = v21++ > 8;
      if (v18)
      {
        uint64_t v15 = 0LL;
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_40;
      }
    }

    v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
LABEL_37:
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_w, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_webAccess, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_w;
    v4[12] |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[9] = self->_webAccess;
    v4[12] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_w;
    *((_BYTE *)result + 12) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_webAccess;
    *((_BYTE *)result + 12) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_12;
    }
    if (self->_w)
    {
      if (!v4[8]) {
        goto LABEL_12;
      }
    }

    else if (v4[8])
    {
      goto LABEL_12;
    }
  }

  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_12;
  }

  BOOL v6 = (v4[12] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_webAccess)
      {
        if (!v4[9]) {
          goto LABEL_12;
        }
      }

      else if (v4[9])
      {
        goto LABEL_12;
      }

      BOOL v6 = 1;
      goto LABEL_13;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_w;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_webAccess;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_w = v4[8];
    *(_BYTE *)&self->_has |= 1u;
    BOOL v5 = v4[12];
  }

  if ((v5 & 2) != 0)
  {
    self->_webAccess = v4[9];
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (BOOL)w
{
  return self->_w;
}

- (BOOL)webAccess
{
  return self->_webAccess;
}

@end