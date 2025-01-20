@interface InstallAppReviewAppsTask
- (void)main;
@end

@implementation InstallAppReviewAppsTask

- (void)main
{
  id v3 = sub_1002B86C0(*(id *)&self->super._success, &stru_1003F09A0);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002A4054;
  v11[3] = &unk_1003EA9D8;
  v11[4] = self;
  [v5 modifyUsingTransaction:v11];

  id v6 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10023C018((uint64_t)v7, 64LL);

  -[Task lock](self, "lock");
  v8 = (NSError *)[v10 copy];
  error = self->super._error;
  self->super._error = v8;

  -[Task unlock](self, "unlock");
}

- (void).cxx_destruct
{
}

@end