@interface DYGPUStatsReport
- (DYGPUStatsReport)init;
- (NSDictionary)lastStatsReport;
- (void)dealloc;
- (void)setup;
- (void)startCollectingStats;
- (void)stopCollectingStats;
@end

@implementation DYGPUStatsReport

- (DYGPUStatsReport)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYGPUStatsReport;
  return -[DYGPUStatsReport init](&v3, "init");
}

- (void)dealloc
{
  powerSubscription = self->_powerSubscription;
  if (powerSubscription)
  {
    CFRelease(powerSubscription);
    self->_powerSubscription = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DYGPUStatsReport;
  -[DYGPUStatsReport dealloc](&v4, "dealloc");
}

- (void)setup
{
  objc_super v3 = (NSMutableDictionary *)IOReportCopyChannelsInCategories(2LL, 0LL, 0LL);
  powerAllChannels = self->_powerAllChannels;
  self->_powerAllChannels = v3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100006224;
  v8[3] = &unk_10000C7C8;
  v8[4] = @"GPU Stats";
  v8[5] = @"GPU Performance States";
  if ((IOReportPrune(v3, v8) & 1) == 0)
  {
    v7 = 0LL;
    v5 = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0LL, v3, &v7, 0LL, 0LL);
    powerSubbedChannels = self->_powerSubbedChannels;
    self->_powerSubbedChannels = v7;
    self->_powerSubscription = v5;
  }

- (void)startCollectingStats
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  objc_super v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("reporting_queue", v4);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006328;
  v9[3] = &unk_10000C698;
  v9[4] = self;
  v6 = sub_100006004(1LL, v5, v9);
  v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v6);
  timer = self->_timer;
  self->_timer = v7;
}

- (void)stopCollectingStats
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    objc_super v4 = self->_timer;
    self->_timer = 0LL;
  }

- (NSDictionary)lastStatsReport
{
  return (NSDictionary *)self->_lastStatsReport;
}

- (void).cxx_destruct
{
}

@end