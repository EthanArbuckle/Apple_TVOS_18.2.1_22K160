@interface SPKCDataStackshotFile
+ (id)sampleStoreForFile:(const char *)a3;
@end

@implementation SPKCDataStackshotFile

+ (id)sampleStoreForFile:(const char *)a3
{
  int v4 = open(a3, 0);
  if (v4 == -1)
  {
    if (byte_1000DFD38)
    {
      int v15 = *__error();
      v16 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000837C0();
      }
      *__error() = v15;
    }

    if (byte_1000DFD39) {
      BOOL v17 = dword_1000DF4B8 <= 3;
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
      v43 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        sub_100089DC8();
      }
      goto LABEL_54;
    }

@end