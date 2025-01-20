@interface CFBundleFollowParentLocalization
@end

@implementation CFBundleFollowParentLocalization

__CFBundle *__CFBundleFollowParentLocalization_block_invoke()
{
  result = (__CFBundle *)_CFBundleGetInfoDictionaryBoolean(@"CFBundleFollowParentLocalization");
  if ((_DWORD)result
    || (result = CFBundleGetMainBundle()) != 0LL
    && (result = CFBundleGetInfoDictionary(result)) != 0LL
    && (result = (__CFBundle *)CFDictionaryGetValue(result, @"NSExtension")) != 0LL)
  {
    CFBundleFollowParentLocalization_followParent = 1;
  }

  return result;
}

@end