@interface NSMutableSet(NSPredicateSupport)
- (void)filterUsingPredicate:()NSPredicateSupport;
@end

@implementation NSMutableSet(NSPredicateSupport)

- (void)filterUsingPredicate:()NSPredicateSupport
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil is not a valid predicate for filtering" userInfo:0]);
LABEL_10:
    CFStringRef v14 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v14 userInfo:0];
    CFRelease(v14);
    objc_exception_throw(v15);
  }

  unint64_t v5 = [a1 count];
  unint64_t v6 = v5;
  v17[0] = 0LL;
  if (v5 >> 60) {
    goto LABEL_10;
  }
  if (v5 <= 1) {
    unint64_t v5 = 1LL;
  }
  *(void *)&double v7 = MEMORY[0x1895F8858](v5).n128_u64[0];
  v9 = (char *)v17 - v8;
  if (v10 >= 0x101)
  {
    v9 = (char *)_CFCreateArrayStorage();
    v11 = v9;
  }

  else
  {
    v11 = 0LL;
  }

  _filterObjectsUsingPredicate((void *)objc_msgSend(a1, "allObjects", v7), a3, (uint64_t)v9, v17);
  id v12 = objc_alloc(MEMORY[0x189604010]);
  v13 = (void *)[v12 initWithObjects:v9 count:v17[0]];
  [a1 setSet:v13];

  free(v11);
}

@end