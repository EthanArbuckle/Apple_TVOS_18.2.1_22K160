@interface BKDisplayAnnotationDisplayController
- (BKDisplayAnnotationDisplayController)init;
@end

@implementation BKDisplayAnnotationDisplayController

- (BKDisplayAnnotationDisplayController)init
{
  v10.receiver = self;
  v10.super_class = [BKDisplayAnnotationDisplayController class];
  BKDisplayAnnotationDisplayController *v2 = [[BKDisplayAnnotationDisplayController alloc] init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    BKCADisplayMonitor *v4 = [[BKCADisplayMonitor alloc] init];
    id v5 = sub_10003F198();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    BKCADisplayMonitor *v7 = [[BKCADisplayMonitor alloc] initWithLog:v6];
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = v7;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end