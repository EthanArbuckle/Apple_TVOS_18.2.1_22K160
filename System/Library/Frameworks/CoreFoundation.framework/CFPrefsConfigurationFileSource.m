@interface CFPrefsConfigurationFileSource
- (CFPrefsConfigurationFileSource)initWithConfigurationPropertyList:(__CFDictionary *)a3 containingPreferences:(id)a4;
@end

@implementation CFPrefsConfigurationFileSource

- (CFPrefsConfigurationFileSource)initWithConfigurationPropertyList:(__CFDictionary *)a3 containingPreferences:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CFPrefsConfigurationFileSource;
  v5 = -[CFPrefsSource initWithContainingPreferences:](&v7, sel_initWithContainingPreferences_, a4);
  if (v5) {
    CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)mergeFunc, v5);
  }
  return v5;
}

@end