LABEL_13:
  +[LogArchiveAggregator _addAWDLogFilesToArchive:](&OBJC_CLASS___LogArchiveAggregator, "_addAWDLogFilesToArchive:", a4);
  if ((v6 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_8:
  if ((v6 & 0x20) != 0) {
LABEL_9:
  }
    +[LogArchiveAggregator _addLaunchdLogFilesToArchive:]( &OBJC_CLASS___LogArchiveAggregator,  "_addLaunchdLogFilesToArchive:",  a4);
LABEL_10:
}

void sub_100003348(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Field Diagnostics Logs did not collect properly: [%@]",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}