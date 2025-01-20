@interface CSDMessagingParticipantProminenceEntry
- (BOOL)hasAudioPriority;
- (BOOL)hasParticipantIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)audioPriority;
- (unint64_t)hash;
- (unint64_t)participantIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioPriority:(unint64_t)a3;
- (void)setHasAudioPriority:(BOOL)a3;
- (void)setHasParticipantIdentifier:(BOOL)a3;
- (void)setParticipantIdentifier:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingParticipantProminenceEntry

- (void)setParticipantIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_participantIdentifier = a3;
}

- (void)setHasParticipantIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParticipantIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAudioPriority:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioPriority = a3;
}

- (void)setHasAudioPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioPriority
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingParticipantProminenceEntry;
  id v3 = -[CSDMessagingParticipantProminenceEntry description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingParticipantProminenceEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_participantIdentifier));
    [v3 setObject:v5 forKey:@"participantIdentifier"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_audioPriority));
    [v3 setObject:v6 forKey:@"audioPriority"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001BE54((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_participantIdentifier, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_audioPriority, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_participantIdentifier;
    *((_BYTE *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[1] = self->_audioPriority;
    *((_BYTE *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_participantIdentifier;
    *((_BYTE *)result + 24) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)result + 1) = self->_audioPriority;
    *((_BYTE *)result + 24) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_participantIdentifier != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }

  BOOL v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_audioPriority != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_participantIdentifier;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  unint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_audioPriority;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_participantIdentifier = *((void *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 24);
  }

  if ((v5 & 1) != 0)
  {
    self->_audioPriority = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (unint64_t)audioPriority
{
  return self->_audioPriority;
}

@end