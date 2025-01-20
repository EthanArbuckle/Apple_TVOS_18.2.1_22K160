@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  char HasEntitlement = BRLTSConnectionHasEntitlement();
  uint64_t v6 = BRLTLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((HasEntitlement & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 auditSessionIdentifier]));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 processIdentifier]));
      int v14 = 138412802;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Accepting connection from client. auditID:%@ pid:%@, connection:%@",  (uint8_t *)&v14,  0x20u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTSTranslationService exportedInterface]( &OBJC_CLASS___BRLTSTranslationService,  "exportedInterface"));
    [v4 setExportedInterface:v11];

    id v12 = objc_alloc_init(&OBJC_CLASS___BRLTSTranslationService);
    [v4 setExportedObject:v12];

    [v4 resume];
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100003938(v4, v8);
    }
  }

  return HasEntitlement;
}

@end