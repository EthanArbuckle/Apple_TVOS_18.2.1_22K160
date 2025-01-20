@interface CFXPreferencesDaemon
@end

@implementation CFXPreferencesDaemon

void ____CFXPreferencesDaemon_main_block_invoke()
{
  do
    unsigned int v0 = __ldxr(terminating);
  while (__stxr(v0 + 1, terminating));
  _CFPrefsSynchronizeForDaemonTermination();
  exit(0);
}

void ____CFXPreferencesDaemon_main_block_invoke_2()
{
}

void ____CFXPreferencesDaemon_main_block_invoke_3(uint64_t a1, void **a2, uint64_t a3)
{
  v17[7] = *MEMORY[0x1895F89C0];
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeSetCallBacks);
  v6 = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  if (a3)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      v8 = *a2++;
      v17[0] = v7;
      v17[1] = 3221225472LL;
      v17[2] = __dumpDebugInfoCallback_block_invoke;
      v17[3] = &unk_1899EE088;
      v17[4] = v8;
      v17[5] = v6;
      v17[6] = Mutable;
      [v8 lockedSync:v17];
      --a3;
    }

    while (a3);
  }

  CFRelease(Mutable);
  uint64_t v9 = getpid();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v11 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"/tmp/cfprefsddump(%d:%f).txt",  v9,  *(void *)&Current);
  v12 = CFURLCreateWithFileSystemPath((CFAllocatorRef)&__kCFAllocatorSystemDefault, v11, kCFURLPOSIXPathStyle, 0);
  CFIndex Length = CFStringGetLength(v6);
  CFIndex v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v15 = (char *)calloc(v14, 1uLL);
  CFStringGetCString(v6, v15, v14, 0x8000100u);
  size_t v16 = strlen(v15);
  _CFWriteBytesToFile(v12, v15, v16);
  CFRelease(v6);
  CFRelease(v12);
  CFRelease(v11);
  free(v15);
}

@end