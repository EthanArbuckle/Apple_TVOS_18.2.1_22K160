@interface GEOWiFiQualityTileRequester
+ ($8E8A1DFF6E8C798DDDF56DAB3917D12E)requestKind;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
@end

@implementation GEOWiFiQualityTileRequester

+ ($8E8A1DFF6E8C798DDDF56DAB3917D12E)requestKind
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)2858LL;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    id v8 = 0LL;
    id v9 = 0LL;
  }

  else
  {
    id v19 = 0LL;
    id v20 = 0LL;
    unsigned __int8 v10 = [v5 didValidateEntityTagForData:&v20 entityTag:&v19];
    id v9 = v20;
    id v8 = v19;
    if ((v10 & 1) != 0)
    {
      v7 = 0LL;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 receivedData]);

      if (v11)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 receivedData]);

        uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 entityTag]);
        v7 = 0LL;
        id v8 = (id)v13;
        id v9 = (id)v12;
      }

      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -8LL,  @"unexpected empty data"));
      }
    }
  }

  (*((void (**)(void))self->_completion + 2))();
  id v15 = objc_msgSend((id)objc_opt_class(self, v14), "requestKind");
  v16 = (void *)objc_claimAutoreleasedReturnValue([self->_auditToken bundleIdForNetworkAttribution]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 clientMetrics]);
  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:]( &OBJC_CLASS___GEONetworkEventDataRecorder,  "recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:erro r:clientMetrics:additionalStates:",  v15,  &__kCFBooleanFalse,  v16,  0LL,  0LL,  v17,  v18,  0LL);
}

- (void)cancel
{
  task = self->_task;
  self->_task = 0LL;
}

- (void).cxx_destruct
{
}

@end