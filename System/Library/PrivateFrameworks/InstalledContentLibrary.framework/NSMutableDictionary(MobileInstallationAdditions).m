@interface NSMutableDictionary(MobileInstallationAdditions)
+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:;
@end

@implementation NSMutableDictionary(MobileInstallationAdditions)

+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_18C677180;
  objc_msgSendSuper2(&v5, sel_MI_dictionaryWithContentsOfURL_options_error_, a3, a4 | 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end