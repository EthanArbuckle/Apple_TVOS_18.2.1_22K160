@interface CSAdBlockerAssetDecoder
- (CSAdBlockerAssetDecoder)initWithAssetPath:(id)a3;
- (NSData)payLoadData;
- (id)decodeAdblockerAsset;
- (void)setPayLoadData:(id)a3;
@end

@implementation CSAdBlockerAssetDecoder

- (CSAdBlockerAssetDecoder)initWithAssetPath:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSAdBlockerAssetDecoder;
  v5 = -[CSAdBlockerAssetDecoder init](&v14, "init");
  if (!v5) {
    goto LABEL_9;
  }
  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSAdBlockerAssetDecoder initWithAssetPath:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s initilizing adBlockerAssetDecoder with assetPath: %@",  buf,  0x16u);
  }

  id v13 = 0LL;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v4,  2LL,  &v13));
  id v8 = v13;
  payLoadData = v5->_payLoadData;
  v5->_payLoadData = (NSData *)v7;

  if (v8 || !v5->_payLoadData)
  {
    v10 = (os_log_s *)CSLogCategoryAdBlocker;
    if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAdBlockerAssetDecoder initWithAssetPath:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Error reading file", buf, 0xCu);
    }

    v11 = 0LL;
  }

  else
  {
LABEL_9:
    v11 = v5;
  }

  return v11;
}

- (id)decodeAdblockerAsset
{
  int v3 = v9;
  id v4 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAdBlockerAssetDecoder decodeAdblockerAsset]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Version of AdBlockerAsset: %d", buf, 0x12u);
  }

  switch(v3)
  {
    case 3:
      v5 = &OBJC_CLASS___CSAdBlockerAssetDecoderV3;
      goto LABEL_9;
    case 2:
      v5 = &OBJC_CLASS___CSAdBlockerAssetDecoderV2;
      goto LABEL_9;
    case 1:
      v5 = &OBJC_CLASS___CSAdBlockerAssetDecoderV1;
LABEL_9:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class decodeAssetWithData:](v5, "decodeAssetWithData:", self->_payLoadData));
      return v6;
  }

  uint64_t v7 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSAdBlockerAssetDecoder decodeAdblockerAsset]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Adblocker Version is not legal to decode",  buf,  0xCu);
  }

  v6 = 0LL;
  return v6;
}

- (NSData)payLoadData
{
  return self->_payLoadData;
}

- (void)setPayLoadData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end