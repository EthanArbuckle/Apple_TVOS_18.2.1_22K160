@interface ADVocabDonationBridge
+ (BOOL)_bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 error:(id *)a6;
+ (BOOL)bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 error:(id *)a6;
+ (BOOL)bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 forUserId:(id)a6 deviceId:(id)a7 error:(id *)a8;
+ (void)bulkDonateHomeMemberInfo:(id)a3;
- (BOOL)addToStream:(id)a3 error:(id *)a4;
- (BOOL)finishStream:(id *)a3;
- (id)_convertHomeMememberInfoToKVItems:(id)a3 error:(id *)a4;
- (id)_convertObjectToItems:(id)a3 error:(id *)a4;
- (id)_createStreamWithDonator:(id)a3 error:(id *)a4;
- (id)_initForStreamingWithAppId:(id)a3 itemClass:(Class)a4 error:(id *)a5;
- (id)_initForStreamingWithItemMapper:(id)a3 stream:(id)a4 error:(id *)a5;
- (id)initForStreamingWithAppId:(id)a3 itemClass:(Class)a4 userId:(id)a5 deviceId:(id)a6 error:(id *)a7;
- (void)cancelStream;
@end

@implementation ADVocabDonationBridge

- (id)initForStreamingWithAppId:(id)a3 itemClass:(Class)a4 userId:(id)a5 deviceId:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315394;
    v24 = "-[ADVocabDonationBridge initForStreamingWithAppId:itemClass:userId:deviceId:error:]";
    __int16 v25 = 2112;
    Class v26 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Starting streaming vocab donation for: %@.",  (uint8_t *)&v23,  0x16u);
  }

  v16 = -[KVItemMapper initWithObjectClass:error:]( objc_alloc(&OBJC_CLASS___KVItemMapper),  "initWithObjectClass:error:",  a4,  a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[KVDonator donatorWithItemType:originAppId:deviceId:userId:error:]( &OBJC_CLASS___KVDonator,  "donatorWithItemType:originAppId:deviceId:userId:error:",  -[KVItemMapper targetItemType](v16, "targetItemType"),  v12,  v14,  v13,  a7));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[ADVocabDonationBridge _createStreamWithDonator:error:]( self,  "_createStreamWithDonator:error:",  v17,  a7));
    self = (ADVocabDonationBridge *) -[ADVocabDonationBridge _initForStreamingWithItemMapper:stream:error:]( self,  "_initForStreamingWithItemMapper:stream:error:",  v16,  v18,  a7);

    v19 = self;
  }

  else
  {
    v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)*a7;
      int v23 = 136315394;
      v24 = "-[ADVocabDonationBridge initForStreamingWithAppId:itemClass:userId:deviceId:error:]";
      __int16 v25 = 2112;
      Class v26 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Donator is nil bailing: %@.",  (uint8_t *)&v23,  0x16u);
    }

    v19 = 0LL;
  }

  return v19;
}

- (id)_initForStreamingWithAppId:(id)a3 itemClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = -[KVItemMapper initWithObjectClass:error:]( objc_alloc(&OBJC_CLASS___KVItemMapper),  "initWithObjectClass:error:",  a4,  a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[KVDonator donatorWithItemType:originAppId:error:]( &OBJC_CLASS___KVDonator,  "donatorWithItemType:originAppId:error:",  -[KVItemMapper targetItemType](v9, "targetItemType"),  v8,  a5));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADVocabDonationBridge _createStreamWithDonator:error:]( self,  "_createStreamWithDonator:error:",  v10,  a5));
    self = (ADVocabDonationBridge *) -[ADVocabDonationBridge _initForStreamingWithItemMapper:stream:error:]( self,  "_initForStreamingWithItemMapper:stream:error:",  v9,  v11,  a5);

    id v12 = self;
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v14 = *a5;
      int v16 = 136315394;
      v17 = "-[ADVocabDonationBridge _initForStreamingWithAppId:itemClass:error:]";
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Donator is nil bailing: %@.",  (uint8_t *)&v16,  0x16u);
    }

    id v12 = 0LL;
  }

  return v12;
}

- (id)_initForStreamingWithItemMapper:(id)a3 stream:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  v11 = 0LL;
  if (v8 && v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___ADVocabDonationBridge;
    id v12 = -[ADVocabDonationBridge init](&v15, "init");
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_itemMapper, a3);
      objc_storeStrong(p_isa + 1, a4);
    }

    self = p_isa;
    v11 = self;
  }

  return v11;
}

- (BOOL)addToStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_10013FDD4;
  objc_super v15 = sub_10013FDE4;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10013FF6C;
  v10[3] = &unk_1004F2BC8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  [v6 enumerateObjectsUsingBlock:v10];
  if (a4)
  {
    v7 = (void *)v12[5];
    if (v7) {
      *a4 = v7;
    }
  }

  char v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)cancelStream
{
}

- (BOOL)finishStream:(id *)a3
{
  if (!self->_stream)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:self file:@"ADVocabDonationBridge.m" lineNumber:214 description:@"Stream can never be nil. A nil stream will cause the semaphore to wait forever."];
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10013FDD4;
  char v20 = sub_10013FDE4;
  id v21 = 0LL;
  stream = self->_stream;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10013FF20;
  v13[3] = &unk_1004F2BF0;
  objc_super v15 = &v16;
  v7 = v5;
  id v14 = v7;
  -[KVFullDatasetStream finish:](stream, "finish:", v13);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = (void *)v17[5];
  if (a3 && v8)
  {
    *a3 = v8;
    char v8 = (void *)v17[5];
  }

  BOOL v9 = v8 == 0LL;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_convertHomeMememberInfoToKVItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserId]);
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v6 homeMemberSettings]);

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 meCard]);
  if (v9 && v7)
  {
    uint64_t v10 = KVFieldTypeToNumber(71LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v18 = v11;
    uint64_t v19 = v7;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[KVItemMapper mapObject:additionalFields:error:]( self->_itemMapper,  "mapObject:additionalFields:error:",  v9,  v12,  a4));
  }

  else
  {
    if (v7 != (void *)AFMultiUserDefaultSharedUserId)
    {
      id v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = @"NO";
        id v21 = "-[ADVocabDonationBridge _convertHomeMememberInfoToKVItems:error:]";
        if (v9) {
          uint64_t v17 = @"NO";
        }
        else {
          uint64_t v17 = @"YES";
        }
        *(_DWORD *)buf = 136315650;
        int v23 = v17;
        __int16 v22 = 2112;
        if (!v7) {
          uint64_t v16 = @"YES";
        }
        __int16 v24 = 2112;
        __int16 v25 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Unable to convert homeMember the following is nil: meCard %@, sharedUserId: %@",  buf,  0x20u);
      }
    }

    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)_convertObjectToItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SAHomeMemberInfo);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[ADVocabDonationBridge _convertHomeMememberInfoToKVItems:error:]( self,  "_convertHomeMememberInfoToKVItems:error:",  v6,  a4));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[KVItemMapper mapObject:error:](self->_itemMapper, "mapObject:error:", v6, a4));
  }
  BOOL v9 = (void *)v8;

  return v9;
}

- (id)_createStreamWithDonator:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:self file:@"ADVocabDonationBridge.m" lineNumber:268 description:@"Donator can never be nil. A nil donator will cause the semaphore to wait forever."];
  }

  uint64_t v23 = 0LL;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  Class v26 = sub_10013FDD4;
  v27 = sub_10013FDE4;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  char v20 = sub_10013FDD4;
  id v21 = sub_10013FDE4;
  id v22 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10013FDEC;
  v13[3] = &unk_1004F2C18;
  objc_super v15 = &v17;
  uint64_t v16 = &v23;
  uint64_t v8 = dispatch_semaphore_create(0LL);
  id v14 = v8;
  [v7 donateWithOptions:0 usingStream:v13];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    BOOL v9 = (void *)v18[5];
    if (v9) {
      *a4 = v9;
    }
  }

  id v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (void).cxx_destruct
{
}

+ (void)bulkDonateHomeMemberInfo:(id)a3
{
  id v4 = a3;
  if (qword_100577F18 != -1) {
    dispatch_once(&qword_100577F18, &stru_1004F2C38);
  }
  dispatch_semaphore_t v5 = (dispatch_queue_s *)qword_100577F10;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100140560;
  v7[3] = &unk_1004FD0A0;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (BOOL)bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 forUserId:(id)a6 deviceId:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    uint64_t v23 = "+[ADVocabDonationBridge bulkDonate:withAppId:itemClass:forUserId:deviceId:error:]";
    __int16 v24 = 2112;
    Class v25 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Starting bulk vocab donation for: %@.",  (uint8_t *)&v22,  0x16u);
  }

  id v18 = -[ADVocabDonationBridge initForStreamingWithAppId:itemClass:userId:deviceId:error:]( objc_alloc(&OBJC_CLASS___ADVocabDonationBridge),  "initForStreamingWithAppId:itemClass:userId:deviceId:error:",  v14,  a5,  v15,  v16,  a8);
  uint64_t v19 = v18;
  else {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

+ (BOOL)bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    id v16 = "+[ADVocabDonationBridge bulkDonate:withAppId:itemClass:error:]";
    __int16 v17 = 2112;
    Class v18 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Starting bulk vocab donation for: %@.",  (uint8_t *)&v15,  0x16u);
  }

  unsigned __int8 v13 = [a1 _bulkDonate:v10 withAppId:v11 itemClass:a5 error:a6];

  return v13;
}

+ (BOOL)_bulkDonate:(id)a3 withAppId:(id)a4 itemClass:(Class)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = -[ADVocabDonationBridge _initForStreamingWithAppId:itemClass:error:]( objc_alloc(&OBJC_CLASS___ADVocabDonationBridge),  "_initForStreamingWithAppId:itemClass:error:",  v10,  a5,  a6);

  else {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

@end