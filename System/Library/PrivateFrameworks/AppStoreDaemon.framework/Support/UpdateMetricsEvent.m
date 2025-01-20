@interface UpdateMetricsEvent
- (UpdateMetricsEvent)initWithTopic:(id)a3;
- (id)description;
@end

@implementation UpdateMetricsEvent

- (UpdateMetricsEvent)initWithTopic:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UpdateMetricsEvent;
  v3 = -[UpdateMetricsEvent initWithTopic:](&v7, "initWithTopic:", a3);
  v4 = v3;
  if (v3)
  {
    -[UpdateMetricsEvent setEventType:](v3, "setEventType:", @"autoUpdateMetrics");
    objc_opt_self(&OBJC_CLASS___UpdateMetricsEvent);
    if (qword_100462308 != -1) {
      dispatch_once(&qword_100462308, &stru_1003ECB30);
    }
    id v5 = (id)qword_100462310;
    -[UpdateMetricsEvent addPropertiesWithDictionary:](v4, "addPropertiesWithDictionary:", v5);
  }

  return v4;
}

- (id)description
{
  if (self)
  {
    double meanTimeToDiscovery = self->_meanTimeToDiscovery;
    double meanTimeToTransaction = self->_meanTimeToTransaction;
    double meanTimeToDownload = self->_meanTimeToDownload;
    double meanTimeToInstall = self->_meanTimeToInstall;
    double averageTimeBetweenPolls = self->_averageTimeBetweenPolls;
  }

  else
  {
    double meanTimeToInstall = 0.0;
    double meanTimeToTransaction = 0.0;
    double meanTimeToDiscovery = 0.0;
    double meanTimeToDownload = 0.0;
    double averageTimeBetweenPolls = 0.0;
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ meanToDiscover: %f meanToTransaction: %f meanToDownload: %f meanToInstall: %f averageTimeBetweenPolls: %f }",  *(void *)&meanTimeToDiscovery,  *(void *)&meanTimeToTransaction,  *(void *)&meanTimeToDownload,  *(void *)&meanTimeToInstall,  *(void *)&averageTimeBetweenPolls);
}

- (void).cxx_destruct
{
}

@end