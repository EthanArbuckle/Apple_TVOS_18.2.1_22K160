@interface CSDFileTransferController
+ (id)copyFileAtURL:(id)a3 toTemporaryFileWithName:(id)a4;
+ (id)renameResourceAtURL:(id)a3 toResourceWithName:(id)a4;
+ (id)renamedResourceURL:(id)a3 withName:(id)a4;
+ (void)deleteContentsAtURL:(id)a3;
- (CSDFileTransferController)init;
- (CSDFileTransferController)initWithService:(id)a3;
- (CSDFileTransferringDelegate)delegate;
- (CSDIDSService)service;
- (NSMutableDictionary)clientFileURLByIdentifier;
- (NSMutableDictionary)temporaryFileURLByClientFileURL;
- (OS_dispatch_queue)queue;
- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3;
- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setService:(id)a3;
- (void)transferFileAtSandboxExtendedURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6;
- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6;
- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5;
- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4;
- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4;
@end

@implementation CSDFileTransferController

- (CSDFileTransferController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeLivePhotosIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeLivePhotosIDSService,  "sharedInstance"));
  v4 = -[CSDFileTransferController initWithService:](self, "initWithService:", v3);

  return v4;
}

- (CSDFileTransferController)initWithService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDFileTransferController;
  v6 = -[CSDFileTransferController init](&v14, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clientFileURLByIdentifier = v6->_clientFileURLByIdentifier;
    v6->_clientFileURLByIdentifier = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    temporaryFileURLByClientFileURL = v6->_temporaryFileURLByClientFileURL;
    v6->_temporaryFileURLByClientFileURL = v9;

    objc_storeStrong((id *)&v6->_service, a3);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.csdfiletransfercontroller", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    -[CSDIDSService addServiceDelegate:queue:](v6->_service, "addServiceDelegate:queue:", v6, v6->_queue);
  }

  return v6;
}

- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "transferFileAtURL: %@, destinations: %@",  buf,  0x16u);
  }

  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100091318;
  v17[3] = &unk_1003D7B28;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)transferFileAtSandboxExtendedURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091434;
  block[3] = &unk_1003D7B00;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByDeletingLastPathComponent]);
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "placing unzip results into folder %@",  buf,  0xCu);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000915E4;
  v15[3] = &unk_1003D8488;
  v15[4] = self;
  id v16 = v6;
  id v17 = v8;
  id v18 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v6;
  dispatch_async(v11, v15);
}

- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "temporaryClientFileURL: %@, destinations: %@",  buf,  0x16u);
  }

  buf[0] = 0;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  unsigned int v19 = [v17 fileExistsAtPath:v18 isDirectory:buf];

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", buf[0]));
    [v20 setObject:v21 forKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"];

    [v20 setObject:v12 forKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100091BC4;
    v30[3] = &unk_1003D8E90;
    id v31 = v11;
    id v22 = v20;
    id v32 = v22;
    id v33 = v13;
    v34 = self;
    id v23 = v10;
    id v35 = v23;
    id v24 = objc_retainBlock(v30);
    v25 = v24;
    if (buf[0])
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100091E20;
      v27[3] = &unk_1003D8EB8;
      v27[4] = self;
      id v28 = v23;
      id v29 = v25;
      -[CSDFileTransferController zipDirectoryAtURL:completion:](self, "zipDirectoryAtURL:completion:", v28, v27);
    }

    else
    {
      ((void (*)(void *, id))v24[2])(v24, v23);
    }
  }

  else
  {
    id v26 = sub_1001704C4();
    id v22 = (id)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_1002B4398();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412802;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "incomingResourceURL: %@ metadata: %@ fromID: %@",  (uint8_t *)&v28,  0x20u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"]);
  id v18 = [v17 BOOLValue];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"]);
  id v21 = (void *)objc_opt_class(self, v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
  id v24 = [v21 copyFileAtURL:v11 toTemporaryFileWithName:v23];

  if (v24)
  {
    id v25 = sub_1001704C4();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Copied resource to temporary URL: %@",  (uint8_t *)&v28,  0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController delegate](self, "delegate"));
    [v27 fileTransferer:self didReceiveResourcesAtURL:v24 withMetadata:v19 isZipped:v18 fromIDSDestination:v13];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v16);

  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  unsigned int v19 = v18;
  if (v8)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "successfully sent file with identifier: %@",  (uint8_t *)&v27,  0xCu);
    }
  }

  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    sub_1002B4474();
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController clientFileURLByIdentifier](self, "clientFileURLByIdentifier"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v14]);

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController delegate](self, "delegate"));
    [v22 fileTransferer:self didTransferFileAtURL:v21 successfully:v8];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController clientFileURLByIdentifier](self, "clientFileURLByIdentifier"));
    [v23 setObject:0 forKeyedSubscript:v14];

    -[CSDFileTransferController cleanUpTemporaryFileIfExistsForClientFileURL:]( self,  "cleanUpTemporaryFileIfExistsForClientFileURL:",  v21);
  }

  else
  {
    id v24 = sub_1001704C4();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController clientFileURLByIdentifier](self, "clientFileURLByIdentifier"));
      int v27 = 138413570;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 1024;
      BOOL v34 = v8;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      __int16 v38 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unexpected nil clientFileURL for service: %@, account: %@, identifier: %@, didSendWithSuccess: %d, error: %@, clientFileURLByIdentifier: %@",  (uint8_t *)&v27,  0x3Au);
    }
  }
}

+ (id)copyFileAtURL:(id)a3 toTemporaryFileWithName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = NSTemporaryDirectory();
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v26 = 0LL;
  LODWORD(v9) = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v14 = v26;

  if (!(_DWORD)v9)
  {
    id v20 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1002B44D4();
    }
    id v15 = 0LL;
    id v18 = v14;
    goto LABEL_9;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v6]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v25 = v14;
  unsigned __int8 v17 = [v16 copyItemAtURL:v5 toURL:v15 error:&v25];
  id v18 = v25;

  if ((v17 & 1) == 0)
  {
    id v22 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v5;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to copy URL at %@ to %@: %@",  buf,  0x20u);
    }

+ (id)renameResourceAtURL:(id)a3 toResourceWithName:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 renamedResourceURL:v6 withName:a4]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = 0LL;
  unsigned __int8 v9 = [v8 moveItemAtURL:v6 toURL:v7 error:&v14];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error moving url %@ to %@: %@",  buf,  0x20u);
    }

    id v7 = 0LL;
  }

  return v7;
}

+ (id)renamedResourceURL:(id)a3 withName:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 pathComponents]);
  id v7 = [v6 mutableCopy];

  [v7 removeLastObject];
  [v7 addObject:v5];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v7));
  return v8;
}

+ (void)deleteContentsAtURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned int v5 = [v4 removeItemAtURL:v3 error:&v10];
  id v6 = v10;

  id v7 = sub_1001704C4();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleted contents at URL: %@", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1002B4534();
  }
}

- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  unsigned __int8 v9 = NSTemporaryDirectory();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v12]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathExtension:@"zip"]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14));
  id v16 = sub_1001704C4();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Zipping directory at URL: %@, output to: %@",  buf,  0x16u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100092A24;
  v21[3] = &unk_1003D7E18;
  id v22 = v6;
  id v23 = v15;
  id v24 = v7;
  id v18 = v7;
  id v19 = v15;
  id v20 = v6;
  -[CSDFileTransferController performFileCopierOperation:onInputURL:outputURL:completion:]( self,  "performFileCopierOperation:onInputURL:outputURL:completion:",  0LL,  v20,  v19,  v21);
}

- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v28 = a3;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "operation: %ld, inputURL: %@, outputURL: %@",  buf,  0x20u);
  }

  id v16 = objc_alloc(&OBJC_CLASS___IMFileCopier);
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  unint64_t v26 = a3;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFileTransferController queue]( self,  "queue",  _NSConcreteStackBlock,  3221225472LL,  sub_100092C4C,  &unk_1003D8EE0));
  id v21 = [v16 initWithInputURL:v19 outputURL:v18 identifier:0 operation:a3 completionBlock:&v22 queue:v20];

  [v21 start];
}

- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFileTransferController temporaryFileURLByClientFileURL](self, "temporaryFileURLByClientFileURL"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  if (v7)
  {
    id v8 = sub_1001704C4();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "deleting temporary file at URL: %@",  (uint8_t *)&v12,  0xCu);
    }

    objc_msgSend((id)objc_opt_class(self, v10), "deleteContentsAtURL:", v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFileTransferController temporaryFileURLByClientFileURL]( self,  "temporaryFileURLByClientFileURL"));
    [v11 setObject:0 forKeyedSubscript:v4];
  }
}

- (CSDFileTransferringDelegate)delegate
{
  return (CSDFileTransferringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)clientFileURLByIdentifier
{
  return self->_clientFileURLByIdentifier;
}

- (NSMutableDictionary)temporaryFileURLByClientFileURL
{
  return self->_temporaryFileURLByClientFileURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

@end