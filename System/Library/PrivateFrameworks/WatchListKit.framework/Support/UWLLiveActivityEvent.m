@interface UWLLiveActivityEvent
- (BOOL)hasBundleId;
- (BOOL)hasCause;
- (BOOL)hasChannel;
- (BOOL)hasCleanupTimeEpochMillis;
- (BOOL)hasContent;
- (BOOL)hasContractOrTimed;
- (BOOL)hasExpectedStartTimeEpochMillis;
- (BOOL)hasMillisecondsSinceEvent;
- (BOOL)hasPassThrough;
- (BOOL)hasProfileId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)passThrough;
- (NSString)profileId;
- (UWLLiveActivityEventChannel)channel;
- (UWLLiveActivityEventContent)content;
- (id)causeAsString:(int)a3;
- (id)contractOrTimedAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCause:(id)a3;
- (int)StringAsContractOrTimed:(id)a3;
- (int)cause;
- (int)contractOrTimed;
- (int64_t)cleanupTimeEpochMillis;
- (int64_t)expectedStartTimeEpochMillis;
- (int64_t)millisecondsSinceEvent;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCause:(int)a3;
- (void)setChannel:(id)a3;
- (void)setCleanupTimeEpochMillis:(int64_t)a3;
- (void)setContent:(id)a3;
- (void)setContractOrTimed:(int)a3;
- (void)setExpectedStartTimeEpochMillis:(int64_t)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasCleanupTimeEpochMillis:(BOOL)a3;
- (void)setHasContractOrTimed:(BOOL)a3;
- (void)setHasExpectedStartTimeEpochMillis:(BOOL)a3;
- (void)setHasMillisecondsSinceEvent:(BOOL)a3;
- (void)setMillisecondsSinceEvent:(int64_t)a3;
- (void)setPassThrough:(id)a3;
- (void)setProfileId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLLiveActivityEvent

- (BOOL)hasBundleId
{
  return self->_bundleId != 0LL;
}

- (void)setMillisecondsSinceEvent:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_millisecondsSinceEvent = a3;
}

- (void)setHasMillisecondsSinceEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMillisecondsSinceEvent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasProfileId
{
  return self->_profileId != 0LL;
}

- (BOOL)hasChannel
{
  return self->_channel != 0LL;
}

- (BOOL)hasContent
{
  return self->_content != 0LL;
}

- (int)cause
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_cause;
  }
  else {
    return 1;
  }
}

- (void)setCause:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)causeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10003CD60 + a3 - 1);
  }
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Tune_In"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Event_End"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"Event_Start"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"Tune_Out"])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setExpectedStartTimeEpochMillis:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expectedStartTimeEpochMillis = a3;
}

- (void)setHasExpectedStartTimeEpochMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpectedStartTimeEpochMillis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCleanupTimeEpochMillis:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cleanupTimeEpochMillis = a3;
}

- (void)setHasCleanupTimeEpochMillis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCleanupTimeEpochMillis
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)contractOrTimed
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    return self->_contractOrTimed;
  }
  else {
    return 0;
  }
}

- (void)setContractOrTimed:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_contractOrTimed = a3;
}

- (void)setHasContractOrTimed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasContractOrTimed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)contractOrTimedAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10003CD80 + a3);
  }
}

- (int)StringAsContractOrTimed:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Not_Specified_Implied_Legacy_Contract"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Contract"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Timed"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPassThrough
{
  return self->_passThrough != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLLiveActivityEvent;
  id v3 = -[UWLLiveActivityEvent description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLLiveActivityEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundle_id"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_millisecondsSinceEvent));
    [v4 setObject:v6 forKey:@"milliseconds_since_event"];
  }

  profileId = self->_profileId;
  if (profileId) {
    [v4 setObject:profileId forKey:@"profile_id"];
  }
  channel = self->_channel;
  if (channel)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UWLLiveActivityEventChannel dictionaryRepresentation](channel, "dictionaryRepresentation"));
    [v4 setObject:v9 forKey:@"channel"];
  }

  content = self->_content;
  if (content)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UWLLiveActivityEventContent dictionaryRepresentation](content, "dictionaryRepresentation"));
    [v4 setObject:v11 forKey:@"content"];
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    int v13 = self->_cause - 1;
    if (v13 >= 4) {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_cause));
    }
    else {
      v14 = *(&off_10003CD60 + v13);
    }
    [v4 setObject:v14 forKey:@"cause"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
LABEL_21:
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_cleanupTimeEpochMillis));
      [v4 setObject:v16 forKey:@"cleanup_time_epoch_millis"];

      if ((*(_BYTE *)&self->_has & 0x10) == 0) {
        goto LABEL_26;
      }
LABEL_22:
      uint64_t contractOrTimed = self->_contractOrTimed;
      if (contractOrTimed >= 3) {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_contractOrTimed));
      }
      else {
        v18 = *(&off_10003CD80 + contractOrTimed);
      }
      [v4 setObject:v18 forKey:@"contract_or_timed"];

      goto LABEL_26;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_expectedStartTimeEpochMillis));
  [v4 setObject:v15 forKey:@"expected_start_time_epoch_millis"];

  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_21;
  }
LABEL_14:
  if ((has & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_26:
  passThrough = self->_passThrough;
  if (passThrough) {
    [v4 setObject:passThrough forKey:@"pass_through"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLLiveActivityEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  bundleId = self->_bundleId;
  id v11 = v4;
  if (bundleId)
  {
    PBDataWriterWriteStringField(v4, bundleId, 1LL);
    id v4 = v11;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field(v11, self->_millisecondsSinceEvent, 2LL);
    id v4 = v11;
  }

  profileId = self->_profileId;
  if (profileId)
  {
    PBDataWriterWriteStringField(v11, profileId, 3LL);
    id v4 = v11;
  }

  channel = self->_channel;
  if (channel)
  {
    PBDataWriterWriteSubmessage(v11, channel, 4LL);
    id v4 = v11;
  }

  content = self->_content;
  if (content)
  {
    PBDataWriterWriteSubmessage(v11, content, 5LL);
    id v4 = v11;
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v11, self->_cause, 6LL);
    id v4 = v11;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  PBDataWriterWriteInt64Field(v11, self->_expectedStartTimeEpochMillis, 7LL);
  id v4 = v11;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_millisecondsSinceEvent;
    *((_BYTE *)v4 + 88) |= 4u;
  }

  if (self->_profileId)
  {
    objc_msgSend(v6, "setProfileId:");
    id v4 = v6;
  }

  if (self->_channel)
  {
    objc_msgSend(v6, "setChannel:");
    id v4 = v6;
  }

  if (self->_content)
  {
    objc_msgSend(v6, "setContent:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_cause;
    *((_BYTE *)v4 + 88) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  *((void *)v4 + 2) = self->_expectedStartTimeEpochMillis;
  *((_BYTE *)v4 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[3] = self->_millisecondsSinceEvent;
    *((_BYTE *)v5 + 88) |= 4u;
  }

  id v8 = -[NSString copyWithZone:](self->_profileId, "copyWithZone:", a3);
  v9 = (void *)v5[10];
  v5[10] = v8;

  id v10 = -[UWLLiveActivityEventChannel copyWithZone:](self->_channel, "copyWithZone:", a3);
  id v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = -[UWLLiveActivityEventContent copyWithZone:](self->_content, "copyWithZone:", a3);
  int v13 = (void *)v5[7];
  v5[7] = v12;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_cause;
    *((_BYTE *)v5 + 88) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      v5[1] = self->_cleanupTimeEpochMillis;
      *((_BYTE *)v5 + 88) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  v5[2] = self->_expectedStartTimeEpochMillis;
  *((_BYTE *)v5 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 16) = self->_contractOrTimed;
    *((_BYTE *)v5 + 88) |= 0x10u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 4))
  {
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_millisecondsSinceEvent != *((void *)v4 + 3)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
LABEL_37:
    unsigned __int8 v11 = 0;
    goto LABEL_38;
  }

  profileId = self->_profileId;
  channel = self->_channel;
  if ((unint64_t)channel | *((void *)v4 + 6))
  {
    if (!-[UWLLiveActivityEventChannel isEqual:](channel, "isEqual:")) {
      goto LABEL_37;
    }
  }

  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 7))
  {
    if (!-[UWLLiveActivityEventContent isEqual:](content, "isEqual:")) {
      goto LABEL_37;
    }
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_cause != *((_DWORD *)v4 + 10)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_37;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_expectedStartTimeEpochMillis != *((void *)v4 + 2)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_37;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_cleanupTimeEpochMillis != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_37;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0 || self->_contractOrTimed != *((_DWORD *)v4 + 16)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_37;
  }

  passThrough = self->_passThrough;
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761LL * self->_millisecondsSinceEvent;
  }
  else {
    uint64_t v4 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_profileId, "hash");
  unint64_t v6 = -[UWLLiveActivityEventChannel hash](self->_channel, "hash");
  unint64_t v7 = -[UWLLiveActivityEventContent hash](self->_content, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v8 = 2654435761LL * self->_cause;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v9 = 2654435761LL * self->_expectedStartTimeEpochMillis;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v10 = 0LL;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v11 = 0LL;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_passThrough, "hash");
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }

  uint64_t v9 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v10 = 2654435761LL * self->_cleanupTimeEpochMillis;
  if ((*(_BYTE *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v11 = 2654435761LL * self->_contractOrTimed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_passThrough, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 4))
  {
    -[UWLLiveActivityEvent setBundleId:](self, "setBundleId:");
    id v4 = v10;
  }

  if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    self->_millisecondsSinceEvent = *((void *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }

  if (*((void *)v4 + 10))
  {
    -[UWLLiveActivityEvent setProfileId:](self, "setProfileId:");
    id v4 = v10;
  }

  channel = self->_channel;
  uint64_t v6 = *((void *)v4 + 6);
  if (channel)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[UWLLiveActivityEventChannel mergeFrom:](channel, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[UWLLiveActivityEvent setChannel:](self, "setChannel:");
  }

  id v4 = v10;
LABEL_13:
  content = self->_content;
  uint64_t v8 = *((void *)v4 + 7);
  if (content)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[UWLLiveActivityEventContent mergeFrom:](content, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[UWLLiveActivityEvent setContent:](self, "setContent:");
  }

  id v4 = v10;
LABEL_19:
  char v9 = *((_BYTE *)v4 + 88);
  if ((v9 & 8) != 0)
  {
    self->_cause = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
    char v9 = *((_BYTE *)v4 + 88);
    if ((v9 & 2) == 0)
    {
LABEL_21:
      if ((v9 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_29;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 2) == 0)
  {
    goto LABEL_21;
  }

  self->_expectedStartTimeEpochMillis = *((void *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  char v9 = *((_BYTE *)v4 + 88);
  if ((v9 & 1) == 0)
  {
LABEL_22:
    if ((v9 & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)millisecondsSinceEvent
{
  return self->_millisecondsSinceEvent;
}

- (NSString)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
}

- (UWLLiveActivityEventChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (UWLLiveActivityEventContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (int64_t)expectedStartTimeEpochMillis
{
  return self->_expectedStartTimeEpochMillis;
}

- (int64_t)cleanupTimeEpochMillis
{
  return self->_cleanupTimeEpochMillis;
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