@interface SDAutoUnlockWiFiAWDLInfo
- (BOOL)hasChannelFlags;
- (BOOL)hasDiscoveryMetric;
- (BOOL)hasExtraInfoData;
- (BOOL)hasMacAddress;
- (BOOL)hasMasterChannel;
- (BOOL)hasPreferredChannel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)extraInfoData;
- (NSData)macAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)channelFlags;
- (unsigned)discoveryMetric;
- (unsigned)masterChannel;
- (unsigned)preferredChannel;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelFlags:(unsigned int)a3;
- (void)setDiscoveryMetric:(unsigned int)a3;
- (void)setExtraInfoData:(id)a3;
- (void)setHasChannelFlags:(BOOL)a3;
- (void)setHasDiscoveryMetric:(BOOL)a3;
- (void)setHasMasterChannel:(BOOL)a3;
- (void)setHasPreferredChannel:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setMasterChannel:(unsigned int)a3;
- (void)setPreferredChannel:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockWiFiAWDLInfo

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0LL;
}

- (void)setDiscoveryMetric:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_discoveryMetric = a3;
}

- (void)setHasDiscoveryMetric:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDiscoveryMetric
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMasterChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_masterChannel = a3;
}

- (void)setHasMasterChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMasterChannel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPreferredChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_preferredChannel = a3;
}

- (void)setHasPreferredChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChannelFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelFlags = a3;
}

- (void)setHasChannelFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExtraInfoData
{
  return self->_extraInfoData != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockWiFiAWDLInfo;
  id v3 = -[SDAutoUnlockWiFiAWDLInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiAWDLInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  macAddress = self->_macAddress;
  if (macAddress) {
    [v3 setObject:macAddress forKey:@"macAddress"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_discoveryMetric));
    [v4 setObject:v10 forKey:@"discoveryMetric"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_masterChannel));
  [v4 setObject:v11 forKey:@"masterChannel"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockWiFiAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  macAddress = self->_macAddress;
  id v8 = v4;
  if (macAddress)
  {
    PBDataWriterWriteDataField(v4, macAddress, 1LL);
    id v4 = v8;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_discoveryMetric, 2LL);
    id v4 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }

  PBDataWriterWriteUint32Field(v8, self->_masterChannel, 3LL);
  id v4 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macAddress)
  {
    objc_msgSend(v4, "setMacAddress:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_discoveryMetric;
    *((_BYTE *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }

  *((_DWORD *)v4 + 8) = self->_masterChannel;
  *((_BYTE *)v4 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_discoveryMetric;
    *((_BYTE *)v5 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v5 + 9) = self->_preferredChannel;
      *((_BYTE *)v5 + 40) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 8) = self->_masterChannel;
  *((_BYTE *)v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 2) = self->_channelFlags;
    *((_BYTE *)v5 + 40) |= 1u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_discoveryMetric != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_26:
    unsigned __int8 v8 = 0;
    goto LABEL_27;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_masterChannel != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_preferredChannel != *((_DWORD *)v4 + 9)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_channelFlags != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_26;
  }

  extraInfoData = self->_extraInfoData;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_macAddress, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_discoveryMetric;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761LL * self->_masterChannel;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0LL;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0LL;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSData hash](self->_extraInfoData, "hash");
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761LL * self->_preferredChannel;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761LL * self->_channelFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSData hash](self->_extraInfoData, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockWiFiAWDLInfo setMacAddress:](self, "setMacAddress:");
    uint64_t v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_discoveryMetric = v4[3];
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  else if ((v4[10] & 4) == 0)
  {
    goto LABEL_5;
  }

  self->_masterChannel = v4[8];
  *(_BYTE *)&self->_has |= 4u;
  char v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (unsigned)discoveryMetric
{
  return self->_discoveryMetric;
}

- (unsigned)masterChannel
{
  return self->_masterChannel;
}

- (unsigned)preferredChannel
{
  return self->_preferredChannel;
}

- (unsigned)channelFlags
{
  return self->_channelFlags;
}

- (NSData)extraInfoData
{
  return self->_extraInfoData;
}

- (void)setExtraInfoData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end