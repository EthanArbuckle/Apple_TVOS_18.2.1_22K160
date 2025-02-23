@interface NSMutableArray(NSMutableArray)
- (uint64_t)classForCoder;
- (uint64_t)initWithContentsOfFile:()NSMutableArray;
- (uint64_t)initWithContentsOfURL:()NSMutableArray;
- (uint64_t)initWithContentsOfURL:()NSMutableArray error:;
- (void)removeObjectsFromIndices:()NSMutableArray numIndices:;
@end

@implementation NSMutableArray(NSMutableArray)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (void)removeObjectsFromIndices:()NSMutableArray numIndices:
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A78])(a1, v4, *MEMORY[0x189604A08]);
  }
  if (a4 < 2)
  {
LABEL_7:
    if (a4)
    {
      v11 = a3 - 1;
      do
        [a1 removeObjectAtIndex:v11[a4--]];
      while (a4);
    }
  }

  else
  {
    unint64_t v8 = *a3;
    uint64_t v9 = 1LL;
    while (1)
    {
      unint64_t v10 = a3[v9];
      if (v8 > v10) {
        break;
      }
      ++v9;
      unint64_t v8 = v10;
      if (a4 == v9) {
        goto LABEL_7;
      }
    }

    v12 = malloc(8 * a4);
    memmove(v12, a3, 8 * a4);
    qsort(v12, a4, 8uLL, (int (__cdecl *)(const void *, const void *))int_sort);
    size_t v13 = a4 - 1;
    do
      [a1 removeObjectAtIndex:*((void *)v12 + v13--)];
    while (v13 != -1LL);
    free(v12);
  }

- (uint64_t)initWithContentsOfFile:()NSMutableArray
{
  uint64_t v4 = [MEMORY[0x189603F18] newWithContentsOf:a3 immutable:0];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableArray
{
  uint64_t v4 = [MEMORY[0x189603F18] newWithContentsOf:a3 immutable:0];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableArray error:
{
  uint64_t v5 = [MEMORY[0x189603F18] newWithContentsOf:a3 immutable:0 error:a4];

  return v5;
}

@end