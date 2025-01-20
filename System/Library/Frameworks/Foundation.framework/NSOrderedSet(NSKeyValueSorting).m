@interface NSOrderedSet(NSKeyValueSorting)
- (id)sortedArrayUsingDescriptors:()NSKeyValueSorting;
@end

@implementation NSOrderedSet(NSKeyValueSorting)

- (id)sortedArrayUsingDescriptors:()NSKeyValueSorting
{
  v25[3] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a1 count];
  unint64_t v6 = v5;
  if (v5 >> 60)
  {
    CFStringRef v23 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5);
    v24 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v23 userInfo:0];
    CFRelease(v23);
    objc_exception_throw(v24);
  }

  *(void *)&double v7 = MEMORY[0x1895F8858](v5).n128_u64[0];
  v9 = (char *)v25 - v8;
  if (v6 >= 0x101)
  {
    v9 = (char *)_CFCreateArrayStorage();
    v10 = (id *)v9;
  }

  else
  {
    v10 = 0LL;
  }

  objc_msgSend(a1, "getObjects:range:", v9, 0, v6, v7);
  uint64_t v11 = [a3 count];
  if (v6 >= 2 && v11)
  {
    uint64_t v12 = _CFCreateArrayStorage();
    _sortedObjectsUsingDescriptors((uint64_t)v9, v6, a3, v12);
    if (v12)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
        id v14 = *(id *)(v12 + 8 * i);
      v15 = (void *)[objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v12 count:v6 size:v6];
    }

    else
    {
      v15 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v6];
    }

    id v20 = v15;
  }

  else
  {
    if (v10)
    {
      if (v6)
      {
        v16 = v10;
        unint64_t v17 = v6;
        do
        {
          id v18 = *v16++;
          --v17;
        }

        while (v17);
      }

      v19 = (void *)[objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v10 count:v6 size:v6];
    }

    else
    {
      v19 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v9 count:v6];
    }

    v10 = 0LL;
    id v20 = v19;
  }

  id v21 = v20;
  free(v10);
  return v21;
}

@end