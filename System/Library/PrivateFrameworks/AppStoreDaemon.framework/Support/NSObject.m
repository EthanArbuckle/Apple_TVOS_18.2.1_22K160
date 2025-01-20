@interface NSObject
- (id)_tcr_associatedReader;
- (void)_tcr_associateWithReader:(id)a3;
@end

@implementation NSObject

- (void)_tcr_associateWithReader:(id)a3
{
  v4 = self;
  id value = a3;
  objc_opt_self(&OBJC_CLASS___TypeCheckedAbstractReader);
  objc_setAssociatedObject(v4, &unk_10038A8A8, value, (void *)0x301);
}

- (id)_tcr_associatedReader
{
  v2 = self;
  objc_opt_self(&OBJC_CLASS___TypeCheckedAbstractReader);
  id AssociatedObject = objc_getAssociatedObject(v2, &unk_10038A8A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  return v4;
}

@end