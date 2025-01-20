@interface CPLCloudKitRampingRequestTask
- (BOOL)_shouldSkipRampingRequest;
- (CPLCloudKitRampingRequestTask)initWithController:(id)a3 resourceType:(unint64_t)a4 numRequested:(unint64_t)a5 completionHandler:(id)a6;
- (double)timeoutIntervalForRequest;
- (void)runOperations;
@end

@implementation CPLCloudKitRampingRequestTask

- (CPLCloudKitRampingRequestTask)initWithController:(id)a3 resourceType:(unint64_t)a4 numRequested:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLCloudKitRampingRequestTask;
  v11 = -[CPLCloudKitTransportTask initWithController:](&v16, "initWithController:", a3);
  v12 = v11;
  if (v11)
  {
    v11->_resourceType = a4;
    v11->_numRequested = a5;
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;

    -[CPLCloudKitTransportTask setBoostable:](v12, "setBoostable:", 0LL);
  }

  return v12;
}

- (double)timeoutIntervalForRequest
{
  return 30.0;
}

- (BOOL)_shouldSkipRampingRequest
{
  if (qword_1002962A0 != -1) {
    dispatch_once(&qword_1002962A0, &stru_100240EA0);
  }
  return byte_100296298;
}

- (void)runOperations
{
  if (-[CPLCloudKitRampingRequestTask _shouldSkipRampingRequest](self, "_shouldSkipRampingRequest"))
  {
    (*((void (**)(id, uint64_t, void, void))self->_completionHandler + 2))( self->_completionHandler,  1LL,  0LL,  0LL);
    return;
  }

  id v22 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v22);
  id v4 = v22;
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    unsigned __int8 v6 = [v5 isNetworkConnected];

    if ((v6 & 1) != 0)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___CPLRampingRequestResource);
      id v8 = sub_1000896D4((uint64_t)&OBJC_CLASS___CPLCloudKitResourceKeys, self->_resourceType);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = sub_100031F10((uint64_t)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v7 setResource:v11];

      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 resource]);
      if (v12)
      {
        [v7 setNumRequested:self->_numRequested];
        id v13 = objc_alloc_init(&OBJC_CLASS___CPLRampingRequest);
        -[CPLRampingRequest addRequest:](v13, "addRequest:", v7);
        v14 = -[CKCodeOperation initWithServiceName:functionName:responseClass:]( objc_alloc(&OBJC_CLASS___CKCodeOperation),  "initWithServiceName:functionName:responseClass:",  @"Ramping",  @"request",  objc_opt_class(&OBJC_CLASS___CPLRampingResponse));
        -[CKCodeOperation setRequest:](v14, "setRequest:", v13);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10006AC9C;
        v21[3] = &unk_100240EC8;
        v21[4] = self;
        -[CKCodeOperation setCodeOperationCompletionBlock:](v14, "setCodeOperationCompletionBlock:", v21);
        -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v14,  1LL,  0LL);
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          if (qword_1002962A8 != -1) {
            dispatch_once(&qword_1002962A8, &stru_100240EE8);
          }
          objc_super v16 = (void *)qword_1002962B0;
          if (os_log_type_enabled((os_log_t)qword_1002962B0, OS_LOG_TYPE_ERROR))
          {
            unint64_t resourceType = self->_resourceType;
            v18 = v16;
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  resourceType));
            *(_DWORD *)buf = 138412290;
            v24 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Trying to ask for a remapping request for an unsupported resource type: %@",  buf,  0xCu);
          }
        }

        id completionHandler = self->_completionHandler;
        id v13 = (CPLRampingRequest *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"resourceType"));
        (*((void (**)(id, void, void, CPLRampingRequest *))completionHandler + 2))( completionHandler,  0LL,  0LL,  v13);
      }

      goto LABEL_17;
    }

    v15 = (void (*)(void))*((void *)self->_completionHandler + 2);
  }

  else
  {
    v15 = (void (*)(void))*((void *)self->_completionHandler + 2);
  }

  v15();
LABEL_17:
}

- (void).cxx_destruct
{
}

@end