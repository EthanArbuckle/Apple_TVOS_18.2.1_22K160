@interface NSData(NSDataCompression)
- (id)_compressedDataUsingCompressionAlgorithm:()NSDataCompression error:;
- (id)_decompressedDataUsingCompressionAlgorithm:()NSDataCompression error:;
- (uint64_t)compressedDataUsingAlgorithm:()NSDataCompression error:;
- (uint64_t)decompressedDataUsingAlgorithm:()NSDataCompression error:;
- (void)_produceDataWithCompressionOperation:()NSDataCompression algorithm:handler:;
@end

@implementation NSData(NSDataCompression)

- (void)_produceDataWithCompressionOperation:()NSDataCompression algorithm:handler:
{
  v21[5] = *MEMORY[0x1895F89C0];
  id v9 = objc_alloc_init(MEMORY[0x189603FB8]);
  v10 = objc_alloc(&OBJC_CLASS____NSDataCompressor);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke;
  v21[3] = &unk_189C99F90;
  v21[4] = v9;
  v12 = -[_NSDataCompressor initWithAlgorithm:operation:dataHandler:]( v10,  "initWithAlgorithm:operation:dataHandler:",  a4,  a3,  v21);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  v16[0] = v11;
  v16[1] = 3221225472LL;
  v16[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke_2;
  v16[3] = &unk_189C99FB8;
  v16[4] = v12;
  v16[5] = &v17;
  [a1 enumerateByteRangesUsingBlock:v16];
  v13 = v18;
  if (*((_BYTE *)v18 + 24))
  {
    BOOL v14 = -[_NSDataCompressor finishProcessing](v12, "finishProcessing");
    v13 = v18;
  }

  else
  {
    BOOL v14 = 0;
  }

  *((_BYTE *)v13 + 24) = v14;

  if (*((_BYTE *)v18 + 24)) {
    id v15 = v9;
  }
  else {
    id v15 = 0LL;
  }
  (*(void (**)(uint64_t, id))(a5 + 16))(a5, v15);

  _Block_object_dispose(&v17, 8);
}

- (uint64_t)decompressedDataUsingAlgorithm:()NSDataCompression error:
{
  return [a1 _decompressedDataUsingCompressionAlgorithm:_NSAlgToCompAlg(a3) error:a4];
}

- (uint64_t)compressedDataUsingAlgorithm:()NSDataCompression error:
{
  return [a1 _compressedDataUsingCompressionAlgorithm:_NSAlgToCompAlg(a3) error:a4];
}

- (id)_decompressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  uint64_t v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_189C99FE0;
  v8[4] = &v9;
  [a1 _produceDataWithCompressionOperation:1 algorithm:a3 handler:v8];
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  5377LL,  0LL);
    v5 = (void *)v10[5];
  }

  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_compressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  uint64_t v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_189C99FE0;
  v8[4] = &v9;
  [a1 _produceDataWithCompressionOperation:0 algorithm:a3 handler:v8];
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  5376LL,  0LL);
    v5 = (void *)v10[5];
  }

  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

@end