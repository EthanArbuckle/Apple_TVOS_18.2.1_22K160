@interface NSFileHandle(FTABWrite)
- (uint64_t)writeBytes:()FTABWrite length:;
@end

@implementation NSFileHandle(FTABWrite)

- (uint64_t)writeBytes:()FTABWrite length:
{
  id v2 = (id)objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:");
  uint64_t v3 = [a1 uarpWriteData:v2 error:0];

  return v3;
}

@end