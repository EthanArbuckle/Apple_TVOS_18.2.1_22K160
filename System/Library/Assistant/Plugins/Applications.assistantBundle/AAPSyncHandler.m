@interface AAPSyncHandler
+ (void)_checkIfResetIsNeededForKey:(id)a3 withStartAnchorString:(id)a4 validity:(id)a5 lastState:(id)a6 completion:(id)a7;
- (AAPSyncHandler)init;
- (id)currentSyncSnapshot;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7 configuration:(id)a8;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)sourceIsReady:(id)a3;
- (void)syncDidEnd;
@end

@implementation AAPSyncHandler

- (AAPSyncHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AAPSyncHandler;
  v2 = -[AAPSyncHandler init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create( -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.state",  @"com.apple.siri.applications"),  "UTF8String"),  0LL);
    v2->_stateQueue = (OS_dispatch_queue *)v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_68FC;
    block[3] = &unk_1C720;
    block[4] = v2;
    dispatch_async(v3, block);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncHandler;
  -[AAPSyncHandler dealloc](&v3, "dealloc");
}

+ (void)_checkIfResetIsNeededForKey:(id)a3 withStartAnchorString:(id)a4 validity:(id)a5 lastState:(id)a6 completion:(id)a7
{
  uint64_t v63 = 0LL;
  id v12 = +[AAPSyncAnchor anchorFromStringRepresentation:error:]( &OBJC_CLASS___AAPSyncAnchor,  "anchorFromStringRepresentation:error:",  a4,  &v63);
  id v13 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  if (v13)
  {
    *(void *)buf = 0LL;
    id v62 = 0LL;
    [v13 getKnowledgeUUID:buf andSequenceNumber:&v62];
    uint64_t v14 = *(void *)buf;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSUUID);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v16 = objc_msgSend(objc_msgSend(*(id *)buf, "UUIDString"), "copy");
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_11270();
      }
      id v16 = 0LL;
    }

    id v26 = v62;
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      id v25 = +[AAPSyncPrimitiveAnchor anchorFromIndex:]( AAPSyncPrimitiveAnchor,  "anchorFromIndex:",  [v62 unsignedIntegerValue]);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_11204();
      }
      id v25 = 0LL;
    }
  }

  else
  {
    v17 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_11194(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    id v25 = 0LL;
    id v16 = 0LL;
  }

  if (([@"com.apple.siri.applications" isEqualToString:a3] & 1) == 0)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"wrong syncKey",  @"expecting %@",  @"com.apple.siri.applications");
    goto LABEL_42;
  }

  if (a4 && !v12)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_11128();
    }
    goto LABEL_42;
  }

  if (!v16
    || !objc_msgSend(v16, "isEqualToString:", objc_msgSend(a6, "validity"))
    || ![v16 isEqualToString:a5])
  {
    v59 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
    {
      id v61 = [a6 validity];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
      __int16 v65 = 2114;
      id v66 = v16;
      __int16 v67 = 2114;
      id v68 = v61;
      __int16 v69 = 2114;
      id v70 = a5;
      v56 = "%s com.apple.siri.applications: validity check failed: MI-'%{public}@' Internal-'%{public}@' Sync-'%{public}@'";
      v57 = v59;
      uint32_t v58 = 42;
      goto LABEL_47;
    }

- (id)currentSyncSnapshot
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_6F8C;
  v10 = sub_6F9C;
  uint64_t v11 = 0LL;
  stateQueue = self->_stateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_6FA8;
  v5[3] = &unk_1C770;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7 configuration:(id)a8
{
  stateQueue = self->_stateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_71B4;
  v9[3] = &unk_1C7C0;
  v9[4] = self;
  v9[5] = a6;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a7;
  v9[9] = a8;
  dispatch_sync((dispatch_queue_t)stateQueue, v9);
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v19 = 0LL;
  id v7 = +[AAPSyncAnchor anchorFromStringRepresentation:error:]( &OBJC_CLASS___AAPSyncAnchor,  "anchorFromStringRepresentation:error:",  a3,  &v19);
  id v8 = v7;
  if (a3 && !v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_11450();
    }
LABEL_5:
    [a4 setPostAnchor:a3];
    return;
  }

  processor = self->_processor;
  if (!processor)
  {
    source = self->_source;
    uint64_t v11 = (os_log_s *)AFSiriLogContextPlugin;
    if (source)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_113E0(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[AAPSyncHandler getChangeAfterAnchor:changeInfo:]";
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: nothing to do - terminating sync",  buf,  0xCu);
    }

    goto LABEL_5;
  }

  -[AAPSyncMetaDataProcessor processNextChange:afterAnchor:](processor, "processNextChange:afterAnchor:", a4, v8);
}

- (void)syncDidEnd
{
  v2 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[AAPSyncHandler syncDidEnd]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: sync did end", (uint8_t *)&v3, 0xCu);
  }

- (void)sourceIsReady:(id)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_78D8;
  v4[3] = &unk_1C7E8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async((dispatch_queue_t)stateQueue, v4);
}

@end