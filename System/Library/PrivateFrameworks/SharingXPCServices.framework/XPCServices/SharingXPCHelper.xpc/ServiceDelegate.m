@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)whitelistedDownloadsFolderRealPath;
- (void)setWhitelistedDownloadsFolderRealPath:(id)a3;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sharingXPCHelperLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100008940((uint64_t)v5, (uint64_t)v6, v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.private.sharing.XPCHelperAccess"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v9, v10) & 1) != 0 && ([v9 BOOLValue])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SharingXPCHelperProtocol));
    [v6 setExportedInterface:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___SharingXPCHelperGroupContactIcon);
    v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v13,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v12 setClasses:v15 forSelector:"groupMonogramImageDataForContactsSync:style:diameter:monogramsAsFlatImages:replyHandler:" argumentIndex:0 ofReply:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___SharingXPCHelperContactIcon);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v17,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v16 setClasses:v19 forSelector:"monogramImagesForMultipleContactsSync:style:diameter:monogramAsFlatImages:replyHandler:" argumentIndex:0 ofReply:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    v21 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___UISUIActivityViewControllerConfiguration));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v20 setClasses:v22 forSelector:"updateShareSheetHostConfiguration:" argumentIndex:0 ofReply:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
    v25 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v24,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v23 setClasses:v26 forSelector:"setSessionKeepAliveTransactionIdentifier:" argumentIndex:0 ofReply:0];

    v27 = objc_opt_new(&OBJC_CLASS___SharingXPCHelper);
    [v6 setExportedObject:v27];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10000508C;
    v35[3] = &unk_10000C2D0;
    v28 = v27;
    v36 = v28;
    [v6 setInvalidationHandler:v35];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000050D4;
    v33[3] = &unk_10000C2D0;
    v34 = v28;
    v29 = v28;
    [v6 setInterruptionHandler:v33];
    [v6 resume];

    BOOL v30 = 1;
  }

  else
  {
    uint64_t v31 = sharingXPCHelperLog();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v38 = [v6 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "process %d tried to connect to SharingXPCHelper, but it was not entitled!",  buf,  8u);
    }

    BOOL v30 = 0;
  }

  return v30;
}

- (NSString)whitelistedDownloadsFolderRealPath
{
  return self->_whitelistedDownloadsFolderRealPath;
}

- (void)setWhitelistedDownloadsFolderRealPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end