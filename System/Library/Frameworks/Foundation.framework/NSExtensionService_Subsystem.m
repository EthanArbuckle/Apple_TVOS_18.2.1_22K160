@interface NSExtensionService_Subsystem
+ (id)initForPlugInKit;
+ (id)sharedInstance;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
@end

@implementation NSExtensionService_Subsystem

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __46__NSExtensionService_Subsystem_sharedInstance__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C497300 != -1) {
    dispatch_once(&qword_18C497300, v3);
  }
  return (id)qword_18C4972F8;
}

+ (id)initForPlugInKit
{
  return +[NSExtensionService_Subsystem sharedInstance](&OBJC_CLASS___NSExtensionService_Subsystem, "sharedInstance");
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
}

@end