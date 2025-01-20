@interface KTPendingFlag
- (KTFlagString)flag;
- (KTNearFutureScheduler)scheduler;
- (KTPendingFlag)initWithFlag:(id)a3 after:(id)a4;
- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4;
- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 after:(id)a5;
- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 delayInSeconds:(double)a5;
- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 scheduler:(id)a5;
- (KTPendingFlag)initWithFlag:(id)a3 delayInSeconds:(double)a4;
- (KTPendingFlag)initWithFlag:(id)a3 scheduler:(id)a4;
- (NSDate)fireTime;
- (NSOperation)afterOperation;
- (id)description;
- (unint64_t)conditions;
- (void)setAfterOperation:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation KTPendingFlag

- (KTPendingFlag)initWithFlag:(id)a3 delayInSeconds:(double)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTPendingFlag;
  v8 = -[KTPendingFlag init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_flag, a3);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a4));
    fireTime = v9->_fireTime;
    v9->_fireTime = (NSDate *)v10;

    afterOperation = v9->_afterOperation;
    v9->_afterOperation = 0LL;

    v9->_conditions = 0LL;
  }

  return v9;
}

- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4
{
  return -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( self,  "initWithFlag:conditions:delayInSeconds:",  a3,  a4,  0.0);
}

- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 delayInSeconds:(double)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___KTPendingFlag;
  uint64_t v10 = -[KTPendingFlag init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_flag, a3);
    if (a5 <= 0.0)
    {
      fireTime = v11->_fireTime;
      v11->_fireTime = 0LL;
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a5));
      fireTime = v11->_fireTime;
      v11->_fireTime = (NSDate *)v12;
    }

    afterOperation = v11->_afterOperation;
    v11->_afterOperation = 0LL;

    v11->_conditions = a4;
  }

  return v11;
}

- (KTPendingFlag)initWithFlag:(id)a3 after:(id)a4
{
  return -[KTPendingFlag initWithFlag:conditions:after:](self, "initWithFlag:conditions:after:", a3, 0LL, a4);
}

- (KTPendingFlag)initWithFlag:(id)a3 scheduler:(id)a4
{
  return -[KTPendingFlag initWithFlag:conditions:scheduler:](self, "initWithFlag:conditions:scheduler:", a3, 0LL, a4);
}

- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 scheduler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [v10 trigger];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KTPendingFlag;
  v11 = -[KTPendingFlag init](&v17, "init");
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0LL;

    objc_storeStrong((id *)&v12->_scheduler, a5);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 operationDependency]);
    afterOperation = v12->_afterOperation;
    v12->_afterOperation = (NSOperation *)v14;

    v12->_conditions = a4;
  }

  return v12;
}

- (KTPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___KTPendingFlag;
  v11 = -[KTPendingFlag init](&v15, "init");
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0LL;

    objc_storeStrong((id *)&v12->_afterOperation, a5);
    v12->_conditions = a4;
  }

  return v12;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag fireTime](self, "fireTime"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag flag](self, "flag"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTPendingFlag fireTime](self, "fireTime"));
LABEL_3:
    v6 = (void *)v5;
    id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTPendingFlag: %@: %@>",  v4,  v5);
    goto LABEL_4;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag afterOperation](self, "afterOperation"));

  if (!v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag flag](self, "flag"));
    objc_super v15 = sub_10013BDAC(-[KTPendingFlag conditions](self, "conditions"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_3;
  }

  unint64_t v11 = -[KTPendingFlag conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag flag](self, "flag"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[KTPendingFlag afterOperation](self, "afterOperation"));
  v6 = (void *)v12;
  if (v11)
  {
    v13 = sub_10013BDAC(-[KTPendingFlag conditions](self, "conditions"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTPendingFlag: %@: %@ %@>",  v4,  v6,  v14));

    goto LABEL_5;
  }

  id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTPendingFlag: %@: %@>",  v4,  v12);
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_5:

  return v8;
}

- (KTFlagString)flag
{
  return (KTFlagString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSDate)fireTime
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)conditions
{
  return self->_conditions;
}

- (NSOperation)afterOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAfterOperation:(id)a3
{
}

- (KTNearFutureScheduler)scheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end