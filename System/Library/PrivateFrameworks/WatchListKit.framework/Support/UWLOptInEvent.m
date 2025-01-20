@interface UWLOptInEvent
- (BOOL)hasBrandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)brandId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLOptInEvent

- (BOOL)hasBrandId
{
  return self->_brandId != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLOptInEvent;
  id v3 = -[UWLOptInEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLOptInEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  brandId = self->_brandId;
  if (brandId) {
    [v3 setObject:brandId forKey:@"brand_id"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLOptInEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  brandId = self->_brandId;
  if (brandId) {
    PBDataWriterWriteStringField(a3, brandId, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  brandId = self->_brandId;
  if (brandId) {
    [a3 setBrandId:brandId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_brandId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    brandId = self->_brandId;
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
  return -[NSString hash](self->_brandId, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[UWLOptInEvent setBrandId:](self, "setBrandId:");
  }
}

- (NSString)brandId
{
  return self->_brandId;
}

- (void)setBrandId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end