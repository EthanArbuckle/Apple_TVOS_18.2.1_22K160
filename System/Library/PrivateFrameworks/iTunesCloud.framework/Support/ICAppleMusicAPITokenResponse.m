@interface ICAppleMusicAPITokenResponse
- (BOOL)hasError;
- (BOOL)hasTokenCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICAppleMusicAPITokenCollection)tokenCollection;
- (ICAppleMusicAPITokenError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)privacyConsciousDescription;
- (id)privacyConsciousDictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setTokenCollection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenResponse

- (BOOL)hasTokenCollection
{
  return self->_tokenCollection != 0LL;
}

- (BOOL)hasError
{
  return self->_error != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenResponse;
  id v3 = -[ICAppleMusicAPITokenResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  tokenCollection = self->_tokenCollection;
  if (tokenCollection)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICAppleMusicAPITokenCollection dictionaryRepresentation]( tokenCollection,  "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"tokenCollection"];
  }

  error = self->_error;
  if (error)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenError dictionaryRepresentation](error, "dictionaryRepresentation"));
    [v3 setObject:v7 forKey:@"error"];
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
        v13 = objc_alloc_init(&OBJC_CLASS___ICAppleMusicAPITokenCollection);
        objc_storeStrong((id *)&self->_tokenCollection, v13);
LABEL_24:
        PBReaderRecallMark(a3, v15);

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }

    v13 = objc_alloc_init(&OBJC_CLASS___ICAppleMusicAPITokenError);
    objc_storeStrong((id *)&self->_error, v13);
    if (!PBReaderPlaceMark(a3, v15) || (sub_1000C4848((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_28:

      return 0;
    }

    goto LABEL_24;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  tokenCollection = self->_tokenCollection;
  id v7 = v4;
  if (tokenCollection)
  {
    PBDataWriterWriteSubmessage(v4, tokenCollection, 1LL);
    id v4 = v7;
  }

  error = self->_error;
  if (error)
  {
    PBDataWriterWriteSubmessage(v7, error, 2LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[ICAppleMusicAPITokenCollection copyWithZone:](self->_tokenCollection, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[ICAppleMusicAPITokenError copyWithZone:](self->_error, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((tokenCollection = self->_tokenCollection, !((unint64_t)tokenCollection | v4[2]))
     || -[ICAppleMusicAPITokenCollection isEqual:](tokenCollection, "isEqual:")))
  {
    error = self->_error;
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
  unint64_t v3 = -[ICAppleMusicAPITokenCollection hash](self->_tokenCollection, "hash");
  return -[ICAppleMusicAPITokenError hash](self->_error, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  tokenCollection = self->_tokenCollection;
  uint64_t v6 = v4[2];
  char v9 = v4;
  if (tokenCollection)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ICAppleMusicAPITokenCollection mergeFrom:](tokenCollection, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ICAppleMusicAPITokenResponse setTokenCollection:](self, "setTokenCollection:");
  }

  id v4 = v9;
LABEL_7:
  error = self->_error;
  uint64_t v8 = v4[1];
  if (error)
  {
    if (v8)
    {
      -[ICAppleMusicAPITokenError mergeFrom:](error, "mergeFrom:");
LABEL_12:
      id v4 = v9;
    }
  }

  else if (v8)
  {
    -[ICAppleMusicAPITokenResponse setError:](self, "setError:");
    goto LABEL_12;
  }
}

- (ICAppleMusicAPITokenCollection)tokenCollection
{
  return self->_tokenCollection;
}

- (void)setTokenCollection:(id)a3
{
}

- (ICAppleMusicAPITokenError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)privacyConsciousDictionaryRepresentation
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[ICAppleMusicAPITokenResponse hasTokenCollection](self, "hasTokenCollection"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenResponse tokenCollection](self, "tokenCollection"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 privacyConsciousDictionaryRepresentation]);
    [v3 setObject:v5 forKey:@"tokenCollection"];
  }

  if (-[ICAppleMusicAPITokenResponse hasError](self, "hasError"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenResponse error](self, "error"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryRepresentation]);
    [v3 setObject:v7 forKey:@"error"];
  }

  return v3;
}

- (id)privacyConsciousDescription
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenResponse;
  id v3 = -[ICAppleMusicAPITokenResponse description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICAppleMusicAPITokenResponse privacyConsciousDictionaryRepresentation]( self,  "privacyConsciousDictionaryRepresentation"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

@end