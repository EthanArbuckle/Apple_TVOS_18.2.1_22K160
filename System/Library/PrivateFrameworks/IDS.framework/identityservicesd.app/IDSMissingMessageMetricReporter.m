@interface IDSMissingMessageMetricReporter
+ (void)sendMetric:(id)a3;
@end

@implementation IDSMissingMessageMetricReporter

+ (void)sendMetric:(id)a3
{
  id v3 = a3;
  if ([v3 shouldReportMetric])
  {
    v4 = objc_alloc(&OBJC_CLASS___IDSServerMessage);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
    v7 = -[IDSServerMessage initWithPayload:command:](v4, "initWithPayload:command:", v5, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDeliveryController sharedInstance](&OBJC_CLASS___IDSDeliveryController, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C55A0;
    v10[3] = &unk_1008F8A50;
    id v11 = v3;
    [v8 sendIDSMessage:v7 service:0 topic:v9 completionBlock:v10];
  }
}

@end