@interface CLCompanionSyncAuthObject
+ (Class)interestZonesType;
+ (Class)vectorClocksType;
- (BOOL)clearClient;
- (BOOL)hasAuthMask;
- (BOOL)hasClearClient;
- (BOOL)hasCorrectiveCompensationMask;
- (BOOL)hasNotification;
- (BOOL)hasSuppressShowingInSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suppressShowingInSettings;
- (NSMutableArray)interestZones;
- (NSMutableArray)vectorClocks;
- (NSString)clientKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interestZonesAtIndex:(unint64_t)a3;
- (id)notificationAsString:(int)a3;
- (id)operationTypeAsString:(int)a3;
- (id)vectorClocksAtIndex:(unint64_t)a3;
- (int)StringAsNotification:(id)a3;
- (int)StringAsOperationType:(id)a3;
- (int)notification;
- (int)operationType;
- (unint64_t)hash;
- (unint64_t)interestZonesCount;
- (unint64_t)vectorClocksCount;
- (unsigned)authMask;
- (unsigned)correctiveCompensationMask;
- (void)addInterestZones:(id)a3;
- (void)addVectorClocks:(id)a3;
- (void)clearInterestZones;
- (void)clearVectorClocks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAuthMask:(unsigned int)a3;
- (void)setClearClient:(BOOL)a3;
- (void)setClientKey:(id)a3;
- (void)setCorrectiveCompensationMask:(unsigned int)a3;
- (void)setHasAuthMask:(BOOL)a3;
- (void)setHasClearClient:(BOOL)a3;
- (void)setHasCorrectiveCompensationMask:(BOOL)a3;
- (void)setHasNotification:(BOOL)a3;
- (void)setHasSuppressShowingInSettings:(BOOL)a3;
- (void)setInterestZones:(id)a3;
- (void)setNotification:(int)a3;
- (void)setOperationType:(int)a3;
- (void)setSuppressShowingInSettings:(BOOL)a3;
- (void)setVectorClocks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCompanionSyncAuthObject

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionSyncAuthObject;
  -[CLCompanionSyncAuthObject dealloc](&v3, "dealloc");
}

- (unsigned)authMask
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_authMask;
  }
  else {
    return 0;
  }
}

- (void)setAuthMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authMask = a3;
}

- (void)setHasAuthMask:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthMask
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCorrectiveCompensationMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_correctiveCompensationMask = a3;
}

- (void)setHasCorrectiveCompensationMask:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCorrectiveCompensationMask
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)clearClient
{
  return (*(_BYTE *)&self->_has & 8) != 0 && self->_clearClient;
}

- (void)setClearClient:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_clearClient = a3;
}

- (void)setHasClearClient:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasClearClient
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)notification
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_notification;
  }
  else {
    return 0;
  }
}

- (void)setNotification:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_notification = a3;
}

- (void)setHasNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNotification
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)notificationAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_1018613D0 + a3);
  }
}

- (int)StringAsNotification:(id)a3
{
  return 0;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_1018613E8 + a3 - 1);
  }
}

- (int)StringAsOperationType:(id)a3
{
  return 1;
}

- (void)clearVectorClocks
{
}

- (void)addVectorClocks:(id)a3
{
  vectorClocks = self->_vectorClocks;
  if (!vectorClocks)
  {
    vectorClocks = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_vectorClocks = vectorClocks;
  }

  -[NSMutableArray addObject:](vectorClocks, "addObject:", a3);
}

- (unint64_t)vectorClocksCount
{
  return (unint64_t)-[NSMutableArray count](self->_vectorClocks, "count");
}

- (id)vectorClocksAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_vectorClocks, "objectAtIndex:", a3);
}

+ (Class)vectorClocksType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CLAuthSyncVectorClock);
}

- (void)clearInterestZones
{
}

- (void)addInterestZones:(id)a3
{
  interestZones = self->_interestZones;
  if (!interestZones)
  {
    interestZones = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_interestZones = interestZones;
  }

  -[NSMutableArray addObject:](interestZones, "addObject:", a3);
}

- (unint64_t)interestZonesCount
{
  return (unint64_t)-[NSMutableArray count](self->_interestZones, "count");
}

- (id)interestZonesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_interestZones, "objectAtIndex:", a3);
}

+ (Class)interestZonesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CLCompanionSyncInterestZone);
}

- (BOOL)suppressShowingInSettings
{
  return (*(_BYTE *)&self->_has & 0x10) != 0 && self->_suppressShowingInSettings;
}

- (void)setSuppressShowingInSettings:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suppressShowingInSettings = a3;
}

- (void)setHasSuppressShowingInSettings:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressShowingInSettings
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionSyncAuthObject;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCompanionSyncAuthObject description](&v3, "description"),  -[CLCompanionSyncAuthObject dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  clientKey = self->_clientKey;
  if (clientKey) {
    [v3 setObject:clientKey forKey:@"clientKey"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_authMask),  @"authMask");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  self->_correctiveCompensationMask),  @"correctiveCompensationMask");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100932DC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  clientKey = self->_clientKey;
  if (!clientKey) {
    sub_101253D00();
  }
  PBDataWriterWriteStringField(a3, clientKey, 1LL);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_authMask, 2LL);
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_4:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_4;
  }

  PBDataWriterWriteBOOLField(a3, self->_clearClient, 3LL);
  if ((*(_BYTE *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field(a3, self->_notification, 4LL);
LABEL_6:
  PBDataWriterWriteInt32Field(a3, self->_operationType, 5LL);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  vectorClocks = self->_vectorClocks;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( vectorClocks,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(vectorClocks);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v22 + 1) + 8LL * (void)i), 6LL);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( vectorClocks,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    }

    while (v9);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  interestZones = self->_interestZones;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( interestZones,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(interestZones);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v18 + 1) + 8LL * (void)j), 7LL);
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( interestZones,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v14);
  }

  char v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_correctiveCompensationMask, 8LL);
    char v17 = (char)self->_has;
  }

  if ((v17 & 0x10) != 0) {
    PBDataWriterWriteBOOLField(a3, self->_suppressShowingInSettings, 9LL);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      goto LABEL_3;
    }
LABEL_19:
    *((_BYTE *)a3 + 56) = self->_clearClient;
    *((_BYTE *)a3 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)a3 + 2) = self->_authMask;
  *((_BYTE *)a3 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 9) = self->_notification;
    *((_BYTE *)a3 + 60) |= 4u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unint64_t v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[3] = -[NSString copyWithZone:](self->_clientKey, "copyWithZone:", a3);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v7 + 2) = self->_authMask;
    *((_BYTE *)v7 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)v7 + 56) = self->_clearClient;
  *((_BYTE *)v7 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v7 + 9) = self->_notification;
    *((_BYTE *)v7 + 60) |= 4u;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (!v7) {
    return v7;
  }
  clientKey = self->_clientKey;
  if ((unint64_t)clientKey | *((void *)a3 + 3))
  {
    unsigned int v7 = -[NSString isEqual:](clientKey, "isEqual:");
    if (!v7) {
      return v7;
    }
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 1) == 0 || self->_authMask != *((_DWORD *)a3 + 2)) {
      goto LABEL_34;
    }
  }

  else if ((*((_BYTE *)a3 + 60) & 1) != 0)
  {
    goto LABEL_34;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 8) == 0) {
      goto LABEL_34;
    }
    if (self->_clearClient)
    {
      if (!*((_BYTE *)a3 + 56)) {
        goto LABEL_34;
      }
    }

    else if (*((_BYTE *)a3 + 56))
    {
      goto LABEL_34;
    }
  }

  else if ((*((_BYTE *)a3 + 60) & 8) != 0)
  {
    goto LABEL_34;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 4) == 0 || self->_notification != *((_DWORD *)a3 + 9)) {
      goto LABEL_34;
    }
  }

  else if ((*((_BYTE *)a3 + 60) & 4) != 0)
  {
    goto LABEL_34;
  }

  if (self->_operationType != *((_DWORD *)a3 + 10))
  {
LABEL_34:
    LOBYTE(v7) = 0;
    return v7;
  }

  vectorClocks = self->_vectorClocks;
  if (!((unint64_t)vectorClocks | *((void *)a3 + 6))
    || (unsigned int v7 = -[NSMutableArray isEqual:](vectorClocks, "isEqual:")) != 0)
  {
    interestZones = self->_interestZones;
    if (!((unint64_t)interestZones | *((void *)a3 + 2))
      || (unsigned int v7 = -[NSMutableArray isEqual:](interestZones, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 2) == 0 || self->_correctiveCompensationMask != *((_DWORD *)a3 + 8)) {
          goto LABEL_34;
        }
      }

      else if ((*((_BYTE *)a3 + 60) & 2) != 0)
      {
        goto LABEL_34;
      }

      LOBYTE(v7) = (*((_BYTE *)a3 + 60) & 0x10) == 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 0x10) == 0) {
          goto LABEL_34;
        }
        if (self->_suppressShowingInSettings)
        {
          if (!*((_BYTE *)a3 + 57)) {
            goto LABEL_34;
          }
        }

        else if (*((_BYTE *)a3 + 57))
        {
          goto LABEL_34;
        }

        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_clientKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 2654435761LL * self->_authMask;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761LL * self->_clearClient;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761LL * self->_notification;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[CLCompanionSyncAuthObject setClientKey:](self, "setClientKey:");
  }
  char v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 1) != 0)
  {
    self->_authMask = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)a3 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*((_BYTE *)a3 + 60) & 8) == 0)
  {
    goto LABEL_5;
  }

  self->_clearClient = *((_BYTE *)a3 + 56);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 60) & 4) != 0)
  {
LABEL_6:
    self->_uint64_t notification = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }

- (NSString)clientKey
{
  return self->_clientKey;
}

- (void)setClientKey:(id)a3
{
}

- (unsigned)correctiveCompensationMask
{
  return self->_correctiveCompensationMask;
}

- (int)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int)a3
{
  self->_uint64_t operationType = a3;
}

- (NSMutableArray)vectorClocks
{
  return self->_vectorClocks;
}

- (void)setVectorClocks:(id)a3
{
}

- (NSMutableArray)interestZones
{
  return self->_interestZones;
}

- (void)setInterestZones:(id)a3
{
}

@end