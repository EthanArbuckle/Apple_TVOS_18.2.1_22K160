@interface NSURL(NSURLPrivate)
+ (id)_fileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:;
- (char)_initFileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:;
@end

@implementation NSURL(NSURLPrivate)

- (char)_initFileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (![a3 length])
    {

      return 0LL;
    }
  }

  else
  {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"%@: nil string parameter", _NSMethodExceptionProem(a1, a2) format];
  }

  if (([a3 isAbsolutePath] & 1) == 0) {
    [a3 stringByStandardizingPath];
  }
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&off_18C688198;
    v9 = (char *)-[objc_class init](&v13, sel_init);
    if (!v9) {
      return v9;
    }
    uint64_t v11 = _CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
    if (v11)
    {
      *(void *)&v9[*MEMORY[0x189604068]] = v11;
      return v9;
    }

    if (!a5) {
      return 0LL;
    }
    goto LABEL_22;
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if ((objc_class *)qword_18C496C40 != a1) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A48], @"%@: object already initialized", _NSMethodExceptionProem(a1, a2) format];
  }
  v9 = (char *)_CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
  if (!v9)
  {
    if (!a5) {
      return 0LL;
    }
LABEL_22:
    if (*a5)
    {
      v9 = 0LL;
      *a5 = *a5;
      return v9;
    }

    return 0LL;
  }

  return v9;
}

+ (id)_fileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  return (id)[objc_allocWithZone(a1) _initFileURLWithPath:a3 cachingResourceValuesForKeys:a4 error:a5];
}

@end