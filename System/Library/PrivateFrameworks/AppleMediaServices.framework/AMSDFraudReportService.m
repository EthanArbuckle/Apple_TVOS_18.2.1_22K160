@interface AMSDFraudReportService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)_reportedScoreFromFSRDataString:(id)a3 error:(id *)a4;
- (void)performFraudReportRefreshWithOptions:(id)a3 completion:(id)a4;
@end

@implementation AMSDFraudReportService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)performFraudReportRefreshWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    uint64_t v14 = AMSLogKey(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    __int16 v30 = 2114;
    v31 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Running fraud report task.",  buf,  0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
  v17 = -[AMSDFraudReportPrivacyTask initWithBag:]( objc_alloc(&OBJC_CLASS___AMSDFraudReportPrivacyTask),  "initWithBag:",  v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionIdentifier]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 keyIdentifier]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDFraudReportPrivacyTask performBlindingWithTransactionID:keyID:]( v17,  "performBlindingWithTransactionID:keyID:",  v18,  v19));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001A148;
  v24[3] = &unk_1000D6440;
  v24[4] = self;
  id v25 = v6;
  id v26 = v16;
  id v27 = v7;
  id v21 = v16;
  id v22 = v6;
  id v23 = v7;
  [v20 resultWithCompletion:v24];
}

+ (id)_reportedScoreFromFSRDataString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", v5);

  -[NSScanner scanUpToString:intoString:](v6, "scanUpToString:intoString:", @"rs=", 0LL);
  if (!-[NSScanner isAtEnd](v6, "isAtEnd"))
  {
    -[NSScanner setScanLocation:]( v6,  "setScanLocation:",  (char *)[@"rs=" length] + -[NSScanner scanLocation](v6, "scanLocation"));
    unint64_t v11 = 0LL;
    if (-[NSScanner scanUnsignedLongLong:](v6, "scanUnsignedLongLong:", &v11))
    {
      if (!_os_feature_enabled_impl("AppleMediaServices", "FraudScoreReportResponseValidation")
        || v11 < 0x100)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
        goto LABEL_14;
      }

      if (a4)
      {
        id v7 = @"Reported score value is out of allowed range in fsrData string";
        goto LABEL_11;
      }
    }

    else if (a4)
    {
      id v7 = @"Reported score value not found in fsrData string";
      goto LABEL_11;
    }

@end