@interface SECC2MPMetric
- (BOOL)hasCloudkitInfo;
- (BOOL)hasDeviceInfo;
- (BOOL)hasGenericEvent;
- (BOOL)hasMetricType;
- (BOOL)hasNetworkEvent;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasServerInfo;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SECC2MPCloudKitInfo)cloudkitInfo;
- (SECC2MPDeviceInfo)deviceInfo;
- (SECC2MPGenericEvent)genericEvent;
- (SECC2MPNetworkEvent)networkEvent;
- (SECC2MPServerInfo)serverInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricTypeAsString:(int)a3;
- (int)StringAsMetricType:(id)a3;
- (int)metricType;
- (unint64_t)hash;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)triggers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudkitInfo:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setGenericEvent:(id)a3;
- (void)setHasMetricType:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setMetricType:(int)a3;
- (void)setNetworkEvent:(id)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setServerInfo:(id)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPMetric

- (int)metricType
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_metricType;
  }
  else {
    return 0;
  }
}

- (void)setMetricType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_metricType = a3;
}

- (void)setHasMetricType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetricType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)metricTypeAsString:(int)a3
{
  switch(a3)
  {
    case 0:
      return @"none_type";
    case 201:
      return @"generic_event_type";
    case 200:
      char v3 = @"network_event_type";
      break;
    default:
      char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
      break;
  }

  return v3;
}

- (int)StringAsMetricType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none_type"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"network_event_type"])
  {
    int v4 = 200;
  }

  else if ([v3 isEqualToString:@"generic_event_type"])
  {
    int v4 = 201;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0LL;
}

- (BOOL)hasCloudkitInfo
{
  return self->_cloudkitInfo != 0LL;
}

- (BOOL)hasServerInfo
{
  return self->_serverInfo != 0LL;
}

- (void)setTriggers:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggers = a3;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggers
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportFrequency = a3;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportFrequencyBase = a3;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0LL;
}

- (BOOL)hasGenericEvent
{
  return self->_genericEvent != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPMetric;
  id v3 = -[SECC2MPMetric description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    int metricType = self->_metricType;
    if (metricType)
    {
      if (metricType == 201)
      {
        v5 = @"generic_event_type";
      }

      else if (metricType == 200)
      {
        v5 = @"network_event_type";
      }

      else
      {
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_metricType));
      }
    }

    else
    {
      v5 = @"none_type";
    }

    [v3 setObject:v5 forKey:@"metric_type"];
  }

  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation"));
    [v3 setObject:v7 forKey:@"device_info"];
  }

  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo dictionaryRepresentation](cloudkitInfo, "dictionaryRepresentation"));
    [v3 setObject:v9 forKey:@"cloudkit_info"];
  }

  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPServerInfo dictionaryRepresentation](serverInfo, "dictionaryRepresentation"));
    [v3 setObject:v11 forKey:@"server_info"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggers));
    [v3 setObject:v19 forKey:@"triggers"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportFrequency));
  [v3 setObject:v20 forKey:@"report_frequency"];

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_19:
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportFrequencyBase));
    [v3 setObject:v13 forKey:@"report_frequency_base"];
  }

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        goto LABEL_88;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0LL;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        goto LABEL_88;
      }
      unint64_t v13 = v7 >> 3;
      if ((int)v13 <= 199)
      {
        if ((_DWORD)v13 == 101)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v21 = 0LL;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v32 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              goto LABEL_83;
            }
            v29 += 7;
            BOOL v10 = v30++ >= 9;
            if (v10)
            {
              uint64_t v21 = 0LL;
              goto LABEL_85;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_83:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v21 = 0LL;
          }
LABEL_85:
          uint64_t v34 = 8LL;
        }

        else
        {
          if ((_DWORD)v13 != 102) {
            goto LABEL_68;
          }
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0LL;
          *(_BYTE *)&self->_has |= 2u;
          while (1)
          {
            unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if ((v23 & 0x80) == 0) {
              goto LABEL_75;
            }
            v19 += 7;
            BOOL v10 = v20++ >= 9;
            if (v10)
            {
              uint64_t v21 = 0LL;
              goto LABEL_77;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_75:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v21 = 0LL;
          }
LABEL_77:
          uint64_t v34 = 16LL;
        }

        goto LABEL_86;
      }

      if ((_DWORD)v13 == 200)
      {
        v24 = objc_alloc_init(&OBJC_CLASS___SECC2MPNetworkEvent);
        objc_storeStrong((id *)&self->_networkEvent, v24);
        unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || (sub_10016A928((uint64_t)v24, (uint64_t)a3) & 1) == 0)
        {
LABEL_89:

          LOBYTE(v33) = 0;
          return v33;
        }
      }

      else
      {
        if ((_DWORD)v13 != 201)
        {
LABEL_68:
          int v33 = PBReaderSkipValueWithTag(a3);
          if (!v33) {
            return v33;
          }
          goto LABEL_87;
        }

        v24 = objc_alloc_init(&OBJC_CLASS___SECC2MPGenericEvent);
        objc_storeStrong((id *)&self->_genericEvent, v24);
        unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_metricType, 1LL);
    id v4 = v11;
  }

  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    PBDataWriterWriteSubmessage(v11, deviceInfo, 2LL);
    id v4 = v11;
  }

  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    PBDataWriterWriteSubmessage(v11, cloudkitInfo, 3LL);
    id v4 = v11;
  }

  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    PBDataWriterWriteSubmessage(v11, serverInfo, 4LL);
    id v4 = v11;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v11, self->_triggers, 100LL);
    id v4 = v11;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }

  PBDataWriterWriteUint64Field(v11, self->_reportFrequency, 101LL);
  id v4 = v11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint64Field(v11, self->_reportFrequencyBase, 102LL);
    id v4 = v11;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[14] = self->_metricType;
    *((_BYTE *)v4 + 80) |= 8u;
  }

  unsigned int v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    id v4 = v6;
  }

  if (self->_cloudkitInfo)
  {
    objc_msgSend(v6, "setCloudkitInfo:");
    id v4 = v6;
  }

  if (self->_serverInfo)
  {
    objc_msgSend(v6, "setServerInfo:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_triggers;
    *((_BYTE *)v4 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }

  *((void *)v4 + 1) = self->_reportFrequency;
  *((_BYTE *)v4 + 80) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((void *)v4 + 2) = self->_reportFrequencyBase;
    *((_BYTE *)v4 + 80) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unsigned int v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5[14] = self->_metricType;
    *((_BYTE *)v5 + 80) |= 8u;
  }

  id v7 = -[SECC2MPDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  unint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = -[SECC2MPCloudKitInfo copyWithZone:](self->_cloudkitInfo, "copyWithZone:", a3);
  BOOL v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = -[SECC2MPServerInfo copyWithZone:](self->_serverInfo, "copyWithZone:", a3);
  v12 = (void *)v6[9];
  v6[9] = v11;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    v6[1] = self->_reportFrequency;
    *((_BYTE *)v6 + 80) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  v6[3] = self->_triggers;
  *((_BYTE *)v6 + 80) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v6[2] = self->_reportFrequencyBase;
    *((_BYTE *)v6 + 80) |= 2u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_metricType != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
  }

  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
LABEL_32:
    unsigned __int8 v11 = 0;
    goto LABEL_33;
  }

  deviceInfo = self->_deviceInfo;
  cloudkitInfo = self->_cloudkitInfo;
  if ((unint64_t)cloudkitInfo | *((void *)v4 + 4))
  {
    if (!-[SECC2MPCloudKitInfo isEqual:](cloudkitInfo, "isEqual:")) {
      goto LABEL_32;
    }
  }

  serverInfo = self->_serverInfo;
  if ((unint64_t)serverInfo | *((void *)v4 + 9))
  {
    if (!-[SECC2MPServerInfo isEqual:](serverInfo, "isEqual:")) {
      goto LABEL_32;
    }
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_triggers != *((void *)v4 + 3)) {
      goto LABEL_32;
    }
  }

  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_32;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_reportFrequency != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }

  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_32;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_reportFrequencyBase != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }

  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_32;
  }

  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((void *)v4 + 8)
    && !-[SECC2MPNetworkEvent isEqual:](networkEvent, "isEqual:"))
  {
    goto LABEL_32;
  }

  genericEvent = self->_genericEvent;
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_33:

  return v11;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761LL * self->_metricType;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[SECC2MPDeviceInfo hash](self->_deviceInfo, "hash");
  unint64_t v5 = -[SECC2MPCloudKitInfo hash](self->_cloudkitInfo, "hash");
  unint64_t v6 = -[SECC2MPServerInfo hash](self->_serverInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    unint64_t v7 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v8 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v9 = 0LL;
    goto LABEL_11;
  }

  unint64_t v7 = 2654435761u * self->_triggers;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_reportFrequency;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v9 = 2654435761u * self->_reportFrequencyBase;
LABEL_11:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v11 = v7 ^ v8 ^ v9 ^ -[SECC2MPNetworkEvent hash](self->_networkEvent, "hash");
  return v10 ^ v11 ^ -[SECC2MPGenericEvent hash](self->_genericEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[20] & 8) != 0)
  {
    self->_int metricType = v4[14];
    *(_BYTE *)&self->_has |= 8u;
  }

  deviceInfo = self->_deviceInfo;
  uint64_t v7 = v5[5];
  unint64_t v17 = v5;
  if (deviceInfo)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SECC2MPDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SECC2MPMetric setDeviceInfo:](self, "setDeviceInfo:");
  }

  unint64_t v5 = v17;
LABEL_9:
  cloudkitInfo = self->_cloudkitInfo;
  uint64_t v9 = v5[4];
  if (cloudkitInfo)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SECC2MPCloudKitInfo mergeFrom:](cloudkitInfo, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SECC2MPMetric setCloudkitInfo:](self, "setCloudkitInfo:");
  }

  unint64_t v5 = v17;
LABEL_15:
  serverInfo = self->_serverInfo;
  uint64_t v11 = v5[9];
  if (serverInfo)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SECC2MPServerInfo mergeFrom:](serverInfo, "mergeFrom:");
  }

  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[SECC2MPMetric setServerInfo:](self, "setServerInfo:");
  }

  unint64_t v5 = v17;
LABEL_21:
  char v12 = *((_BYTE *)v5 + 80);
  if ((v12 & 4) != 0)
  {
    self->_triggers = v5[3];
    *(_BYTE *)&self->_has |= 4u;
    char v12 = *((_BYTE *)v5 + 80);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }

  else if ((v5[10] & 1) == 0)
  {
    goto LABEL_23;
  }

  self->_reportFrequency = v5[1];
  *(_BYTE *)&self->_has |= 1u;
  if ((v5[10] & 2) != 0)
  {
LABEL_24:
    self->_reportFrequencyBase = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }

- (SECC2MPDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (SECC2MPCloudKitInfo)cloudkitInfo
{
  return self->_cloudkitInfo;
}

- (void)setCloudkitInfo:(id)a3
{
}

- (SECC2MPServerInfo)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (SECC2MPNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
}

- (SECC2MPGenericEvent)genericEvent
{
  return self->_genericEvent;
}

- (void)setGenericEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end