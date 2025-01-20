@interface LSGetFrontBoardOptionsDictionaryClasses
@end

@implementation LSGetFrontBoardOptionsDictionaryClasses

void ___LSGetFrontBoardOptionsDictionaryClasses_block_invoke()
{
  v7[2] = *MEMORY[0x1895F89C0];
  XNSGetPropertyListClasses();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v7 count:2];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setByAddingObjectsFromArray:v1];
  v3 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
  _LSGetFrontBoardOptionsDictionaryClasses_result = v2;

  uint64_t v4 = getBSServiceConnectionEndpointClass[0]();
  if (v4)
  {
    uint64_t v5 = [(id)_LSGetFrontBoardOptionsDictionaryClasses_result setByAddingObject:v4];
    v6 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v5;
  }

@end