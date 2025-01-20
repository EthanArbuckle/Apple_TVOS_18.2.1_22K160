@interface NSMutableData(NSMutableDataCompression)
- (BOOL)_compressUsingCompressionAlgorithm:()NSMutableDataCompression error:;
- (BOOL)_decompressUsingCompressionAlgorithm:()NSMutableDataCompression error:;
- (uint64_t)compressUsingAlgorithm:()NSMutableDataCompression error:;
- (uint64_t)decompressUsingAlgorithm:()NSMutableDataCompression error:;
@end

@implementation NSMutableData(NSMutableDataCompression)

- (BOOL)_compressUsingCompressionAlgorithm:()NSMutableDataCompression error:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v7 = (void *)MEMORY[0x186E1FF60]();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __84__NSMutableData_NSMutableDataCompression___compressUsingCompressionAlgorithm_error___block_invoke;
  v11[3] = &unk_189C9A008;
  v11[4] = a1;
  v11[5] = &v12;
  [a1 _produceDataWithCompressionOperation:0 algorithm:a3 handler:v11];
  objc_autoreleasePoolPop(v7);
  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a4 && !*((_BYTE *)v13 + 24))
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  5376LL,  0LL);
    int v8 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)_decompressUsingCompressionAlgorithm:()NSMutableDataCompression error:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v7 = (void *)MEMORY[0x186E1FF60]();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __86__NSMutableData_NSMutableDataCompression___decompressUsingCompressionAlgorithm_error___block_invoke;
  v11[3] = &unk_189C9A008;
  v11[4] = a1;
  v11[5] = &v12;
  [a1 _produceDataWithCompressionOperation:1 algorithm:a3 handler:v11];
  objc_autoreleasePoolPop(v7);
  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a4 && !*((_BYTE *)v13 + 24))
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  5377LL,  0LL);
    int v8 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (uint64_t)compressUsingAlgorithm:()NSMutableDataCompression error:
{
  return [a1 _compressUsingCompressionAlgorithm:_NSAlgToCompAlg(a3) error:a4];
}

- (uint64_t)decompressUsingAlgorithm:()NSMutableDataCompression error:
{
  return [a1 _decompressUsingCompressionAlgorithm:_NSAlgToCompAlg(a3) error:a4];
}

@end