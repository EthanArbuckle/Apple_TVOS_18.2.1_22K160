@interface MigrationRequestTask
- (void)main;
@end

@implementation MigrationRequestTask

- (void)main
{
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v9 = response;
  id v4 = sub_1002539B8((uint64_t)&OBJC_CLASS___Migrator);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = -[ASDRequestResponse migrationType](v9, "migrationType");
  if (self)
  {
    id Property = objc_getProperty(self, v6, 64LL, 1);
    sub_100254188((uint64_t)v5, (uint64_t)v7, Property);

    LOBYTE(self->super.super._keepAlive) = 1;
  }

  else
  {
    sub_100254188((uint64_t)v5, (uint64_t)v7, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end