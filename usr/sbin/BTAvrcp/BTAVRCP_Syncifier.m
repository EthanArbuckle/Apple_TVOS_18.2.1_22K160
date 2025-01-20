@interface BTAVRCP_Syncifier
- (BOOL)wait:(double)a3;
- (BTAVRCP_Syncifier)init;
- (NSCondition)condition;
- (id)createSwitcher;
- (unint64_t)pendingSwitchers;
- (void)setCondition:(id)a3;
- (void)setPendingSwitchers:(unint64_t)a3;
@end

@implementation BTAVRCP_Syncifier

- (BTAVRCP_Syncifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTAVRCP_Syncifier;
  v2 = -[BTAVRCP_Syncifier init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    condition = v2->_condition;
    v2->_condition = v3;

    v2->_pendingSwitchers = 0LL;
  }

  return v2;
}

- (id)createSwitcher
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003870;
  v4[3] = &unk_1000187A8;
  v4[4] = self;
  return objc_retainBlock(v4);
}

- (BOOL)wait:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
  [v5 lock];

  while (1)
  {
    unint64_t v6 = -[BTAVRCP_Syncifier pendingSwitchers](self, "pendingSwitchers");
    if (!v6) {
      break;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
    unsigned __int8 v8 = [v7 waitUntilDate:v4];

    if ((v8 & 1) == 0)
    {
      -[BTAVRCP_Syncifier setPendingSwitchers:](self, "setPendingSwitchers:", 0LL);
      break;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier condition](self, "condition"));
  [v9 unlock];

  return v6 == 0;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (unint64_t)pendingSwitchers
{
  return self->_pendingSwitchers;
}

- (void)setPendingSwitchers:(unint64_t)a3
{
  self->_pendingSwitchers = a3;
}

- (void).cxx_destruct
{
}

@end