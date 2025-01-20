@interface AMFIService
- (BOOL)verifyBoolEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (void)commitProfileForUuid:(id)a3 withReply:(id)a4;
- (void)getSEPStateWithReply:(id)a3;
- (void)getStagedProfileWithReply:(id)a3;
- (void)initiateDataMigrationWithReply:(id)a3;
- (void)initiateDeveloperModeDaemonsWithReply:(id)a3;
- (void)removeManagedStateWithReply:(id)a3;
- (void)removeTrustforUuid:(id)a3 withReply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDemoState:(unsigned int)a3 withReply:(id)a4;
- (void)setManagedState:(id)a3 withReply:(id)a4;
- (void)setSupervisedState:(unsigned int)a3 withReply:(id)a4;
- (void)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5 withReply:(id)a6;
- (void)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withReply:(id)a6;
- (void)stageProfileForUuid:(id)a3 withReply:(id)a4;
@end

@implementation AMFIService

- (BOOL)verifyBoolEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMFIService connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v4]);

  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014D9C();
    }
    goto LABEL_8;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014E08();
    }
LABEL_8:
    unsigned __int8 v8 = 0;
    goto LABEL_9;
  }

  unsigned __int8 v8 = [v6 BOOLValue];
LABEL_9:

  return v8;
}

- (void)getSEPStateWithReply:(id)a3
{
  LOBYTE(v6) = 0;
  v3 = (void (**)(id, _OWORD *, id))a3;
  id v4 = objc_msgSend( [AMFIError alloc],  "initWithAMFIErrorCode:withURL:",  -409,  0,  (unsigned __int128)0,  (unsigned __int128)0,  (unsigned __int128)0,  v6);
  v3[2](v3, &v5, v4);
}

- (void)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withReply:(id)a6
{
  uint64_t v6 = (void (**)(id, void, id))a6;
  id v7 = [[AMFIError alloc] initWithAMFIErrorCode:-409 withURL:0];
  v6[2](v6, 0LL, v7);
}

- (void)setSupervisedState:(unsigned int)a3 withReply:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = [[AMFIError alloc] initWithAMFIErrorCode:-409 withURL:0];
  v4[2](v4, v5);
}

- (void)setDemoState:(unsigned int)a3 withReply:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = [[AMFIError alloc] initWithAMFIErrorCode:-409 withURL:0];
  v4[2](v4, v5);
}

- (void)setManagedState:(id)a3 withReply:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = [[AMFIError alloc] initWithAMFIErrorCode:-409 withURL:0];
  v4[2](v4, v5);
}

- (void)removeManagedStateWithReply:(id)a3
{
  v3 = (void (**)(id, id))a3;
  id v4 = [[AMFIError alloc] initWithAMFIErrorCode:-409 withURL:0];
  v3[2](v3, v4);
}

- (void)initiateDataMigrationWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (-[AMFIService verifyBoolEntitlement:]( self,  "verifyBoolEntitlement:",  @"com.apple.private.amfi.data-migration"))
  {
    sub_1000095C4();
    id v5 = 0LL;
  }

  else
  {
    id v5 = [[AMFIError alloc] initWithAMFIErrorCode:-440 withURL:0];
  }

  id v6 = v5;
  v4[2](v4);
}

- (void)initiateDeveloperModeDaemonsWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (-[AMFIService verifyBoolEntitlement:]( self,  "verifyBoolEntitlement:",  @"com.apple.private.amfi.developer-mode-control"))
  {
    id v5 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      unsigned __int8 v8 = "-[AMFIService initiateDeveloperModeDaemonsWithReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: attempting to kick-off developer-mode-daemons",  (uint8_t *)&v7,  0xCu);
    }

    sub_100004B98();
    id v6 = 0LL;
  }

  else
  {
    id v6 = [[AMFIError alloc] initWithAMFIErrorCode:-440 withURL:0];
  }

  v4[2](v4, v6);
}

- (void)stageProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, id))a4;
  if (!-[AMFIService verifyBoolEntitlement:]( self,  "verifyBoolEntitlement:",  @"com.apple.private.amfi.schedule-profile"))
  {
    id v11 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v12 = -440LL;
LABEL_16:
    id v10 = [v11 initWithAMFIErrorCode:v12 withURL:0];
    goto LABEL_17;
  }

  unsigned __int8 v8 = (os_log_s *)off_100020D40;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014E74(v8, v13, v14, v15, v16, v17, v18, v19);
    }
    id v11 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v12 = -406LL;
    goto LABEL_16;
  }

  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[AMFIService stageProfileForUuid:withReply:]";
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] attempting to stage: %@", buf, 0x16u);
  }

  id v23 = 0LL;
  [v6 writeToFile:@"/private/var/db/amfid/UPPStaging.plist" atomically:1 encoding:4 error:&v23];
  id v9 = v23;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014F68();
    }
    goto LABEL_17;
  }

  int v20 = AMFIArmSecurityBootMode(3LL);
  v21 = (os_log_s *)off_100020D40;
  if (v20)
  {
    int v22 = v20;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014EE4(v22, v21);
    }
    id v11 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v12 = -401LL;
    goto LABEL_16;
  }

  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[AMFIService stageProfileForUuid:withReply:]";
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%s] successfully staged UUID: %@", buf, 0x16u);
  }

  id v10 = 0LL;
LABEL_17:
  v7[2](v7, v10);
}

- (void)getStagedProfileWithReply:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  id v4 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[AMFIService getStagedProfileWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%s] acquiring staged UUID", buf, 0xCu);
  }

  id v7 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  @"/private/var/db/amfid/UPPStaging.plist",  4LL,  &v7));
  id v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
    sub_100014FD4();
  }
  v3[2](v3, v5, v6);
}

- (void)commitProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_100006634;
  v32[4] = sub_100006644;
  id v33 = (id)0xAAAAAAAAAAAAAAAALL;
  id v8 = v6;
  id v33 = v8;
  if (!-[AMFIService verifyBoolEntitlement:]( self,  "verifyBoolEntitlement:",  @"com.apple.private.amfi.commit-profile"))
  {
    id v15 = [[AMFIError alloc] initWithAMFIErrorCode:-440 withURL:0];
    goto LABEL_8;
  }

  id v9 = (os_log_s *)off_100020D40;
  BOOL v10 = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[AMFIService commitProfileForUuid:withReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%s] attempting to remove staged UUID",  buf,  0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v18 = [v17 fileExistsAtPath:@"/private/var/db/amfid/UPPStaging.plist"];

    if (!v18)
    {
      uint64_t v16 = 0LL;
      goto LABEL_27;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v31 = 0LL;
    [v19 removeItemAtPath:@"/private/var/db/amfid/UPPStaging.plist" error:&v31];
    id v15 = v31;

LABEL_8:
    uint64_t v16 = 0LL;
    goto LABEL_9;
  }

  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[AMFIService commitProfileForUuid:withReply:]";
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] attempting to commit UUID: %@", buf, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v12 = [v11 fileExistsAtPath:@"/private/var/db/amfid/UPPCommitting.plist"];

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v30 = 0LL;
    [v13 removeItemAtPath:@"/private/var/db/amfid/UPPCommitting.plist" error:&v30];
    id v14 = v30;
  }

  else
  {
    id v14 = 0LL;
  }

  id v29 = v14;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  @"/private/var/db/amfid/UPPStaging.plist",  4LL,  &v29));
  id v15 = v29;

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_1000151A0();
    }
    goto LABEL_9;
  }

  if ([v8 isEqualToString:v16])
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v28 = 0LL;
    [v20 removeItemAtPath:@"/private/var/db/amfid/UPPStaging.plist" error:&v28];
    id v21 = v28;

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
        sub_1000150AC();
      }
    }

    id v27 = 0LL;
    [v8 writeToFile:@"/private/var/db/amfid/UPPCommitting.plist" atomically:1 encoding:4 error:&v27];
    id v22 = v27;
    id v23 = (os_log_s *)off_100020D40;
    if (v22)
    {
      id v15 = v22;
      if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
        sub_100015040();
      }
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[AMFIService commitProfileForUuid:withReply:]";
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%s] successfully committed UUID: %@",  buf,  0x16u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10000664C;
    v26[3] = &unk_10001CBF0;
    v26[4] = v32;
    dispatch_async(v25, v26);

LABEL_27:
    id v15 = 0LL;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
    sub_100015118();
  }
  id v15 = [[AMFIError alloc] initWithAMFIErrorCode:-407 withURL:0];
LABEL_9:
  v7[2](v7, v15);
  _Block_object_dispose(v32, 8);
}

- (void)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, id))a6;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", @"com.apple.private.amfi.set-trust"))
  {
    id v15 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v16 = -440LL;
LABEL_12:
    id v14 = [v15 initWithAMFIErrorCode:v16 withURL:0];
    goto LABEL_13;
  }

  uint64_t v13 = (os_log_s *)off_100020D40;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_10001520C(v13, v17, v18, v19, v20, v21, v22, v23);
    }
    id v15 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v16 = -406LL;
    goto LABEL_12;
  }

  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315394;
    v25 = "-[AMFIService setTrustForUuid:withSignature:withSignType:withReply:]";
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%s] attempting to set trust for UUID: %@",  (uint8_t *)&v24,  0x16u);
  }

  MISSetProfileTrust(v10, v11);
  if (a5 == 1) {
    sub_100009A14(v10);
  }
  id v14 = 0LL;
LABEL_13:
  v12[2](v12, v14);
}

- (void)removeTrustforUuid:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (!-[AMFIService verifyBoolEntitlement:]( self,  "verifyBoolEntitlement:",  @"com.apple.private.amfi.remove-trust"))
  {
    id v10 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v11 = -440LL;
LABEL_10:
    id v9 = [v10 initWithAMFIErrorCode:v11 withURL:0];
    goto LABEL_11;
  }

  id v8 = (os_log_s *)off_100020D40;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_10001527C(v8, v12, v13, v14, v15, v16, v17, v18);
    }
    id v10 = objc_alloc(&OBJC_CLASS___AMFIError);
    uint64_t v11 = -406LL;
    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[AMFIService removeTrustforUuid:withReply:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%s] attempting to remove trust for UUID: %@",  (uint8_t *)&v19,  0x16u);
  }

  MISRemoveProfileTrust(v6);
  id v9 = 0LL;
LABEL_11:
  v7[2](v7, v9);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end