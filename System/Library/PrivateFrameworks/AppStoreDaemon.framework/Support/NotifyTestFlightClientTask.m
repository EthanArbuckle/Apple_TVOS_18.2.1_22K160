@interface NotifyTestFlightClientTask
- (void)main;
@end

@implementation NotifyTestFlightClientTask

- (void)main
{
  v3 = -[KeepAlive initWithName:]( objc_alloc(&OBJC_CLASS___KeepAlive),  "initWithName:",  @"com.apple.appstored.NotifyTestFlightClient");
  v4 = objc_alloc(&OBJC_CLASS___TestFlightServiceHost);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v7 = sub_1003054A0((id *)&v4->super.isa, v6);

  id v8 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (sub_100255FB0((id *)v9, (uint64_t)@"testflight-extension/extension-enabled", 1LL))
  {
    uint64_t v10 = sub_100305A74((uint64_t)v7);

    if (v10 == 1)
    {
      error = self->super._error;
      uint64_t v12 = 1LL;
      uint64_t v13 = 2LL;
      if (error != (NSError *)-30LL) {
        uint64_t v13 = 0LL;
      }
      if (error != (NSError *)-20LL) {
        uint64_t v12 = v13;
      }
      if (error == (NSError *)-40LL) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = v12;
      }
      uint64_t v33 = 0LL;
      v34 = &v33;
      uint64_t v35 = 0x2020000000LL;
      char v36 = 0;
      *(void *)buf = 0LL;
      v28 = buf;
      uint64_t v29 = 0x3032000000LL;
      v30 = sub_1002C9AD4;
      v31 = sub_1002C9AE4;
      id v32 = 0LL;
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
      v16 = *(void **)&self->super._success;
      bundle = self->_bundle;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1002C9AEC;
      v23[3] = &unk_1003F1A70;
      v25 = &v33;
      v26 = buf;
      v18 = v15;
      v24 = v18;
      sub_100306498((uint64_t)v7, v16, v14, bundle, v23);
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v34 + 24))
      {
        -[Task completeWithSuccess](self, "completeWithSuccess");
      }

      else
      {
        v21 = (void *)*((void *)v28 + 5);
        v22 = v21;
        if (!v21) {
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  1072LL,  0LL));
        }
        -[Task completeWithError:](self, "completeWithError:", v22);
        if (!v21) {
      }
        }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v33, 8);
      goto LABEL_21;
    }
  }

  else
  {
  }

  uint64_t v19 = ASDLogHandleForCategory(39LL);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "NotifyTestFlightClient: extension not available. Quitting.",  buf,  2u);
  }

  -[Task completeWithSuccess](self, "completeWithSuccess");
LABEL_21:
}

- (void).cxx_destruct
{
}

@end