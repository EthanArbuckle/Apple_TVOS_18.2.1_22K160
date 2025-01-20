@interface NSOrderedChangesCopy
@end

@implementation NSOrderedChangesCopy

id ___NSOrderedChangesCopy_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v9 = *(void **)(a1 + 32);
  if (a2 == 5 && a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_22;
  }
  while (1)
  {
    size_t v10 = v9[3];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = v9[2];
      goto LABEL_15;
    }

    uint64_t v11 = v9[4];
    if (v11)
    {
      size_t v12 = malloc_good_size(40 * v11 + 40) / 0x28;
      if (v12 <= v9[4]) {
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListGrowIfNeeded(NSOrderedChangeList *)"),  @"NSOrderedChanges.m",  154LL,  @"capacity should be larger than previously requested");
      }
    }

    else
    {
      size_t v12 = 32LL;
    }

    if (!v9[2]) {
      break;
    }
    uint64_t v13 = __CFSafelyReallocate();
    if (v13) {
      goto LABEL_11;
    }
LABEL_21:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"Unable to allocate underlying buffer for change list" userInfo:0]);
LABEL_22:
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListAppend(NSOrderedChanges *, NSKeyValueChange, NSUInteger, NSUInteger, id)"),  @"NSOrderedChanges.m",  187LL,  @"move sources not found");
  }

  uint64_t v13 = (uint64_t)malloc(40 * v12);
  if (!v13) {
    goto LABEL_21;
  }
LABEL_11:
  size_t v14 = v9[4];
  if (v14 < v12)
  {
    v15 = (uint64_t *)(v13 + 40 * v14 + 32);
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      *(v15 - 1) = 0LL;
      uint64_t *v15 = v16;
      uint64_t v16 = v14++;
      v15 += 5;
    }

    while (v12 != v14);
  }

  size_t v10 = v12 - 1;
  v9[2] = v13;
  v9[3] = v12 - 1;
  v9[4] = v12;
LABEL_15:
  v17 = (void *)(v13 + 40 * v10);
  v17[1] = a3;
  v17[2] = a4;
  id result = a5;
  void *v17 = a2;
  v17[3] = result;
  v17[4] = 0x7FFFFFFFFFFFFFFFLL;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  if (v9[5] == 0x7FFFFFFFFFFFFFFFLL) {
    v9[5] = v10;
  }
  uint64_t v19 = v9[6];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(v9[2] + 40 * v19 + 32) = v10;
  }
  uint64_t v20 = v9[7] + 1LL;
  v9[6] = v10;
  v9[7] = v20;
  return result;
}

@end