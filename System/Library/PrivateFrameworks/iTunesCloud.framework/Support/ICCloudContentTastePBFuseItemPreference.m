@interface ICCloudContentTastePBFuseItemPreference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICCloudContentTastePBFuseItemPreference

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICCloudContentTastePBFuseItemPreference;
  id v3 = -[ICCloudContentTastePBFuseItemPreference description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContentTastePBFuseItemPreference dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_preference));
  [v3 setObject:v4 forKey:@"preference"];

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_adamId));
    [v3 setObject:v5 forKey:@"adam_id"];
  }

  externalId = self->_externalId;
  if (externalId) {
    [v3 setObject:externalId forKey:@"external_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_preferenceType));
    [v3 setObject:v11 forKey:@"preference_type"];

    if ((*(_BYTE *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_createdOffsetMillis));
  [v3 setObject:v10 forKey:@"created_offset_millis"];

  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_actionTimestampMillis));
    [v3 setObject:v8 forKey:@"action_timestamp_millis"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006DF00((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  ((void (*)(void))PBDataWriterWriteInt32Field)();
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field(v6, self->_adamId, 2LL);
  }
  externalId = self->_externalId;
  if (externalId) {
    PBDataWriterWriteStringField(v6, externalId, 3LL);
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    PBDataWriterWriteInt32Field(v6, self->_preferenceType, 5LL);
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  PBDataWriterWriteInt64Field(v6, self->_createdOffsetMillis, 4LL);
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 1) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt64Field(v6, self->_actionTimestampMillis, 6LL);
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  v5[10] = self->_preference;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)v5 + 2) = self->_adamId;
    *((_BYTE *)v5 + 48) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_externalId, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v6 + 11) = self->_preferenceType;
    *((_BYTE *)v6 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      return v6;
    }
    goto LABEL_6;
  }

  v6[3] = self->_createdOffsetMillis;
  *((_BYTE *)v6 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    v6[1] = self->_actionTimestampMillis;
    *((_BYTE *)v6 + 48) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    || self->_preference != *((_DWORD *)v4 + 10))
  {
    goto LABEL_25;
  }

  char has = (char)self->_has;
  char v7 = *((_BYTE *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_adamId != *((void *)v4 + 2)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_25;
  }

  externalId = self->_externalId;
  if ((unint64_t)externalId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalId, "isEqual:"))
    {
LABEL_25:
      BOOL v9 = 0;
      goto LABEL_26;
    }

    char has = (char)self->_has;
    char v7 = *((_BYTE *)v4 + 48);
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_createdOffsetMillis != *((void *)v4 + 3)) {
      goto LABEL_25;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_25;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_preferenceType != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_25;
  }

  BOOL v9 = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_actionTimestampMillis != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761LL * self->_adamId;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t preference = self->_preference;
  NSUInteger v5 = -[NSString hash](self->_externalId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0LL;
    return v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761LL * preference);
  }

  uint64_t v6 = 2654435761LL * self->_createdOffsetMillis;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761LL * self->_preferenceType;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761LL * self->_actionTimestampMillis;
  return v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761LL * preference);
}

- (void).cxx_destruct
{
}

@end