@interface SGM2PerfSuggestdLaunched
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2PerfSuggestdLaunched

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"PerfSuggestdLaunched";
  }
}

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SGM2PerfSuggestdLaunched;
  id v3 = -[SGM2PerfSuggestdLaunched description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SGM2PerfSuggestdLaunched dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2PerfSuggestdLaunchedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  key = self->_key;
  if (key) {
    PBDataWriterWriteStringField(a3, key, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  if (key) {
    [a3 setKey:key];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    key = self->_key;
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
  return -[NSString hash](self->_key, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SGM2PerfSuggestdLaunched setKey:](self, "setKey:");
  }
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end