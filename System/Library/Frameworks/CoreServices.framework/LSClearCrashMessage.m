@interface LSClearCrashMessage
@end

@implementation LSClearCrashMessage

void ___LSClearCrashMessage_block_invoke()
{
  uint64_t v0 = _LSSetCrashReporterMessage_messagePtr;
  while (1)
  {
    unint64_t v1 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage_messagePtr);
    if (v1 != v0) {
      break;
    }
    if (!__stxr(0LL, (unint64_t *)&_LSSetCrashReporterMessage_messagePtr))
    {
      int v2 = 1;
      goto LABEL_6;
    }
  }

  int v2 = 0;
  __clrex();
LABEL_6:
  if (v2) {
    v3 = (void *)v0;
  }
  else {
    v3 = 0LL;
  }
  free(v3);
  qword_18C49A7B0 = _LSSetCrashReporterMessage_messagePtr;
}

@end