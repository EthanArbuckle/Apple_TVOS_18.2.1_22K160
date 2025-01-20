@interface _NSAssumedFallbackInflectionAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSAssumedFallbackInflectionAttributeDescriptor

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSDictionary()) {
    return  -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "initWithExternalRepresentationDictionary:error:",  a3,  0LL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0LL;
    }
  }

  return a3;
}

@end