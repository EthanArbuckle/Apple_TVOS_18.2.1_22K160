@interface ModelKeyServerAPISignedKey
- (BOOL)hasData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPISignedKey

- (BOOL)hasData
{
  return self->_data != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ModelKeyServerAPISignedKey;
  id v3 = -[ModelKeyServerAPISignedKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPISignedKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPISignedKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  data = self->_data;
  if (data) {
    PBDataWriterWriteDataField(a3, data, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  data = self->_data;
  if (data) {
    [a3 setData:data];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    data = self->_data;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_data, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ModelKeyServerAPISignedKey setData:](self, "setData:");
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end