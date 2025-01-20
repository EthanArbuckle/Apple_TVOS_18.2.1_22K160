@interface DoStaticInit
@end

@implementation DoStaticInit

void ___DoStaticInit_block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sMaxAvailableMemoryForResourceValidation = [v0 estimatedAvailableMemoryForValidation];

  sAvailableMemoryForResourceValidation = sMaxAvailableMemoryForResourceValidation;
}

@end