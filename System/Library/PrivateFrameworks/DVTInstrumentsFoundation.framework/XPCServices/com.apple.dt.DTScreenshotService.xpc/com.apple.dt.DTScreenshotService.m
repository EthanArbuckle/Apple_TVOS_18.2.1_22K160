int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100003730(id a1)
{
  qword_100008708 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  int valuePtr = 1065353216;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100008708, kCGImageDestinationLossyCompressionQuality, v1);
  CFRelease(v1);
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}