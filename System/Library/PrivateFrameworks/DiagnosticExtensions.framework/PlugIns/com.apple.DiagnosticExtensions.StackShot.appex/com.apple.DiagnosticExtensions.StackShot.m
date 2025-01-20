LABEL_10:
  v4 = (void (*)(const __CFString *, uint64_t))qword_100008160;
  if (qword_100008160) {
    goto LABEL_11;
  }
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DEWriteStackshotReport is NULL\n", buf, 2u);
  }

  v10 = 0LL;
LABEL_29:

  return v10;
}

id objc_msgSend_takeStackshot(void *a1, const char *a2, ...)
{
  return [a1 takeStackshot];
}