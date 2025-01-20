@interface SECC2MPGenericEventMetric
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (SECC2MPGenericEventMetricValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEventMetric

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (BOOL)hasValue
{
  return self->_value != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPGenericEventMetric;
  id v3 = -[SECC2MPGenericEventMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  value = self->_value;
  if (value)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetricValue dictionaryRepresentation](value, "dictionaryRepresentation"));
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006F3CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  key = self->_key;
  id v7 = v4;
  if (key)
  {
    PBDataWriterWriteStringField(v4, key, 101LL);
    id v4 = v7;
  }

  value = self->_value;
  if (value)
  {
    PBDataWriterWriteSubmessage(v7, value, 201LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }

  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[SECC2MPGenericEventMetricValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
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
  NSUInteger v3 = -[NSString hash](self->_key, "hash");
  return -[SECC2MPGenericEventMetricValue hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4[1])
  {
    -[SECC2MPGenericEventMetric setKey:](self, "setKey:");
    id v4 = v7;
  }

  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6)
    {
      -[SECC2MPGenericEventMetricValue mergeFrom:](value, "mergeFrom:");
LABEL_8:
      id v4 = v7;
    }
  }

  else if (v6)
  {
    -[SECC2MPGenericEventMetric setValue:](self, "setValue:");
    goto LABEL_8;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (SECC2MPGenericEventMetricValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end