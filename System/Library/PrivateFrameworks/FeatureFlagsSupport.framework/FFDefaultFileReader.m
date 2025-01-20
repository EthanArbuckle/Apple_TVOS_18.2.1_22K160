@interface FFDefaultFileReader
- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4;
@end

@implementation FFDefaultFileReader

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithContentsOfURL:a3];
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:256 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1896078A8];
  id v6 = a3;
  [v5 defaultManager];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:5 error:a4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end