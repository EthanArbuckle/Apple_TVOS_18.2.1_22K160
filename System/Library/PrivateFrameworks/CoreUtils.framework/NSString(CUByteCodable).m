@interface NSString(CUByteCodable)
+ (id)createWithBytesNoCopy:()CUByteCodable length:error:;
- (const)encodedBytesAndReturnLength:()CUByteCodable error:;
- (id)encodedDataAndReturnError:()CUByteCodable;
@end

@implementation NSString(CUByteCodable)

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  v6 = (const char *)[a1 UTF8String];
  v7 = v6;
  if (v6)
  {
    *a3 = strlen(v6);
  }

  else if (a4)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)encodedDataAndReturnError:()CUByteCodable
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else if (a3)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  id v6 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:a3 length:a4 encoding:4 freeWhenDone:1];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else if (a5)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5AALL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end