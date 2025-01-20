@interface CSDMessagingRoute
- (BOOL)hasDeviceType;
- (BOOL)hasName;
- (BOOL)hasProtoCurrentlyPicked;
- (BOOL)hasProtoGuest;
- (BOOL)hasProtoSupportsRelay;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)protoCurrentlyPicked;
- (BOOL)protoGuest;
- (BOOL)protoSupportsRelay;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingRoute)initWithTURoute:(id)a3;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (TURoute)tuRoute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceType:(id)a3;
- (int)deviceType;
- (int64_t)tuRouteDeviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentlyPicked:(BOOL)a3;
- (void)setDeviceType:(int)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasProtoCurrentlyPicked:(BOOL)a3;
- (void)setHasProtoGuest:(BOOL)a3;
- (void)setHasProtoSupportsRelay:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProtoCurrentlyPicked:(BOOL)a3;
- (void)setProtoGuest:(BOOL)a3;
- (void)setProtoSupportsRelay:(BOOL)a3;
- (void)setSupportsRelay:(BOOL)a3;
- (void)setTURouteDeviceType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingRoute

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0LL;
}

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (int)deviceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_deviceType;
  }
  else {
    return 0;
  }
}

- (void)setDeviceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceType = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  else {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"AirPods"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"BeatsSolo"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"BeatsX"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"Powerbeats"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"BeatsStudio"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"iPod"])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:@"iPad"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"iMac"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"MacBook"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"MacMini"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"MacPro"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"HomePodStereoPair"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"iPadPro"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"PowerbeatsPro"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"BeatsSoloPro"])
  {
    int v4 = 17;
  }

  else if ([v3 isEqualToString:@"AirPodsPro"])
  {
    int v4 = 18;
  }

  else if ([v3 isEqualToString:@"Powerbeats4"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"HeadPods"])
  {
    int v4 = 20;
  }

  else if ([v3 isEqualToString:@"BeatsX2"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"HomePodMini"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"HomePodMiniStereoPair"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"BeatsStudioBuds"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"BeatsFitPro"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"AirPods3"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"B620"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"B620StereoPair"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"B698"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"B487"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"B463"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"B498"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"B768"])
  {
    int v4 = 36;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoCurrentlyPicked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_protoCurrentlyPicked = a3;
}

- (void)setHasProtoCurrentlyPicked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProtoCurrentlyPicked
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setProtoGuest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_protoGuest = a3;
}

- (void)setHasProtoGuest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtoGuest
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setProtoSupportsRelay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_protoSupportsRelay = a3;
}

- (void)setHasProtoSupportsRelay:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtoSupportsRelay
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingRoute;
  id v3 = -[CSDMessagingRoute description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRoute dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    unsigned int deviceType = self->_deviceType;
    if (deviceType < 0x25 && ((0x16BFFFFFFFuLL >> deviceType) & 1) != 0) {
      v9 = off_1003DB7A8[deviceType];
    }
    else {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_deviceType));
    }
    [v4 setObject:v9 forKey:@"deviceType"];

    char has = (char)self->_has;
  }

  if ((has & 2) == 0)
  {
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
LABEL_17:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoGuest));
    [v4 setObject:v13 forKey:@"protoGuest"];

    if ((*(_BYTE *)&self->_has & 8) == 0) {
      return v4;
    }
    goto LABEL_14;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoCurrentlyPicked));
  [v4 setObject:v12 forKey:@"protoCurrentlyPicked"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoSupportsRelay));
    [v4 setObject:v10 forKey:@"protoSupportsRelay"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001664A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uniqueIdentifier = self->_uniqueIdentifier;
  id v8 = v4;
  if (uniqueIdentifier)
  {
    PBDataWriterWriteStringField(v4, uniqueIdentifier, 1LL);
    id v4 = v8;
  }

  name = self->_name;
  if (name)
  {
    PBDataWriterWriteStringField(v8, name, 2LL);
    id v4 = v8;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_deviceType, 3LL);
    id v4 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      PBDataWriterWriteBOOLField(v8, self->_protoGuest, 5LL);
      id v4 = v8;
      if ((*(_BYTE *)&self->_has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }

  PBDataWriterWriteBOOLField(v8, self->_protoCurrentlyPicked, 4LL);
  id v4 = v8;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField(v8, self->_protoSupportsRelay, 6LL);
    id v4 = v8;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "setUniqueIdentifier:");
    id v4 = v6;
  }

  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_deviceType;
    *((_BYTE *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *((_BYTE *)v4 + 33) = self->_protoGuest;
      *((_BYTE *)v4 + 36) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }

  *((_BYTE *)v4 + 32) = self->_protoCurrentlyPicked;
  *((_BYTE *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 34) = self->_protoSupportsRelay;
    *((_BYTE *)v4 + 36) |= 8u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_deviceType;
    *((_BYTE *)v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_BYTE *)v5 + 33) = self->_protoGuest;
      *((_BYTE *)v5 + 36) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0) {
        return v5;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)v5 + 32) = self->_protoCurrentlyPicked;
  *((_BYTE *)v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_BYTE *)v5 + 34) = self->_protoSupportsRelay;
    *((_BYTE *)v5 + 36) |= 8u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 3))
  {
  }

  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_deviceType != *((_DWORD *)v4 + 2)) {
      goto LABEL_29;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_29;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0) {
      goto LABEL_29;
    }
    if (self->_protoCurrentlyPicked)
    {
      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_29;
      }
    }

    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_29;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0) {
      goto LABEL_29;
    }
    if (self->_protoGuest)
    {
      if (!*((_BYTE *)v4 + 33)) {
        goto LABEL_29;
      }
    }

    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_29;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_29;
  }

  BOOL v8 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) != 0)
    {
      if (self->_protoSupportsRelay)
      {
        if (!*((_BYTE *)v4 + 34)) {
          goto LABEL_29;
        }
      }

      else if (*((_BYTE *)v4 + 34))
      {
        goto LABEL_29;
      }

      BOOL v8 = 1;
      goto LABEL_30;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_uniqueIdentifier, "hash");
  NSUInteger v4 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_deviceType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761LL * self->_protoCurrentlyPicked;
      if ((*(_BYTE *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0LL;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0LL;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v6 = 0LL;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761LL * self->_protoGuest;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761LL * self->_protoSupportsRelay;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[CSDMessagingRoute setUniqueIdentifier:](self, "setUniqueIdentifier:");
    id v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[CSDMessagingRoute setName:](self, "setName:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_unsigned int deviceType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      self->_protoGuest = *((_BYTE *)v4 + 33);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 36) & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_7;
  }

  self->_protoCurrentlyPicked = *((_BYTE *)v4 + 32);
  *(_BYTE *)&self->_has |= 2u;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    self->_protoSupportsRelay = *((_BYTE *)v4 + 34);
    *(_BYTE *)&self->_has |= 8u;
  }

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)protoCurrentlyPicked
{
  return self->_protoCurrentlyPicked;
}

- (BOOL)protoGuest
{
  return self->_protoGuest;
}

- (BOOL)protoSupportsRelay
{
  return self->_protoSupportsRelay;
}

- (void).cxx_destruct
{
}

- (CSDMessagingRoute)initWithTURoute:(id)a3
{
  id v4 = a3;
  char v5 = -[CSDMessagingRoute init](self, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    -[CSDMessagingRoute setUniqueIdentifier:](v5, "setUniqueIdentifier:", v6);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    -[CSDMessagingRoute setName:](v5, "setName:", v7);

    -[CSDMessagingRoute setTURouteDeviceType:](v5, "setTURouteDeviceType:", [v4 deviceType]);
    -[CSDMessagingRoute setCurrentlyPicked:](v5, "setCurrentlyPicked:", [v4 isCurrentlyPicked]);
    -[CSDMessagingRoute setGuest:](v5, "setGuest:", [v4 isGuest]);
    -[CSDMessagingRoute setSupportsRelay:](v5, "setSupportsRelay:", [v4 supportsRelay]);
  }

  return v5;
}

- (TURoute)tuRoute
{
  id v3 = objc_alloc(&OBJC_CLASS___TUMutableRoute);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRoute uniqueIdentifier](self, "uniqueIdentifier"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRoute name](self, "name"));
  id v6 = [v3 initWithUniqueIdentifier:v4 name:v5];

  objc_msgSend(v6, "setDeviceType:", -[CSDMessagingRoute tuRouteDeviceType](self, "tuRouteDeviceType"));
  objc_msgSend(v6, "setCurrentlyPicked:", -[CSDMessagingRoute isCurrentlyPicked](self, "isCurrentlyPicked"));
  objc_msgSend(v6, "setGuest:", -[CSDMessagingRoute isGuest](self, "isGuest"));
  objc_msgSend(v6, "setSupportsRelay:", -[CSDMessagingRoute supportsRelay](self, "supportsRelay"));
  id v7 = [v6 copy];

  return (TURoute *)v7;
}

- (int64_t)tuRouteDeviceType
{
  unsigned int v2 = -[CSDMessagingRoute deviceType](self, "deviceType") - 1;
  if (v2 > 0x23) {
    return 0LL;
  }
  else {
    return qword_1003793F8[v2];
  }
}

- (void)setTURouteDeviceType:(int64_t)a3
{
  uint64_t v5 = 1LL;
  switch(a3)
  {
    case 0LL:
      if (-[CSDMessagingRoute deviceType](self, "deviceType", 1LL))
      {
        uint64_t v5 = 0LL;
        goto LABEL_37;
      }

      return;
    case 1LL:
      goto LABEL_37;
    case 2LL:
      uint64_t v5 = 2LL;
      goto LABEL_37;
    case 3LL:
      uint64_t v5 = 3LL;
      goto LABEL_37;
    case 4LL:
      uint64_t v5 = 4LL;
      goto LABEL_37;
    case 5LL:
      uint64_t v5 = 5LL;
      goto LABEL_37;
    case 6LL:
      uint64_t v5 = 6LL;
      goto LABEL_37;
    case 7LL:
      uint64_t v5 = 7LL;
      goto LABEL_37;
    case 8LL:
      uint64_t v5 = 8LL;
      goto LABEL_37;
    case 9LL:
      uint64_t v5 = 9LL;
      goto LABEL_37;
    case 10LL:
      uint64_t v5 = 10LL;
      goto LABEL_37;
    case 11LL:
      uint64_t v5 = 11LL;
      goto LABEL_37;
    case 12LL:
      uint64_t v5 = 12LL;
      goto LABEL_37;
    case 13LL:
      uint64_t v5 = 13LL;
      goto LABEL_37;
    case 14LL:
      uint64_t v5 = 14LL;
      goto LABEL_37;
    case 15LL:
      uint64_t v5 = 15LL;
      goto LABEL_37;
    case 16LL:
      uint64_t v5 = 16LL;
      goto LABEL_37;
    case 17LL:
      uint64_t v5 = 17LL;
      goto LABEL_37;
    case 18LL:
      uint64_t v5 = 18LL;
      goto LABEL_37;
    case 19LL:
      uint64_t v5 = 19LL;
      goto LABEL_37;
    case 20LL:
      uint64_t v5 = 20LL;
      goto LABEL_37;
    case 21LL:
      uint64_t v5 = 21LL;
      goto LABEL_37;
    case 22LL:
      uint64_t v5 = 22LL;
      goto LABEL_37;
    case 23LL:
      uint64_t v5 = 23LL;
      goto LABEL_37;
    case 24LL:
      uint64_t v5 = 24LL;
      goto LABEL_37;
    case 25LL:
      uint64_t v5 = 25LL;
      goto LABEL_37;
    case 26LL:
      uint64_t v5 = 26LL;
      goto LABEL_37;
    case 27LL:
      uint64_t v5 = 27LL;
      goto LABEL_37;
    case 28LL:
      uint64_t v5 = 28LL;
      goto LABEL_37;
    case 29LL:
      uint64_t v5 = 29LL;
      goto LABEL_37;
    case 31LL:
      uint64_t v5 = 31LL;
      goto LABEL_37;
    case 33LL:
      uint64_t v5 = 33LL;
      goto LABEL_37;
    case 34LL:
      uint64_t v5 = 34LL;
      goto LABEL_37;
    case 36LL:
      uint64_t v5 = 36LL;
LABEL_37:
      -[CSDMessagingRoute setDeviceType:](self, "setDeviceType:", v5);
      break;
    default:
      return;
  }

- (void)setCurrentlyPicked:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRoute protoCurrentlyPicked](self, "protoCurrentlyPicked")) {
    -[CSDMessagingRoute setProtoCurrentlyPicked:](self, "setProtoCurrentlyPicked:", v3);
  }
}

- (void)setGuest:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRoute protoGuest](self, "protoGuest")) {
    -[CSDMessagingRoute setProtoGuest:](self, "setProtoGuest:", v3);
  }
}

- (void)setSupportsRelay:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRoute protoSupportsRelay](self, "protoSupportsRelay")) {
    -[CSDMessagingRoute setProtoSupportsRelay:](self, "setProtoSupportsRelay:", v3);
  }
}

@end