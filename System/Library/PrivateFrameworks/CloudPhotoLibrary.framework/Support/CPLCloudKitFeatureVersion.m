@interface CPLCloudKitFeatureVersion
- (BOOL)hasEtag;
- (BOOL)hasServerToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serverToken;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setServerToken:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitFeatureVersion

- (void)setVersion:(int64_t)a3
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

- (BOOL)hasServerToken
{
  return self->_serverToken != 0LL;
}

- (BOOL)hasEtag
{
  return self->_etag != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCloudKitFeatureVersion;
  id v3 = -[CPLCloudKitFeatureVersion description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFeatureVersion dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  serverToken = self->_serverToken;
  if (serverToken) {
    [v3 setObject:serverToken forKey:@"serverToken"];
  }
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitFeatureVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v4, self->_version, 1LL);
    id v4 = v7;
  }

  serverToken = self->_serverToken;
  if (serverToken)
  {
    PBDataWriterWriteDataField(v7, serverToken, 2LL);
    id v4 = v7;
  }

  etag = self->_etag;
  if (etag)
  {
    PBDataWriterWriteStringField(v7, etag, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v5 = v4;
  if (self->_serverToken)
  {
    objc_msgSend(v4, "setServerToken:");
    id v4 = v5;
  }

  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_version;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[NSData copyWithZone:](self->_serverToken, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_version != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }

  serverToken = self->_serverToken;
  etag = self->_etag;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_serverToken, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_etag, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_version = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  v5 = v4;
  if (v4[3])
  {
    -[CPLCloudKitFeatureVersion setServerToken:](self, "setServerToken:");
    unint64_t v4 = v5;
  }

  if (v4[2])
  {
    -[CPLCloudKitFeatureVersion setEtag:](self, "setEtag:");
    unint64_t v4 = v5;
  }
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)serverToken
{
  return self->_serverToken;
}

- (void)setServerToken:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end