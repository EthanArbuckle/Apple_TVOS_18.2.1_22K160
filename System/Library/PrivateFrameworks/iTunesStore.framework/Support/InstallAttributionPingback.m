@interface InstallAttributionPingback
- (BOOL)isEqual:(id)a3;
- (InstallAttributionPingback)initWithAppAdamId:(id)a3 transactionId:(id)a4 campaignId:(id)a5 adNetworkId:(id)a6 attributionSignature:(id)a7 pingbackUrl:(id)a8 retryCount:(int64_t)a9 localTimestamp:(id)a10;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)localTimestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)transactionId;
- (NSURL)pingbackUrl;
- (id)description;
- (int64_t)retryCount;
@end

@implementation InstallAttributionPingback

- (InstallAttributionPingback)initWithAppAdamId:(id)a3 transactionId:(id)a4 campaignId:(id)a5 adNetworkId:(id)a6 attributionSignature:(id)a7 pingbackUrl:(id)a8 retryCount:(int64_t)a9 localTimestamp:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v50 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___InstallAttributionPingback;
  v22 = -[InstallAttributionPingback init](&v51, "init");
  if (v22)
  {
    v23 = (NSNumber *)[v16 copy];
    appAdamId = v22->_appAdamId;
    v22->_appAdamId = v23;

    v25 = (NSString *)[v17 copy];
    transactionId = v22->_transactionId;
    v22->_transactionId = v25;

    v27 = (NSNumber *)[v50 copy];
    campaignId = v22->_campaignId;
    v22->_campaignId = v27;

    v29 = (NSString *)[v18 copy];
    adNetworkId = v22->_adNetworkId;
    v22->_adNetworkId = v29;

    v31 = (NSString *)[v19 copy];
    attributionSignature = v22->_attributionSignature;
    v22->_attributionSignature = v31;

    v33 = (NSURL *)[v20 copy];
    pingbackUrl = v22->_pingbackUrl;
    v22->_pingbackUrl = v33;

    v22->_retryCount = a9;
    v35 = (NSNumber *)[v21 copy];
    localTimestamp = v22->_localTimestamp;
    v22->_localTimestamp = v35;

    if (!v22->_appAdamId
      || !v22->_transactionId
      || !v22->_campaignId
      || !v22->_adNetworkId
      || !v22->_attributionSignature
      || !v21
      || !v22->_pingbackUrl)
    {
      id v49 = v16;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v37) {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v38) = [v37 shouldLog];
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 OSLogObject]);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        uint64_t v38 = v38;
      }
      else {
        v38 &= 2u;
      }
      if ((_DWORD)v38)
      {
        id v40 = v20;
        id v41 = v19;
        id v42 = v17;
        v43 = (void *)objc_opt_class(v22);
        id v47 = v43;
        id v48 = v18;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback description](v22, "description"));
        int v52 = 138543618;
        v53 = v43;
        id v17 = v42;
        id v19 = v41;
        id v20 = v40;
        __int16 v54 = 2112;
        v55 = v44;
        v45 = (void *)_os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  16LL,  "[%{public}@]: One or more initializer arguments was nil: %@",  &v52,  22);

        id v18 = v48;
        if (!v45)
        {
LABEL_20:

          v22 = 0LL;
          id v16 = v49;
          goto LABEL_21;
        }

        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v45,  4LL));
        free(v45);
        SSFileLog(v37, @"%@");
      }

      goto LABEL_20;
    }
  }

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"appAdamId: %@, adNetworkId: %@, campaignId: %@, transactionId: %@, attributionSignature: %@, pingbackUrl: %@, retryCount: %ld, localTimestamp: %@",  self->_appAdamId,  self->_adNetworkId,  self->_campaignId,  self->_transactionId,  self->_attributionSignature,  self->_pingbackUrl,  self->_retryCount,  self->_localTimestamp);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    id v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback appAdamId](self, "appAdamId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appAdamId]);
    if ([v6 isEqual:v7])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback adNetworkId](self, "adNetworkId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 adNetworkId]);
      if ([v8 isEqual:v9])
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback campaignId](self, "campaignId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 campaignId]);
        if ([v10 isEqual:v11])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback pingbackUrl](self, "pingbackUrl"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v5 pingbackUrl]);
          v27 = v12;
          if ([v12 isEqual:v26])
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback transactionId](self, "transactionId"));
            v24 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionId]);
            v25 = v13;
            if ([v13 isEqual:v24])
            {
              uint64_t v14 = objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback attributionSignature](self, "attributionSignature"));
              uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 attributionSignature]);
              v23 = (void *)v14;
              id v16 = (void *)v14;
              id v17 = (void *)v15;
              if ([v16 isEqual:v15]
                && (id v21 = -[InstallAttributionPingback retryCount](self, "retryCount"),
                    v21 == [v5 retryCount]))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionPingback localTimestamp](self, "localTimestamp"));
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 localTimestamp]);
                unsigned __int8 v18 = [v22 isEqual:v20];
              }

              else
              {
                unsigned __int8 v18 = 0;
              }
            }

            else
            {
              unsigned __int8 v18 = 0;
            }
          }

          else
          {
            unsigned __int8 v18 = 0;
          }
        }

        else
        {
          unsigned __int8 v18 = 0;
        }
      }

      else
      {
        unsigned __int8 v18 = 0;
      }
    }

    else
    {
      unsigned __int8 v18 = 0;
    }
  }

  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (NSURL)pingbackUrl
{
  return self->_pingbackUrl;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSNumber)localTimestamp
{
  return self->_localTimestamp;
}

- (void).cxx_destruct
{
}

@end