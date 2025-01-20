@interface AppleIDAuthenticationFindPerson
@end

@implementation AppleIDAuthenticationFindPerson

void ___AppleIDAuthenticationFindPerson_block_invoke( uint64_t a1,  CFArrayRef theArray,  int a3,  const void *a4)
{
  if (theArray && (v8 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) != 0LL)
  {
    v9.length = CFArrayGetCount(theArray);
    v9.location = 0LL;
    CFArrayAppendArray(v8, theArray, v9);
  }

  else if (theArray)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreateMutableCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  theArray);
  }

  if (a4 && *(void *)(a1 + 40))
  {
    CFRetain(a4);
    **(void **)(a1 + 40) = a4;
  }

  if (a3) {
    dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 48));
  }
}

@end