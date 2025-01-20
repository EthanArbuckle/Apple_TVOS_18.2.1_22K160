@interface ICDPlaybackPositionResponseDataBase
- (ICDPlaybackPositionResponseDataBase)initWithDomain:(id)a3;
- (id)dataByInflatingWithNoZipHeader:(id)a3;
- (id)description;
- (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5;
@end

@implementation ICDPlaybackPositionResponseDataBase

- (ICDPlaybackPositionResponseDataBase)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionResponseDataBase;
  v6 = -[ICDPlaybackPositionResponseDataBase init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>",  objc_opt_class(self, a2),  self);
}

- (id)dataByInflatingWithNoZipHeader:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >> 32)
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      __int16 v16 = 2048;
      double v17 = (double)(unint64_t)[v4 length] / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ ERROR: unable to zip large data of size ~%.3f GB",  buf,  0x16u);
    }

    v6 = 0LL;
  }

  else
  {
    memset(&v13.avail_in, 0, 104);
    v13.avail_in = [v4 length];
    id v7 = v4;
    v13.next_in = (Bytef *)[v7 bytes];
    if (inflateInit2_(&v13, -15, "1.2.12", 112))
    {
LABEL_16:
      v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v15 = self;
        __int16 v16 = 2114;
        double v17 = *(double *)&v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@ could not unzip. returning inputdata: %{public}@",  buf,  0x16u);
      }

      v6 = (NSMutableData *)v7;
    }

    else
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      do
      {
        v13.avail_out = 0x4000;
        v13.next_out = buf;
        unsigned int v8 = inflate(&v13, 0);
        if (v8 > 1)
        {
          inflateEnd(&v13);

          goto LABEL_16;
        }

        unsigned int v9 = v8;
        if (v13.avail_out != 0x4000) {
          -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", buf, 0x4000 - v13.avail_out);
        }
      }

      while (!v9);
      inflateEnd(&v13);
      if (!v6) {
        goto LABEL_16;
      }
      v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v15 = self;
        __int16 v16 = 2114;
        double v17 = *(double *)&v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@ successfully unzipped. outputData=%{public}@",  buf,  0x16u);
      }
    }
  }

  return v6;
}

- (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    id v41 = 0LL;
    os_log_t v11 = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  1LL,  0LL,  &v41));
    id v12 = v41;
    if (v12)
    {
      z_stream v13 = v12;
      id v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v43 = self;
        __int16 v44 = 2114;
        id v45 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ metadataWithItemIdentifier - error deserializing data. error=%{public}@,",  buf,  0x16u);
      }
    }

    if (v11)
    {
      id v39 = 0LL;
    }

    else
    {
      id v40 = 0LL;
      id v5 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v10,  &v40);
      id v39 = v40;
      -[os_log_s setDecodingFailurePolicy:](v5, "setDecodingFailurePolicy:", 0LL);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v17);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
      v22 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v16,  v18,  v20,  objc_opt_class(&OBJC_CLASS___NSString, v21),  0LL);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      os_log_t v11 = (os_log_t)objc_claimAutoreleasedReturnValue( -[os_log_s decodeObjectOfClasses:forKey:]( v5,  "decodeObjectOfClasses:forKey:",  v23,  NSKeyedArchiveRootObjectKey));

      -[os_log_s finishDecoding](v5, "finishDecoding");
      if (!v11)
      {
        if (!a5)
        {
          v36 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v43 = self;
            __int16 v44 = 2112;
            id v45 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@ metadataWithItemIdentifier - encountered invalid data while unarchiving payload for itemIdentifier: %@",  buf,  0x16u);
          }

          os_log_t v11 = 0LL;
          v14 = 0LL;
          goto LABEL_37;
        }

        os_log_t v11 = 0LL;
LABEL_33:
        v14 = 0LL;
LABEL_38:

        goto LABEL_39;
      }
    }

    if ((objc_opt_respondsToSelector(v11, "objectForKey:") & 1) == 0) {
      goto LABEL_33;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"pver"));
    if (!v24
      || (id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"pver")),
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber, v25),
          (objc_opt_isKindOfClass(v5, v26) & 1) != 0))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"pver"));
      id v28 = [v29 integerValue];

      if (!v24) {
        goto LABEL_18;
      }
    }

    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"pver"));
      id v28 = [v27 integerValue];
    }

LABEL_18:
    if (!v28)
    {
      v14 = -[ICPlaybackPositionEntity initWithDomain:]( objc_alloc(&OBJC_CLASS___ICPlaybackPositionEntity),  "initWithDomain:",  self->_domain);
      -[ICPlaybackPositionEntity setPlaybackPositionKey:](v14, "setPlaybackPositionKey:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"bktm"));
      if ((_NSIsNSNumber() & 1) != 0)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"bktm"));
        -[ICPlaybackPositionEntity setBookmarkTime:](v14, "setBookmarkTime:", v31);
      }

      else
      {
        -[ICPlaybackPositionEntity setBookmarkTime:](v14, "setBookmarkTime:", 0LL);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"hbpl"));
      if ((_NSIsNSNumber() & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"hbpl"));
        -[ICPlaybackPositionEntity setHasBeenPlayed:](v14, "setHasBeenPlayed:", v33);
      }

      else
      {
        -[ICPlaybackPositionEntity setHasBeenPlayed:](v14, "setHasBeenPlayed:", 0LL);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"plct"));
      if ((_NSIsNSNumber() & 1) != 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"plct"));
        -[ICPlaybackPositionEntity setUserPlayCount:](v14, "setUserPlayCount:", v35);
      }

      else
      {
        -[ICPlaybackPositionEntity setUserPlayCount:](v14, "setUserPlayCount:", 0LL);
      }

      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"tstm"));
      if ((_NSIsNSNumber() & 1) != 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v11, "objectForKey:", @"tstm"));
        -[ICPlaybackPositionEntity setBookmarkTimestamp:](v14, "setBookmarkTimestamp:", v37);
      }

      else
      {
        -[ICPlaybackPositionEntity setBookmarkTimestamp:](v14, "setBookmarkTimestamp:", 0LL);
      }

- (void).cxx_destruct
{
}

@end