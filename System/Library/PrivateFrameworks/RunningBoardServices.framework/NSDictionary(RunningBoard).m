@interface NSDictionary(RunningBoard)
- (id)entriesToStringWithIndent:()RunningBoard debug:;
@end

@implementation NSDictionary(RunningBoard)

- (id)entriesToStringWithIndent:()RunningBoard debug:
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  [MEMORY[0x189607940] string];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __62__NSDictionary_RunningBoard__entriesToStringWithIndent_debug___block_invoke;
  v9[3] = &unk_189DE0AF8;
  v9[4] = &v12;
  int v10 = a3;
  char v11 = a4;
  [a1 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end