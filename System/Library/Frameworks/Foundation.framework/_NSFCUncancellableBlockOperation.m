@interface _NSFCUncancellableBlockOperation
- (void)cancel;
@end

@implementation _NSFCUncancellableBlockOperation

- (void)cancel
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  v2 = (os_log_s *)qword_18C497138;
  if (os_log_type_enabled((os_log_t)qword_18C497138, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_INFO,  "Refusing to cancel a File Coordination-originating operation",  v3,  2u);
  }

@end