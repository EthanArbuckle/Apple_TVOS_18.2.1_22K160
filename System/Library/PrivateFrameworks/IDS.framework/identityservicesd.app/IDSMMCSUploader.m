@interface IDSMMCSUploader
- (IDSMMCSUploader)initWithEncryptionController:(id)a3 transferServicesController:(id)a4;
- (id)pinnedIdentityController;
- (id)uploadData:(id)a3 fromID:(id)a4 toEndpoint:(id)a5 onTopic:(id)a6 forGUID:(id)a7 encryptionType:(unint64_t)a8;
@end

@implementation IDSMMCSUploader

- (id)pinnedIdentityController
{
  return +[IDSPinnedIdentityController sharedInstance](&OBJC_CLASS___IDSPinnedIdentityController, "sharedInstance");
}

- (IDSMMCSUploader)initWithEncryptionController:(id)a3 transferServicesController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSMMCSUploader;
  v9 = -[IDSMMCSUploader init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionController, a3);
    objc_storeStrong((id *)&v10->_transferServicesController, a4);
  }

  return v10;
}

- (id)uploadData:(id)a3 fromID:(id)a4 toEndpoint:(id)a5 onTopic:(id)a6 forGUID:(id)a7 encryptionType:(unint64_t)a8
{
  id v14 = a3;
  id v34 = a4;
  id v35 = a5;
  id v36 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _randomTemporaryPathWithSuffix:0]);

  if (!v18)
  {
    _IMWarn(@"Failed to create temporary directory");
LABEL_11:
    v28 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Failed uploading attachment file transfer (could not generate file)",  NSLocalizedDescriptionKey,  0LL);
    v29 = objc_alloc(&OBJC_CLASS___NSError);
    v30 = -[NSError initWithDomain:code:userInfo:](v29, "initWithDomain:code:userInfo:", IDSSendErrorDomain, 4LL, v28);
    [v16 failWithError:v30];

    goto LABEL_12;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);
  id v46 = 0LL;
  unsigned int v20 = [v19 writeToFile:v18 options:1 error:&v46];
  id v21 = v46;

  if (!v20)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);
    _IMWarn(@"Failed to write wrapped data { error: %@, randomFileName: %@, data: %@ }");

    goto LABEL_11;
  }

  uint64_t v22 = OSLogHandleForIDSCategory("Attachments");
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "    Wrote data to path: %@", buf, 0xCu);
  }

  transferServicesController = self->_transferServicesController;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByResolvingAndStandardizingPath]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUIDForObject:](&OBJC_CLASS___NSString, "stringGUIDForObject:", v18));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10034C1B8;
  v37[3] = &unk_100901C40;
  v38 = (NSDictionary *)v35;
  id v39 = v15;
  unint64_t v45 = a8;
  id v40 = v34;
  id v41 = v36;
  v42 = self;
  id v43 = v18;
  id v44 = v16;
  -[IDSTransferServicesController sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:]( transferServicesController,  "sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:",  v26,  v41,  0LL,  v27,  0LL,  &stru_100901BF0,  v37);

  v28 = v38;
LABEL_12:

  v31 = (void *)objc_claimAutoreleasedReturnValue([v16 promise]);
  return v31;
}

- (void).cxx_destruct
{
}

@end