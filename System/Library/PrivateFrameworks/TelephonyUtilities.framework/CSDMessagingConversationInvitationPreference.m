@interface CSDMessagingConversationInvitationPreference
+ (id)invitationPreferenceWithTUConversationInvitationPreference:(id)a3;
+ (int)messagingHandleTypeFor:(int64_t)a3;
- (BOOL)hasHandleType;
- (BOOL)hasNotificationStyles;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TUConversationInvitationPreference)tuInvitationPreference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handleTypeAsString:(int)a3;
- (int)StringAsHandleType:(id)a3;
- (int)handleType;
- (int64_t)tuHandleType;
- (unint64_t)hash;
- (unsigned)notificationStyles;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandleType:(int)a3;
- (void)setHasHandleType:(BOOL)a3;
- (void)setHasNotificationStyles:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setNotificationStyles:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationInvitationPreference

+ (id)invitationPreferenceWithTUConversationInvitationPreference:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationInvitationPreference);
    -[CSDMessagingConversationInvitationPreference setHandleType:]( v5,  "setHandleType:",  objc_msgSend(a1, "messagingHandleTypeFor:", objc_msgSend(v4, "handleType")));
    id v6 = [v4 notificationStyles];

    -[CSDMessagingConversationInvitationPreference setNotificationStyles:](v5, "setNotificationStyles:", v6);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (int)messagingHandleTypeFor:(int64_t)a3
{
  else {
    return 0;
  }
}

- (TUConversationInvitationPreference)tuInvitationPreference
{
  if (-[CSDMessagingConversationInvitationPreference hasHandleType](self, "hasHandleType")
    && -[CSDMessagingConversationInvitationPreference hasNotificationStyles](self, "hasNotificationStyles"))
  {
    v3 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]( objc_alloc(&OBJC_CLASS___TUConversationInvitationPreference),  "initWithHandleType:notificationStyles:",  -[CSDMessagingConversationInvitationPreference tuHandleType](self, "tuHandleType"),  -[CSDMessagingConversationInvitationPreference notificationStyles](self, "notificationStyles"));
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (int64_t)tuHandleType
{
  unsigned int v2 = -[CSDMessagingConversationInvitationPreference handleType](self, "handleType");
  if (v2 > 3) {
    return 2LL;
  }
  else {
    return qword_100378CD8[v2];
  }
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)handleType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_handleType;
  }
  else {
    return 0;
  }
}

- (void)setHandleType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_handleType = a3;
}

- (void)setHasHandleType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHandleType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)handleTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003DA728 + a3);
  }
}

- (int)StringAsHandleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNotificationStyles:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_notificationStyles = a3;
}

- (void)setHasNotificationStyles:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNotificationStyles
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationInvitationPreference;
  id v3 = -[CSDMessagingConversationInvitationPreference description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationInvitationPreference dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t handleType = self->_handleType;
    if (handleType >= 4) {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_handleType));
    }
    else {
      v9 = *(&off_1003DA728 + handleType);
    }
    [v3 setObject:v9 forKey:@"handleType"];

    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    return v3;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
  [v3 setObject:v7 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_notificationStyles));
    [v3 setObject:v5 forKey:@"notificationStyles"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100111B44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    PBDataWriterWriteInt32Field(v6, self->_handleType, 2LL);
    id v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v6, self->_notificationStyles, 3LL);
    id v4 = v6;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v4[2] = self->_handleType;
    *((_BYTE *)v4 + 20) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  v4[4] = self->_version;
  *((_BYTE *)v4 + 20) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_notificationStyles;
    *((_BYTE *)v4 + 20) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_version;
    *((_BYTE *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 2) = self->_handleType;
  *((_BYTE *)result + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_notificationStyles;
  *((_BYTE *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_handleType != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_16;
  }

  BOOL v6 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_notificationStyles != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0LL;
    return v3 ^ v2 ^ v4;
  }

  uint64_t v2 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_handleType;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_notificationStyles;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    self->_uint64_t handleType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 20) & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  self->_version = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_notificationStyles = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

- (unsigned)version
{
  return self->_version;
}

- (unsigned)notificationStyles
{
  return self->_notificationStyles;
}

@end