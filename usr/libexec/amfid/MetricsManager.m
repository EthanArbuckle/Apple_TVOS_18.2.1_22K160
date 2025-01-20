@interface MetricsManager
+ (id)sharedInstance;
- (MetricsManager)init;
- (void)clean;
- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6;
- (void)report;
@end

@implementation MetricsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000907C;
  block[3] = &unk_10001CCB0;
  block[4] = a1;
  if (qword_100021390[0] != -1) {
    dispatch_once(qword_100021390, block);
  }
  return (id)qword_100021388;
}

- (MetricsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MetricsManager;
  v2 = -[MetricsManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC5amfid29ConstraintUsageMetricsManager);
    constraintUsageMetrics = v2->_constraintUsageMetrics;
    v2->_constraintUsageMetrics = v3;
  }

  return v2;
}

- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6
{
}

- (void)clean
{
}

- (void)report
{
}

- (void).cxx_destruct
{
}

@end