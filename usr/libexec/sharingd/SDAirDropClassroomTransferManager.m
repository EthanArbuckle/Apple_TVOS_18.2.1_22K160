@interface SDAirDropClassroomTransferManager
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (SDAirDropAlertManagerProtocol)alertManager;
- (SDAirDropClassroomTransferManager)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)makeDestinationDirectoryWithIdentifier:(id)a3 error:(id *)a4;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)activate;
- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6;
- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)invalidate;
- (void)replaceIconValue:(id)a3 forKey:(id)a4;
- (void)setAlertManager:(id)a3;
- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6;
@end

@implementation SDAirDropClassroomTransferManager

- (SDAirDropClassroomTransferManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropClassroomTransferManager;
  v2 = -[SDXPCDaemon init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    transferIDToProgress = v2->_transferIDToProgress;
    v2->_transferIDToProgress = v3;
  }

  return v2;
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropClassroomTransferManager;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropClassroomTransferManager;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)makeDestinationDirectoryWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_100115790();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v5 isDirectory:1]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:@"Files" isDirectory:1]);

    NSFileAttributeKey v35 = NSFileProtectionKey;
    NSFileProtectionType v36 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v14 = [v13 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:v12 error:a4];

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = airdrop_log(v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001748EC((uint64_t)a4, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    v24 = v11;

    v25 = v24;
  }

  else
  {
    if (a4)
    {
      id v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6709LL, 0LL));
      *a4 = v26;
    }

    uint64_t v27 = airdrop_log(v7);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100174884((uint64_t)a4, v24, v28, v29, v30, v31, v32, v33);
    }
    v25 = 0LL;
  }

  return v25;
}

- (void)replaceIconValue:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (const __CFData *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v8);
    if ((isKindOfClass & 1) != 0)
    {
      CGImageRef v10 = sub_10008DF74(v7);
      if (v10)
      {
        CGImageRef v11 = v10;
        [v5 setObject:v10 forKeyedSubscript:v6];
        CFRelease(v11);
        goto LABEL_10;
      }

      uint64_t v21 = airdrop_log(0LL);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100174954(v13, v22, v23, v24, v25, v26, v27, v28);
      }
    }

    else
    {
      uint64_t v12 = airdrop_log(isKindOfClass);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100174988(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v48 = a5;
  v47 = (void (**)(id, uint64_t, void *, id))a6;
  CGImageRef v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v11);

  uint64_t v13 = airdrop_log(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    __int16 v60 = 1024;
    int v61 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Update transfer %@ with state %d", buf, 0x12u);
  }

  id v15 = [v48 mutableCopy];
  [v15 setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationSenderIsMeKey];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kSFOperationVerifiableIdentityKey];
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:]( self,  "replaceIconValue:forKey:",  v15,  kSFOperationSmallFileIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:]( self,  "replaceIconValue:forKey:",  v15,  kSFOperationFileIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:]( self,  "replaceIconValue:forKey:",  v15,  kSFOperationSenderIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:]( self,  "replaceIconValue:forKey:",  v15,  kSFOperationReceiverIconKey);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_transferIDToProgress,  "objectForKeyedSubscript:",  v10));
  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  switch(a4)
  {
    case 1LL:
      id v56 = 0LL;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropClassroomTransferManager makeDestinationDirectoryWithIdentifier:error:]( self,  "makeDestinationDirectoryWithIdentifier:error:",  v10,  &v56));
      id v18 = v56;
      [v15 setObject:v17 forKeyedSubscript:kSFOperationReceiverClassroomDestination];
      uint64_t v19 = objc_alloc(&OBJC_CLASS___NSProgress);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByDeletingLastPathComponent]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_initWithFileURL:](v19, "sf_initWithFileURL:", v20));

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_transferIDToProgress,  "setObject:forKeyedSubscript:",  v21,  v10);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_10017414C;
      v53[3] = &unk_1005D0798;
      objc_copyWeak(&v55, (id *)buf);
      v53[4] = self;
      id v22 = v10;
      id v54 = v22;
      [v21 setCancellationHandler:v53];
      [v21 _publish];
      objc_msgSend(v21, "setSf_transferState:", 3);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSFOperationTotalBytesKey]);
      objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v23, "longLongValue"));

      [v21 setCompletedUnitCount:0];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      [v24 askEventForRecordID:v22 withResults:v15];

      objc_destroyWeak(&v55);
      if (!v18) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 2LL:
      NSFileAttributeKey v35 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSFOperationTotalBytesKey]);
      objc_msgSend(v16, "setTotalUnitCount:", objc_msgSend(v35, "longLongValue"));

      NSFileProtectionType v36 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSFOperationBytesCopiedKey]);
      objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v36, "longLongValue"));

      v37 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSFOperationTimeRemainingKey]);
      [v16 setUserInfoObject:v37 forKey:NSProgressEstimatedTimeRemainingKey];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      [v38 progressEventForRecordID:v10 withResults:v15];

      goto LABEL_13;
    case 3LL:
      objc_msgSend(v16, "setSf_transferState:", 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      [v39 cancelEventForRecordID:v10 withResults:v15];
      goto LABEL_12;
    case 4LL:
      v40 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSFOperationErrorKey]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 localizedDescription]);
      objc_msgSend(v16, "sf_failedWithError:", v41);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      [v39 errorEventForRecordID:v10 withResults:v15];
      goto LABEL_12;
    case 5LL:
      objc_msgSend(v16, "setSf_transferState:", 6);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      [v39 finishedEventForRecordID:v10 withResults:v15];
LABEL_12:

      id location = 0LL;
      objc_initWeak(&location, v16);
      dispatch_time_t v42 = sub_100114580(2.0);
      uint64_t v44 = SFMainQueue(v42, v43);
      v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v44);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100174198;
      block[3] = &unk_1005D0798;
      objc_copyWeak(&v51, &location);
      block[4] = self;
      id v50 = v10;
      dispatch_after(v42, v45, block);

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
LABEL_13:
      uint64_t v17 = 0LL;
      id v18 = 0LL;
      uint64_t v34 = 1LL;
      break;
    default:
      NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
      v58 = @"invalid state value";
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v46));

      uint64_t v17 = 0LL;
      uint64_t v21 = v16;
      if (v18)
      {
LABEL_5:
        uint64_t v26 = airdrop_log(v25);
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1001749BC((uint64_t)v18, v27, v28, v29, v30, v31, v32, v33);
        }

        uint64_t v34 = 0LL;
      }

      else
      {
LABEL_15:
        uint64_t v34 = 1LL;
      }

      uint64_t v16 = v21;
      break;
  }

  v47[2](v47, v34, v17, v18);

  objc_destroyWeak((id *)buf);
}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  id v7 = a4;
  uint64_t v8 = airdrop_log(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v10 count];
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Notifying %d clients that transfer %@ was accepted",  buf,  0x12u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100174300;
  v12[3] = &unk_1005D07C0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  -[SDAirDropClassroomTransferManager _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v12);
}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = airdrop_log(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    *(_DWORD *)buf = 67109378;
    unsigned int v16 = [v10 count];
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Notifying %d clients that transfer %@ was declined",  buf,  0x12u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10017448C;
  v12[3] = &unk_1005D07E8;
  v12[4] = self;
  id v13 = v7;
  unint64_t v14 = a5;
  id v11 = v7;
  -[SDAirDropClassroomTransferManager _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v12);
}

- (id)machServiceName
{
  return @"com.apple.sharing.classroom-transfer";
}

- (id)exportedInterface
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SDAirDropClassroomTransferManagerProtocol));
  v6[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v6[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v6[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v6[3] = objc_opt_class(&OBJC_CLASS___NSURL);
  v6[4] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v6[5] = objc_opt_class(&OBJC_CLASS___NSData);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 6LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  [v2 setClasses:v4 forSelector:"updateTransferWithIdentifier:withState:information:completionHandler:" argumentIndex:2 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFAirDropClassroomTransferManagerProtocol);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "connection established %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
  [v8 setClassroomDelegate:self];
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "connection invalidated %@",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  id v9 = [v8 count];

  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
    [v10 setClassroomDelegate:0];
  }
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end