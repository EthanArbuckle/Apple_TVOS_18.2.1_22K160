@interface PurgeExpendableDataContainerContentForContainerClass
@end

@implementation PurgeExpendableDataContainerContentForContainerClass

uint64_t ___PurgeExpendableDataContainerContentForContainerClass_block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = -[MICandidateContainer initWithContainerURL:identifier:metadata:]( objc_alloc(&OBJC_CLASS___MICandidateContainer),  "initWithContainerURL:identifier:metadata:",  v9,  v8,  v7);

  [*(id *)(a1 + 32) addObject:v10];
  return 1LL;
}

uint64_t ___PurgeExpendableDataContainerContentForContainerClass_block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 identifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 identifier];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end