@interface NetworkPathFinder
+ (id)getNetworkPath;
- (OS_dispatch_queue)noMonitorQueue;
- (void)setNoMonitorQueue:(id)a3;
@end

@implementation NetworkPathFinder

+ (id)getNetworkPath
{
  default_evaluator = (void *)nw_path_create_default_evaluator();
  v3 = (void *)nw_path_evaluator_copy_path();

  return v3;
}

- (OS_dispatch_queue)noMonitorQueue
{
  return self->_noMonitorQueue;
}

- (void)setNoMonitorQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end