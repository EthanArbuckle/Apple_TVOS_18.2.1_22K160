@interface NRNWActivityReporter
- (id)description;
- (void)dealloc;
@end

@implementation NRNWActivityReporter

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self->_started) {
    v4 = "";
  }
  else {
    v4 = "!";
  }
  return  -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"[%llu %sreporting %@]",  self->_identifier,  v4,  self->_nrUUID);
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRNWActivityReporter *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    _NRLogWithArgs(v9, 1LL, "%s%.30s:%-4d %@: dealloc", ", "-[NRNWActivityReporter dealloc]"", 63LL, v2);
  }

  if (v2)
  {
    v2->_started = 0;
    objc_setProperty_nonatomic_copy(v2, v5, 0LL, 40LL);
    v10 = v2->_nrUUID;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRNWActivityReporter description](v2, "description"));
    sub_10011BB18(v10, 40003, v11, 0LL);
  }

  v12.receiver = v2;
  v12.super_class = (Class)&OBJC_CLASS___NRNWActivityReporter;
  -[NRNWActivityReporter dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
}

@end