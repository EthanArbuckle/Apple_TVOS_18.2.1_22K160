@interface LSEncodeURLPropertyDictionary
@end

@implementation LSEncodeURLPropertyDictionary

void ___LSEncodeURLPropertyDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  _LSReplaceURLPropertyValueForEncoding(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

@end