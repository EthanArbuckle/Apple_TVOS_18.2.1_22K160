@interface _NSPersonNameComponentsStyleFormatterShortNameSimpleFallback
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4;
@end

@implementation _NSPersonNameComponentsStyleFormatterShortNameSimpleFallback

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  if (!-[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](self, "fullComponentsAreValid:")) {
    return 0LL;
  }
  id v7 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:]( self,  "_formattedStringFromOrderedKeys:components:attributesByRange:",  -[_NSPersonNameComponentsStyleFormatter _orderedNonEmptyKeysFromComponents:]( self,  "_orderedNonEmptyKeysFromComponents:",  a3),  a3,  a4);
  if (!v7) {
    return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterMedium),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")),  "stringFromComponents:attributesByRange:",  a3,  a4);
  }
  v8 = v7;
  if (![v7 length]) {
    return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterMedium),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")),  "stringFromComponents:attributesByRange:",  a3,  a4);
  }
  return v8;
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"familyName",  @"givenName",  0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)fallbackStyleFormatter
{
  return  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterMedium),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end