@interface CLPCUserClient
- (BOOL)setContextualPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setDockMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setGameMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setGameModeOnProcess:(BOOL)a3 targetProcess:(int)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)setHotInPocketMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setLowPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setSustainableMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setTaskingMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (CLPCUserClient)init;
- (id).cxx_construct;
- (id)init:(id *)a3;
- (id)reportingObfuscationData:(id *)a3;
- (uint64_t)connect:(uint64_t)result;
- (unint64_t)isInContextualPowerMode:(id *)a3;
- (unint64_t)isInDockMode:(id *)a3;
- (unint64_t)isInGameMode:(id *)a3;
- (unint64_t)isInHotInPocketMode:(id *)a3;
- (unint64_t)isInLowPowerMode:(id *)a3;
- (unint64_t)isInSustainableMode:(id *)a3;
- (unint64_t)isInTaskingMode:(id *)a3;
@end

@implementation CLPCUserClient

- (id)init:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLPCUserClient;
  v4 = -[CLPCUserClient init](&v8, sel_init);
  v5 = v4;
  else {
    v6 = 0LL;
  }

  return v6;
}

- (uint64_t)connect:(uint64_t)result
{
  kern_return_t v3;
  void *v4;
  uint64_t v5;
  void v6[2];
  v6[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (*(_DWORD *)(result + 20))
    {
      return 1LL;
    }

    else
    {
      v3 = IOServiceOpen(*(_DWORD *)(result + 16), *MEMORY[0x1895FBBE0], 0, (io_connect_t *)(result + 20));
      result = v3 == 0;
      if (a2)
      {
        if (v3)
        {
          v5 = *MEMORY[0x189607490];
          v6[0] = @"Failed to open user client connection to AppleCLPC.";
          [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v3 userInfo:v4];
          *a2 = (id)objc_claimAutoreleasedReturnValue();

          return 0LL;
        }
      }
    }
  }

  return result;
}

- (CLPCUserClient)init
{
  return (CLPCUserClient *)-[CLPCUserClient init:](self, "init:", 0LL);
}

- (unint64_t)isInLowPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(int64x2_t *)input = vdupq_n_s64(1uLL);
  v10 = 0u;
  v11 = 0u;
  output = 0LL;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Low Power Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setLowPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 1LL;
  input[1] = v7;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Low Power Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInHotInPocketMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C060;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Hot In Pocket Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setHotInPocketMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 4LL;
  input[1] = v7;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Hot In Pocket Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInGameMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C070;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Game Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setGameMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  input[0] = 2LL;
  input[1] = v7;
  uint64_t input[2] = a4;
  memset(&input[3], 0, 24);
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Game Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x189607490];
    v22[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)setGameModeOnProcess:(BOOL)a3 targetProcess:(int)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  v17[1] = *MEMORY[0x1895F89C0];
  int v9 = setpriority(7, a4, a3);
  if (v9)
  {
    uint64_t v10 = *__error();
    unsigned int v11 = @"disable";
    if (v8) {
      unsigned int v11 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Game Mode on process %d.", v11, v7];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x189607490];
    v17[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 errorWithDomain:@"CLPCErrorDomain" code:v10 userInfo:v14];
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == 0;
}

- (unint64_t)isInSustainableMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C080;
  uint64_t v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Sustainable Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setSustainableMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 3LL;
  input[1] = v7;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Sustainable Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInDockMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C090;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Dock Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setDockMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 5LL;
  input[1] = v7;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Dock Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInTaskingMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C0A0;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Tasking Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setTaskingMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 6LL;
  input[1] = v7;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Tasking Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInContextualPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void v13[2];
  v13[1] = *MEMORY[0x1895F89C0];
  *(_OWORD *)input = xmmword_18897C0B0;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to determine if Contextual Power Mode is enabled.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else if (output)
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)setContextualPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 2LL;
  if (!a3) {
    uint64_t v7 = 0LL;
  }
  input[0] = 7LL;
  input[1] = v7;
  uint64_t input[2] = a4;
  memset(&input[3], 0, 24);
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (output) {
    BOOL v10 = (_DWORD)v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    [NSString stringWithFormat:@"Failed to %@ Contextual Power Mode.", v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x189607490];
    v22[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (id)reportingObfuscationData:(id *)a3
{
  kern_return_t v4;
  BOOL v5;
  int v6;
  void *v7;
  uint32_t outputCnt;
  uint64_t v10;
  CFStringRef v11;
  _OWORD v12[2];
  int v13;
  uint64_t output[2];
  __int128 v15;
  uint64_t v16;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  *(_OWORD *)uint64_t output = 0u;
  v15 = 0u;
  uint32_t outputCnt = 4;
  v4 = IOConnectCallMethod(self->clpc.connect, 5u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (v4) {
    v5 = 1;
  }
  else {
    v5 = outputCnt == 4;
  }
  if (v5) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = -536870212;
  }
  v12[0] = *(_OWORD *)output;
  v12[1] = v15;
  v13 = v6;
  if (v6)
  {
    if (a3)
    {
      BOOL v10 = *MEMORY[0x189607490];
      unsigned int v11 = @"Failed to get reporting obfuscation data.";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:v6 userInfo:v7];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    [MEMORY[0x189603F48] dataWithBytes:v12 length:32];
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end