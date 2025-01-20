@interface DaemonPBFuseItemPreference
- (BOOL)hasAdamId;
- (BOOL)hasCreatedOffsetMillis;
- (BOOL)hasExternalId;
- (BOOL)hasPreferenceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)externalId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)preference;
- (int)preferenceType;
- (int64_t)adamId;
- (int64_t)createdOffsetMillis;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCreatedOffsetMillis:(int64_t)a3;
- (void)setExternalId:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasCreatedOffsetMillis:(BOOL)a3;
- (void)setHasPreferenceType:(BOOL)a3;
- (void)setPreference:(int)a3;
- (void)setPreferenceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DaemonPBFuseItemPreference

- (void)setAdamId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExternalId
{
  return self->_externalId != 0LL;
}

- (void)setCreatedOffsetMillis:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_createdOffsetMillis = a3;
}

- (void)setHasCreatedOffsetMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreatedOffsetMillis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)preferenceType
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_preferenceType;
  }
  else {
    return 0;
  }
}

- (void)setPreferenceType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_preferenceType = a3;
}

- (void)setHasPreferenceType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreferenceType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DaemonPBFuseItemPreference;
  id v3 = -[DaemonPBFuseItemPreference description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonPBFuseItemPreference dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_preference));
  [v3 setObject:v4 forKey:@"preference"];

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_adamId));
    [v3 setObject:v5 forKey:@"adam_id"];
  }

  externalId = self->_externalId;
  if (externalId) {
    [v3 setObject:externalId forKey:@"external_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_createdOffsetMillis));
    [v3 setObject:v8 forKey:@"created_offset_millis"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_preferenceType));
    [v3 setObject:v9 forKey:@"preference_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DaemonPBFuseItemPreferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  ((void (*)(void))PBDataWriterWriteInt32Field)();
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt64Field(v6, self->_adamId, 2LL);
  }
  externalId = self->_externalId;
  if (externalId) {
    PBDataWriterWriteStringField(v6, externalId, 3LL);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field(v6, self->_createdOffsetMillis, 4LL);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field(v6, self->_preferenceType, 5LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = v5;
  v5[8] = self->_preference;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v5 + 1) = self->_adamId;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_externalId, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6[2] = self->_createdOffsetMillis;
    *((_BYTE *)v6 + 40) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 9) = self->_preferenceType;
    *((_BYTE *)v6 + 40) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class(self)]
    || self->_preference != *((_DWORD *)v4 + 8))
  {
    goto LABEL_20;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_20;
  }

  externalId = self->_externalId;
  if ((unint64_t)externalId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](externalId, "isEqual:"))
    {
LABEL_20:
      BOOL v7 = 0;
      goto LABEL_21;
    }

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_createdOffsetMillis != *((void *)v4 + 2)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }

  BOOL v7 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_preferenceType != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_adamId;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t preference = self->_preference;
  NSUInteger v5 = -[NSString hash](self->_externalId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761LL * self->_createdOffsetMillis;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0LL;
    return v3 ^ v5 ^ v6 ^ v7 ^ (2654435761LL * preference);
  }

  uint64_t v6 = 0LL;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761LL * self->_preferenceType;
  return v3 ^ v5 ^ v6 ^ v7 ^ (2654435761LL * preference);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t preference = *((_DWORD *)v4 + 8);
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_adamId = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[DaemonPBFuseItemPreference setExternalId:](self, "setExternalId:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_createdOffsetMillis = *((void *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 40);
  }

  if ((v5 & 4) != 0)
  {
    self->_preferenceType = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (int)preference
{
  return self->_preference;
}

- (void)setPreference:(int)a3
{
  self->_uint64_t preference = a3;
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (NSString)externalId
{
  return self->_externalId;
}

- (void)setExternalId:(id)a3
{
}

- (int64_t)createdOffsetMillis
{
  return self->_createdOffsetMillis;
}

- (void).cxx_destruct
{
}

@end