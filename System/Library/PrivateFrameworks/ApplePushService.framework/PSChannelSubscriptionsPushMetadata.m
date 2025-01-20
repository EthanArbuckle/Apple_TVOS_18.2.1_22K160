@interface PSChannelSubscriptionsPushMetadata
- (BOOL)hasChannelId;
- (BOOL)hasCheckpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setHasCheckpoint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsPushMetadata

- (BOOL)hasChannelId
{
  return self->_channelId != 0LL;
}

- (void)setCheckpoint:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_checkpoint = a3;
}

- (void)setHasCheckpoint:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCheckpoint
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSChannelSubscriptionsPushMetadata;
  id v3 = -[PSChannelSubscriptionsPushMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscriptionsPushMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_checkpoint));
    [v4 setObject:v6 forKey:@"checkpoint"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000734F4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  channelId = self->_channelId;
  id v6 = v4;
  if (channelId)
  {
    PBDataWriterWriteDataField(v4, channelId, 1LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_checkpoint, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_channelId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setChannelId:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_checkpoint;
    *((_BYTE *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_checkpoint;
    *((_BYTE *)v5 + 24) |= 1u;
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

  BOOL v7 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_checkpoint == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v4 = 2654435761u * self->_checkpoint;
  }
  else {
    unint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[PSChannelSubscriptionsPushMetadata setChannelId:](self, "setChannelId:");
    unint64_t v4 = v5;
  }

  if ((v4[3] & 1) != 0)
  {
    self->_checkpoint = v4[1];
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

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void).cxx_destruct
{
}

@end