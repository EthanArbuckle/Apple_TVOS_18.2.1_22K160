@interface CPLCloudKitSetupTask
- (BOOL)shouldUpdateDisabledFeatures;
- (CPLCloudKitSetupTask)initWithController:(id)a3 updateDisabledFeatures:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchDerivativesFilter;
- (void)fetchDisabledFeatures;
- (void)fetchUserRecord;
- (void)runOperations;
@end

@implementation CPLCloudKitSetupTask

- (CPLCloudKitSetupTask)initWithController:(id)a3 updateDisabledFeatures:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLCloudKitSetupTask;
  v9 = -[CPLCloudKitBaseSetupTask initWithController:](&v13, "initWithController:", a3);
  if (v9)
  {
    id v10 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v10;

    v9->_shouldUpdateDisabledFeatures = a4;
  }

  return v9;
}

- (void)fetchDisabledFeatures
{
  id v14 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v14);
  id v4 = v14;
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayForKey:@"CPLDisabledFeatures"]);

    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_100044424();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Forcing disabled features: (%@)",  buf,  0xCu);
        }
      }

      (*((void (**)(void))self->_completionHandler + 2))();
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100044424();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching list of disabled features from server",  buf,  2u);
        }
      }

      v12 = objc_alloc_init(&OBJC_CLASS___CPLCKCheckFeatureAvailabilityOperation);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100044464;
      v13[3] = &unk_10023FB08;
      v13[4] = self;
      -[CPLCKCheckFeatureAvailabilityOperation setFeatureCheckAvailabilityCompletionBlock:]( v12,  "setFeatureCheckAvailabilityCompletionBlock:",  v13);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v12,  1LL,  0LL);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)fetchDerivativesFilter
{
  id v7 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v7);
  id v4 = v7;
  if ((v3 & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000446D4;
    v6[3] = &unk_10023FB30;
    v6[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCKResourceDownloadOperation fetchDerivativesUploadConfigurationWithCompletionBlock:]( &OBJC_CLASS___CPLCKResourceDownloadOperation,  "fetchDerivativesUploadConfigurationWithCompletionBlock:",  v6));
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v5,  1LL,  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)fetchUserRecord
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000448E8;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask fetchUserRecordIDFetchWithCompletionHandler:]( self,  "fetchUserRecordIDFetchWithCompletionHandler:",  v2);
}

- (void)runOperations
{
}

- (BOOL)shouldUpdateDisabledFeatures
{
  return self->_shouldUpdateDisabledFeatures;
}

- (void).cxx_destruct
{
}

@end