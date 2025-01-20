uint64_t start()
{
  os_log_s *v0;
  void *v1;
  uint8_t v3[16];
  if (IMOSLoggingEnabled())
  {
    v0 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMNotificationServiceAgent");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "IMNotificationServiceAgent launched!", v3, 2u);
    }
  }

  +[IMMessageNotificationController sharedInstance](&OBJC_CLASS___IMMessageNotificationController, "sharedInstance");
  v1 = objc_autoreleasePoolPush();
  -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
  objc_autoreleasePoolPop(v1);
  return 0LL;
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}