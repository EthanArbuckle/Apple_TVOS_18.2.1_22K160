@interface NRCBScalablePipeConnectionState
- (id)description;
@end

@implementation NRCBScalablePipeConnectionState

- (id)description
{
  int state = self->_state;
  if (state == 1)
  {
    uint64_t v4 = 2LL;
  }

  else
  {
    if (state != 2)
    {
      v12 = @"<unknown>";
      goto LABEL_15;
    }

    uint64_t v4 = 3LL;
  }

  Class v5 = (&self->super.isa)[v4];
  uint64_t v6 = mach_continuous_time();
  double v9 = 0.0;
  if (v5) {
    BOOL v10 = v6 > (unint64_t)v5;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v11 = v6;
    if (qword_1001DC9F0 != -1) {
      dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
    }
    LODWORD(v7) = dword_1001DC9F8;
    LODWORD(v8) = *(_DWORD *)algn_1001DC9FC;
    double v9 = (double)(v11 - (unint64_t)v5) * (0.000000001 * (double)v7) / (double)v8;
  }

  v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%.2fs",  *(void *)&v9);
LABEL_15:
  v13 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t v14 = self->_state;
  if (v14 >= 3) {
    v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"UnknownType(%lld)",  v14);
  }
  else {
    v15 = (NSString *)*(&off_1001AE530 + v14);
  }
  v16 = -[NSString initWithFormat:](v13, "initWithFormat:", @"NRBTPipe[%@ %@]", v15, v12);

  return v16;
}

@end