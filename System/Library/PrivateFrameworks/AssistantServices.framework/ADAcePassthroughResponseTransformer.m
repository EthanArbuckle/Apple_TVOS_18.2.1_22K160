@interface ADAcePassthroughResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADAcePassthroughResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___ADAcePassthroughSiriResponse);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
  {
    if (v8) {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "ad_aceResponseCommandRepresentationWithErrorCode:reason:",  objc_msgSend(v8, "code"),  0));
    }
    else {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 replyCommand]);
    }
  }

  else
  {
    v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      v16 = "-[ADAcePassthroughResponseTransformer aceCommandForSiriResponse:responseError:forRequestCommand:]";
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unexpected response %@",  (uint8_t *)&v15,  0x16u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ad_aceResponseCommandGenericErrorRepresentation"));
  }

  v13 = (void *)v11;

  return v13;
}

@end