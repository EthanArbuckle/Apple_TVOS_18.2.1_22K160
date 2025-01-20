@interface SPKCDataStackshotFile
+ (id)sampleStoreForFile:(const char *)a3;
@end

@implementation SPKCDataStackshotFile

+ (id)sampleStoreForFile:(const char *)a3
{
  int v4 = open(a3, 0);
  if (v4 == -1)
  {
    if (byte_1000E7D30)
    {
      int v15 = *__error();
      v16 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000873A4();
      }
      *__error() = v15;
    }

    if (byte_1000E7D31) {
      BOOL v17 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      return 0LL;
    }
    int v18 = *__error();
    uint64_t v19 = *__error();
    v20 = __error();
    v21 = strerror(*v20);
    v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Unable to open %s: %d (%s)", a3, v19, v21);
    if (!v22)
    {
      v43 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        sub_10008E6D4();
      }
      goto LABEL_54;
    }

@end