@interface PSChannelResponse
- (BOOL)hasChannelId;
- (BOOL)hasChannelStatus;
- (BOOL)hasChannelSubscriptionCheckpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (id)channelStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChannelStatus:(id)a3;
- (int)channelStatus;
- (unint64_t)channelSubscriptionCheckpoint;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setChannelStatus:(int)a3;
- (void)setChannelSubscriptionCheckpoint:(unint64_t)a3;
- (void)setHasChannelStatus:(BOOL)a3;
- (void)setHasChannelSubscriptionCheckpoint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelResponse

- (BOOL)hasChannelId
{
  return self->_channelId != 0LL;
}

- (int)channelStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_channelStatus;
  }
  else {
    return 0;
  }
}

- (void)setChannelStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_channelStatus = a3;
}

- (void)setHasChannelStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)channelStatusAsString:(int)a3
{
  if (!a3) {
    return @"CHANNEL_ID_INVALID";
  }
  if (a3 == 1) {
    char v3 = @"CHECKPOINT_LATEST";
  }
  else {
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsChannelStatus:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"CHECKPOINT_LATEST"];
  }

  return v4;
}

- (void)setChannelSubscriptionCheckpoint:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelSubscriptionCheckpoint = a3;
}

- (void)setHasChannelSubscriptionCheckpoint:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelSubscriptionCheckpoint
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSChannelResponse;
  id v3 = -[PSChannelResponse description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int channelStatus = self->_channelStatus;
    if (channelStatus)
    {
      if (channelStatus == 1) {
        objc_super v8 = @"CHECKPOINT_LATEST";
      }
      else {
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_channelStatus));
      }
    }

    else
    {
      objc_super v8 = @"CHANNEL_ID_INVALID";
    }

    [v4 setObject:v8 forKey:@"channel_status"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_channelSubscriptionCheckpoint));
    [v4 setObject:v9 forKey:@"channel_subscription_checkpoint"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001D678((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  channelId = self->_channelId;
  id v7 = v4;
  if (channelId)
  {
    PBDataWriterWriteDataField(v4, channelId, 1LL);
    id v4 = v7;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_channelStatus, 2LL);
    id v4 = v7;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_channelSubscriptionCheckpoint, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_channelId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setChannelId:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_channelStatus;
    *((_BYTE *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_channelSubscriptionCheckpoint;
    *((_BYTE *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_channelId, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_channelStatus;
    *((_BYTE *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[1] = self->_channelSubscriptionCheckpoint;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_channelStatus != *((_DWORD *)v4 + 6)) {
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
    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_channelStatus;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0LL;
    return v4 ^ v3 ^ v5;
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_channelSubscriptionCheckpoint;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[PSChannelResponse setChannelId:](self, "setChannelId:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_int channelStatus = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 28);
  }

  if ((v5 & 1) != 0)
  {
    self->_channelSubscriptionCheckpoint = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (unint64_t)channelSubscriptionCheckpoint
{
  return self->_channelSubscriptionCheckpoint;
}

- (void).cxx_destruct
{
}

@end