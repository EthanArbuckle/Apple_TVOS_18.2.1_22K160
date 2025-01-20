@interface UIKit_PKSubsystem
+ (id)initForPlugInKit;
+ (id)initForPlugInKitWithOptions:(id)a3;
+ (id)sharedInstance;
- (BOOL)isPlugInKitProcess;
- (NSDictionary)infoDictionary;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
- (void)dealloc;
- (void)setInfoDictionary:(id)a3;
- (void)setPlugInKitProcess:(BOOL)a3;
@end

@implementation UIKit_PKSubsystem

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UIKit_PKSubsystem;
  -[UIKit_PKSubsystem dealloc](&v3, sel_dealloc);
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  block[6] = *MEMORY[0x1895F89C0];
  v6 = +[NSExtension globalStateQueueForExtension:](&OBJC_CLASS___NSExtension, "globalStateQueueForExtension:", 0LL, a4);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__UIKit_PKSubsystem_beginUsing_withBundle___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v6, block);
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__UIKit_PKSubsystem_sharedInstance__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C4972F0 != -1) {
    dispatch_once(&qword_18C4972F0, v3);
  }
  return (id)_MergedGlobals_154;
}

+ (id)initForPlugInKitWithOptions:(id)a3
{
  return +[UIKit_PKSubsystem initForPlugInKit](&OBJC_CLASS___UIKit_PKSubsystem, "initForPlugInKit", a3);
}

+ (id)initForPlugInKit
{
  id result = (id)[a1 sharedInstance];
  *((_BYTE *)result + 9) = 1;
  return result;
}

- (NSDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
}

- (BOOL)isPlugInKitProcess
{
  return self->_plugInKitProcess;
}

- (void)setPlugInKitProcess:(BOOL)a3
{
  self->_plugInKitProcess = a3;
}

@end