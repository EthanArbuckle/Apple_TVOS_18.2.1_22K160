@interface _ADPBDeviceStartRemoteRequest
+ (unsigned)_ADPBDeviceRequestType;
- (AFRequestInfo)_ad_requestInfo;
- (BOOL)hasHandoffData;
- (BOOL)hasHandoffNotification;
- (BOOL)hasHandoffOriginDeviceName;
- (BOOL)hasHandoffUrlString;
- (BOOL)hasRequiresUserInteraction;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresUserInteraction;
- (NSData)handoffData;
- (NSString)handoffNotification;
- (NSString)handoffOriginDeviceName;
- (NSString)handoffUrlString;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)_ad_setRequestInfo:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandoffData:(id)a3;
- (void)setHandoffNotification:(id)a3;
- (void)setHandoffOriginDeviceName:(id)a3;
- (void)setHandoffUrlString:(id)a3;
- (void)setHasRequiresUserInteraction:(BOOL)a3;
- (void)setRequiresUserInteraction:(BOOL)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceStartRemoteRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 3;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[_ADPBDeviceStartRemoteRequest(ADSharedDataService) _ad_performWithSharedDataRemote:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  [v6 _startRemoteRequest:self completion:v7];
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = "-[_ADPBDeviceStartRemoteRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest _ad_requestInfo](self, "_ad_requestInfo"));
  [v8 _notifyObserversOfRequestInfo:v12 fromPeer:v9 completion:v10];
}

- (BOOL)hasText
{
  return self->_text != 0LL;
}

- (BOOL)hasHandoffData
{
  return self->_handoffData != 0LL;
}

- (BOOL)hasHandoffUrlString
{
  return self->_handoffUrlString != 0LL;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requiresUserInteraction = a3;
}

- (void)setHasRequiresUserInteraction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequiresUserInteraction
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHandoffNotification
{
  return self->_handoffNotification != 0LL;
}

- (BOOL)hasHandoffOriginDeviceName
{
  return self->_handoffOriginDeviceName != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBDeviceStartRemoteRequest;
  id v3 = -[_ADPBDeviceStartRemoteRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  handoffData = self->_handoffData;
  if (handoffData) {
    [v4 setObject:handoffData forKey:@"handoff_data"];
  }
  handoffUrlString = self->_handoffUrlString;
  if (handoffUrlString) {
    [v4 setObject:handoffUrlString forKey:@"handoff_url_string"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_requiresUserInteraction));
    [v4 setObject:v8 forKey:@"requiresUserInteraction"];
  }

  handoffNotification = self->_handoffNotification;
  if (handoffNotification) {
    [v4 setObject:handoffNotification forKey:@"handoff_notification"];
  }
  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  if (handoffOriginDeviceName) {
    [v4 setObject:handoffOriginDeviceName forKey:@"handoff_origin_device_name"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v15 = 40LL;
        goto LABEL_32;
      case 2u:
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v15 = 8LL;
        goto LABEL_32;
      case 3u:
        uint64_t v18 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v18);
        uint64_t v15 = 32LL;
        goto LABEL_32;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        break;
      case 5u:
        uint64_t v24 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v24);
        uint64_t v15 = 16LL;
        goto LABEL_32;
      case 6u:
        uint64_t v25 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v25);
        uint64_t v15 = 24LL;
LABEL_32:
        v26 = *(void **)&self->PBRequest_opaque[v15];
        *(void *)&self->PBRequest_opaque[v15] = v14;

        continue;
      default:
        int v16 = PBReaderSkipValueWithTag(a3);
        if (!v16) {
          return v16;
        }
        continue;
    }

    while (1)
    {
      unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v21 |= (unint64_t)(v23 & 0x7F) << v19;
      if ((v23 & 0x80) == 0) {
        goto LABEL_36;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        uint64_t v21 = 0LL;
        goto LABEL_38;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v21 = 0LL;
    }
LABEL_38:
    self->_requiresUserInteraction = v21 != 0;
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  text = self->_text;
  id v10 = v4;
  if (text)
  {
    PBDataWriterWriteStringField(v4, text, 1LL);
    id v4 = v10;
  }

  handoffuint64_t Data = self->_handoffData;
  if (handoffData)
  {
    PBDataWriterWriteDataField(v10, handoffData, 2LL);
    id v4 = v10;
  }

  handoffUrluint64_t String = self->_handoffUrlString;
  if (handoffUrlString)
  {
    PBDataWriterWriteStringField(v10, handoffUrlString, 3LL);
    id v4 = v10;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_requiresUserInteraction, 4LL);
    id v4 = v10;
  }

  handoffNotification = self->_handoffNotification;
  if (handoffNotification)
  {
    PBDataWriterWriteStringField(v10, handoffNotification, 5LL);
    id v4 = v10;
  }

  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  if (handoffOriginDeviceName)
  {
    PBDataWriterWriteStringField(v10, handoffOriginDeviceName, 6LL);
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    id v4 = v5;
  }

  if (self->_handoffData)
  {
    objc_msgSend(v5, "setHandoffData:");
    id v4 = v5;
  }

  if (self->_handoffUrlString)
  {
    objc_msgSend(v5, "setHandoffUrlString:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_requiresUserInteraction;
    v4[52] |= 1u;
  }

  if (self->_handoffNotification)
  {
    objc_msgSend(v5, "setHandoffNotification:");
    id v4 = v5;
  }

  if (self->_handoffOriginDeviceName)
  {
    objc_msgSend(v5, "setHandoffOriginDeviceName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = -[NSData copyWithZone:](self->_handoffData, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSString copyWithZone:](self->_handoffUrlString, "copyWithZone:", a3);
  int v11 = (void *)v5[4];
  v5[4] = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 48) = self->_requiresUserInteraction;
    *((_BYTE *)v5 + 52) |= 1u;
  }

  id v12 = -[NSString copyWithZone:](self->_handoffNotification, "copyWithZone:", a3);
  int v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = -[NSString copyWithZone:](self->_handoffOriginDeviceName, "copyWithZone:", a3);
  uint64_t v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 5))
  {
  }

  handoffuint64_t Data = self->_handoffData;
  if ((unint64_t)handoffData | *((void *)v4 + 1))
  {
  }

  handoffUrluint64_t String = self->_handoffUrlString;
  if ((unint64_t)handoffUrlString | *((void *)v4 + 4))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_requiresUserInteraction)
      {
        if (!*((_BYTE *)v4 + 48)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }

      if (!*((_BYTE *)v4 + 48)) {
        goto LABEL_16;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_text, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_handoffData, "hash");
  NSUInteger v5 = -[NSString hash](self->_handoffUrlString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_requiresUserInteraction;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v8 = -[NSString hash](self->_handoffNotification, "hash");
  return v7 ^ v8 ^ -[NSString hash](self->_handoffOriginDeviceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (BOOL *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[_ADPBDeviceStartRemoteRequest setText:](self, "setText:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffData:](self, "setHandoffData:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 4))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffUrlString:](self, "setHandoffUrlString:");
    unint64_t v4 = v5;
  }

  if (v4[52])
  {
    self->_requiresUserInteraction = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 2))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffNotification:](self, "setHandoffNotification:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 3))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffOriginDeviceName:](self, "setHandoffOriginDeviceName:");
    unint64_t v4 = v5;
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSData)handoffData
{
  return self->_handoffData;
}

- (void)setHandoffData:(id)a3
{
}

- (NSString)handoffUrlString
{
  return self->_handoffUrlString;
}

- (void)setHandoffUrlString:(id)a3
{
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (NSString)handoffNotification
{
  return self->_handoffNotification;
}

- (void)setHandoffNotification:(id)a3
{
}

- (NSString)handoffOriginDeviceName
{
  return self->_handoffOriginDeviceName;
}

- (void)setHandoffOriginDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (AFRequestInfo)_ad_requestInfo
{
  NSUInteger v3 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest text](self, "text"));
  -[AFRequestInfo setText:](v3, "setText:", v4);

  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest handoffData](self, "handoffData"));
  -[AFRequestInfo setHandoffRequestData:](v3, "setHandoffRequestData:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest handoffUrlString](self, "handoffUrlString"));
  -[AFRequestInfo setHandoffURLString:](v3, "setHandoffURLString:", v6);

  -[AFRequestInfo setHandoffRequiresUserInteraction:]( v3,  "setHandoffRequiresUserInteraction:",  -[_ADPBDeviceStartRemoteRequest requiresUserInteraction](self, "requiresUserInteraction"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest handoffNotification](self, "handoffNotification"));
  -[AFRequestInfo setHandoffNotification:](v3, "setHandoffNotification:", v7);

  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStartRemoteRequest handoffOriginDeviceName](self, "handoffOriginDeviceName"));
  -[AFRequestInfo setHandoffOriginDeviceName:](v3, "setHandoffOriginDeviceName:", v8);

  -[AFRequestInfo setActivationEvent:](v3, "setActivationEvent:", 1LL);
  return v3;
}

- (void)_ad_setRequestInfo:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  -[_ADPBDeviceStartRemoteRequest setText:](self, "setText:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffRequestData]);
  -[_ADPBDeviceStartRemoteRequest setHandoffData:](self, "setHandoffData:", v6);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffURLString]);
  -[_ADPBDeviceStartRemoteRequest setHandoffUrlString:](self, "setHandoffUrlString:", v7);

  -[_ADPBDeviceStartRemoteRequest setRequiresUserInteraction:]( self,  "setRequiresUserInteraction:",  [v4 handoffRequiresUserInteraction]);
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffNotification]);
  -[_ADPBDeviceStartRemoteRequest setHandoffNotification:](self, "setHandoffNotification:", v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 handoffOriginDeviceName]);
  -[_ADPBDeviceStartRemoteRequest setHandoffOriginDeviceName:](self, "setHandoffOriginDeviceName:", v9);
}

@end