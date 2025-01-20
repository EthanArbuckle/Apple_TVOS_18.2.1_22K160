@interface DMDUserSwitchStakeholder
+ (id)sharedStakeholder;
- (BOOL)inEDUMode;
@end

@implementation DMDUserSwitchStakeholder

+ (id)sharedStakeholder
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050C74;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCE18 != -1) {
    dispatch_once(&qword_1000CCE18, block);
  }
  return (id)qword_1000CCE10;
}

- (BOOL)inEDUMode
{
  return 0;
}

@end