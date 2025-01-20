uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0LL, 0LL);
  objc_autoreleasePoolPop(v4);
  return v5;
}

id sub_100002EC4()
{
  if (qword_100008758 != -1) {
    dispatch_once(&qword_100008758, &stru_1000041B0);
  }
  return (id)qword_100008750;
}

void sub_100002F04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAccessViewService", "Default");
  v2 = (void *)qword_100008750;
  qword_100008750 = (uint64_t)v1;
}

void sub_100003220( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_10000325C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _remoteViewControllerProxy]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  [v3 dismissWithResult:v4];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}