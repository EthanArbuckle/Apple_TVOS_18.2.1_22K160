@interface HSModel
- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7;
- (HSModel)init;
- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation HSModel

- (HSModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HSModel;
  v2 = -[HSModel init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater.HSQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011A4C;
  block[3] = &unk_10002D598;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7
{
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v15 = "valid";
  if (!a6) {
    v15 = "NULL";
  }
  NSLog( @"getHSModelForEngineMajorVersion: majorVersion=%lu minorVersion=%lu numHSModels=%lu buffer=%s length=%zu\n",  a3,  a4,  a5,  v15,  a7);
  if (!a6)
  {
    NSLog(@"Empty buffer\n", v33);
    goto LABEL_40;
  }

  v39 = v14;
  v40 = v13;
  unint64_t v36 = a3;
  unint64_t v37 = a4;
  v35 = self;
  unint64_t v38 = a5;
  if (a5)
  {
    if (a7 >= 4)
    {
      uint64_t v16 = 0LL;
      v17 = 0LL;
      v18 = 0LL;
      v19 = 0LL;
      LODWORD(a5) = 0;
      int v20 = 0;
      while (1)
      {
        unsigned int v21 = a6[v16];
        if (v21 >= 2)
        {
          NSLog(@"Unexpected modelType = 0x%x\n", a6[v16], v34);
          goto LABEL_31;
        }

        uint64_t v22 = (v20 + 2);
        unint64_t v23 = a6[v20 + 1];
        if (a7 - v22 <= v23)
        {
          NSLog(@"Bad buffer: remaining bytes %lu is less than localeCodeLen %d\n", a7 - v22, v23);
          goto LABEL_31;
        }

        if (v19) {

        }
        v19 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &a6[v22],  v23,  4LL);
        if (!v19)
        {
          NSLog(@"Failed to create localeCode\n");

          goto LABEL_36;
        }

        int v24 = v22 + v23;
        uint64_t v25 = (v22 + v23 + 1);
        unint64_t v26 = a6[v24];
        if (a7 - v25 < v26)
        {
          NSLog(@"Bad buffer: remaining bytes %lu is less than hashLen %d\n", a7 - v25, v26);
          goto LABEL_31;
        }

        if (v18) {

        }
        v27 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &a6[v25],  v26,  4LL);
        if (!v27)
        {
          NSLog(@"Failed to create hash\n");

          goto LABEL_35;
        }

        v18 = v27;
        if (v17) {

        }
        uint64_t v42 = 0LL;
        v43 = &v42;
        uint64_t v44 = 0x2050000000LL;
        v28 = (void *)qword_10003DEC8;
        uint64_t v45 = qword_10003DEC8;
        if (!qword_10003DEC8)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_1000122EC;
          v41[3] = &unk_10002D9A0;
          v41[4] = &v42;
          sub_1000122EC((uint64_t)v41);
          v28 = (void *)v43[3];
        }

        v29 = v28;
        _Block_object_dispose(&v42, 8);
        id v30 = [[v29 alloc] initWithData:0 hash:v18 locale:v19 digest:0 signature:0 certificate:0];
        if (!v30) {
          break;
        }
        v17 = v30;
        v31 = v40;
        if (v21) {
          v31 = v39;
        }
        [v31 addObject:v17];
        uint64_t v16 = (v25 + v26);
        a5 = (a5 + 1);
        int v20 = v25 + v26;
      }

      NSLog(@"Failed to create CSVoiceTriggerRTModel asset\n");
      goto LABEL_34;
    }

    NSLog(@"Invalid length=%zu\n", a7);
LABEL_40:
    LOBYTE(v19) = 0;
    goto LABEL_26;
  }

  v19 = 0LL;
  v18 = 0LL;
  v17 = 0LL;
LABEL_24:
  if (a5 == v38)
  {
    v13 = v40;
    v14 = v39;
    NSLog( @"Requesting HSModel: majorVersion=%lu minorVersion=%lu assetCount=%d downloaded[%lu] preInstalled[%lu], on Queue: %@\n",  v36,  v37,  a5,  [v40 count],  objc_msgSend(v39, "count"),  v35->_queue);
    -[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]( v35,  "scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:",  v36,  v37,  v40,  v39);

    LOBYTE(v19) = 1;
    goto LABEL_26;
  }

  NSLog(@"assetCount %u != numHSModels %lu\n", a5, v38);
LABEL_31:

LABEL_34:
LABEL_35:

  LOBYTE(v19) = 0;
LABEL_36:
  v14 = v39;
  v13 = v40;
LABEL_26:

  return (char)v19;
}

- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->delegate)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100011FF0;
    v15[3] = &unk_10002D978;
    v15[4] = self;
    v12 = objc_retainBlock(v15);
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2050000000LL;
    v13 = (void *)qword_10003DED8;
    uint64_t v19 = qword_10003DED8;
    if (!qword_10003DED8)
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      unsigned int v21 = sub_1000123EC;
      uint64_t v22 = &unk_10002D9A0;
      unint64_t v23 = &v16;
      sub_1000123EC((uint64_t)&buf);
      v13 = (void *)v17[3];
    }

    id v14 = v13;
    _Block_object_dispose(&v16, 8);
    [v14 voiceTriggerRTModelForVersion:a3 minorVersion:a4 downloadedModels:v10 preinstalledModels:v11 completion:v12];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: delegate is nil",  (uint8_t *)&buf,  0xCu);
  }
}

- (void).cxx_destruct
{
}

@end