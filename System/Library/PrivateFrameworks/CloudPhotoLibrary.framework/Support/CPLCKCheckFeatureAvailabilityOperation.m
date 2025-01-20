@interface CPLCKCheckFeatureAvailabilityOperation
- (CPLCKCheckFeatureAvailabilityOperation)init;
- (id)featureCheckAvailabilityCompletionBlock;
- (void)setFeatureCheckAvailabilityCompletionBlock:(id)a3;
@end

@implementation CPLCKCheckFeatureAvailabilityOperation

- (CPLCKCheckFeatureAvailabilityOperation)init
{
  if (qword_100296050 != -1) {
    dispatch_once(&qword_100296050, &stru_10023F9D8);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 stringForKey:@"CPLCloudPhotosAvailabilityServiceName"]);

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLGenericOSLogDomain(v5);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Using custom CloudPhotosAvailability service: '%@'",  buf,  0xCu);
      }
    }
  }

  else
  {
    v4 = @"CloudPhotosAvailability";
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CPLCKFeatureAvailabilityResponse);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLCKCheckFeatureAvailabilityOperation;
  v9 = -[CPLCKCheckFeatureAvailabilityOperation initWithServiceName:functionName:responseClass:]( &v14,  "initWithServiceName:functionName:responseClass:",  v4,  @"checkFeatures",  v8);
  v10 = v9;
  if (v9)
  {
    -[CPLCKCheckFeatureAvailabilityOperation setRequest:](v9, "setRequest:", qword_100296048);
    objc_initWeak((id *)buf, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100042230;
    v12[3] = &unk_10023F9B8;
    objc_copyWeak(&v13, (id *)buf);
    -[CPLCKCheckFeatureAvailabilityOperation setCodeOperationCompletionBlock:]( v10,  "setCodeOperationCompletionBlock:",  v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  return v10;
}

- (id)featureCheckAvailabilityCompletionBlock
{
  return self->_featureCheckAvailabilityCompletionBlock;
}

- (void)setFeatureCheckAvailabilityCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end