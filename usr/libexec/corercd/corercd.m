uint64_t sub_1000036BC(pthread_attr_t *a1, int a2, int a3)
{
  uint64_t v6;
  sched_param v8;
  v6 = pthread_attr_init(a1);
  if ((_DWORD)v6
    || (pthread_attr_setschedpolicy(a1, a3), v6 = pthread_attr_getschedparam(a1, &v8), (_DWORD)v6)
    || (v8.sched_priority = a2, v6 = pthread_attr_setschedparam(a1, &v8), (_DWORD)v6)
    || (v6 = pthread_attr_setdetachstate(a1, 1), (_DWORD)v6))
  {
    pthread_attr_destroy(a1);
  }

  return v6;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_opt_new(&OBJC_CLASS___CoreRCXPCService);
  if (gLogCategory_CoreRC <= 40)
  {
    if (gLogCategory_CoreRC <= 40
      && (gLogCategory_CoreRC != -1 || _LogCategory_Initialize(&gLogCategory_CoreRC, 40LL)))
    {
      LogPrintF( &gLogCategory_CoreRC,  "int main(int, const char **)",  40LL,  "%s",  "@(#)PROGRAM:corercd  PROJECT:CoreRC-249.63.1\n");
    }
  }

  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("corercd - Workloop");
  if (inactive)
  {
    v3 = inactive;
    dispatch_workloop_set_scheduler_priority(inactive, 63LL, 1LL);
    dispatch_activate(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000391C;
    block[3] = &unk_1000040C0;
    block[4] = v1;
    block[5] = v3;
    dispatch_async(v3, block);

    dispatch_main();
  }

  if (gLogCategory_CoreRC <= 120
    && (gLogCategory_CoreRC != -1 || _LogCategory_Initialize(&gLogCategory_CoreRC, 120LL)))
  {
    LogPrintF(&gLogCategory_CoreRC, "int main(int, const char **)", 120LL, "corercd: Unable to create workloop\n");
  }

  [v1 invalidate];

  objc_autoreleasePoolPop(v0);
  return 1LL;
}

id sub_10000391C(uint64_t a1)
{
  return [*(id *)(a1 + 32) startOnQueue:*(void *)(a1 + 40)];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}