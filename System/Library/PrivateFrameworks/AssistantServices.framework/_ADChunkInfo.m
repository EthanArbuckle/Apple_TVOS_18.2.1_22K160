@interface _ADChunkInfo
- (BOOL)isValid;
- (NSString)postGen;
- (NSString)validity;
- (_ADChunkInfo)initWithDictionary:(id)a3;
- (id)anchorWithKey:(id)a3 appID:(id)a4 syncType:(id)a5;
- (id)dictionaryRepresentation;
- (void)setPostGen:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation _ADChunkInfo

- (_ADChunkInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____ADChunkInfo;
  v5 = -[_ADChunkInfo init](&v14, "init");
  if (v5)
  {
    if ((objc_opt_respondsToSelector(v4, "objectForKey:") & 1) != 0)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v7 = SASyncAnchorGenerationPListKey;
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SASyncAnchorGenerationPListKey]);
      if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0)
      {
        -[_ADChunkInfo setPostGen:](v5, "setPostGen:", v8);
      }

      else if (v8)
      {
        v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "-[_ADChunkInfo initWithDictionary:]";
          __int16 v17 = 2112;
          uint64_t v18 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Non-string object under key %@",  buf,  0x16u);
        }
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SASyncAnchorValidityPListKey]);

      if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
      {
        -[_ADChunkInfo setValidity:](v5, "setValidity:", v11);
      }

      else if (v11)
      {
        v12 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "-[_ADChunkInfo initWithDictionary:]";
          __int16 v17 = 2112;
          uint64_t v18 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Non-string object under key %@",  buf,  0x16u);
        }
      }
    }

    else
    {
      v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[_ADChunkInfo initWithDictionary:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Invalid parameter is not a dictionary!",  buf,  0xCu);
      }
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  id v4 = v3;
  postGen = self->_postGen;
  if (postGen) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", postGen, SASyncAnchorGenerationPListKey);
  }
  validity = self->_validity;
  if (validity) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", validity, SASyncAnchorValidityPListKey);
  }
  return v4;
}

- (BOOL)isValid
{
  return -[NSString length](self->_postGen, "length") || -[NSString length](self->_validity, "length") != 0;
}

- (id)anchorWithKey:(id)a3 appID:(id)a4 syncType:(id)a5
{
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___SASyncAnchor);
  -[SASyncAnchor setKey:](v11, "setKey:", v10);

  -[SASyncAnchor setValidity:](v11, "setValidity:", self->_validity);
  -[SASyncAnchor setGeneration:](v11, "setGeneration:", self->_postGen);
  if (v8 | v9)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___SASyncAppMetaData);
    if (v9)
    {
      unint64_t v16 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
      [v12 setSyncSlots:v13];
    }

    if (v8)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
      [v14 setBundleId:v8];
      [v12 setAppIdentifyingInfo:v14];
    }

    -[SASyncAnchor setAppMetaData:](v11, "setAppMetaData:", v12);
  }

  return v11;
}

- (NSString)postGen
{
  return self->_postGen;
}

- (void)setPostGen:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setValidity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end