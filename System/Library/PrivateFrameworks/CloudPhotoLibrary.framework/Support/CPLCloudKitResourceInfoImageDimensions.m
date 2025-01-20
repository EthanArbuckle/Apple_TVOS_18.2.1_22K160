@interface CPLCloudKitResourceInfoImageDimensions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(int64_t)a3;
- (void)setWidth:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitResourceInfoImageDimensions

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCloudKitResourceInfoImageDimensions;
  id v3 = -[CPLCloudKitResourceInfoImageDimensions description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitResourceInfoImageDimensions dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_width));
  [v3 setObject:v4 forKey:@"width"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_height));
  [v3 setObject:v5 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitResourceInfoImageDimensionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  ((void (*)(void))PBDataWriterWriteInt64Field)();
  PBDataWriterWriteInt64Field(v4, self->_height, 2LL);
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_width;
  *((void *)a3 + 1) = self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_width;
  *((void *)result + 1) = self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class(self)]
    && self->_width == v4[2]
    && self->_height == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761LL * self->_height) ^ (2654435761LL * self->_width);
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((void *)a3 + 2);
  self->_height = *((void *)a3 + 1);
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

@end