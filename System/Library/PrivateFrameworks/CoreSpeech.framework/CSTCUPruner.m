@interface CSTCUPruner
- (CSTCUIntendedInfoProviding)tcuIntendedInfoProvider;
- (CSTCUPruner)init;
- (id)processTCUPackage:(id)a3 requestId:(id)a4;
- (void)processTRPCandidateInfo:(id)a3 requestId:(id)a4 withCompletion:(id)a5;
- (void)registerInfoProviderNode:(id)a3;
@end

@implementation CSTCUPruner

- (CSTCUPruner)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSTCUPruner;
  return -[CSTCUPruner init](&v3, "init");
}

- (void)registerInfoProviderNode:(id)a3
{
}

- (void)processTRPCandidateInfo:(id)a3 requestId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v26 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v27 = v8;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 tcuList]);
  id v11 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    p_tcuIntendedInfoProvider = &self->_tcuIntendedInfoProvider;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v17 = (void *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          id WeakRetained = objc_loadWeakRetained((id *)p_tcuIntendedInfoProvider);
          *(_DWORD *)buf = 136315650;
          v38 = "-[CSTCUPruner processTRPCandidateInfo:requestId:withCompletion:]";
          __int16 v39 = 2112;
          v40 = v16;
          __int16 v41 = 2112;
          id v42 = WeakRetained;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s tcuPackage:%@ _tcuIntendedInfoProvider:%@",  buf,  0x20u);
        }

        id v20 = objc_loadWeakRetained((id *)p_tcuIntendedInfoProvider);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v16 speechPackage]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constructTCUIntendedInfoForRequestId:v9 withResultCandidate:v21]);

        if (v22)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100009FE0;
          v31[3] = &unk_10022A0A8;
          id v32 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v16 mutatedCopyWithMutator:v31]);
          [v10 addObject:v23];
        }

        else
        {
          [v10 addObject:v16];
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v12);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100009FEC;
  v29[3] = &unk_10022A0D0;
  id v30 = v10;
  id v24 = v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 mutatedCopyWithMutator:v29]);
  if (v26) {
    v26[2](v26, v25);
  }
}

- (id)processTCUPackage:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CSTCUPruner processTCUPackage:requestId:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s tcuPackage:%@ _tcuIntendedInfoProvider:%@",  buf,  0x20u);
  }

  id v11 = objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 speechPackage]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constructTCUIntendedInfoForRequestId:v7 withResultCandidate:v12]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100009FCC;
  v17[3] = &unk_10022A0A8;
  id v18 = v13;
  id v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 mutatedCopyWithMutator:v17]);

  return v15;
}

- (CSTCUIntendedInfoProviding)tcuIntendedInfoProvider
{
  return (CSTCUIntendedInfoProviding *)objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
}

- (void).cxx_destruct
{
}

@end