@interface _NSPersonNameComponentsStyleFormatterLong
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
@end

@implementation _NSPersonNameComponentsStyleFormatterLong

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = +[NSPersonNameComponents _allComponents](&OBJC_CLASS___NSPersonNameComponents, "_allComponents");
    self->super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)fallbackStyleFormatter
{
  return  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterNicknameVariant),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end