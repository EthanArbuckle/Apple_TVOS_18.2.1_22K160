@interface BMPBStoreEventAtomValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation BMPBStoreEventAtomValue

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BMPBStoreEventAtomValue;
  id v3 = -[BMPBStoreEventAtomValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMPBStoreEventAtomValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_dataVersion));
    [v3 setObject:v5 forKey:@"dataVersion"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_dataTimestamp));
    [v3 setObject:v6 forKey:@"dataTimestamp"];
  }

  eventData = self->_eventData;
  if (eventData) {
    [v3 setObject:eventData forKey:@"eventData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100034154((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_dataVersion, 1LL);
    id v4 = v7;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v7, 2LL, self->_dataTimestamp);
    id v4 = v7;
  }

  eventData = self->_eventData;
  if (eventData)
  {
    PBDataWriterWriteDataField(v7, eventData, 3LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_dataVersion;
    *((_BYTE *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[1] = *(void *)&self->_dataTimestamp;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v8 = -[NSData copyWithZone:](self->_eventData, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_dataVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v7 = 0;
    goto LABEL_15;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }

  eventData = self->_eventData;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_dataVersion;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0LL;
    return v8 ^ v3 ^ (unint64_t)-[NSData hash](self->_eventData, "hash");
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double dataTimestamp = self->_dataTimestamp;
  double v5 = -dataTimestamp;
  if (dataTimestamp >= 0.0) {
    double v5 = self->_dataTimestamp;
  }
  double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }

  else
  {
    v8 -= (unint64_t)fabs(v7);
  }

  return v8 ^ v3 ^ (unint64_t)-[NSData hash](self->_eventData, "hash");
}

- (void).cxx_destruct
{
}

@end