@interface XDCCancelInstallResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation XDCCancelInstallResponse

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XDCCancelInstallResponse;
  id v3 = -[XDCCancelInstallResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XDCCancelInstallResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_errorCode));
    [v4 setObject:v6 forKey:@"errorCode"];
  }

  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
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
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 3)
    {
      uint64_t String = PBReaderReadString(a3);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
      uint64_t v16 = 16LL;
    }

    else
    {
      if ((_DWORD)v13 == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
          v21 |= (unint64_t)(v23 & 0x7F) << v19;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v19 += 7;
          BOOL v10 = v20++ >= 9;
          if (v10)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }

        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v21) = 0;
        }
LABEL_35:
        self->_errorCode = v21;
        continue;
      }

      if ((_DWORD)v13 != 1)
      {
        int v24 = PBReaderSkipValueWithTag(a3);
        if (!v24) {
          return v24;
        }
        continue;
      }

      uint64_t v14 = PBReaderReadString(a3);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = 24LL;
    }

    v18 = *(void **)&self->PBCodable_opaque[v16];
    *(void *)&self->PBCodable_opaque[v16] = v15;
  }

  LOBYTE(v24) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  errorDomain = self->_errorDomain;
  id v7 = v4;
  if (errorDomain)
  {
    PBDataWriterWriteStringField(v4, errorDomain, 1LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_errorCode, 2LL);
    id v4 = v7;
  }

  errorDescription = self->_errorDescription;
  if (errorDescription)
  {
    PBDataWriterWriteStringField(v7, errorDescription, 3LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  id v7 = (void *)v5[3];
  v5[3] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_errorCode;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  char v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  errorDescription = self->_errorDescription;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ -[NSString hash](self->_errorDescription, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end