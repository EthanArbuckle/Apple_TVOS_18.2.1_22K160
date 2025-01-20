@interface DaemonStartupTask
- (id)perform;
@end

@implementation DaemonStartupTask

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100009D94;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[DaemonStartupTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

@end