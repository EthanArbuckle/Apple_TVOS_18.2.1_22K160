@interface NSData
- (id)_cl_initWithFileDescriptor:(int)a3;
- (id)cl_hexadecimalString;
@end

@implementation NSData

- (id)cl_hexadecimalString
{
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  uint64_t v4 = -[NSData length](self, "length");
  v5 = -[NSData bytes](self, "bytes");
  if (v4 >= 1)
  {
    v6 = v5;
    do
    {
      unsigned int v7 = *v6++;
      objc_msgSend(v3, "appendFormat:", @"%02X", v7);
      --v4;
    }

    while (v4);
  }

  return v3;
}

- (id)_cl_initWithFileDescriptor:(int)a3
{
  if (fstat(a3, &v12))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101876B80);
    }
    v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026LL;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:fstat failed}",  (uint8_t *)&buf,  0x12u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101876B80);
      }
    }

    v6 = (os_log_s *)qword_1019349B8;
    if (!os_signpost_enabled((os_log_t)qword_1019349B8)) {
      goto LABEL_10;
    }
    uint64_t buf = 68289026LL;
    __int16 v14 = 2082;
    v15 = "";
    unsigned int v7 = "fstat failed";
    v8 = "{msg%{public}.0s:fstat failed}";
LABEL_9:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v7,  v8,  (uint8_t *)&buf,  0x12u);
LABEL_10:

    return 0LL;
  }

  v10 = mmap(0LL, v12.st_size, 1, 2, a3, 0LL);
  if (v10 == (void *)-1LL)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101876B80);
    }
    v11 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026LL;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:mmap failed}",  (uint8_t *)&buf,  0x12u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101876B80);
      }
    }

    v6 = (os_log_s *)qword_1019349B8;
    if (!os_signpost_enabled((os_log_t)qword_1019349B8)) {
      goto LABEL_10;
    }
    uint64_t buf = 68289026LL;
    __int16 v14 = 2082;
    v15 = "";
    unsigned int v7 = "mmap failed";
    v8 = "{msg%{public}.0s:mmap failed}";
    goto LABEL_9;
  }

  return -[NSData initWithBytesNoCopy:length:deallocator:]( self,  "initWithBytesNoCopy:length:deallocator:",  v10,  v12.st_size,  NSDataDeallocatorUnmap);
}

@end