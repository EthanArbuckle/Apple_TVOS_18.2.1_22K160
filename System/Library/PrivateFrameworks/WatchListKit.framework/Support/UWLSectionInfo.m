@interface UWLSectionInfo
- (BOOL)hasIsDone;
- (BOOL)hasLengthInMilliseconds;
- (BOOL)hasPassThrough;
- (BOOL)hasPlayheadInMilliseconds;
- (BOOL)isDone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passThrough;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)lengthInMilliseconds;
- (int64_t)playheadInMilliseconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDone:(BOOL)a3;
- (void)setHasLengthInMilliseconds:(BOOL)a3;
- (void)setHasPlayheadInMilliseconds:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLengthInMilliseconds:(int64_t)a3;
- (void)setPassThrough:(id)a3;
- (void)setPlayheadInMilliseconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLSectionInfo

- (void)setIsDone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isDone = a3;
}

- (void)setHasIsDone:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDone
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPlayheadInMilliseconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playheadInMilliseconds = a3;
}

- (void)setHasPlayheadInMilliseconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayheadInMilliseconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLengthInMilliseconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lengthInMilliseconds = a3;
}

- (void)setHasLengthInMilliseconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLengthInMilliseconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPassThrough
{
  return self->_passThrough != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLSectionInfo;
  id v3 = -[UWLSectionInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLSectionInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isDone));
    [v3 setObject:v8 forKey:@"is_done"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_playheadInMilliseconds));
  [v3 setObject:v9 forKey:@"playhead_in_milliseconds"];

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_lengthInMilliseconds));
    [v3 setObject:v5 forKey:@"length_in_milliseconds"];
  }

- (BOOL)readFrom:(id)a3
{
  return UWLSectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_isDone, 1LL);
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt64Field(v7, self->_playheadInMilliseconds, 2LL);
  id v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field(v7, self->_lengthInMilliseconds, 3LL);
    id v4 = v7;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[32] = self->_isDone;
    v4[36] |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v4 + 2) = self->_playheadInMilliseconds;
  v4[36] |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_lengthInMilliseconds;
    v4[36] |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v5[2] = self->_playheadInMilliseconds;
    *((_BYTE *)v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_BYTE *)v5 + 32) = self->_isDone;
  *((_BYTE *)v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    v5[1] = self->_lengthInMilliseconds;
    *((_BYTE *)v5 + 36) |= 1u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_isDone)
      {
        if (!*((_BYTE *)v4 + 32)) {
          goto LABEL_22;
        }
        goto LABEL_10;
      }

      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_10;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0LL;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_passThrough, "hash");
  }

  uint64_t v2 = 2654435761LL * self->_isDone;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_playheadInMilliseconds;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_lengthInMilliseconds;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_passThrough, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_isDone = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_playheadInMilliseconds = *((void *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_4:
    self->_lengthInMilliseconds = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (BOOL)isDone
{
  return self->_isDone;
}

- (int64_t)playheadInMilliseconds
{
  return self->_playheadInMilliseconds;
}

- (int64_t)lengthInMilliseconds
{
  return self->_lengthInMilliseconds;
}

- (NSString)passThrough
{
  return self->_passThrough;
}

- (void)setPassThrough:(id)a3
{
}

- (void).cxx_destruct
{
}

@end