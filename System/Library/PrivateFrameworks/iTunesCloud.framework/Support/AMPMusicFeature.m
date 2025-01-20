@interface AMPMusicFeature
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (float)valueAtIndex:(unint64_t)a3;
- (float)values;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValue:(float)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValues:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicFeature

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AMPMusicFeature;
  -[AMPMusicFeature dealloc](&v3, "dealloc");
}

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (float)values
{
  return self->_values.list;
}

- (void)clearValues
{
}

- (void)addValue:(float)a3
{
}

- (float)valueAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_values->list[a3];
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AMPMusicFeature;
  id v3 = -[AMPMusicFeature description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicFeature dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t v6 = PBRepeatedFloatNSArray(&self->_values);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 setObject:v7 forKey:@"value"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006D5F0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  key = self->_key;
  id v8 = v4;
  if (key)
  {
    PBDataWriterWriteStringField(v4, key, 1LL);
    id v4 = v8;
  }

  p_values = &self->_values;
  if (p_values->count)
  {
    unint64_t v7 = 0LL;
    do
    {
      PBDataWriterWriteFloatField(v8, 2LL, p_values->list[v7]);
      id v4 = v8;
      ++v7;
    }

    while (v7 < p_values->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (self->_key) {
    objc_msgSend(v7, "setKey:");
  }
  if (-[AMPMusicFeature valuesCount](self, "valuesCount"))
  {
    [v7 clearValues];
    unint64_t v4 = -[AMPMusicFeature valuesCount](self, "valuesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[AMPMusicFeature valueAtIndex:](self, "valueAtIndex:", i);
        objc_msgSend(v7, "addValue:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  id v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedFloatCopy(v5 + 1, &self->_values);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:")))
  {
    char IsEqual = PBRepeatedFloatIsEqual(&self->_values, v4 + 1);
  }

  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_key, "hash");
  return PBRepeatedFloatHash(&self->_values) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v8 = v4;
  if (v4[4])
  {
    -[AMPMusicFeature setKey:](self, "setKey:");
    unint64_t v4 = v8;
  }

  uint64_t v5 = (char *)[v4 valuesCount];
  if (v5)
  {
    id v6 = v5;
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      [v8 valueAtIndex:i];
      -[AMPMusicFeature addValue:](self, "addValue:");
    }
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end