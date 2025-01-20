@interface MCObjectLight
+ (id)objectWithImprint:(id)a3;
- (id)imprint;
@end

@implementation MCObjectLight

+ (id)objectWithImprint:(id)a3
{
  id result = NSClassFromString((NSString *)[a3 objectForKey:@"type"]);
  if (result) {
    return [objc_alloc((Class)result) initWithImprint:a3];
  }
  return result;
}

- (id)imprint
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  NSStringFromClass(v2),  @"type",  0LL);
}

@end