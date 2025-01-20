@interface AWDMetricsServerInterface
- (AWDMetricsServerInterface)init;
- (AWDServerConnection)awdServerConnection;
- (BOOL)setupAWDMetricsServerConnections;
- (OS_dispatch_queue)msgQueue;
- (void)handleMetricQuery:(unsigned int)a3;
- (void)setAwdServerConnection:(id)a3;
- (void)setMsgQueue:(id)a3;
@end

@implementation AWDMetricsServerInterface

- (AWDMetricsServerInterface)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AWDMetricsServerInterface;
  v2 = -[AWDMetricsServerInterface init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Flagstone.analytics.awd.queue", v4);
    msgQueue = v2->_msgQueue;
    v2->_msgQueue = (OS_dispatch_queue *)v5;

    if (v2->_msgQueue)
    {
      v7 = sub_1000160F4("com.apple.wpantund.awd", "default");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : init - Message Queue setup",  v18,  2u);
      }

      v9 = -[AWDServerConnection initWithComponentId:andBlockOnConfiguration:]( objc_alloc(&OBJC_CLASS___AWDServerConnection),  "initWithComponentId:andBlockOnConfiguration:",  137LL,  1LL);
      awdServerConnection = v2->_awdServerConnection;
      v2->_awdServerConnection = v9;

      if (v2->_awdServerConnection)
      {
        v11 = sub_1000160F4("com.apple.wpantund.awd", "default");
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : init - AWD Server Connection setup",  v18,  2u);
        }

        -[AWDMetricsServerInterface setupAWDMetricsServerConnections](v2, "setupAWDMetricsServerConnections");
        goto LABEL_9;
      }

      v16 = sub_1000160F4("com.apple.wpantund.awd", "default");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10021013C();
      }
    }

    else
    {
      v14 = sub_1000160F4("com.apple.wpantund.awd", "default");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100210110();
      }
    }

    v13 = 0LL;
    goto LABEL_15;
  }

- (BOOL)setupAWDMetricsServerConnections
{
  awdServerConnection = self->_awdServerConnection;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100103E9C;
  v40[3] = &unk_1002B3660;
  v40[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( awdServerConnection,  "registerQueriableMetric:callback:",  8978433LL,  v40) & 1) != 0)
  {
    v4 = sub_1000160F4("com.apple.wpantund.awd", "default");
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_EngagementMetrics",  buf,  2u);
    }
  }

  else
  {
    v6 = sub_1000160F4("com.apple.wpantund.awd", "default");
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100210270();
    }
  }

  v7 = self->_awdServerConnection;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100103FBC;
  v38[3] = &unk_1002B3660;
  v38[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( v7,  "registerQueriableMetric:callback:",  8978434LL,  v38) & 1) != 0)
  {
    v8 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_NetworkRadioMetrics",  buf,  2u);
    }
  }

  else
  {
    v10 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100210244();
    }
  }

  v11 = self->_awdServerConnection;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1001040DC;
  v37[3] = &unk_1002B3660;
  v37[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( v11,  "registerQueriableMetric:callback:",  8978435LL,  v37) & 1) != 0)
  {
    v12 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_MACMetrics",  buf,  2u);
    }
  }

  else
  {
    v14 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100210218();
    }
  }

  v15 = self->_awdServerConnection;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001041FC;
  v36[3] = &unk_1002B3660;
  v36[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( v15,  "registerQueriableMetric:callback:",  8978436LL,  v36) & 1) != 0)
  {
    v16 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_CoexMetrics",  buf,  2u);
    }
  }

  else
  {
    v18 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002101EC();
    }
  }

  objc_super v19 = self->_awdServerConnection;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10010431C;
  v35[3] = &unk_1002B3660;
  v35[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( v19,  "registerQueriableMetric:callback:",  8978437LL,  v35) & 1) != 0)
  {
    v20 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_IPMLEMetrics",  buf,  2u);
    }
  }

  else
  {
    v22 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1002101C0();
    }
  }

  v23 = self->_awdServerConnection;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10010443C;
  v34[3] = &unk_1002B3660;
  v34[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:]( v23,  "registerQueriableMetric:callback:",  8978439LL,  v34) & 1) != 0)
  {
    v24 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_PowerMetrics",  buf,  2u);
    }
  }

  else
  {
    v26 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100210194();
    }
  }

  v27 = self->_awdServerConnection;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10010455C;
  v33[3] = &unk_1002B3660;
  v33[4] = self;
  unsigned __int8 v28 = -[AWDServerConnection registerQueriableMetric:callback:]( v27,  "registerQueriableMetric:callback:",  8978440LL,  v33);
  if ((v28 & 1) != 0)
  {
    v29 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_TopologyMetrics",  buf,  2u);
    }
  }

  else
  {
    v31 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100210168();
    }
  }

  return v28;
}

- (void)handleMetricQuery:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 8978440 && (sub_1000E7FB4(self, a2) & 1) == 0)
  {
    v16 = sub_1000160F4("com.apple.wpantund.awd", "default");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v41[0] = 67109120;
      v41[1] = 8978440;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AWDMetricsServerInterface : handleMetricQuery with metricId %d return here as topology not modified",  (uint8_t *)v41,  8u);
    }
  }

  else
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
    v6 = (os_log_s *)[v5 newMetricContainerWithIdentifier:v3];

    if (v6)
    {
      v7 = 0LL;
      v8 = off_1002AC340;
      switch((int)v3)
      {
        case 8978433:
          goto LABEL_14;
        case 8978434:
          v8 = off_1002AC358;
          goto LABEL_14;
        case 8978435:
          v8 = off_1002AC350;
          goto LABEL_14;
        case 8978436:
          v8 = off_1002AC338;
          goto LABEL_14;
        case 8978437:
          v8 = off_1002AC348;
          goto LABEL_14;
        case 8978439:
          v8 = &off_1002AC360;
LABEL_14:
          v7 = (AWDFlagstoneTopologyMetrics *)objc_opt_new(*v8);
          goto LABEL_19;
        case 8978440:
          v7 = objc_opt_new(&OBJC_CLASS___AWDFlagstoneTopologyMetrics);
          goto LABEL_16;
        default:
LABEL_16:
          v17 = sub_1000160F4("com.apple.wpantund.awd", "default");
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100210364(v3, v18, v19, v20, v21, v22, v23, v24);
          }

LABEL_19:
          if (v7)
          {
            switch((int)v3)
            {
              case 8978433:
                sub_1000E48C4(v7);
                sub_1000E73C4();
                -[os_log_s setMetric:](v6, "setMetric:", v7);
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v25 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_100081BB8(v7);
                }
                goto LABEL_36;
              case 8978434:
                sub_1000E4F9C(v7);
                sub_1000E75C4();
                -[os_log_s setMetric:](v6, "setMetric:", v7);
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v30 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_1000828F0(v7);
                }
                goto LABEL_36;
              case 8978435:
                sub_1000E5E44(v7);
                sub_1000E7B40();
                -[os_log_s setMetric:](v6, "setMetric:", v7);
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v27 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_100084EB4(v7);
                }
                goto LABEL_36;
              case 8978436:
                sub_1000E6864(v7);
                sub_1000E7D38();
                -[os_log_s setMetric:](v6, "setMetric:", v7);
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v31 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_100086B98(v7);
                }
                goto LABEL_36;
              case 8978437:
                sub_1000E6C78(v7);
                sub_1000E7E30();
                -[os_log_s setMetric:](v6, "setMetric:", v7);
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v32 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_100087CE8(v7);
                }
                goto LABEL_36;
              case 8978439:
                sub_1000E72E4(v7);
                -[os_log_s setMetric:](v6, "setMetric:", v7, sub_1000E7FA8());
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v29 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_1000889B0(v7);
                }
                goto LABEL_36;
              default:
                if ((_DWORD)v3 != 8978440) {
                  goto LABEL_40;
                }
                sub_1000E7FB8(v7);
                -[os_log_s setMetric:](v6, "setMetric:", v7, sub_1000E8050());
                unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(-[AWDMetricsServerInterface awdServerConnection](self, "awdServerConnection"));
                unsigned __int8 v26 = [v28 submitMetric:v6];

                if (byte_1002C97C8) {
                  sub_1000891C0(v7);
                }
LABEL_36:
                if ((v26 & 1) == 0)
                {
                  v33 = sub_1000160F4("com.apple.wpantund.awd", "default");
                  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                    sub_100210300(v3, v34, v35, v36, v37, v38, v39, v40);
                  }
                }

                break;
            }
          }

          break;
      }
    }

    else
    {
      v9 = sub_1000160F4("com.apple.wpantund.awd", "default");
      v7 = (AWDFlagstoneTopologyMetrics *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_10021029C(v3, (os_log_s *)v7, v10, v11, v12, v13, v14, v15);
      }
    }

- (OS_dispatch_queue)msgQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMsgQueue:(id)a3
{
}

- (AWDServerConnection)awdServerConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAwdServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end