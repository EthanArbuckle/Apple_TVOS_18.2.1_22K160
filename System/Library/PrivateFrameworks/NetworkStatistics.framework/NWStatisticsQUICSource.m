@interface NWStatisticsQUICSource
- (id)_currentSnapshot;
- (id)description;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
@end

@implementation NWStatisticsQUICSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  if (a4 < 0x158) {
    return 1;
  }
  if (self->_eventFlags != a5)
  {
    self->_eventFlags = a5;
    p_descriptor = &self->_descriptor;
    goto LABEL_7;
  }

  if (memcmp(&self->_descriptor, a3, 0x158uLL))
  {
    p_descriptor = &self->_descriptor;
LABEL_7:
    memcpy(p_descriptor, a3, sizeof(nstat_tcp_descriptor));
    return 3;
  }
  v9 = -[NWStatisticsSource manager](self, "manager");
  char v10 = [v9 mgrflags];

  if ((v10 & 4) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)_currentSnapshot
{
  return  -[NWSQUICSnapshot initWithCounts:QUICDescriptor:sourceIdent:events:seqno:provider:]( objc_alloc(&OBJC_CLASS___NWSQUICSnapshot),  "initWithCounts:QUICDescriptor:sourceIdent:events:seqno:provider:",  -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"),  &self->_descriptor,  -[NWStatisticsSource reference](self, "reference"),  self->_eventFlags,  -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"),  -[NWStatisticsSource provider](self, "provider"));
}

- (id)description
{
  __ret = 0LL;
  v3 = (_printf_domain *)printf_domain();
  asxprintf( &__ret,  v3,  0LL,  "NWSQUICSource %N<->%N@%I",  &self->_descriptor.local,  &self->_descriptor.remote,  self->_descriptor.ifindex);
  if (!__ret) {
    return 0LL;
  }
  [NSString stringWithCString:__ret encoding:4];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

@end