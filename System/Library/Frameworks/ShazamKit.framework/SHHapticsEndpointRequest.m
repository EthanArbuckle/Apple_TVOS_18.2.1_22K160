@interface SHHapticsEndpointRequest
- (BOOL)hasRequestAppleMusicID;
- (BOOL)hasRequestISRC;
- (NSURLRequest)urlRequest;
- (SHHapticsEndpoint)hapticsEndpoint;
- (SHHapticsEndpointRequest)initWithRequestMediaItem:(id)a3 hapticsEndpoint:(id)a4;
- (SHMediaItem)mediaItem;
- (id)constructURLRequest;
@end

@implementation SHHapticsEndpointRequest

- (SHHapticsEndpointRequest)initWithRequestMediaItem:(id)a3 hapticsEndpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SHHapticsEndpointRequest;
  v9 = -[SHHapticsEndpointRequest init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_hapticsEndpoint, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest constructURLRequest](v10, "constructURLRequest"));
    urlRequest = v10->_urlRequest;
    v10->_urlRequest = (NSURLRequest *)v11;
  }

  return v10;
}

- (id)constructURLRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest hapticsEndpoint](self, "hapticsEndpoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 adamIDURL]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest hapticsEndpoint](self, "hapticsEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 isrcURL]);

  if (-[SHHapticsEndpointRequest hasRequestAppleMusicID](self, "hasRequestAppleMusicID") && v4)
  {
    [v4 updateToken:11 withValue:@"songs"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest mediaItem](self, "mediaItem"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleMusicID]);
    [v4 updateToken:12 withValue:v8];
    v9 = v4;
  }

  else
  {
    BOOL v10 = -[SHHapticsEndpointRequest hasRequestISRC](self, "hasRequestISRC");
    if (!v10 || !v6)
    {
      uint64_t v15 = sh_log_object(v10);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v4 URLRepresentation]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v6 URLRepresentation]);
        int v24 = 138412546;
        v25 = v17;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Haptics endpoints: AdamID:%@, ISRC: %@",  (uint8_t *)&v24,  0x16u);
      }

      uint64_t v20 = sh_log_object(v19);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest mediaItem](self, "mediaItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 properties]);
        int v24 = 138412290;
        v25 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Did not find apple music ID or ISRC from media item: %@ to create haptics endpoint request.",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_15;
    }

    [v6 updateToken:11 withValue:@"isrc"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest mediaItem](self, "mediaItem"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 isrc]);
    [v6 updateToken:12 withValue:v8];
    v9 = v6;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 URLRepresentation]);
  if (!v11)
  {
    uint64_t v14 = sh_log_object(0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Haptics request URL could not be constructed.",  (uint8_t *)&v24,  2u);
    }

- (BOOL)hasRequestAppleMusicID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest mediaItem](self, "mediaItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appleMusicID]);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)hasRequestISRC
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequest mediaItem](self, "mediaItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 isrc]);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (SHHapticsEndpoint)hapticsEndpoint
{
  return self->_hapticsEndpoint;
}

- (void).cxx_destruct
{
}

@end