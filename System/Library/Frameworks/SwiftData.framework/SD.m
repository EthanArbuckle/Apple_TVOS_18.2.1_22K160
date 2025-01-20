@interface SD
@end

@implementation SD

void ___SD_Initialize_framework_block_invoke()
{
  queue = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
  if (!dispatch_queue_get_specific(MEMORY[0x1895F8AE0], "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
  {
    Class context = objc_getClass("NSManagedObjectContext");
    if (context) {
      dispatch_queue_set_specific(queue, "com.apple.CoreData.NSManagedObjectContext.mainQueue", context, 0LL);
    }
  }

@end