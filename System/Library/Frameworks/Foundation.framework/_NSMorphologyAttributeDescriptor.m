@interface _NSMorphologyAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSMorphologyAttributeDescriptor

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSDictionary()) {
    return  -[NSMorphology _initWithExternalRepresentationDictionary:]( objc_alloc(&OBJC_CLASS___NSMorphology),  "_initWithExternalRepresentationDictionary:",  a3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return a3;
  }
  else {
    return 0LL;
  }
}

@end