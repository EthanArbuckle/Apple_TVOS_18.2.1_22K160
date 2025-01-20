@interface ALSMeta
- (BOOL)hasProductId;
- (BOOL)hasSoftwareBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)productId;
- (NSString)softwareBuild;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setProductId:(id)a3;
- (void)setSoftwareBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSMeta

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSMeta;
  -[ALSMeta dealloc](&v3, "dealloc");
}

- (BOOL)hasSoftwareBuild
{
  return self->_softwareBuild != 0LL;
}

- (BOOL)hasProductId
{
  return self->_productId != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSMeta;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSMeta description](&v3, "description"),  -[ALSMeta dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  softwareBuild = self->_softwareBuild;
  if (softwareBuild) {
    [v3 setObject:softwareBuild forKey:@"softwareBuild"];
  }
  productId = self->_productId;
  if (productId) {
    [v4 setObject:productId forKey:@"productId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100DD49AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  softwareBuild = self->_softwareBuild;
  if (softwareBuild) {
    PBDataWriterWriteStringField(a3, softwareBuild, 1LL);
  }
  productId = self->_productId;
  if (productId) {
    PBDataWriterWriteStringField(a3, productId, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_softwareBuild) {
    objc_msgSend(a3, "setSoftwareBuild:");
  }
  if (self->_productId) {
    objc_msgSend(a3, "setProductId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[2] = -[NSString copyWithZone:](self->_softwareBuild, "copyWithZone:", a3);
  v7[1] = -[NSString copyWithZone:](self->_productId, "copyWithZone:", a3);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    softwareBuild = self->_softwareBuild;
    if (!((unint64_t)softwareBuild | *((void *)a3 + 2))
      || (unsigned int v7 = -[NSString isEqual:](softwareBuild, "isEqual:")) != 0)
    {
      productId = self->_productId;
      else {
        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_softwareBuild, "hash");
  return -[NSString hash](self->_productId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[ALSMeta setSoftwareBuild:](self, "setSoftwareBuild:");
  }
  if (*((void *)a3 + 1)) {
    -[ALSMeta setProductId:](self, "setProductId:");
  }
}

- (NSString)softwareBuild
{
  return self->_softwareBuild;
}

- (void)setSoftwareBuild:(id)a3
{
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

@end