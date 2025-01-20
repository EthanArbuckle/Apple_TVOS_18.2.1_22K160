@interface _ADPBLocationGetPeerLocationRequest
+ (unsigned)_ADPBLocationRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithPeerLocationManagerRemote:(id)a3 completion:(id)a4;
@end

@implementation _ADPBLocationGetPeerLocationRequest

- (void)_ad_performWithPeerLocationManagerRemote:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[_ADPBLocationGetPeerLocationRequest(ADPeerLocationRemote) _ad_performWithPeerLocationManagerRemote:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  [v5 _getBestLocationWithCompletion:v6];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBLocationGetPeerLocationRequest;
  id v3 = -[_ADPBLocationGetPeerLocationRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBLocationGetPeerLocationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
}

- (BOOL)readFrom:(id)a3
{
  while (1)
  {
    int v4 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
      return v4 == 0;
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      int v4 = 1;
      return v4 == 0;
    }

    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
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
        LOBYTE(v7) = 0;
        int v4 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v4 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v7) = 0;
    }
LABEL_13:
    if (v4) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = (v7 & 7) == 4;
    }
    if (v11) {
      return v4 == 0;
    }
    if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
      return 0;
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [v4 isMemberOfClass:objc_opt_class(self)];

  return (char)self;
}

- (unint64_t)hash
{
  return 0LL;
}

+ (unsigned)_ADPBLocationRequestType
{
  return 1;
}

@end