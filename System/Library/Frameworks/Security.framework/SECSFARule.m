@interface SECSFARule
- (BOOL)hasAction;
- (BOOL)hasEventClass;
- (BOOL)hasEventType;
- (BOOL)hasMatch;
- (BOOL)hasProcess;
- (BOOL)hasRepeatAfterSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)match;
- (NSString)eventType;
- (NSString)process;
- (SECSFAAction)action;
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
- (void)setHasRepeatAfterSeconds:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setProcess:(id)a3;
- (void)setRepeatAfterSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFARule

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

- (BOOL)hasProcess
{
  return self->_process != 0LL;
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
    char v3 = off_189667210[a3];
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

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFARule;
  -[SECSFARule description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFARule dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
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

  process = self->_process;
  if (process) {
    [v4 setObject:process forKey:@"process"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t eventClass = self->_eventClass;
    if (eventClass < 0xF && ((0x7C03u >> eventClass) & 1) != 0)
    {
      v12 = off_189667210[eventClass];
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventClass);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [v4 setObject:v12 forKey:@"eventClass"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int v4 = (int *)MEMORY[0x189611CF0];
  v5 = (int *)MEMORY[0x189611CE8];
  v6 = (int *)MEMORY[0x189611CE0];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x189611CF0]) < *(void *)((char *)a3 + (int)*MEMORY[0x189611CE8]))
  {
    objc_super v8 = (int *)MEMORY[0x189611CD8];
    while (!*((_BYTE *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0LL;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        char v14 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0LL;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }

      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6)) {
        unint64_t v11 = 0LL;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 4LL;
          goto LABEL_34;
        case 2u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 5LL;
          goto LABEL_34;
        case 3u:
          v21 = objc_alloc_init(&OBJC_CLASS___SECSFAAction);
          objc_storeStrong((id *)&self->_action, v21);
          if (!PBReaderPlaceMark() || (SECSFAActionReadFrom((uint64_t)v21, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v20) = 0;
            return v20;
          }

          PBReaderRecallMark();

LABEL_50:
          break;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          int64_t v24 = 0LL;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v25 = *v4;
            unint64_t v26 = *(void *)((char *)a3 + v25);
            if (v26 == -1LL || v26 >= *(void *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }

            else
            {
              char v27 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v26);
              *(void *)((char *)a3 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v15 = v23++ >= 9;
                if (v15)
                {
                  int64_t v24 = 0LL;
                  goto LABEL_45;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + *v6)) {
            int64_t v24 = 0LL;
          }
LABEL_45:
          self->_repeatAfterSeconds = v24;
          goto LABEL_50;
        case 5u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 6LL;
LABEL_34:
          Class v28 = (&self->super.super.isa)[v19];
          (&self->super.super.isa)[v19] = v18;

          goto LABEL_50;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0LL;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v32 = *v4;
            unint64_t v33 = *(void *)((char *)a3 + v32);
            if (v33 == -1LL || v33 >= *(void *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }

            else
            {
              char v34 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v33);
              *(void *)((char *)a3 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v15 = v30++ >= 9;
                if (v15)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_49;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + *v6)) {
            LODWORD(v31) = 0;
          }
LABEL_49:
          self->_uint64_t eventClass = v31;
          goto LABEL_50;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          goto LABEL_50;
      }
    }
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

  if (self->_process)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
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
    *((_BYTE *)v4 + 56) |= 1u;
  }

  if (self->_process)
  {
    objc_msgSend(v5, "setProcess:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventClass;
    *((_BYTE *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_match, "copyWithZone:", a3);
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = -[SECSFAAction copyWithZone:](self->_action, "copyWithZone:", a3);
  unint64_t v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_repeatAfterSeconds;
    *(_BYTE *)(v5 + 56) |= 1u;
  }

  uint64_t v12 = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  unint64_t v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventClass;
    *(_BYTE *)(v5 + 56) |= 2u;
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
      goto LABEL_20;
    }
  }

  char has = (char)self->_has;
  char v9 = *((_BYTE *)v4 + 56);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_repeatAfterSeconds != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_20;
  }

  process = self->_process;
  if ((unint64_t)process | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](process, "isEqual:"))
    {
LABEL_20:
      BOOL v11 = 0;
      goto LABEL_21;
    }

    char has = (char)self->_has;
    char v9 = *((_BYTE *)v4 + 56);
  }

  BOOL v11 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_eventClass != *((_DWORD *)v4 + 6)) {
      goto LABEL_20;
    }
    BOOL v11 = 1;
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
  NSUInteger v7 = -[NSString hash](self->_process, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761LL * self->_eventClass;
  }
  else {
    uint64_t v8 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFARule setEventType:](self, "setEventType:");
    id v4 = v7;
  }

  if (*((void *)v4 + 5))
  {
    -[SECSFARule setMatch:](self, "setMatch:");
    id v4 = v7;
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
    -[SECSFARule setAction:](self, "setAction:");
  }

  id v4 = v7;
LABEL_11:
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_repeatAfterSeconds = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 6))
  {
    -[SECSFARule setProcess:](self, "setProcess:");
    id v4 = v7;
  }

  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_uint64_t eventClass = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
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

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (void).cxx_destruct
{
}

@end