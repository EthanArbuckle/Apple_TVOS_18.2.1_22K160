@interface _ADPBDeviceExecuteOnRemoteRequest
+ (unsigned)_ADPBDeviceRequestType;
- (BOOL)hasAssistantId;
- (BOOL)hasContent;
- (BOOL)hasSourceAirplayId;
- (BOOL)hasSourceIDSFirstRoutableDestination;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)content;
- (NSString)assistantId;
- (NSString)sourceAirplayId;
- (NSString)sourceIDSFirstRoutableDestination;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setContent:(id)a3;
- (void)setSourceAirplayId:(id)a3;
- (void)setSourceIDSFirstRoutableDestination:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceExecuteOnRemoteRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 4;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[_ADPBDeviceExecuteOnRemoteRequest(ADSharedDataService) _ad_performWithSharedDataRemote:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  [v6 _handleExecuteRequestOnRemoteWatch:self completion:v7];
}

- (BOOL)hasContent
{
  return self->_content != 0LL;
}

- (BOOL)hasSourceIDSFirstRoutableDestination
{
  return self->_sourceIDSFirstRoutableDestination != 0LL;
}

- (BOOL)hasAssistantId
{
  return self->_assistantId != 0LL;
}

- (BOOL)hasSourceAirplayId
{
  return self->_sourceAirplayId != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBDeviceExecuteOnRemoteRequest;
  id v3 = -[_ADPBDeviceExecuteOnRemoteRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceExecuteOnRemoteRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }
  sourceIDSFirstRoutableDestination = self->_sourceIDSFirstRoutableDestination;
  if (sourceIDSFirstRoutableDestination) {
    [v4 setObject:sourceIDSFirstRoutableDestination forKey:@"sourceIDSFirstRoutableDestination"];
  }
  assistantId = self->_assistantId;
  if (assistantId) {
    [v4 setObject:assistantId forKey:@"assistant_id"];
  }
  sourceAirplayId = self->_sourceAirplayId;
  if (sourceAirplayId) {
    [v4 setObject:sourceAirplayId forKey:@"source_airplay_id"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v7 >> 3))
      {
        case 1u:
          uint64_t Data = PBReaderReadData(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
          uint64_t v15 = 16LL;
          goto LABEL_24;
        case 2u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v15 = 32LL;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(v17);
          uint64_t v15 = 8LL;
          goto LABEL_24;
        case 4u:
          uint64_t v18 = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(v18);
          uint64_t v15 = 24LL;
LABEL_24:
          v19 = *(void **)&self->PBRequest_opaque[v15];
          *(void *)&self->PBRequest_opaque[v15] = v14;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          break;
      }
    }
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  content = self->_content;
  id v9 = v4;
  if (content)
  {
    PBDataWriterWriteDataField(v4, content, 1LL);
    id v4 = v9;
  }

  sourceIDSFirstRoutableDestination = self->_sourceIDSFirstRoutableDestination;
  if (sourceIDSFirstRoutableDestination)
  {
    PBDataWriterWriteStringField(v9, sourceIDSFirstRoutableDestination, 2LL);
    id v4 = v9;
  }

  assistantId = self->_assistantId;
  if (assistantId)
  {
    PBDataWriterWriteStringField(v9, assistantId, 3LL);
    id v4 = v9;
  }

  sourceAirplayId = self->_sourceAirplayId;
  if (sourceAirplayId)
  {
    PBDataWriterWriteStringField(v9, sourceAirplayId, 4LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_content)
  {
    objc_msgSend(v4, "setContent:");
    id v4 = v5;
  }

  if (self->_sourceIDSFirstRoutableDestination)
  {
    objc_msgSend(v5, "setSourceIDSFirstRoutableDestination:");
    id v4 = v5;
  }

  if (self->_assistantId)
  {
    objc_msgSend(v5, "setAssistantId:");
    id v4 = v5;
  }

  if (self->_sourceAirplayId)
  {
    objc_msgSend(v5, "setSourceAirplayId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_content, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_sourceIDSFirstRoutableDestination, "copyWithZone:", a3);
  id v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[NSString copyWithZone:](self->_assistantId, "copyWithZone:", a3);
  int v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = -[NSString copyWithZone:](self->_sourceAirplayId, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((content = self->_content, !((unint64_t)content | v4[2]))
     || -[NSData isEqual:](content, "isEqual:"))
    && ((sourceIDSFirstRoutableDestination = self->_sourceIDSFirstRoutableDestination,
         !((unint64_t)sourceIDSFirstRoutableDestination | v4[4]))
     || -[NSString isEqual:](sourceIDSFirstRoutableDestination, "isEqual:"))
    && ((assistantId = self->_assistantId, !((unint64_t)assistantId | v4[1]))
     || -[NSString isEqual:](assistantId, "isEqual:")))
  {
    sourceAirplayId = self->_sourceAirplayId;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_content, "hash");
  unint64_t v4 = -[NSString hash](self->_sourceIDSFirstRoutableDestination, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_assistantId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_sourceAirplayId, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setContent:](self, "setContent:");
  }
  if (v4[4]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setSourceIDSFirstRoutableDestination:]( self,  "setSourceIDSFirstRoutableDestination:");
  }
  if (v4[1]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setAssistantId:](self, "setAssistantId:");
  }
  if (v4[3]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setSourceAirplayId:](self, "setSourceAirplayId:");
  }
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSString)sourceIDSFirstRoutableDestination
{
  return self->_sourceIDSFirstRoutableDestination;
}

- (void)setSourceIDSFirstRoutableDestination:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)sourceAirplayId
{
  return self->_sourceAirplayId;
}

- (void)setSourceAirplayId:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[_ADPBDeviceExecuteOnRemoteRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  [v8 _handleRemoteExecution:self peer:v9 completion:v10];
}

@end