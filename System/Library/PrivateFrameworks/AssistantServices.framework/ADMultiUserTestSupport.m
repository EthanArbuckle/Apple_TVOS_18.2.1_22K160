@interface ADMultiUserTestSupport
+ (id)sharedService;
- (BOOL)hasTestUserSelectionScores;
- (id)_init;
- (id)getClassifiedUser;
- (id)getDebugVoiceIdScores;
- (id)getUserIdentityClassification;
- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6;
@end

@implementation ADMultiUserTestSupport

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADMultiUserTestSupport;
  v2 = -[ADMultiUserTestSupport init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADMultiUserTestSupport", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((AFIsInternalInstall(v12) & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029E14C;
    block[3] = &unk_1004F95C8;
    BOOL v18 = a5;
    block[4] = self;
    id v15 = v11;
    id v16 = v10;
    id v17 = v12;
    dispatch_async(queue, block);
  }

  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0LL);
  }
}

- (id)getDebugVoiceIdScores
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_10029DC6C;
  id v10 = sub_10029DC7C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10029E114;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getClassifiedUser
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_10029DC6C;
  id v12 = sub_10029DC7C;
  id v13 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10029E024;
  v7[3] = &unk_1004FCDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADMultiUserTestSupport getClassifiedUser]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s classifiedUser = %@", buf, 0x16u);
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)getUserIdentityClassification
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_10029DC6C;
  id v13 = sub_10029DC7C;
  id v14 = SAUserIdentityClassificationUnknownValue;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10029DC84;
  v8[3] = &unk_1004FCDB0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v10[5];
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[ADMultiUserTestSupport getUserIdentityClassification]";
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s userIdentityClassification = %@",  buf,  0x16u);
  }

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (BOOL)hasTestUserSelectionScores
{
  int v3 = AFIsInternalInstall(self);
  if (v3) {
    LOBYTE(v3) = self->_scoresBySharedID != 0LL;
  }
  return v3;
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (AFSupportsMultiUser(a1, a2))
  {
    if (qword_100578328 != -1) {
      dispatch_once(&qword_100578328, &stru_1004F95A0);
    }
    id v2 = (id)qword_100578320;
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

@end