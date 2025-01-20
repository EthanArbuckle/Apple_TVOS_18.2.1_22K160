@interface SECSFAEventRule
- (BOOL)hasAction;
- (BOOL)hasEventClass;
- (BOOL)hasEventType;
- (BOOL)hasMatch;
- (BOOL)hasMatchOnFirstFailure;
- (BOOL)hasProcessName;
- (BOOL)hasRepeatAfterSeconds;
- (BOOL)hasVersions;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchOnFirstFailure;
- (BOOL)readFrom:(id)a3;
- (NSData)match;
- (NSString)eventType;
- (NSString)processName;
- (SECSFAAction)action;
- (SECSFAVersionMatch)versions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventClassAsString:(int)a3;
- (int)StringAsEventClass:(id)a3;
- (int)eventClass;
- (int64_t)repeatAfterSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(id)a3;
- (void)setEventClass:(int)a3;
- (void)setEventType:(id)a3;
- (void)setHasEventClass:(BOOL)a3;
- (void)setHasMatchOnFirstFailure:(BOOL)a3;
- (void)setHasRepeatAfterSeconds:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setMatchOnFirstFailure:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setRepeatAfterSeconds:(int64_t)a3;
- (void)setVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAEventRule

- (BOOL)hasEventType
{
  return self->_eventType != 0LL;
}

- (BOOL)hasMatch
{
  return self->_match != 0LL;
}

- (BOOL)hasAction
{
  return self->_action != 0LL;
}

- (void)setRepeatAfterSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_repeatAfterSeconds = a3;
}

- (void)setHasRepeatAfterSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepeatAfterSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0LL;
}

- (int)eventClass
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_eventClass;
  }
  else {
    return 0;
  }
}

- (void)setEventClass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventClass = a3;
}

- (void)setHasEventClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventClass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventClassAsString:(int)a3
{
  if (a3 < 0xF && ((0x7C03u >> a3) & 1) != 0)
  {
    char v3 = off_189665888[a3];
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsEventClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Errors"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"HardFailure"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"SoftFailure"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"Note"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"Rockwell"])
  {
    int v4 = 14;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasVersions
{
  return self->_versions != 0LL;
}

- (void)setMatchOnFirstFailure:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_matchOnFirstFailure = a3;
}

- (void)setHasMatchOnFirstFailure:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMatchOnFirstFailure
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAEventRule;
  -[SECSFAEventRule description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFAEventRule dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  eventType = self->_eventType;
  if (eventType) {
    [v3 setObject:eventType forKey:@"eventType"];
  }
  match = self->_match;
  if (match) {
    [v4 setObject:match forKey:@"match"];
  }
  action = self->_action;
  if (action)
  {
    -[SECSFAAction dictionaryRepresentation](action, "dictionaryRepresentation");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKey:@"action"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithLongLong:self->_repeatAfterSeconds];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKey:@"repeatAfterSeconds"];
  }

  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"processName"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t eventClass = self->_eventClass;
    if (eventClass < 0xF && ((0x7C03u >> eventClass) & 1) != 0)
    {
      v12 = off_189665888[eventClass];
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventClass);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [v4 setObject:v12 forKey:@"eventClass"];
  }

  versions = self->_versions;
  if (versions)
  {
    v14 = -[SECSFAVersionMatch dictionaryRepresentation](versions, "dictionaryRepresentation");
    [v4 setObject:v14 forKey:@"versions"];
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_matchOnFirstFailure];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v15 forKey:@"matchOnFirstFailure"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAEventRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_match)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }

  if (self->_processName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }

  if (self->_versions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    objc_msgSend(v4, "setEventType:");
    id v4 = v5;
  }

  if (self->_match)
  {
    objc_msgSend(v5, "setMatch:");
    id v4 = v5;
  }

  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_repeatAfterSeconds;
    *((_BYTE *)v4 + 68) |= 1u;
  }

  if (self->_processName)
  {
    objc_msgSend(v5, "setProcessName:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventClass;
    *((_BYTE *)v4 + 68) |= 2u;
  }

  if (self->_versions)
  {
    objc_msgSend(v5, "setVersions:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_matchOnFirstFailure;
    *((_BYTE *)v4 + 68) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_match, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = -[SECSFAAction copyWithZone:](self->_action, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_repeatAfterSeconds;
    *(_BYTE *)(v5 + 68) |= 1u;
  }

  uint64_t v12 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventClass;
    *(_BYTE *)(v5 + 68) |= 2u;
  }

  id v14 = -[SECSFAVersionMatch copyWithZone:](self->_versions, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_matchOnFirstFailure;
    *(_BYTE *)(v5 + 68) |= 4u;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((void *)v4 + 4))
  {
  }

  match = self->_match;
  if ((unint64_t)match | *((void *)v4 + 5))
  {
  }

  action = self->_action;
  if ((unint64_t)action | *((void *)v4 + 2))
  {
    if (!-[SECSFAAction isEqual:](action, "isEqual:")) {
      goto LABEL_26;
    }
  }

  char has = (char)self->_has;
  char v9 = *((_BYTE *)v4 + 68);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_repeatAfterSeconds != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_26;
  }

  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 6))
  {
    char has = (char)self->_has;
    char v9 = *((_BYTE *)v4 + 68);
  }

  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_eventClass != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }

  else if ((v9 & 2) != 0)
  {
    goto LABEL_26;
  }

  versions = self->_versions;
  if ((unint64_t)versions | *((void *)v4 + 7))
  {
    if (!-[SECSFAVersionMatch isEqual:](versions, "isEqual:")) {
      goto LABEL_26;
    }
    char has = (char)self->_has;
    char v9 = *((_BYTE *)v4 + 68);
  }

  BOOL v12 = (v9 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_matchOnFirstFailure)
      {
        if (!*((_BYTE *)v4 + 64)) {
          goto LABEL_26;
        }
      }

      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_26;
      }

      BOOL v12 = 1;
      goto LABEL_27;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_eventType, "hash");
  uint64_t v4 = -[NSData hash](self->_match, "hash");
  unint64_t v5 = -[SECSFAAction hash](self->_action, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_repeatAfterSeconds;
  }
  else {
    uint64_t v6 = 0LL;
  }
  NSUInteger v7 = -[NSString hash](self->_processName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761LL * self->_eventClass;
  }
  else {
    uint64_t v8 = 0LL;
  }
  unint64_t v9 = -[SECSFAVersionMatch hash](self->_versions, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v10 = 2654435761LL * self->_matchOnFirstFailure;
  }
  else {
    uint64_t v10 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFAEventRule setEventType:](self, "setEventType:");
    id v4 = v9;
  }

  if (*((void *)v4 + 5))
  {
    -[SECSFAEventRule setMatch:](self, "setMatch:");
    id v4 = v9;
  }

  action = self->_action;
  uint64_t v6 = *((void *)v4 + 2);
  if (action)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFAAction mergeFrom:](action, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFAEventRule setAction:](self, "setAction:");
  }

  id v4 = v9;
LABEL_11:
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_repeatAfterSeconds = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 6))
  {
    -[SECSFAEventRule setProcessName:](self, "setProcessName:");
    id v4 = v9;
  }

  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_uint64_t eventClass = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

  versions = self->_versions;
  uint64_t v8 = *((void *)v4 + 7);
  if (versions)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[SECSFAVersionMatch mergeFrom:](versions, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[SECSFAEventRule setVersions:](self, "setVersions:");
  }

  id v4 = v9;
LABEL_23:
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    self->_matchOnFirstFailure = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSData)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (SECSFAAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (int64_t)repeatAfterSeconds
{
  return self->_repeatAfterSeconds;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (SECSFAVersionMatch)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
}

- (BOOL)matchOnFirstFailure
{
  return self->_matchOnFirstFailure;
}

- (void).cxx_destruct
{
}

@end