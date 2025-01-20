@interface PBIdleAction
- (NSString)description;
- (PBIdleAction)initWithInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7;
- (double)idleInterval;
- (void)_run;
- (void)fire;
- (void)invalidate;
- (void)resetForAwake;
- (void)resetForSleep;
@end

@implementation PBIdleAction

- (PBIdleAction)initWithInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PBIdleAction;
  v16 = -[PBIdleAction init](&v45, "init");
  v17 = v16;
  if (v16)
  {
    double v18 = 0.01;
    if (a3 >= 0.01) {
      double v18 = a3;
    }
    v16->_ti = v18;
    v19 = (NSString *)[v12 copy];
    reason = v17->_reason;
    v17->_reason = v19;

    objc_storeStrong((id *)&v17->_queue, a5);
    id v21 = [v14 copy];
    id action = v17->_action;
    v17->_id action = v21;

    if (v15)
    {
      id v23 = [v15 copy];
      id v24 = objc_retainBlock(v23);
      id invalidate = v17->_invalidate;
      v17->_id invalidate = v24;
    }

    else
    {
      id v23 = v17->_invalidate;
      v17->_id invalidate = &stru_1003D0818;
    }

    v26 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.PineBoard.IdleAction.%p",  v17));
    [v26 setIdentifier:v27];

    else {
      uint64_t v28 = 1133LL;
    }
    [v26 setEventMask:v28];
    [v26 setAttentionLostTimeout:a3];
    v29 = objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessClient);
    id v44 = 0LL;
    unsigned __int8 v30 = -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( v29,  "setConfiguration:shouldReset:error:",  v26,  0LL,  &v44);
    id v31 = v44;
    if ((v30 & 1) == 0)
    {
      id v32 = sub_100084338();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100270880();
      }
    }

    objc_initWeak(&location, v17);
    v34 = &_dispatch_main_q;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100017F90;
    v41[3] = &unk_1003D0840;
    objc_copyWeak(&v42, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]( v29,  "setEventHandlerWithQueue:block:",  &_dispatch_main_q,  v41);

    objc_storeStrong((id *)&v17->_attentor, v29);
    id v40 = 0LL;
    unsigned __int8 v35 = -[AWAttentionAwarenessClient resumeWithError:](v29, "resumeWithError:", &v40);
    id v36 = v40;
    if ((v35 & 1) == 0)
    {
      id v37 = sub_100084338();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100270820();
      }
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (void)resetForSleep
{
  if (v3 > 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AWAttentionAwarenessClient configuration](self->_attentor, "configuration"));
    [v4 setEventMask:1];
    attentor = self->_attentor;
    if (attentor)
    {
      id v10 = 0LL;
      unsigned __int8 v6 = -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( attentor,  "setConfiguration:shouldReset:error:",  v4,  0LL,  &v10);
      id v7 = v10;
      if ((v6 & 1) == 0)
      {
        id v8 = sub_100084338();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1002708E0();
        }
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

- (void)resetForAwake
{
  if (v3 > 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AWAttentionAwarenessClient configuration](self->_attentor, "configuration"));
    [v4 setEventMask:1133];
    attentor = self->_attentor;
    if (attentor)
    {
      id v10 = 0LL;
      unsigned __int8 v6 = -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( attentor,  "setConfiguration:shouldReset:error:",  v4,  1LL,  &v10);
      id v7 = v10;
      if ((v6 & 1) == 0)
      {
        id v8 = sub_100084338();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1002708E0();
        }
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

- (double)idleInterval
{
  double result = 0.0;
  if (!self->_state) {
    return self->_ti;
  }
  return result;
}

- (void)_run
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000181E4;
  v5[3] = &unk_1003CFF08;
  v5[4] = self;
  double v3 = objc_retainBlock(v5);
  queue = (dispatch_queue_s *)self->_queue;
  if (queue) {
    dispatch_async(queue, v3);
  }
  else {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)fire
{
  p_state = (unsigned __int8 *)&self->_state;
  while (!__ldaxr(p_state))
  {
    if (!__stlxr(0x65u, p_state))
    {
      -[PBIdleAction _run](self, "_run");
      return;
    }
  }

  __clrex();
}

- (void)invalidate
{
  p_state = (unsigned __int8 *)&self->_state;
  while (!__ldaxr(p_state))
  {
    if (!__stlxr(0x69u, p_state))
    {
      -[PBIdleAction _run](self, "_run");
      return;
    }
  }

  __clrex();
  while (1)
  {
    int v4 = __ldaxr(p_state);
    if (v4 != 101) {
      break;
    }
    if (!__stlxr(0x69u, p_state)) {
      return;
    }
  }

  __clrex();
}

- (NSString)description
{
  double v3 = "garbage";
  switch(self->_state)
  {
    case 'e':
      double v3 = "execution scheduled";
      break;
    case 'f':
      double v3 = "executing";
      break;
    case 'g':
      double v3 = "executed";
      break;
    case 'h':
      break;
    case 'i':
      double v3 = "invalidation scheduled";
      break;
    case 'j':
      double v3 = "invalidating";
      break;
    case 'k':
      double v3 = "invalidated";
      break;
    default:
      if (!self->_state) {
        double v3 = "waiting";
      }
      break;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBIdleAction;
  int v4 = -[PBIdleAction description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{state=%s, reason='%@'}",  v5,  v3,  self->_reason));

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end