@interface NSStream(NSStreamBoundPairCreationExtensions)
+ (__CFWriteStream)getBoundStreamsWithBufferSize:()NSStreamBoundPairCreationExtensions inputStream:outputStream:;
@end

@implementation NSStream(NSStreamBoundPairCreationExtensions)

+ (__CFWriteStream)getBoundStreamsWithBufferSize:()NSStreamBoundPairCreationExtensions inputStream:outputStream:
{
  readStream[1] = *(CFReadStreamRef *)MEMORY[0x1895F89C0];
  CFWriteStreamRef writeStream = 0LL;
  readStream[0] = 0LL;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x189604DB0], readStream, &writeStream, transferBufferSize);
  if (readStream[0])
  {
    v7 = readStream[0];
    if (a4) {
      *a4 = readStream[0];
    }
  }

  result = writeStream;
  if (writeStream)
  {
    result = writeStream;
    if (a5) {
      *a5 = writeStream;
    }
  }

  return result;
}

@end