@interface _NSPersonNameComponentsStyleFormatterShortVariantGeneral
- (id)fallbackStyleFormatter;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterShortVariantGeneral

- (int64_t)shortNameFormat
{
  return 0LL;
}

- (id)fallbackStyleFormatter
{
  return  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShortNameSimpleFallback),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end