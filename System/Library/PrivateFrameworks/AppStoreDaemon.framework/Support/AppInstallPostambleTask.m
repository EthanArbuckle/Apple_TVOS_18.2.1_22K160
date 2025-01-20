@interface AppInstallPostambleTask
- (void)main;
@end

@implementation AppInstallPostambleTask

- (void)main
{
  if (!self) {
    goto LABEL_53;
  }
  id v3 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = [v4 isHRNMode];

  if (v5)
  {
    id v6 = sub_1001E26D0(self->super._error, (uint64_t)@"client_id");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    install = self->_install;
    if (install != (AppInstall *)3 && install != 0LL) {
      goto LABEL_12;
    }
    if ([@"dmd" isEqualToString:v7])
    {
      unsigned int v5 = 1;
    }

    else
    {
      if (!os_variant_has_internal_content("com.apple.appstored"))
      {
LABEL_12:
        unsigned int v5 = 0;
        goto LABEL_13;
      }

      unsigned int v5 = [@"asclient" isEqualToString:v7];
    }

- (void).cxx_destruct
{
}

@end