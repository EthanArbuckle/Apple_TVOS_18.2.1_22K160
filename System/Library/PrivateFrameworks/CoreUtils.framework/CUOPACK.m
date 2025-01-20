@interface CUOPACK
+ (id)decodeData:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)encodeObject:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
@end

@implementation CUOPACK

+ (id)encodeObject:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  unsigned int v11 = -6700;
  CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)a3, a4, (int *)&v11);
  CFMutableDataRef v7 = DataMutable;
  if (DataMutable)
  {
    v8 = DataMutable;
  }

  else if (a5)
  {
    if (v11) {
      uint64_t v10 = v11;
    }
    else {
      uint64_t v10 = 4294960596LL;
    }
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)decodeData:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  unsigned int v11 = -6700;
  v6 = (__CFString *)OPACKDecodeData((const __CFData *)a3, a4, &v11);
  CFMutableDataRef v7 = v6;
  if (v6)
  {
    v8 = v6;
  }

  else if (a5)
  {
    if (v11) {
      uint64_t v10 = v11;
    }
    else {
      uint64_t v10 = 4294960596LL;
    }
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end