@interface PPSPBSource
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBSource

- (BOOL)hasSource
{
  return self->_source != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PPSPBSource;
  v4 = -[PPSPBSource description](&v8, sel_description);
  v5 = -[PPSPBSource dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_source) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  source = self->_source;
  if (source) {
    [a3 setSource:source];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    source = self->_source;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_source, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PPSPBSource setSource:](self, "setSource:");
  }
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end