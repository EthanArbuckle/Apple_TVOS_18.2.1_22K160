@interface NSMutableArray(NSKeyValueSorting)
- (void)sortUsingDescriptors:()NSKeyValueSorting;
@end

@implementation NSMutableArray(NSKeyValueSorting)

- (void)sortUsingDescriptors:()NSKeyValueSorting
{
  v21[3] = *MEMORY[0x1895F89C0];
  unint64_t v6 = [a1 count];
  uint64_t v7 = [a3 count];
  if (v7 && v6 >= 2)
  {
    if (v6 >> 60)
    {
      CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
      v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v17 userInfo:0];
      CFRelease(v17);
      objc_exception_throw(v18);
      v20 = v19;
      free(v3);
      _Unwind_Resume(v20);
    }

    if (v6 >= 0x101) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v9 = 8 * v8;
    *(void *)&double v10 = MEMORY[0x1895F8858](v7).n128_u64[0];
    v12 = (char *)v21 - v11;
    if (v6 >= 0x101)
    {
      v12 = (char *)_CFCreateArrayStorage();
      v13 = v12;
    }

    else
    {
      v13 = 0LL;
    }

    uint64_t v14 = objc_msgSend(a1, "getObjects:range:", v12, 0, v6, v10);
    MEMORY[0x1895F8858](v14);
    v15 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v6 >= 0x101) {
      v16 = (char *)_CFCreateArrayStorage();
    }
    else {
      v16 = 0LL;
    }
    if (v6 >= 0x101) {
      v15 = v16;
    }
    _sortedObjectsUsingDescriptors((uint64_t)v12, v6, a3, (uint64_t)v15);
    objc_msgSend(a1, "replaceObjectsInRange:withObjects:count:", 0, v6, v15, v6);
    free(v16);
    free(v13);
  }

@end