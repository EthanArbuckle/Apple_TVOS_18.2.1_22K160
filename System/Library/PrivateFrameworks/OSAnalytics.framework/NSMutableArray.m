@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __79__NSMutableArray_OSABinaryImageListExtension__sortByAddressAndSetInferredSizes__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 symbolInfo];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 start];
  [v5 symbolInfo];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= [v8 start])
  {
    [v4 symbolInfo];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 start];
    [v5 symbolInfo];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v11 != [v12 start];
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  return v9;
}

@end