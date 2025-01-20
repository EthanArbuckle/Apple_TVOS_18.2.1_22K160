@interface NSArray(NSPredicateSupport)
- (id)filteredArrayUsingPredicate:()NSPredicateSupport;
@end

@implementation NSArray(NSPredicateSupport)

- (id)filteredArrayUsingPredicate:()NSPredicateSupport
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil is not a valid predicate for filtering" userInfo:0]);
LABEL_16:
    CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v17 userInfo:0];
    CFRelease(v17);
    objc_exception_throw(v18);
  }

  unint64_t v5 = [a1 count];
  unint64_t v6 = v5;
  v20[0] = 0LL;
  if (v5 >> 60) {
    goto LABEL_16;
  }
  if (v5 <= 1) {
    unint64_t v5 = 1LL;
  }
  MEMORY[0x1895F8858](v5);
  v8 = (char *)v20 - v7;
  if (v9 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage();
    v10 = (id *)v8;
  }

  else
  {
    v10 = 0LL;
  }

  _filterObjectsUsingPredicate(a1, a3, (uint64_t)v8, v20);
  uint64_t v11 = v20[0];
  if (v10)
  {
    if (v20[0] >= 1LL)
    {
      v12 = v10;
      uint64_t v13 = v20[0];
      do
      {
        id v14 = *v12++;
        --v13;
      }

      while (v13);
    }

    v15 = (void *)[objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v10 count:v11 size:v11];
  }

  else
  {
    v15 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v8 count:v20[0]];
  }

  return v15;
}

@end