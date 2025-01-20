LABEL_10:
}

id sub_100001788(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 size];
  double v6 = v5;
  [*(id *)(a1 + 32) size];
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v9 setFill];

  objc_msgSend(v4, "fillRect:", 0.0, 0.0, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath _bezierPathWithPillRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "_bezierPathWithPillRect:cornerRadius:",  0.0,  0.0,  v6,  v8,  *(double *)(a1 + 40)));
  [v10 addClip];

  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v6, v8);
}

void sub_1000019B0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  double v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AKUIServiceAppDelegate);
  double v6 = NSStringFromClass(v5);
  double v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100001A4C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid message, unknown AKAuthorizationTVMessageType received. {type=%ld, message=%@}",  (uint8_t *)&v3,  0x16u);
}

void sub_100001AD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100001B04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_userInteractedWithEndorsingDevice(void *a1, const char *a2, ...)
{
  return [a1 userInteractedWithEndorsingDevice];
}