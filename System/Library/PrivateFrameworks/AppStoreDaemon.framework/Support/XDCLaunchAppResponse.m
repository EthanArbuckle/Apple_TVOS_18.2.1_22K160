@interface XDCLaunchAppResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation XDCLaunchAppResponse

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XDCLaunchAppResponse;
  id v3 = -[XDCLaunchAppResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XDCLaunchAppResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_status));
  [v3 setObject:v4 forKey:@"status"];

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
    if ((v7 >> 3) == 1)
    {
      char v13 = 0;
      unsigned int v14 = 0;
      uint64_t v15 = 0LL;
      while (1)
      {
        unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0) {
          goto LABEL_28;
        }
        v13 += 7;
        BOOL v10 = v14++ >= 9;
        if (v10)
        {
          LODWORD(v15) = 0;
          goto LABEL_30;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v15) = 0;
      }
LABEL_30:
      self->_status = v15;
    }

    else
    {
      int v18 = PBReaderSkipValueWithTag(a3);
      if (!v18) {
        return v18;
      }
    }
  }

  LOBYTE(v18) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_status;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761LL * self->_status;
}

@end