@interface SECC2MPGenericEventMetricValue
- (BOOL)hasDateValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasErrorValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (SECC2MPError)errorValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)dateValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateValue:(unint64_t)a3;
- (void)setDoubleValue:(double)a3;
- (void)setErrorValue:(id)a3;
- (void)setHasDateValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEventMetricValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0LL;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDateValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateValue = a3;
}

- (void)setHasDateValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorValue
{
  return self->_errorValue != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPGenericEventMetricValue;
  id v3 = -[SECC2MPGenericEventMetricValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetricValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"string_value"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_doubleValue));
    [v4 setObject:v7 forKey:@"double_value"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_dateValue));
    [v4 setObject:v8 forKey:@"date_value"];
  }

  errorValue = self->_errorValue;
  if (errorValue)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](errorValue, "dictionaryRepresentation"));
    [v4 setObject:v10 forKey:@"error_value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100072AD4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  stringValue = self->_stringValue;
  id v8 = v4;
  if (stringValue)
  {
    PBDataWriterWriteStringField(v4, stringValue, 101LL);
    id v4 = v8;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v8, 102LL, self->_doubleValue);
    id v4 = v8;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v8, self->_dateValue, 103LL);
    id v4 = v8;
  }

  errorValue = self->_errorValue;
  if (errorValue)
  {
    PBDataWriterWriteSubmessage(v8, errorValue, 201LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_doubleValue;
    *((_BYTE *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_dateValue;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  if (self->_errorValue)
  {
    objc_msgSend(v6, "setErrorValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_doubleValue;
    *((_BYTE *)v5 + 40) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[1] = self->_dateValue;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v9 = -[SECC2MPError copyWithZone:](self->_errorValue, "copyWithZone:", a3);
  v10 = (void *)v5[3];
  v5[3] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 4))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v8 = 0;
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_dateValue != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_16;
  }

  errorValue = self->_errorValue;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_stringValue, "hash");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double doubleValue = self->_doubleValue;
    double v7 = -doubleValue;
    double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }

    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  if ((has & 1) != 0) {
    unint64_t v10 = 2654435761u * self->_dateValue;
  }
  else {
    unint64_t v10 = 0LL;
  }
  return v5 ^ v3 ^ v10 ^ -[SECC2MPError hash](self->_errorValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECC2MPGenericEventMetricValue setStringValue:](self, "setStringValue:");
    id v4 = v8;
  }

  char v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_double doubleValue = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 40);
  }

  if ((v5 & 1) != 0)
  {
    self->_dateValue = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  errorValue = self->_errorValue;
  uint64_t v7 = *((void *)v4 + 3);
  if (errorValue)
  {
    if (v7)
    {
      -[SECC2MPError mergeFrom:](errorValue, "mergeFrom:");
LABEL_12:
      id v4 = v8;
    }
  }

  else if (v7)
  {
    -[SECC2MPGenericEventMetricValue setErrorValue:](self, "setErrorValue:");
    goto LABEL_12;
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (unint64_t)dateValue
{
  return self->_dateValue;
}

- (SECC2MPError)errorValue
{
  return self->_errorValue;
}

- (void)setErrorValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end