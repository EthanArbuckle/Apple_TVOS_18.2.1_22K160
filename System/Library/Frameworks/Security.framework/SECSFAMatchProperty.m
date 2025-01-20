@interface SECSFAMatchProperty
- (BOOL)hasPropertyName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)propertyName;
- (SECSFAPropertyValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPropertyName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAMatchProperty

- (BOOL)hasPropertyName
{
  return self->_propertyName != 0LL;
}

- (BOOL)hasValue
{
  return self->_value != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAMatchProperty;
  v4 = -[SECSFAMatchProperty description](&v8, sel_description);
  v5 = -[SECSFAMatchProperty dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  propertyName = self->_propertyName;
  if (propertyName) {
    [v3 setObject:propertyName forKey:@"propertyName"];
  }
  value = self->_value;
  if (value)
  {
    v7 = -[SECSFAPropertyValue dictionaryRepresentation](value, "dictionaryRepresentation");
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x189611CF0];
  v5 = (int *)MEMORY[0x189611CE8];
  v6 = (int *)MEMORY[0x189611CE0];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x189611CF0]) < *(void *)((char *)a3 + (int)*MEMORY[0x189611CE8]))
  {
    objc_super v8 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6)) {
        return *((_BYTE *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0LL;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        char v14 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0LL;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }

      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6)) {
        unint64_t v11 = 0LL;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((_BYTE *)a3 + *v6) == 0;
      }
      if ((v11 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        propertyName = (SECSFAPropertyValue *)self->_propertyName;
        self->_propertyName = v18;
LABEL_24:

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
    }

    propertyName = objc_alloc_init(&OBJC_CLASS___SECSFAPropertyValue);
    objc_storeStrong((id *)&self->_value, propertyName);
    if (!PBReaderPlaceMark()
      || (SECSFAPropertyValueReadFrom((uint64_t)propertyName, (uint64_t)a3) & 1) == 0)
    {

      return 0;
    }

    PBReaderRecallMark();
    goto LABEL_24;
  }

  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_propertyName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_propertyName)
  {
    objc_msgSend(v4, "setPropertyName:");
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
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_propertyName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[SECSFAPropertyValue copyWithZone:](self->_value, "copyWithZone:", a3);
  char v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((propertyName = self->_propertyName, !((unint64_t)propertyName | v4[1]))
     || -[NSString isEqual:](propertyName, "isEqual:")))
  {
    value = self->_value;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_propertyName, "hash");
  return -[SECSFAPropertyValue hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[SECSFAMatchProperty setPropertyName:](self, "setPropertyName:");
    id v4 = v7;
  }

  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6)
    {
      -[SECSFAPropertyValue mergeFrom:](value, "mergeFrom:");
LABEL_8:
      id v4 = v7;
    }
  }

  else if (v6)
  {
    -[SECSFAMatchProperty setValue:](self, "setValue:");
    goto LABEL_8;
  }
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (void)setPropertyName:(id)a3
{
}

- (SECSFAPropertyValue)value
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