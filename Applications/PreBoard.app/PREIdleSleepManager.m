@interface PREIdleSleepManager
+ (id)sharedController;
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BOOL)isDisplayDim;
- (PREIdleSleepManager)init;
- (SSDisplay)display;
- (void)dimDisplay;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setDisplayDim:(BOOL)a3;
- (void)undimDisplay;
@end

@implementation PREIdleSleepManager

+ (id)sharedController
{
  if (qword_100011FE8 != -1) {
    dispatch_once(&qword_100011FE8, &stru_10000C478);
  }
  return (id)qword_100011FE0;
}

- (PREIdleSleepManager)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___PREIdleSleepManager;
  v2 = -[PREIdleSleepManager init](&v35, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SSDisplay);
    display = v2->_display;
    v2->_display = v3;

    v5 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    [v5 setIdentifier:@"com.apple.PreBoard"];
    [v5 setEventMask:1133];
    [v5 setAttentionLostTimeout:900.0];
    v6 = objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v6;

    v8 = v2->_attentionAwarenessClient;
    id v34 = 0LL;
    unsigned __int8 v9 = -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( v8,  "setConfiguration:shouldReset:error:",  v5,  0LL,  &v34);
    id v10 = v34;
    if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006624((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = v2;
    v19 = v2->_attentionAwarenessClient;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100002498;
    v32[3] = &unk_10000C4A0;
    v33 = v18;
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]( v19,  "setEventHandlerWithQueue:block:",  &_dispatch_main_q,  v32);

    v20 = v2->_attentionAwarenessClient;
    id v31 = 0LL;
    unsigned __int8 v21 = -[AWAttentionAwarenessClient resumeWithError:](v20, "resumeWithError:", &v31);
    id v22 = v31;
    if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000065B4((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  return v2;
}

- (void)undimDisplay
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[PREIdleSleepManager undimDisplay]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BKSDisplayServicesSetScreenBlanked(0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PREIdleSleepManager display](self, "display"));
  [v3 setState:2 completion:&stru_10000C4E0];

  dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002600;
  block[3] = &unk_10000C508;
  block[4] = self;
  dispatch_after(v4, &_dispatch_main_q, block);
}

- (void)dimDisplay
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[PREIdleSleepManager dimDisplay]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s",  (uint8_t *)&v4,  0xCu);
  }

  BKSDisplayServicesSetScreenBlanked(1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PREIdleSleepManager display](self, "display"));
  [v3 setState:1 completion:&stru_10000C528];

  -[PREIdleSleepManager setDisplayDim:](self, "setDisplayDim:", 1LL);
}

- (BOOL)isDisplayDim
{
  return self->_displayDim;
}

- (void)setDisplayDim:(BOOL)a3
{
  self->_displayDim = a3;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (SSDisplay)display
{
  return self->_display;
}

- (void)setDisplay:(id)a3
{
}

- (void).cxx_destruct
{
}

@end