@interface DownloadAssetEntity
+ (Class)memoryEntityClass;
+ (id)copyDatabaseDictionaryWithRequestProperties:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4;
+ (void)initialize;
- (BOOL)deleteFromDatabase;
- (NSArray)sinfs;
- (id)copyStoreDownloadKeyCookie;
- (id)copyURLRequestProperties;
@end

@implementation DownloadAssetEntity

+ (id)copyDatabaseDictionaryWithRequestProperties:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 allowedRetryCount]),  @"retry_count");
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [a3 isITunesStoreRequest] ^ 1),  @"is_external");
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 networkServiceType]),  @"service_type");
    [a3 timeoutInterval];
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"timeout_interval");
    id v5 = [a3 HTTPBody];
    if (v5) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"body_data");
    }
    id v6 = [a3 HTTPHeaders];
    if (v6)
    {
      v7 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  0LL);
      if (v7) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"http_headers");
      }
    }

    id v8 = [a3 HTTPMethod];
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"http_method");
    }
    id v9 = [a3 requestParameters];
    if (v9)
    {
      v10 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  0LL);
      if (v10) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"request_parameters");
      }
    }

    id v11 = [a3 URL];
    id v12 = [v11 absoluteString];
    if (v12)
    {
      id v13 = v12;
      id v14 = objc_msgSend(objc_msgSend(v11, "path"), "pathExtension");
      if (v14) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"path_extension");
      }
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"url");
    }
  }

  return v4;
}

+ (id)newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 604800LL),  NSHTTPCookieMaximumAge);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", [a4 host], NSHTTPCookieDomain);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", @"downloadKey", NSHTTPCookieName);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", [a4 path], NSHTTPCookiePath);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", a4, NSHTTPCookieOriginURL);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", a3, NSHTTPCookieValue);
  v7 = -[NSHTTPCookie initWithProperties:](objc_alloc(&OBJC_CLASS___NSHTTPCookie), "initWithProperties:", v6);

  return v7;
}

- (id)copyStoreDownloadKeyCookie
{
  v10[0] = @"download_id";
  v10[1] = @"store_download_key";
  v10[2] = @"asset_type";
  v10[3] = @"url";
  -[DownloadAssetEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v6, v10, 4LL);
  if (!v7 && [v8 isEqualToString:SSDownloadAssetTypeMedia])
  {
    v3 = objc_alloc(&OBJC_CLASS___DownloadEntity);
    v4 = -[DownloadEntity initWithPersistentID:inDatabase:]( v3,  "initWithPersistentID:inDatabase:",  [v6 longLongValue],  -[DownloadAssetEntity database](self, "database"));
    id v7 = -[DownloadEntity valueForProperty:](v4, "valueForProperty:", @"store_download_key");
  }

  id result = 0LL;
  if (v7)
  {
    if (v9) {
      return +[DownloadAssetEntity newDownloadKeyCookieWithValue:URL:]( &OBJC_CLASS___DownloadAssetEntity,  "newDownloadKeyCookieWithValue:URL:",  v7,  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
    }
  }

  return result;
}

- (id)copyURLRequestProperties
{
  v3 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setRequiresExtendedValidationCertificates:]( v3,  "setRequiresExtendedValidationCertificates:",  0LL);
  v42[0] = @"retry_count";
  v42[1] = @"bytes_total";
  v42[2] = @"body_data";
  v42[3] = @"body_data_file_path";
  v42[4] = @"http_headers";
  v42[5] = @"http_method";
  v42[6] = @"is_external";
  v42[7] = @"is_local_cache_server";
  v42[8] = @"service_type";
  v42[9] = @"request_parameters";
  v42[10] = @"timeout_interval";
  v42[11] = @"asset_type";
  v42[12] = @"url";
  -[DownloadAssetEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v31, v42, 13LL);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v3, "setAllowedRetryCount:", [v31 integerValue]);
  -[SSMutableURLRequestProperties setCachePolicy:](v3, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setHTTPMethod:](v3, "setHTTPMethod:", v36);
  -[SSMutableURLRequestProperties setNetworkServiceType:]( v3,  "setNetworkServiceType:",  [v38 integerValue]);
  [v40 doubleValue];
  if (v4 > 2.22044605e-16)
  {
    [v40 doubleValue];
    -[SSMutableURLRequestProperties setTimeoutInterval:](v3, "setTimeoutInterval:");
  }

  if ([v34 length])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    unsigned int v6 = -[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v34);
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    id v8 = v7;
    if (v6)
    {
      if (!v7) {
        id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v9 = [v8 shouldLog];
      else {
        LODWORD(v10) = v9;
      }
      id v11 = (os_log_s *)[v8 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        uint64_t v10 = v10;
      }
      else {
        v10 &= 2u;
      }
      if ((_DWORD)v10)
      {
        int v27 = 138412546;
        uint64_t v28 = objc_opt_class(self);
        __int16 v29 = 2112;
        id v30 = v34;
        uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "[%@] Using HTTPBodyDataFilePath: %@",  &v27,  22);
        if (v12)
        {
          id v13 = (void *)v12;
          id v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
          free(v13);
          v26 = v14;
          SSFileLog(v8, @"%@");
        }
      }

      v15 = objc_alloc(&OBJC_CLASS___NSInputStream);
      v16 = -[NSInputStream initWithFileAtPath:](v15, "initWithFileAtPath:", v34);
      -[SSMutableURLRequestProperties setHTTPBodyStream:](v3, "setHTTPBodyStream:", v16);
    }

    else
    {
      if (!v7) {
        id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v17 = [v8 shouldLog];
      else {
        LODWORD(v18) = v17;
      }
      v19 = (os_log_s *)[v8 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        uint64_t v18 = v18;
      }
      else {
        v18 &= 2u;
      }
      if ((_DWORD)v18)
      {
        int v27 = 138412546;
        uint64_t v28 = objc_opt_class(self);
        __int16 v29 = 2112;
        id v30 = v34;
        uint64_t v20 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  16LL,  "[%@] HTTPBodyDataFilePath is present but does not exist on disk: %@",  &v27,  22);
        if (v20)
        {
          v21 = (void *)v20;
          v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
          free(v21);
          v26 = v22;
          SSFileLog(v8, @"%@");
        }
      }
    }
  }

  else
  {
    -[SSMutableURLRequestProperties setHTTPBody:](v3, "setHTTPBody:", v33);
  }

  unsigned int v23 = objc_msgSend(v37, "BOOLValue", v26);
  if (v23) {
    uint64_t v24 = 2LL;
  }
  else {
    uint64_t v24 = 0LL;
  }
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v3, "setITunesStoreRequest:", v23 ^ 1);
  -[SSMutableURLRequestProperties setURLBagType:](v3, "setURLBagType:", v24);
  if (v35) {
    -[SSMutableURLRequestProperties setHTTPHeaders:]( v3,  "setHTTPHeaders:",  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v35,  0LL,  0LL,  0LL));
  }
  if (v39) {
    -[SSMutableURLRequestProperties setRequestParameters:]( v3,  "setRequestParameters:",  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v39,  0LL,  0LL,  0LL));
  }
  if (v41) {
    -[SSMutableURLRequestProperties setURL:]( v3,  "setURL:",  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
  }
  if (v32) {
    -[SSMutableURLRequestProperties setExpectedContentLength:]( v3,  "setExpectedContentLength:",  [v32 longLongValue]);
  }
  return v3;
}

- (NSArray)sinfs
{
  v11[0] = @"download_id";
  v11[1] = @"sinfs_data";
  v11[2] = @"asset_type";
  -[DownloadAssetEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v8, v11, 3LL);
  if (v9) {
    return (NSArray *)+[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  0LL);
  }
  double v4 = objc_alloc(&OBJC_CLASS___DownloadEntity);
  id v5 = -[DownloadEntity initWithPersistentID:inDatabase:]( v4,  "initWithPersistentID:inDatabase:",  [v8 longLongValue],  -[DownloadAssetEntity database](self, "database"));
  id v6 = -[DownloadEntity copyStoreDownloadMetadata](v5, "copyStoreDownloadMetadata");
  v3 = (NSArray *)[v6 sinfs];

  return v3;
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return [(id)qword_1003A32C8 objectForKey:a3];
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  id result = objc_msgSend((id)qword_1003A32D0, "objectForKey:");
  if (!result) {
    return [(id)qword_1003A32C8 objectForKey:a3];
  }
  return result;
}

+ (id)databaseTable
{
  return @"asset";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id result = objc_msgSend((id)qword_1003A32D8, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___DownloadAssetEntity;
    return objc_msgSendSuper2(&v6, "disambiguatedSQLForProperty:", a3);
  }

  return result;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadAsset);
}

- (BOOL)deleteFromDatabase
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadAssetEntity;
  BOOL v3 = -[DownloadAssetEntity deleteFromDatabase](&v6, "deleteFromDatabase");
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100086ED8;
    v5[3] = &unk_10034CB20;
    v5[4] = self;
    objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyExternalUsingTransactionBlock:",  v5);
  }

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___DownloadAssetEntity) == a1)
  {
    BOOL v3 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  @"IFNULL(asset.local_path, ITSDGetAssetPath(asset.download_id, asset.ROWID))",  @"IFNULL(asset.blocked_reason, 0)",  @"IFNULL(asset.blocked_reason, 0)",  0LL);
    double v4 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"retry_count",  @"asset_order",  @"avfoundation_blocked",  @"bytes_total",  @"destination_url",  @"download_id",  @"download_token",  @"dpinfo_data",  @"uncompressed_size",  @"file_protection",  @"hash_array",  @"hash_type",  @"body_data",  @"body_data_file_path",  @"http_headers",  @"http_method",  @"is_discretionary",  @"is_downloaded",  @"is_drm_free",  @"is_external",  @"is_hls",  @"is_local_cache_server",  @"is_zip_streamable",  @"local_path",  @"service_type",  @"bytes_to_hash",  @"path_extension",  @"processing_types",  @"protection_type",  @"request_parameters",  @"server_guid",  @"sinfs_data",  @"store_flavor",  @"timeout_interval",  @"asset_type",  @"url",  @"video_dimensions",  0LL);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  [a1 disambiguatedSQLForProperty:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)],  *(void *)(*((void *)&v11 + 1) + 8 * (void)i));
        }

        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v6);
    }

    qword_1003A32D8 = (uint64_t)-[NSMutableDictionary copy](v3, "copy");

    id v10 = objc_alloc(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = SSDownloadAssetPropertyLocalPath;
    qword_1003A32C8 = -[NSDictionary initWithObjectsAndKeys:]( v10,  "initWithObjectsAndKeys:",  @"retry_count",  SSDownloadAssetPropertyAllowedRetryCount,  @"bytes_total",  SSDownloadAssetPropertyBytesTotal,  @"destination_url",  SSDownloadAssetPropertyDestinationURL,  @"download_token",  SSDownloadAssetPropertyDownloadToken,  @"dpinfo_data",  SSDownloadAssetPropertyDPInfo,  @"file_protection",  SSDownloadAssetPropertyFileProtectionType,  @"uncompressed_size",  SSDownloadAssetPropertyExpectedDiskSpace,  @"hash_array",  SSDownloadAssetPropertyHashes,  @"hash_type",  SSDownloadAssetPropertyHashType,  @"body_data",  SSDownloadAssetPropertyHTTPBodyData,  @"body_data_file_path",  SSDownloadAssetPropertyHTTPBodyDataFilePath,  @"http_headers",  SSDownloadAssetPropertyHTTPHeaderData,  @"http_method",  SSDownloadAssetPropertyHTTPMethod,  @"initial_odr_size",  SSDownloadAssetPropertyInitialODRSize,  @"is_discretionary",  SSDownloadAssetPropertyIsDiscretionary,  @"is_drm_free",  SSDownloadAssetPropertyIsDRMFree,  @"is_external",  SSDownloadAssetPropertyIsExternal,  @"is_hls",  SSDownloadAssetPropertyIsHLS,  @"is_zip_streamable",  SSDownloadAssetPropertyIsZipStreamable,  @"is_local_cache_server",  SSDownloadAssetPropertyIsLocalCacheServer,  @"bytes_to_hash",  SSDownloadAssetPropertyNumberOfBytesToHash,  @"path_extension",  SSDownloadAssetPropertyPathExtension,  @"processing_types",  SSDownloadAssetPropertyProcessingTypes,  @"request_parameters",
                        SSDownloadAssetPropertyRequestParameterData,
                        @"IFNULL(asset.local_path, ITSDGetAssetPath(asset.download_id, asset.ROWID))",
                        SSDownloadAssetPropertyLocalPath,
                        @"sinfs_data",
                        SSDownloadAssetPropertySINFData,
                        @"store_flavor",
                        SSDownloadAssetPropertyStoreFlavor,
                        @"timeout_interval",
                        SSDownloadAssetPropertyTimeoutInterval,
                        @"asset_type",
                        SSDownloadAssetPropertyType,
                        @"url",
                        SSDownloadAssetPropertyURL,
                        @"video_dimensions");
    qword_1003A32D0 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"local_path",  v9,  0LL);
  }

@end