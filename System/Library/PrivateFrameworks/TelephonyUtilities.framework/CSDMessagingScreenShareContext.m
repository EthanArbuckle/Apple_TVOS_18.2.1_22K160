@interface CSDMessagingScreenShareContext
- (BOOL)hasOriginType;
- (BOOL)hasScreenShareUUID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)screenShareUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incomingScreenShareRequestFromParticipant:(id)a3 handleEligibilityBlock:(id)a4 error:(id *)a5;
- (id)initOutgoingRequestWithScreenSharingRequest:(id)a3;
- (id)originTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsOriginType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)originType;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOriginType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOriginType:(int)a3;
- (void)setScreenShareUUID:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingScreenShareContext

- (BOOL)hasScreenShareUUID
{
  return self->_screenShareUUID != 0LL;
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
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003D82D0 + a3);
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ShareScreen"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"ViewScreen"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Cancel"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"Deny"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)originType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_originType;
  }
  else {
    return 0;
  }
}

- (void)setOriginType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_originType = a3;
}

- (void)setHasOriginType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)originTypeAsString:(int)a3
{
  if (!a3) {
    return @"JoinRequest";
  }
  if (a3 == 1) {
    id v3 = @"AskToShare";
  }
  else {
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsOriginType:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"AskToShare"];
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingScreenShareContext;
  id v3 = -[CSDMessagingScreenShareContext description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingScreenShareContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  screenShareUUID = self->_screenShareUUID;
  if (screenShareUUID) {
    [v3 setObject:screenShareUUID forKey:@"screenShareUUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4) {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      objc_super v8 = *(&off_1003D82D0 + type);
    }
    [v4 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    int originType = self->_originType;
    if (originType)
    {
      if (originType == 1) {
        v10 = @"AskToShare";
      }
      else {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_originType));
      }
    }

    else
    {
      v10 = @"JoinRequest";
    }

    [v4 setObject:v10 forKey:@"originType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005DE5C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  screenShareUUID = self->_screenShareUUID;
  id v7 = v4;
  if (screenShareUUID)
  {
    PBDataWriterWriteStringField(v4, screenShareUUID, 1LL);
    id v4 = v7;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_type, 2LL);
    id v4 = v7;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_originType, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_screenShareUUID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setScreenShareUUID:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((_BYTE *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_originType;
    *((_BYTE *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_screenShareUUID, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((_BYTE *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_originType;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  screenShareUUID = self->_screenShareUUID;
  if ((unint64_t)screenShareUUID | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_14;
  }

  BOOL v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_originType != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_screenShareUUID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0LL;
    return v4 ^ v3 ^ v5;
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761LL * self->_originType;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[CSDMessagingScreenShareContext setScreenShareUUID:](self, "setScreenShareUUID:");
    uint64_t v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t type = v4[6];
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 28);
  }

  if ((v5 & 1) != 0)
  {
    self->_int originType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)screenShareUUID
{
  return self->_screenShareUUID;
}

- (void)setScreenShareUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)initOutgoingRequestWithScreenSharingRequest:(id)a3
{
  id v4 = a3;
  char v5 = -[CSDMessagingScreenShareContext init](self, "init");
  if (!v5) {
    goto LABEL_17;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  -[CSDMessagingScreenShareContext setScreenShareUUID:](v5, "setScreenShareUUID:", v7);

  id v8 = [v4 type];
  if (v8 == (id)4)
  {
    v9 = v5;
    uint64_t v10 = 3LL;
  }

  else if (v8 == (id)2)
  {
    v9 = v5;
    uint64_t v10 = 1LL;
  }

  else
  {
    if (v8 != (id)1)
    {
      id v11 = sub_1001704C4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1002B6BE0();
      }

      char v5 = 0LL;
      goto LABEL_12;
    }

    v9 = v5;
    uint64_t v10 = 0LL;
  }

  -[CSDMessagingScreenShareContext setType:](v9, "setType:", v10);
LABEL_12:
  id v13 = [v4 originType];
  if (v13 == (id)1)
  {
    uint64_t v14 = 0LL;
    goto LABEL_16;
  }

  if (v13 == (id)2)
  {
    uint64_t v14 = 1LL;
LABEL_16:
    -[CSDMessagingScreenShareContext setOriginType:](v5, "setOriginType:", v14);
  }

- (id)incomingScreenShareRequestFromParticipant:(id)a3 handleEligibilityBlock:(id)a4 error:(id *)a5
{
  id v8 = (uint64_t (**)(id, void *))a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingScreenShareContext screenShareUUID](self, "screenShareUUID"));
  v12 = -[NSUUID initWithUUIDString:](v10, "initWithUUIDString:", v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
  id v14 = [v9 identifier];

  unsigned int v15 = -[CSDMessagingScreenShareContext type](self, "type");
  if (v15)
  {
    if (v15 != 1)
    {
      id v20 = sub_1001704C4();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1002B6C40();
      }

      if (!a5) {
        goto LABEL_22;
      }
      uint64_t v22 = TUScreenSharingRequestErrorDomain;
      uint64_t v23 = 1LL;
      goto LABEL_27;
    }

    uint64_t v16 = 3LL;
  }

  else
  {
    uint64_t v16 = 4LL;
  }

  unsigned int v17 = -[CSDMessagingScreenShareContext originType](self, "originType");
  if (!v17)
  {
    uint64_t v18 = 1LL;
    if (v12) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }

  if (v17 != 1)
  {
    id v26 = sub_1001704C4();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1002B6CA0();
    }

    goto LABEL_22;
  }

  uint64_t v18 = 2LL;
  if (!v12)
  {
LABEL_15:
    id v24 = sub_1001704C4();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1002B6D00();
    }

    if (!a5) {
      goto LABEL_22;
    }
    uint64_t v22 = TUScreenSharingRequestErrorDomain;
    uint64_t v23 = 2LL;
LABEL_27:
    v19 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  0LL));
    goto LABEL_28;
  }

@end