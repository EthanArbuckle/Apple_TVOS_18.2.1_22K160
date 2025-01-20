@interface ODRApplicationCleanTask
- (void)main;
@end

@implementation ODRApplicationCleanTask

- (void)main
{
  id v3 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002B5110;
  v5[3] = &unk_1003E9880;
  v5[4] = self;
  sub_1002FEED4(v4, v5);
}

- (void).cxx_destruct
{
}

@end