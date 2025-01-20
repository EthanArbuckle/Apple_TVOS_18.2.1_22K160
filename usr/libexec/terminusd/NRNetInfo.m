@interface NRNetInfo
- (id)description;
- (void)dealloc;
@end

@implementation NRNetInfo

- (void)dealloc
{
  if (qword_1001DC690 != -1) {
    dispatch_once(&qword_1001DC690, &stru_1001AE298);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC688, 1LL))
  {
    if (qword_1001DC690 != -1) {
      dispatch_once(&qword_1001DC690, &stru_1001AE298);
    }
    _NRLogWithArgs(qword_1001DC688, 1LL, "%s%.30s:%-4d dealloc", ", "-[NRNetInfo dealloc]"", 113);
  }

  if (self)
  {
    self->_invalidated = 1;
    if (self->_evaluator)
    {
      nw_path_evaluator_cancel();
      evaluator = self->_evaluator;
      self->_evaluator = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRNetInfo;
  -[NRNetInfo dealloc](&v4, "dealloc");
}

- (id)description
{
  if (self)
  {
    if (self->_isIncoming && self->_forcedUpdateIdentifier) {
      v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @" (forced:%u)",  self->_forcedUpdateIdentifier);
    }
    else {
      v3 = &stru_1001B1528;
    }
    v5 = objc_alloc(&OBJC_CLASS___NSMutableString);
    unsigned int version = self->_version;
    unint64_t pathStatus = self->_pathStatus;
    if (pathStatus >= 4) {
      v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown(%u)",  self->_pathStatus);
    }
    else {
      v8 = (NSString *)*(&off_1001AE2B8 + pathStatus);
    }
    v9 = @"other";
    switch(self->_pathInterfaceType)
    {
      case 0u:
        break;
      case 1u:
        v9 = @"wifi";
        break;
      case 2u:
        v9 = @"cellular";
        break;
      case 3u:
        v9 = @"wired";
        break;
      case 4u:
        v9 = @"loopback";
        break;
      default:
        v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown(%u)",  self->_pathInterfaceType);
        break;
    }
  }

  else
  {
    v5 = objc_alloc(&OBJC_CLASS___NSMutableString);
    v8 = 0LL;
    unsigned int version = 0;
    v9 = 0LL;
    v3 = &stru_1001B1528;
  }

  v10 = -[NSMutableString initWithFormat:]( v5,  "initWithFormat:",  @"NRNetInfo:[v%d%@, %@, %@, ",  version,  v3,  v8,  v9);

  if (self)
  {
    unsigned int pathFlags = self->_pathFlags;
    if ((pathFlags & 1) != 0)
    {
      -[NSMutableString appendString:](v10, "appendString:", @"dns, ");
      unsigned int pathFlags = self->_pathFlags;
      if ((pathFlags & 2) == 0)
      {
LABEL_20:
        if ((pathFlags & 4) == 0) {
          goto LABEL_21;
        }
        goto LABEL_46;
      }
    }

    else if ((pathFlags & 2) == 0)
    {
      goto LABEL_20;
    }

    -[NSMutableString appendString:](v10, "appendString:", @"ipv4, ");
    unsigned int pathFlags = self->_pathFlags;
    if ((pathFlags & 4) == 0)
    {
LABEL_21:
      if ((pathFlags & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_47;
    }

- (void).cxx_destruct
{
}

@end