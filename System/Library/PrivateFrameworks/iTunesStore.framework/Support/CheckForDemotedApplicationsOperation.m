@interface CheckForDemotedApplicationsOperation
- (BOOL)hasDemotedApplications;
- (CheckForDemotedApplicationsOperation)init;
- (void)run;
@end

@implementation CheckForDemotedApplicationsOperation

- (CheckForDemotedApplicationsOperation)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CheckForDemotedApplicationsOperation;
  v2 = -[CheckForDemotedApplicationsOperation init](&v4, "init");
  if (v2) {
    NSLog(@"here in init");
  }
  return v2;
}

- (void)run
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10015F2D0;
  v4[3] = &unk_10034C5D8;
  v4[4] = &v5;
  [v3 enumerateBundlesOfType:0 block:v4];

  self->_hasDemotedApplications = *((_BYTE *)v6 + 24);
  -[CheckForDemotedApplicationsOperation setError:](self, "setError:", 0LL);
  -[CheckForDemotedApplicationsOperation setSuccess:](self, "setSuccess:", 1LL);
  _Block_object_dispose(&v5, 8);
}

- (BOOL)hasDemotedApplications
{
  return self->_hasDemotedApplications;
}

@end