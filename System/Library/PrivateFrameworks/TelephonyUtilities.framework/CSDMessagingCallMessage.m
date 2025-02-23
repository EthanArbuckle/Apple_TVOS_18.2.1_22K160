@interface CSDMessagingCallMessage
- (BOOL)hasInviteData;
- (BOOL)hasOBSOLETEProtoMomentsAvailable;
- (BOOL)hasProtoMomentsV2Available;
- (BOOL)hasProtoProtocolVersion;
- (BOOL)hasProtoSenderMuteUplink;
- (BOOL)hasProtoShouldSuppressInCallUI;
- (BOOL)hasProtoUpgradeSessionUUID;
- (BOOL)hasProtoWantsVideo;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)oBSOLETEProtoMomentsAvailable;
- (BOOL)protoMomentsV2Available;
- (BOOL)protoSenderMuteUplink;
- (BOOL)protoShouldSuppressInCallUI;
- (BOOL)protoWantsVideo;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)inviteData;
- (NSString)protoUpgradeSessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)protoProtocolVersion;
- (void)addProtocolVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOBSOLETEProtoMomentsAvailable:(BOOL)a3;
- (void)setHasProtoMomentsV2Available:(BOOL)a3;
- (void)setHasProtoProtocolVersion:(BOOL)a3;
- (void)setHasProtoSenderMuteUplink:(BOOL)a3;
- (void)setHasProtoShouldSuppressInCallUI:(BOOL)a3;
- (void)setHasProtoWantsVideo:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInviteData:(id)a3;
- (void)setMomentsAvailable:(BOOL)a3;
- (void)setOBSOLETEProtoMomentsAvailable:(BOOL)a3;
- (void)setProtoMomentsV2Available:(BOOL)a3;
- (void)setProtoProtocolVersion:(unsigned int)a3;
- (void)setProtoSenderMuteUplink:(BOOL)a3;
- (void)setProtoShouldSuppressInCallUI:(BOOL)a3;
- (void)setProtoUpgradeSessionUUID:(id)a3;
- (void)setProtoWantsVideo:(BOOL)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setSenderMuteUplink:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setWantsVideo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallMessage

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCallMessage protoProtocolVersion](self, "protoProtocolVersion")) {
    -[CSDMessagingCallMessage setProtoProtocolVersion:](self, "setProtoProtocolVersion:", v3);
  }
}

- (void)setWantsVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCallMessage protoWantsVideo](self, "protoWantsVideo")) {
    -[CSDMessagingCallMessage setProtoWantsVideo:](self, "setProtoWantsVideo:", v3);
  }
}

- (void)setSenderMuteUplink:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCallMessage protoSenderMuteUplink](self, "protoSenderMuteUplink")) {
    -[CSDMessagingCallMessage setProtoSenderMuteUplink:](self, "setProtoSenderMuteUplink:", v3);
  }
}

- (void)setMomentsAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCallMessage protoMomentsV2Available](self, "protoMomentsV2Available")) {
    -[CSDMessagingCallMessage setProtoMomentsV2Available:](self, "setProtoMomentsV2Available:", v3);
  }
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCallMessage protoShouldSuppressInCallUI](self, "protoShouldSuppressInCallUI")) {
    -[CSDMessagingCallMessage setProtoShouldSuppressInCallUI:](self, "setProtoShouldSuppressInCallUI:", v3);
  }
}

- (void)addProtocolVersion
{
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003DA578 + a3);
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Invite"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"SenderMuteUplink"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_protoProtocolVersion = a3;
}

- (void)setHasProtoProtocolVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtoProtocolVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setProtoWantsVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_protoWantsVideo = a3;
}

- (void)setHasProtoWantsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasProtoWantsVideo
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasInviteData
{
  return self->_inviteData != 0LL;
}

- (void)setOBSOLETEProtoMomentsAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_oBSOLETEProtoMomentsAvailable = a3;
}

- (void)setHasOBSOLETEProtoMomentsAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOBSOLETEProtoMomentsAvailable
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setProtoSenderMuteUplink:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_protoSenderMuteUplink = a3;
}

- (void)setHasProtoSenderMuteUplink:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtoSenderMuteUplink
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setProtoShouldSuppressInCallUI:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_protoShouldSuppressInCallUI = a3;
}

- (void)setHasProtoShouldSuppressInCallUI:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasProtoShouldSuppressInCallUI
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setProtoMomentsV2Available:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_protoMomentsV2Available = a3;
}

- (void)setHasProtoMomentsV2Available:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtoMomentsV2Available
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasProtoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingCallMessage;
  id v3 = -[CSDMessagingCallMessage description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 3) {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      v6 = *(&off_1003DA578 + type);
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_protoProtocolVersion));
    [v3 setObject:v7 forKey:@"protoProtocolVersion"];

    char has = (char)self->_has;
  }

  if ((has & 0x40) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoWantsVideo));
    [v3 setObject:v8 forKey:@"protoWantsVideo"];
  }

  inviteData = self->_inviteData;
  if (inviteData)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingAVConferenceInviteData dictionaryRepresentation]( inviteData,  "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"inviteData"];
  }

  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_oBSOLETEProtoMomentsAvailable));
    [v3 setObject:v15 forKey:@"OBSOLETE_protoMomentsAvailable"];

    char v11 = (char)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_14:
      if ((v11 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoSenderMuteUplink));
  [v3 setObject:v16 forKey:@"protoSenderMuteUplink"];

  char v11 = (char)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10010E0D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
    id v4 = v9;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v9, self->_protoProtocolVersion, 2LL);
  id v4 = v9;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField(v9, self->_protoWantsVideo, 3LL);
    id v4 = v9;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  v4[4] = self->_protoProtocolVersion;
  *((_BYTE *)v4 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 40) = self->_protoWantsVideo;
    *((_BYTE *)v4 + 44) |= 0x40u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[8] = self->_type;
    *((_BYTE *)v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  v5[4] = self->_protoProtocolVersion;
  *((_BYTE *)v5 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 40) = self->_protoWantsVideo;
    *((_BYTE *)v5 + 44) |= 0x40u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_51;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_protoProtocolVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_51;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x40) == 0) {
      goto LABEL_51;
    }
    if (self->_protoWantsVideo)
    {
      if (!*((_BYTE *)v4 + 40)) {
        goto LABEL_51;
      }
    }

    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_51;
  }

  inviteData = self->_inviteData;
  if ((unint64_t)inviteData | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingAVConferenceInviteData isEqual:](inviteData, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0) {
      goto LABEL_51;
    }
    if (self->_oBSOLETEProtoMomentsAvailable)
    {
      if (!*((_BYTE *)v4 + 36)) {
        goto LABEL_51;
      }
    }

    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_51;
  }

  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0) {
      goto LABEL_51;
    }
    if (self->_protoSenderMuteUplink)
    {
      if (!*((_BYTE *)v4 + 38)) {
        goto LABEL_51;
      }
    }

    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_51;
  }

  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0) {
      goto LABEL_51;
    }
    if (self->_protoShouldSuppressInCallUI)
    {
      if (!*((_BYTE *)v4 + 39)) {
        goto LABEL_51;
      }
    }

    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_51;
  }

  if ((has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0) {
      goto LABEL_57;
    }
LABEL_51:
    unsigned __int8 v8 = 0;
    goto LABEL_52;
  }

  if ((*((_BYTE *)v4 + 44) & 8) == 0) {
    goto LABEL_51;
  }
  if (!self->_protoMomentsV2Available)
  {
    if (!*((_BYTE *)v4 + 37)) {
      goto LABEL_57;
    }
    goto LABEL_51;
  }

  if (!*((_BYTE *)v4 + 37)) {
    goto LABEL_51;
  }
LABEL_57:
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_52:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x40) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v3 = 2654435761LL * self->_type;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_protoProtocolVersion;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_protoWantsVideo;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    char v6 = *((_BYTE *)v4 + 44);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_protoProtocolVersion = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
  {
LABEL_4:
    self->_protoWantsVideo = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 0x40u;
  }

- (unsigned)protoProtocolVersion
{
  return self->_protoProtocolVersion;
}

- (BOOL)protoWantsVideo
{
  return self->_protoWantsVideo;
}

- (CSDMessagingAVConferenceInviteData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
}

- (BOOL)oBSOLETEProtoMomentsAvailable
{
  return self->_oBSOLETEProtoMomentsAvailable;
}

- (BOOL)protoSenderMuteUplink
{
  return self->_protoSenderMuteUplink;
}

- (BOOL)protoShouldSuppressInCallUI
{
  return self->_protoShouldSuppressInCallUI;
}

- (BOOL)protoMomentsV2Available
{
  return self->_protoMomentsV2Available;
}

- (NSString)protoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID;
}

- (void)setProtoUpgradeSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end