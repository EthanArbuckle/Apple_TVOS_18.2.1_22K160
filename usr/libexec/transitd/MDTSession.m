@interface MDTSession
+ (id)lookupSessionForPort:(unsigned int)a3;
+ (id)sessionWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5;
+ (int64_t)sessionCount;
+ (void)initialize;
+ (void)removeSession:(id)a3;
- (MDTSession)initWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5;
- (unsigned)clientPort;
- (unsigned)serverPort;
- (void)dealloc;
- (void)finalize;
- (void)invalidate;
- (void)returnStatusWithDestURL:(id)a3 error:(id)a4;
@end

@implementation MDTSession

+ (void)initialize
{
  qword_10000C6E0 = objc_alloc_init(&OBJC_CLASS___NSLock);
  qword_10000C6E8 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
}

+ (id)lookupSessionForPort:(unsigned int)a3
{
  v4 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_10000C6E8, (const void *)a3);
  objc_sync_exit(v4);
  return Value;
}

+ (id)sessionWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5
{
  v6 = -[MDTSession initWithServerPort:clientPort:pid:]( objc_alloc(&OBJC_CLASS___MDTSession),  "initWithServerPort:clientPort:pid:",  *(void *)&a3,  *(void *)&a4,  *(void *)&a5);
  v7 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C6E8, (const void *)a3, v6);
  ++qword_10000C6F0;
  objc_sync_exit(v7);
  return v6;
}

+ (void)removeSession:(id)a3
{
  unsigned int v3 = [a3 serverPort];
  v4 = (void *)qword_10000C6E0;
  objc_sync_enter((id)qword_10000C6E0);
  if (CFDictionaryGetValue((CFDictionaryRef)qword_10000C6E8, (const void *)v3))
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_10000C6E8, (const void *)v3);
    --qword_10000C6F0;
  }

  objc_sync_exit(v4);
}

+ (int64_t)sessionCount
{
  return qword_10000C6F0;
}

- (MDTSession)initWithServerPort:(unsigned int)a3 clientPort:(unsigned int)a4 pid:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MDTSession;
  result = -[MDTSession init](&v9, "init");
  result->_server = a3;
  result->_client = a4;
  result->_pid = a5;
  result->_valid = 1;
  return result;
}

- (void)dealloc
{
  self->_copier = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MDTSession;
  -[MDTSession dealloc](&v3, "dealloc");
}

- (void)finalize
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MDTSession;
  -[MDTSession finalize](&v3, "finalize");
}

- (void)invalidate
{
  if (self->_valid)
  {
    self->_valid = 0;
    mach_port_mod_refs(mach_task_self_, self->_server, 1u, -1);
    -[Copier invalidate](self->_copier, "invalidate");
    objc_super v3 = (void *)objc_opt_class(self);
    [v3 removeSession:self];
  }

- (unsigned)clientPort
{
  return self->_client;
}

- (unsigned)serverPort
{
  return self->_server;
}

- (void)returnStatusWithDestURL:(id)a3 error:(id)a4
{
  v7 = sub_1000059F4((CFErrorRef)a4);
  CFDictionaryRef v8 = sub_100005028((const __CFURL *)a3, v7);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    v10 = (const __CFData *)sub_1000053F8(v8);
    if (v10)
    {
      v11 = v10;
      v12 = 0LL;
    }

    else
    {
      NSLog(@"NULL data from __MDTSerializePropertyList");
      v16 = CFErrorCreate(0LL, kCFErrorDomainPOSIX, 5LL, 0LL);
      if (v16)
      {
        v17 = v16;
        CFStringRef v18 = CFErrorCopyDescription(v16);
        v12 = (__CFString *)CFRetain(v18);
        CFRelease(v17);
      }

      else
      {
        v12 = @"Input/output error";
      }

      v11 = (const __CFData *)sub_100005338(v12, @"com.apple.mdt", 1LL);
      if (!v11)
      {
        int Length = 0;
        BytePtr = 0LL;
LABEL_11:
        CFRelease(v9);
        if (a4) {
          goto LABEL_12;
        }
LABEL_5:
        int v15 = 0;
        goto LABEL_13;
      }
    }

    BytePtr = CFDataGetBytePtr(v11);
    int Length = CFDataGetLength(v11);
    goto LABEL_11;
  }

  int Length = 0;
  v12 = 0LL;
  BytePtr = 0LL;
  v11 = 0LL;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_12:
  int v15 = [a4 code];
LABEL_13:
  sub_100005B90(self->_client, v15, (uint64_t)BytePtr, Length);
  if (v11) {
    CFRelease(v11);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v12) {
    CFRelease(v12);
  }
}

@end