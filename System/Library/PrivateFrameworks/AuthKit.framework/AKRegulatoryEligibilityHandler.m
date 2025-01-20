@interface AKRegulatoryEligibilityHandler
+ (id)regulatoryEligibilities;
+ (void)reportRegulatoryEligibilityStatusToIdMS;
@end

@implementation AKRegulatoryEligibilityHandler

+ (id)regulatoryEligibilities
{
  id v15 = 0LL;
  uint64_t all_domain_answers = os_eligibility_get_all_domain_answers(&v15, a2);
  if ((_DWORD)all_domain_answers)
  {
    int v3 = all_domain_answers;
    uint64_t v4 = _AKLogSystem(all_domain_answers);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10013BFB4(v3, v5);
    }
    v6 = 0LL;
  }

  else
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = (os_log_s *)v7;
    id v8 = v15;
    if (v15)
    {
      v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      v12 = sub_100089744;
      v13 = &unk_1001C9E90;
      v14 = v7;
      xpc_dictionary_apply(v8, &v10);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString ak_base64EncodedJsonFromObject:]( &OBJC_CLASS___NSString,  "ak_base64EncodedJsonFromObject:",  v5,  v10,  v11,  v12,  v13));
  }

  return v6;
}

+ (void)reportRegulatoryEligibilityStatusToIdMS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 primaryAuthKitAccount]);
  uint64_t v4 = _AKLogSystem(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Triggering liveness to report latest eligibility",  v7,  2u);
    }

    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
    -[os_log_s performCheckInForAccount:event:reason:completion:]( v5,  "performCheckInForAccount:event:reason:completion:",  v3,  AKPostDataEventLiveness,  8LL,  &stru_1001C9EB0);
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Skipping regulatory eligibility check since there is no primary AuthKit account",  buf,  2u);
  }
}

@end