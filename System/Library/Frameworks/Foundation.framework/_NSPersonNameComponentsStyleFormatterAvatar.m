@interface _NSPersonNameComponentsStyleFormatterAvatar
- (BOOL)shouldFallBack;
- (id)fallbackStyleFormatter;
@end

@implementation _NSPersonNameComponentsStyleFormatterAvatar

- (id)fallbackStyleFormatter
{
  int64_t v3 = -[_NSPersonNameComponentsStyleFormatter ordering](self, "ordering");
  v4 = off_189C62260;
  if (v3 != 1) {
    v4 = off_189C62270;
  }
  return (id)objc_msgSend( objc_alloc(*v4),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

- (BOOL)shouldFallBack
{
  return 1;
}

@end