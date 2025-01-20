@interface ResetRequesterAccountTask
- (id)perform;
@end

@implementation ResetRequesterAccountTask

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000175AC;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[ResetRequesterAccountTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

@end