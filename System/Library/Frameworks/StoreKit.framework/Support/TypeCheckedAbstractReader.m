@interface TypeCheckedAbstractReader
+ (id)_associatedReaderForObject:(id)a3;
+ (id)_predicateForKindOfClass:(Class)a3;
+ (void)_setAssociatedReader:(id)a3 forObject:(id)a4;
@end

@implementation TypeCheckedAbstractReader

+ (id)_associatedReaderForObject:(id)a3
{
  return objc_getAssociatedObject(a3, &unk_1002791B0);
}

+ (void)_setAssociatedReader:(id)a3 forObject:(id)a4
{
}

+ (id)_predicateForKindOfClass:(Class)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self isKindOfClass: %@",  a3);
}

@end