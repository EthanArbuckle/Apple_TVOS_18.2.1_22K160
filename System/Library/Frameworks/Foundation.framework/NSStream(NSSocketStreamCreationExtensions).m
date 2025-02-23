@interface NSStream(NSSocketStreamCreationExtensions)
+ (const)getStreamsToHost:()NSSocketStreamCreationExtensions port:inputStream:outputStream:;
+ (void)getStreamsToHostWithName:()NSSocketStreamCreationExtensions port:inputStream:outputStream:;
@end

@implementation NSStream(NSSocketStreamCreationExtensions)

+ (void)getStreamsToHostWithName:()NSSocketStreamCreationExtensions port:inputStream:outputStream:
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  id v12 = 0LL;
  v13[0] = 0LL;
  if (host)
  {
    v8 = v13;
    if (!a5) {
      v8 = 0LL;
    }
    if (a6) {
      v9 = &v12;
    }
    else {
      v9 = 0LL;
    }
    CFStreamCreatePairWithSocketToHost( (CFAllocatorRef)*MEMORY[0x189604DB0],  host,  port,  (CFReadStreamRef *)v8,  (CFWriteStreamRef *)v9);
    if (v13[0])
    {
      id v10 = v13[0];
      if (a5) {
        *a5 = v13[0];
      }
    }

    if (v12)
    {
      id v11 = v12;
      if (a6) {
        *a6 = v12;
      }
    }
  }

+ (const)getStreamsToHost:()NSSocketStreamCreationExtensions port:inputStream:outputStream:
{
  v16[1] = *(id *)MEMORY[0x1895F89C0];
  if (getStreamsToHost_port_inputStream_outputStream__onceToken != -1) {
    dispatch_once(&getStreamsToHost_port_inputStream_outputStream__onceToken, &__block_literal_global_48);
  }
  id v15 = 0LL;
  v16[0] = 0LL;
  id v10 = (const __CFString *)[a3 name];
  if (v10
    || (id v10 = (const __CFString *)[a3 address]) != 0
    || (result = (const __CFString *)[a3 _thingToResolve], (id v10 = result) != 0))
  {
    if (a5) {
      id v12 = v16;
    }
    else {
      id v12 = 0LL;
    }
    if (a6) {
      v13 = &v15;
    }
    else {
      v13 = 0LL;
    }
    CFStreamCreatePairWithSocketToHost( (CFAllocatorRef)*MEMORY[0x189604DB0],  v10,  a4,  (CFReadStreamRef *)v12,  (CFWriteStreamRef *)v13);
    if (v16[0])
    {
      id v14 = v16[0];
      if (a5) {
        *a5 = v16[0];
      }
    }

    result = (const __CFString *)v15;
    if (v15)
    {
      result = (const __CFString *)v15;
      if (a6) {
        *a6 = v15;
      }
    }
  }

  return result;
}

@end