@interface _ADPBProxyWakeUpRequest
+ (unsigned)_ADPBProxyRequestType;
- (BOOL)hasStreamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)streamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithPeerStreamConnection:(id)a3 context:(id)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStreamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyWakeUpRequest

- (void)_ad_performWithPeerStreamConnection:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyWakeUpRequest streamId](self, "streamId"));
    int v11 = 136315394;
    v12 = "-[_ADPBProxyWakeUpRequest(ADPeerStreamConnection) _ad_performWithPeerStreamConnection:context:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  [v6 _handleWakeUpMessage:self context:v7];
}

- (BOOL)hasStreamId
{
  return self->_streamId != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBProxyWakeUpRequest;
  id v3 = -[_ADPBProxyWakeUpRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyWakeUpRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  streamId = self->_streamId;
  if (streamId) {
    [v3 setObject:streamId forKey:@"stream_id"];
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
      break;
    }
    if ((v7 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a3);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue(String);
      streamId = self->_streamId;
      self->_streamId = v14;
    }

    else
    {
      int v16 = PBReaderSkipValueWithTag(a3);
      if (!v16) {
        return v16;
      }
    }
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  streamId = self->_streamId;
  if (streamId) {
    PBDataWriterWriteStringField(a3, streamId, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  streamId = self->_streamId;
  if (streamId) {
    _[a3 setStreamId:streamId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_streamId, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    streamId = self->_streamId;
    else {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_streamId, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_ADPBProxyWakeUpRequest setStreamId:](self, "setStreamId:");
  }
}

- (NSString)streamId
{
  return self->_streamId;
}

- (void)setStreamId:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (unsigned)_ADPBProxyRequestType
{
  return 0;
}

@end