@interface _TVCAPackage
- (id)substitutedClasses;
@end

@implementation _TVCAPackage

- (id)substitutedClasses
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVCAPackage;
  id v2 = -[_TVCAPackage substitutedClasses](&v6, "substitutedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 mutableCopy];

  [v4 setObject:objc_opt_class(NSNull) forKeyedSubscript:@"LKEventHandler"];
  return v4;
}

@end