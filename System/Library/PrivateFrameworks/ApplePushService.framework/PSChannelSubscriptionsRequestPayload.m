@interface PSChannelSubscriptionsRequestPayload
+ (Class)appChannelSubscriptionsType;
+ (id)createPayloadForSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 subscriptionType:(int)a5;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSubscriptionsType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appChannelSubscriptions;
- (id)appChannelSubscriptionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionsTypeAsString:(int)a3;
- (id)versionAsString:(int)a3;
- (int)StringAsSubscriptionsType:(id)a3;
- (int)StringAsVersion:(id)a3;
- (int)subscriptionsType;
- (int)version;
- (unint64_t)appChannelSubscriptionsCount;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)addAppChannelSubscriptions:(id)a3;
- (void)clearAppChannelSubscriptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppChannelSubscriptions:(id)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSubscriptionsType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSubscriptionsType:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsRequestPayload

+ (id)createPayloadForSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 subscriptionType:(int)a5
{
  id v6 = a3;
  id v63 = a4;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v80;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
        v12 = objc_alloc_init(&OBJC_CLASS___PSChannelSubscription);
        v13 = objc_alloc(&OBJC_CLASS___NSData);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 channelID]);
        v15 = -[NSData initWithBase64EncodedString:options:](v13, "initWithBase64EncodedString:options:", v14, 0LL);

        -[PSChannelSubscription setChannelId:](v12, "setChannelId:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v11 channelTopic]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([&off_10012B7F0 objectForKeyedSubscript:v16]);

        else {
          BOOL v18 = v17 == 0LL;
        }
        if (v18) {
          -[PSChannelSubscription setCheckpoint:](v12, "setCheckpoint:", [v11 checkpoint]);
        }
        else {
          -[PSChannelSubscription setMessageReplayCount:]( v12,  "setMessageReplayCount:",  [v17 unsignedLongLongValue]);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue([v11 channelTopic]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v19]);
        v21 = v20;
        if (v20) {
          id v22 = v20;
        }
        else {
          id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [obj count]));
        }
        v23 = v22;

        [v23 addObject:v12];
        v24 = (void *)objc_claimAutoreleasedReturnValue([v11 channelTopic]);
        [v66 setObject:v23 forKeyedSubscript:v24];
      }

      id v8 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
    }

    while (v8);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v64 = v63;
  id v26 = [v64 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v76;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v76 != v28) {
          objc_enumerationMutation(v64);
        }
        v30 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)j);
        v31 = objc_alloc_init(&OBJC_CLASS___PSChannelUnsubscription);
        v32 = objc_alloc(&OBJC_CLASS___NSData);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v30 channelID]);
        v34 = -[NSData initWithBase64EncodedString:options:](v32, "initWithBase64EncodedString:options:", v33, 0LL);

        -[PSChannelUnsubscription setChannelId:](v31, "setChannelId:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v30 channelTopic]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v35]);
        v37 = v36;
        if (v36) {
          id v38 = v36;
        }
        else {
          id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v64 count]));
        }
        v39 = v38;

        [v39 addObject:v31];
        v40 = (void *)objc_claimAutoreleasedReturnValue([v30 channelTopic]);
        [v25 setObject:v39 forKeyedSubscript:v40];
      }

      id v27 = [v64 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }

    while (v27);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v62 = (id)objc_claimAutoreleasedReturnValue([v66 allKeys]);
  id v42 = [v62 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v72;
    do
    {
      for (k = 0LL; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v72 != v44) {
          objc_enumerationMutation(v62);
        }
        uint64_t v46 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)k);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v46]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v46]);
        [v25 removeObjectForKey:v46];
        v49 = objc_alloc_init(&OBJC_CLASS___PSAppChannelSubscriptions);
        -[PSAppChannelSubscriptions setAppId:](v49, "setAppId:", v46);
        -[PSAppChannelSubscriptions setSubscriptionChannels:](v49, "setSubscriptionChannels:", v47);
        -[PSAppChannelSubscriptions setUnsubscriptionChannels:](v49, "setUnsubscriptionChannels:", v48);
        [v41 addObject:v49];
      }

      id v43 = [v62 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }

    while (v43);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  v50 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);
  id v51 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      for (m = 0LL; m != v52; m = (char *)m + 1)
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)m);
        v56 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v55]);
        v57 = objc_alloc_init(&OBJC_CLASS___PSAppChannelSubscriptions);
        -[PSAppChannelSubscriptions setAppId:](v57, "setAppId:", v55);
        -[PSAppChannelSubscriptions setUnsubscriptionChannels:](v57, "setUnsubscriptionChannels:", v56);
        [v41 addObject:v57];
      }

      id v52 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }

    while (v52);
  }

  v58 = objc_alloc_init(&OBJC_CLASS___PSChannelSubscriptionsRequestPayload);
  -[PSChannelSubscriptionsRequestPayload setSubscriptionsType:](v58, "setSubscriptionsType:", a5);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v41));
  -[PSChannelSubscriptionsRequestPayload setAppChannelSubscriptions:](v58, "setAppChannelSubscriptions:", v59);

  -[PSChannelSubscriptionsRequestPayload setVersion:](v58, "setVersion:", 1LL);
  return v58;
}

- (int)version
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(int)a3
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

- (id)versionAsString:(int)a3
{
  if (a3 == 1) {
    char v3 = @"V_1";
  }
  else {
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsVersion:(id)a3
{
  return 1;
}

- (void)clearAppChannelSubscriptions
{
}

- (void)addAppChannelSubscriptions:(id)a3
{
  id v4 = a3;
  appChannelSubscriptions = self->_appChannelSubscriptions;
  id v8 = v4;
  if (!appChannelSubscriptions)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_appChannelSubscriptions;
    self->_appChannelSubscriptions = v6;

    id v4 = v8;
    appChannelSubscriptions = self->_appChannelSubscriptions;
  }

  -[NSMutableArray addObject:](appChannelSubscriptions, "addObject:", v4);
}

- (unint64_t)appChannelSubscriptionsCount
{
  return (unint64_t)-[NSMutableArray count](self->_appChannelSubscriptions, "count");
}

- (id)appChannelSubscriptionsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_appChannelSubscriptions, "objectAtIndex:", a3);
}

+ (Class)appChannelSubscriptionsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___PSAppChannelSubscriptions, a2);
}

- (int)subscriptionsType
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_subscriptionsType;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionsType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subscriptionsType = a3;
}

- (void)setHasSubscriptionsType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubscriptionsType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)subscriptionsTypeAsString:(int)a3
{
  if (!a3) {
    return @"DELTA_SUBSCRIPTION";
  }
  if (a3 == 1) {
    char v3 = @"FULL_SUBSCRIPTION";
  }
  else {
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsSubscriptionsType:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"FULL_SUBSCRIPTION"];
  }

  return v4;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSChannelSubscriptionsRequestPayload;
  id v3 = -[PSChannelSubscriptionsRequestPayload description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscriptionsRequestPayload dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if (self->_version == 1) {
      int v4 = @"V_1";
    }
    else {
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_version));
    }
    [v3 setObject:v4 forKey:@"version"];
  }

  if (-[NSMutableArray count](self->_appChannelSubscriptions, "count"))
  {
    v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_appChannelSubscriptions, "count"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = self->_appChannelSubscriptions;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v5 forKey:@"app_channel_subscriptions"];
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int subscriptionsType = self->_subscriptionsType;
    if (subscriptionsType)
    {
      if (subscriptionsType == 1) {
        v14 = @"FULL_SUBSCRIPTION";
      }
      else {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_subscriptionsType));
      }
    }

    else
    {
      v14 = @"DELTA_SUBSCRIPTION";
    }

    [v3 setObject:v14 forKey:@"subscriptions_type"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_sequenceNumber));
    [v3 setObject:v15 forKey:@"sequence_number"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003B274((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_version, 1LL);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = self->_appChannelSubscriptions;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v12 + 1) + 8LL * (void)i), 2LL);
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_subscriptionsType, 3LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_sequenceNumber, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 32) |= 4u;
  }

  id v10 = v4;
  if (-[PSChannelSubscriptionsRequestPayload appChannelSubscriptionsCount](self, "appChannelSubscriptionsCount"))
  {
    [v10 clearAppChannelSubscriptions];
    unint64_t v5 = -[PSChannelSubscriptionsRequestPayload appChannelSubscriptionsCount](self, "appChannelSubscriptionsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PSChannelSubscriptionsRequestPayload appChannelSubscriptionsAtIndex:]( self,  "appChannelSubscriptionsAtIndex:",  i));
        [v10 addAppChannelSubscriptions:v8];
      }
    }
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 6) = self->_subscriptionsType;
    *((_BYTE *)v10 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v10 + 1) = self->_sequenceNumber;
    *((_BYTE *)v10 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 32) |= 4u;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = self->_appChannelSubscriptions;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v15);
        [v6 addAppChannelSubscriptions:v12];
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_subscriptionsType;
    *((_BYTE *)v6 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v6 + 1) = self->_sequenceNumber;
    *((_BYTE *)v6 + 32) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }

  appChannelSubscriptions = self->_appChannelSubscriptions;
  if ((unint64_t)appChannelSubscriptions | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](appChannelSubscriptions, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_subscriptionsType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }

  BOOL v8 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_sequenceNumber != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_appChannelSubscriptions, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_subscriptionsType;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6;
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_sequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PSChannelSubscriptionsRequestPayload addAppChannelSubscriptions:]( self,  "addAppChannelSubscriptions:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  char v11 = *((_BYTE *)v5 + 32);
  if ((v11 & 2) != 0)
  {
    self->_int subscriptionsType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
    char v11 = *((_BYTE *)v5 + 32);
  }

  if ((v11 & 1) != 0)
  {
    self->_sequenceNumber = *((void *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)appChannelSubscriptions
{
  return self->_appChannelSubscriptions;
}

- (void)setAppChannelSubscriptions:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
}

@end