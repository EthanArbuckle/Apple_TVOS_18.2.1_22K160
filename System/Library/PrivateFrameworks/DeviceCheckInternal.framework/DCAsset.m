@interface DCAsset
+ (id)assetWithMobileAsset:(id)a3;
- (NSData)publicKey;
- (double)publicKeyRefreshInterval;
- (id)description;
- (unint64_t)version;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyRefreshInterval:(double)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation DCAsset

+ (id)assetWithMobileAsset:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assetProperty:ASAttributeContentVersion]);
  id v5 = [v4 unsignedIntegerValue];

  if (v5 == (id)1)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 assetProperty:@"com.apple.devicecheck.pubvalue"]);
    if (v6)
    {
      v7 = (os_log_s *)v6;
      v8 = objc_alloc_init(&OBJC_CLASS___DCAsset);
      -[DCAsset setVersion:](v8, "setVersion:", 1LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 assetProperty:@"com.apple.devicecheck.refreshtimer"]);
      [v9 doubleValue];
      -[DCAsset setPublicKeyRefreshInterval:](v8, "setPublicKeyRefreshInterval:");

      -[DCAsset setPublicKey:](v8, "setPublicKey:", v7);
      id v10 = sub_1000043BC();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Returning parsed asset: %@",  (uint8_t *)&v14,  0xCu);
      }
    }

    else
    {
      id v12 = sub_1000043BC();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005D40(v7);
      }
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)description
{
  id v3 = [(id)objc_opt_class(self) description];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p - version: %lu, refreshInterval: %f>",  v4,  self,  self->_version,  *(void *)&self->_publicKeyRefreshInterval));

  return v5;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (double)publicKeyRefreshInterval
{
  return self->_publicKeyRefreshInterval;
}

- (void)setPublicKeyRefreshInterval:(double)a3
{
  self->_publicKeyRefreshInterval = a3;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end