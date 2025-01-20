@interface SUCoreConnectConstants
+ (id)defaultClasses;
@end

@implementation SUCoreConnectConstants

+ (id)defaultClasses
{
  v3[14] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:14];
  return (id)objc_claimAutoreleasedReturnValue();
}

@end