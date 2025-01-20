@interface TFDevice
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFDevice

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFDevice;
  id v3 = -[TFDevice description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFDevice dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t devicePlatform = self->_devicePlatform;
    if (devicePlatform >= 4) {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_devicePlatform));
    }
    else {
      v6 = *(&off_1003F1CD8 + devicePlatform);
    }
    [v3 setObject:v6 forKey:@"devicePlatform"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    uint64_t deviceFamily = self->_deviceFamily;
    if (deviceFamily >= 7) {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_deviceFamily));
    }
    else {
      objc_super v8 = *(&off_1003F1CF8 + deviceFamily);
    }
    [v3 setObject:v8 forKey:@"deviceFamily"];
  }

  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"osVersion"];
  }
  architecture = self->_architecture;
  if (architecture) {
    [v3 setObject:architecture forKey:@"architecture"];
  }
  display = self->_display;
  if (display)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TFDisplay dictionaryRepresentation](display, "dictionaryRepresentation"));
    [v3 setObject:v13 forKey:@"display"];
  }

  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  timezone = self->_timezone;
  if (timezone) {
    [v3 setObject:timezone forKey:@"timezone"];
  }
  carrier = self->_carrier;
  if (carrier) {
    [v3 setObject:carrier forKey:@"carrier"];
  }
  cellularNetworkType = self->_cellularNetworkType;
  if (cellularNetworkType) {
    [v3 setObject:cellularNetworkType forKey:@"cellularNetworkType"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t connection = self->_connection;
    if (connection >= 4) {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_connection));
    }
    else {
      v19 = *(&off_1003F1D30 + connection);
    }
    [v3 setObject:v19 forKey:@"connection"];
  }

  disk = self->_disk;
  if (disk)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TFMemoryUsage dictionaryRepresentation](disk, "dictionaryRepresentation"));
    [v3 setObject:v21 forKey:@"disk"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_batteryPercentage));
    [v3 setObject:v22 forKey:@"batteryPercentage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1002D07C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  model = self->_model;
  id v15 = v4;
  if (model)
  {
    PBDataWriterWriteStringField(v4, model, 1LL);
    id v4 = v15;
  }

  osVersion = self->_osVersion;
  if (osVersion)
  {
    PBDataWriterWriteStringField(v15, osVersion, 2LL);
    id v4 = v15;
  }

  architecture = self->_architecture;
  if (architecture)
  {
    PBDataWriterWriteStringField(v15, architecture, 3LL);
    id v4 = v15;
  }

  display = self->_display;
  if (display)
  {
    PBDataWriterWriteSubmessage(v15, display, 4LL);
    id v4 = v15;
  }

  locale = self->_locale;
  if (locale)
  {
    PBDataWriterWriteStringField(v15, locale, 5LL);
    id v4 = v15;
  }

  timezone = self->_timezone;
  if (timezone)
  {
    PBDataWriterWriteStringField(v15, timezone, 6LL);
    id v4 = v15;
  }

  carrier = self->_carrier;
  if (carrier)
  {
    PBDataWriterWriteStringField(v15, carrier, 7LL);
    id v4 = v15;
  }

  cellularNetworkType = self->_cellularNetworkType;
  if (cellularNetworkType)
  {
    PBDataWriterWriteStringField(v15, cellularNetworkType, 8LL);
    id v4 = v15;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_connection, 9LL);
    id v4 = v15;
  }

  disk = self->_disk;
  if (disk)
  {
    PBDataWriterWriteSubmessage(v15, disk, 10LL);
    id v4 = v15;
  }

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_23;
    }
LABEL_27:
    PBDataWriterWriteInt32Field(v15, self->_deviceFamily, 12LL);
    id v4 = v15;
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  PBDataWriterWriteUint32Field(v15, self->_batteryPercentage, 11LL);
  id v4 = v15;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  if ((has & 8) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt32Field(v15, self->_devicePlatform, 13LL);
    id v4 = v15;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = -[NSString copyWithZone:](self->_architecture, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = -[TFDisplay copyWithZone:](self->_display, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  id v14 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  id v15 = (void *)v5[9];
  v5[9] = v14;

  id v16 = -[NSString copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v17 = (void *)v5[12];
  v5[12] = v16;

  id v18 = -[NSString copyWithZone:](self->_carrier, "copyWithZone:", a3);
  v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = -[NSString copyWithZone:](self->_cellularNetworkType, "copyWithZone:", a3);
  v21 = (void *)v5[4];
  v5[4] = v20;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_connection;
    *((_BYTE *)v5 + 104) |= 2u;
  }

  id v22 = -[TFMemoryUsage copyWithZone:](self->_disk, "copyWithZone:", a3);
  v23 = (void *)v5[7];
  v5[7] = v22;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v5 + 11) = self->_deviceFamily;
    *((_BYTE *)v5 + 104) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0) {
      return v5;
    }
    goto LABEL_6;
  }

  *((_DWORD *)v5 + 4) = self->_batteryPercentage;
  *((_BYTE *)v5 + 104) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 12) = self->_devicePlatform;
    *((_BYTE *)v5 + 104) |= 8u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  model = self->_model;
  if ((unint64_t)model | *((void *)v4 + 10))
  {
  }

  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 11))
  {
  }

  architecture = self->_architecture;
  if ((unint64_t)architecture | *((void *)v4 + 1))
  {
  }

  display = self->_display;
  if ((unint64_t)display | *((void *)v4 + 8))
  {
    if (!-[TFDisplay isEqual:](display, "isEqual:")) {
      goto LABEL_40;
    }
  }

  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 9))
  {
  }

  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 12))
  {
  }

  carrier = self->_carrier;
  if ((unint64_t)carrier | *((void *)v4 + 3))
  {
  }

  cellularNetworkType = self->_cellularNetworkType;
  if ((unint64_t)cellularNetworkType | *((void *)v4 + 4))
  {
  }

  char has = (char)self->_has;
  char v15 = *((_BYTE *)v4 + 104);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_connection != *((_DWORD *)v4 + 10)) {
      goto LABEL_40;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
    goto LABEL_40;
  }

  disk = self->_disk;
  if ((unint64_t)disk | *((void *)v4 + 7))
  {
    if (!-[TFMemoryUsage isEqual:](disk, "isEqual:"))
    {
LABEL_40:
      BOOL v17 = 0;
      goto LABEL_41;
    }

    char has = (char)self->_has;
    char v15 = *((_BYTE *)v4 + 104);
  }

  if ((has & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_batteryPercentage != *((_DWORD *)v4 + 4)) {
      goto LABEL_40;
    }
  }

  else if ((v15 & 1) != 0)
  {
    goto LABEL_40;
  }

  if ((has & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_deviceFamily != *((_DWORD *)v4 + 11)) {
      goto LABEL_40;
    }
  }

  else if ((v15 & 4) != 0)
  {
    goto LABEL_40;
  }

  BOOL v17 = (v15 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_devicePlatform != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
    BOOL v17 = 1;
  }

- (unint64_t)hash
{
  NSUInteger v16 = -[NSString hash](self->_model, "hash");
  NSUInteger v3 = -[NSString hash](self->_osVersion, "hash");
  NSUInteger v4 = -[NSString hash](self->_architecture, "hash");
  unint64_t v5 = -[TFDisplay hash](self->_display, "hash");
  NSUInteger v6 = -[NSString hash](self->_locale, "hash");
  NSUInteger v7 = -[NSString hash](self->_timezone, "hash");
  NSUInteger v8 = -[NSString hash](self->_carrier, "hash");
  NSUInteger v9 = -[NSString hash](self->_cellularNetworkType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761LL * self->_connection;
  }
  else {
    uint64_t v10 = 0LL;
  }
  unint64_t v11 = -[TFMemoryUsage hash](self->_disk, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    uint64_t v12 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v13 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v14 = 0LL;
    return v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }

  uint64_t v12 = 2654435761LL * self->_batteryPercentage;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v13 = 2654435761LL * self->_deviceFamily;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v14 = 2654435761LL * self->_devicePlatform;
  return v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void).cxx_destruct
{
}

@end