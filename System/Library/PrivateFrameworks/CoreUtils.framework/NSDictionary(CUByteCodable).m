@interface NSDictionary(CUByteCodable)
+ (__CFString)createWithBytesNoCopy:()CUByteCodable length:error:;
- (CFMutableDataRef)encodedDataAndReturnError:()CUByteCodable;
- (uint64_t)encodedBytesAndReturnLength:()CUByteCodable error:;
@end

@implementation NSDictionary(CUByteCodable)

- (uint64_t)encodedBytesAndReturnLength:()CUByteCodable error:
{
  if (a4) {
    *a4 = 0LL;
  }
  return 0LL;
}

- (CFMutableDataRef)encodedDataAndReturnError:()CUByteCodable
{
  CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable(a1, 8, (int *)&v9);
  CFMutableDataRef v5 = DataMutable;
  if (DataMutable)
  {
    v6 = DataMutable;
  }

  else if (a3)
  {
    if (v9) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = 4294960534LL;
    }
    NSErrorWithOSStatusF((const char *)v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (__CFString)createWithBytesNoCopy:()CUByteCodable length:error:
{
  uint64_t v7 = (__CFString *)_OPACKDecodeBytes(0LL, a3, a4, 8, &v12);
  if (!v7)
  {
    if (a5)
    {
      if (v12) {
        uint64_t v9 = v12;
      }
      else {
        uint64_t v9 = 4294960534LL;
      }
      NSErrorWithOSStatusF((const char *)v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }

@end