uint64_t start(int a1, uint64_t a2)
{
  __CFRunLoopSource *v2;
  __CFRunLoop *Main;
  void v5[5];
  int v6;
  CFRunLoopSourceContext context;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000036A0;
  v5[3] = &unk_100004120;
  v6 = a1;
  v5[4] = a2;
  dispatch_async(&_dispatch_main_q, v5);
  v2 = (__CFRunLoopSource *)qword_100008008;
  if (!qword_100008008)
  {
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_3;
    v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0LL, &context);
    qword_100008008 = (uint64_t)v2;
    if (!v2) {
      dispatch_main();
    }
  }

  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v2, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0LL;
}

void sub_1000036A0(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  configure_symptom_logging();
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100003740(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
  {
    configure_analytics_launchpad_for_helper();
  }

  else
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100004160);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_100004180);

    uint64_t v1 = configure_symptom_evaluator_handling(0LL, 0LL);
    activate_symptom_evaluator_handling(v1);
    init_managed_event_listening(0LL);
    init_symptom_evaluator_listening(0LL);
    init_analytics_portal_listening(0LL);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  v3 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v2;

  if (qword_100008000)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008000, &stru_1000041C0);
    dispatch_resume((dispatch_object_t)qword_100008000);
  }

  return atexit_b(&stru_1000041E0);
}

void sub_100003830(id a1)
{
  uint64_t v1 = client_transactions_release(a1);
  xpc_transaction_exit_clean(v1);
}