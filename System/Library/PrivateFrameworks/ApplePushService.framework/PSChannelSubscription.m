@interface PSChannelSubscription
+ (Class)attributesType;
- (BOOL)hasChannelId;
- (BOOL)hasCheckpoint;
- (BOOL)hasMessageReplayCount;
- (BOOL)hasSubscriptionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (NSMutableArray)attributes;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionInfoAsString:(int)a3;
- (int)StringAsSubscriptionInfo:(id)a3;
- (int)subscriptionInfo;
- (unint64_t)attributesCount;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (unint64_t)messageReplayCount;
- (void)addAttributes:(id)a3;
- (void)clearAttributes;
- (void)clearOneofValuesForSubscriptionInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setHasCheckpoint:(BOOL)a3;
- (void)setHasMessageReplayCount:(BOOL)a3;
- (void)setHasSubscriptionInfo:(BOOL)a3;
- (void)setMessageReplayCount:(unint64_t)a3;
- (void)setSubscriptionInfo:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscription

- (BOOL)hasChannelId
{
  return self->_channelId != 0LL;
}

- (void)setCheckpoint:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subscriptionInfo = 1;
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

- (void)setMessageReplayCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subscriptionInfo = 2;
  *(_BYTE *)&self->_has |= 2u;
  self->_messageReplayCount = a3;
}

- (void)setHasMessageReplayCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageReplayCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)subscriptionInfo
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_subscriptionInfo;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionInfo:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subscriptionInfo = a3;
}

- (void)setHasSubscriptionInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubscriptionInfo
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)subscriptionInfoAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_10011F8F8[a3];
  }
}

- (int)StringAsSubscriptionInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"checkpoint"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"message_replay_count"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForSubscriptionInfo
{
  *(_BYTE *)&self->_has &= ~4u;
  self->_subscriptionInfo = 0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_checkpoint = 0LL;
  *(_BYTE *)&self->_has &= ~2u;
  self->_messageReplayCount = 0LL;
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }

  -[NSMutableArray addObject:](attributes, "addObject:", v4);
}

- (unint64_t)attributesCount
{
  return (unint64_t)-[NSMutableArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSAttribute, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSChannelSubscription;
  id v3 = -[PSChannelSubscription description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscription dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_checkpoint));
    [v4 setObject:v7 forKey:@"checkpoint"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_messageReplayCount));
  [v4 setObject:v8 forKey:@"message_replay_count"];

  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo >= 3) {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_subscriptionInfo));
  }
  else {
    v10 = off_10011F8F8[subscriptionInfo];
  }
  [v4 setObject:v10 forKey:@"SubscriptionInfo"];

LABEL_13:
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v11 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_attributes, "count"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v12 = self->_attributes;
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v11, "addObject:", v17);
        }

        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v14);
    }

    [v4 setObject:v11 forKey:@"attributes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100070B78(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  channelId = self->_channelId;
  if (channelId) {
    PBDataWriterWriteDataField(v4, channelId, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_checkpoint, 2LL);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = self->_attributes;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11), 3LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_messageReplayCount, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_subscriptionInfo;
    *((_BYTE *)v4 + 44) |= 4u;
  }

  id v9 = v4;
  if (self->_channelId)
  {
    objc_msgSend(v4, "setChannelId:");
    id v4 = v9;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_checkpoint;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  if (-[PSChannelSubscription attributesCount](self, "attributesCount"))
  {
    [v9 clearAttributes];
    unint64_t v5 = -[PSChannelSubscription attributesCount](self, "attributesCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscription attributesAtIndex:](self, "attributesAtIndex:", i));
        [v9 addAttributes:v8];
      }
    }
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)v9 + 2) = self->_messageReplayCount;
    *((_BYTE *)v9 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[10] = self->_subscriptionInfo;
    *((_BYTE *)v5 + 44) |= 4u;
  }

  id v7 = -[NSData copyWithZone:](self->_channelId, "copyWithZone:", a3);
  id v8 = (void *)v6[4];
  v6[4] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = self->_checkpoint;
    *((_BYTE *)v6 + 44) |= 1u;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_attributes;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "copyWithZone:", a3, (void)v16);
        [v6 addAttributes:v14];

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[2] = self->_messageReplayCount;
    *((_BYTE *)v6 + 44) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_subscriptionInfo != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }

  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 4))
  {
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }

  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 3))
  {
    if (-[NSMutableArray isEqual:](attributes, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_18;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761LL * self->_subscriptionInfo;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v5 = 2654435761u * self->_checkpoint;
  }
  else {
    unint64_t v5 = 0LL;
  }
  unint64_t v6 = (unint64_t)-[NSMutableArray hash](self->_attributes, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_messageReplayCount;
  }
  else {
    unint64_t v7 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_uint64_t subscriptionInfo = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }

  if (*((void *)v4 + 4)) {
    -[PSChannelSubscription setChannelId:](self, "setChannelId:");
  }
  if ((*((_BYTE *)v5 + 44) & 1) != 0)
  {
    self->_checkpoint = *((void *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = *((id *)v5 + 3);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PSChannelSubscription addAttributes:]( self,  "addAttributes:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

  if ((*((_BYTE *)v5 + 44) & 2) != 0)
  {
    self->_messageReplayCount = *((void *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
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

- (unint64_t)messageReplayCount
{
  return self->_messageReplayCount;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end