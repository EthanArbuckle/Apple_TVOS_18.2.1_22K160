@interface _NSInflectionAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSInflectionAttributeDescriptor

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSNumber())
  {
    else {
      return 0LL;
    }
  }

  else if (_NSIsNSDictionary())
  {
    return  -[NSInflectionRuleExplicit initWithMorphology:]( objc_alloc(&OBJC_CLASS___NSInflectionRuleExplicit),  "initWithMorphology:",   -[NSMorphology _initWithExternalRepresentationDictionary:]( objc_alloc(&OBJC_CLASS___NSMorphology),  "_initWithExternalRepresentationDictionary:",  a3));
  }

  else
  {
    return 0LL;
  }

@end