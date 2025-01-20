@interface NSData(CUByteCodable)
+ (id)createWithBytesNoCopy:()CUByteCodable length:error:;
- (const)encodedBytesAndReturnLength:()CUByteCodable error:;
@end

@implementation NSData(CUByteCodable)

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  *a3 = [a1 length];
  result = (const char *)[a1 bytes];
  if (!result) {
    return "";
  }
  return result;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:1];
}

@end