@interface PPSPBUnit
- (BOOL)hasSymbol;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)symbol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSymbol:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBUnit

- (BOOL)hasSymbol
{
  return self->_symbol != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PPSPBUnit;
  v4 = -[PPSPBUnit description](&v8, sel_description);
  v5 = -[PPSPBUnit dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  symbol = self->_symbol;
  if (symbol) {
    [v3 setObject:symbol forKey:@"symbol"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBUnitReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_symbol) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  symbol = self->_symbol;
  if (symbol) {
    [a3 setSymbol:symbol];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_symbol, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    symbol = self->_symbol;
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
  return -[NSString hash](self->_symbol, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PPSPBUnit setSymbol:](self, "setSymbol:");
  }
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (void).cxx_destruct
{
}

@end