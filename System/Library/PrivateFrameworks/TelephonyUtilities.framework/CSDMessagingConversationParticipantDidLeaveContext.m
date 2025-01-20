@interface CSDMessagingConversationParticipantDidLeaveContext
- (BOOL)hasLeaveReason;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)leaveReasonAsString:(int)a3;
- (int)StringAsLeaveReason:(id)a3;
- (int)leaveReason;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLeaveReason:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLeaveReason:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipantDidLeaveContext

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)leaveReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_leaveReason;
  }
  else {
    return 0;
  }
}

- (void)setLeaveReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_leaveReason = a3;
}

- (void)setHasLeaveReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLeaveReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)leaveReasonAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003DBBD0 + a3);
  }
}

- (int)StringAsLeaveReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unspecified"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Handoff"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"GreenTea"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"ExitScreenMode"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationParticipantDidLeaveContext;
  id v3 = -[CSDMessagingConversationParticipantDidLeaveContext description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidLeaveContext dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    uint64_t leaveReason = self->_leaveReason;
    if (leaveReason >= 4) {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_leaveReason));
    }
    else {
      v7 = *(&off_1003DBBD0 + leaveReason);
    }
    [v3 setObject:v7 forKey:@"leaveReason"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100170A38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_leaveReason, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_version;
    *((_BYTE *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_leaveReason;
    *((_BYTE *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_version;
    *((_BYTE *)result + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_leaveReason;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_version != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }

  BOOL v6 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_leaveReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_leaveReason;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 16);
  }

  if ((v5 & 1) != 0)
  {
    self->_uint64_t leaveReason = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

@end