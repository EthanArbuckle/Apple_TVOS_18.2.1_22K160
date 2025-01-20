@interface TFMemoryUsage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFMemoryUsage

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFMemoryUsage;
  id v3 = -[TFMemoryUsage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFMemoryUsage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_availableBytes));
    [v3 setObject:v5 forKey:@"availableBytes"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytes));
    [v3 setObject:v6 forKey:@"totalBytes"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100239C28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_availableBytes, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_totalBytes, 2LL);
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)result + 1) = self->_availableBytes;
    *((_BYTE *)result + 24) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_totalBytes;
    *((_BYTE *)result + 24) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_availableBytes != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }

  BOOL v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_totalBytes != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v2 = 2654435761u * self->_availableBytes;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  unint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_totalBytes;
  return v3 ^ v2;
}

@end