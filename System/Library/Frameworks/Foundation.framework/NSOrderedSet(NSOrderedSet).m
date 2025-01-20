@interface NSOrderedSet(NSOrderedSet)
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSOrderedSet;
- (uint64_t)initWithCoder:()NSOrderedSet;
@end

@implementation NSOrderedSet(NSOrderedSet)

+ (uint64_t)supportsSecureCoding
{
  return 1LL;
}

- (uint64_t)encodeWithCoder:()NSOrderedSet
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A20]);
  }
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSOrderedSets cannot be encoded by non-keyed coders" userInfo:0]);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a1);
        }
        [a3 encodeObject:*(void *)(*((void *)&v12 + 1) + 8 * v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object.%lu", v8 + v10) forKey];
        ++v10;
      }

      while (v7 != v10);
      uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v7 = result;
      v8 += v10;
    }

    while (result);
  }

  return result;
}

- (uint64_t)initWithCoder:()NSOrderedSet
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSOrderedSets cannot be decoded by non-keyed coders" userInfo:0]);
  }
  unint64_t v6 = 128LL;
  id v7 = NSAllocateObjectArray(0x80uLL);
  for (unint64_t i = 0LL; ; ++i)
  {
    if (v6 > i) {
      goto LABEL_6;
    }
    v6 *= 2LL;
    NSReallocateObjectArray(v7, v6);
    if (!v9) {
      break;
    }
    id v7 = v9;
LABEL_6:
    uint64_t v10 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.object.%lu", i);
    if (![a3 containsValueForKey:v10])
    {
      uint64_t v12 = -[objc_class initWithObjects:count:](a1, "initWithObjects:count:", v7, i);
      goto LABEL_12;
    }

    uint64_t v11 = [a3 decodeObjectForKey:v10];
    *((void *)v7 + i) = v11;
    if (!v11) {
      goto LABEL_11;
    }
  }

  __int128 v15 = @"NSLocalizedDescription";
  v16[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ordered set is too large to decode (%llu)",  _NSMethodExceptionProem(a1, a2),  v6);
  uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  *MEMORY[0x189604F40],  4864,  v13));
  id v7 = 0LL;
LABEL_11:
  uint64_t v12 = 0LL;
LABEL_12:
  free(v7);
  return v12;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1LL;
}

@end