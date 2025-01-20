@interface NSAttributedString(CSVisualizerMethods)
- (id)cs_rangesMatchingPredicate:()CSVisualizerMethods;
- (uint64_t)cs_writeToFileHandle:()CSVisualizerMethods;
- (void)cs_writeToFileHandle:()CSVisualizerMethods supportingANSIEscapeCodes:;
@end

@implementation NSAttributedString(CSVisualizerMethods)

- (uint64_t)cs_writeToFileHandle:()CSVisualizerMethods
{
  int v5 = fileno(a3);
  if (v5 < 0 || !isatty(v5))
  {
    BOOL v6 = 0LL;
  }

  else
  {
    if (-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once != -1) {
      dispatch_once( &-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once,  &__block_literal_global_640);
    }
    BOOL v6 = -[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::TERM != 0;
  }

  return objc_msgSend(a1, "cs_writeToFileHandle:supportingANSIEscapeCodes:", a3, v6);
}

- (void)cs_writeToFileHandle:()CSVisualizerMethods supportingANSIEscapeCodes:
{
  if (a4)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __90__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle_supportingANSIEscapeCodes___block_invoke;
    v10[3] = &unk_189D66828;
    v10[4] = a1;
    v10[5] = a3;
    BOOL v6 = (void *)MEMORY[0x186E27CB8](v10);
    v7 = (void *)MEMORY[0x186E27B50]();
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(a1, "length"), 0, v6);
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    v8 = (void *)MEMORY[0x186E27B50]();
    id v9 = [a1 string];
    fputs((const char *)[v9 UTF8String], a3);

    objc_autoreleasePoolPop(v8);
  }

- (id)cs_rangesMatchingPredicate:()CSVisualizerMethods
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x186E27B50]();
  [MEMORY[0x189603FA8] array];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0LL;
  v13 = 0LL;
  uint64_t v14 = 0LL;
  +[_CSVisualizerPredicate getRanges:matchingPredicate:inDescription:]( &OBJC_CLASS____CSVisualizerPredicate,  "getRanges:matchingPredicate:inDescription:",  &__p,  v4,  a1);
  v7 = __p;
  v8 = v13;
  if (__p != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x189607B18], "valueWithRange:", *v7, v7[1]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v9];

      v7 += 2;
    }

    while (v7 != v8);
  }

  v10 = (void *)[v6 copy];
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  objc_autoreleasePoolPop(v5);
  return v10;
}

@end