@interface CEMConfigurationBase
- (id)dmf_installSynthesizedProfileRequestWithAssetProviders:(id)a3 error:(id *)a4;
- (id)dmf_removeSynthesizedProfileRequestWithError:(id *)a3;
@end

@implementation CEMConfigurationBase

- (id)dmf_installSynthesizedProfileRequestWithAssetProviders:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[CEMConfigurationBase synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:]( self,  "synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:",  v7,  0LL,  v6));

  uint64_t v9 = DMFConfigurationEngineLog();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000601F0();
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PayloadContent"]);
  id v12 = [v11 count];

  if (!v12)
  {
    id v13 = (id)objc_opt_new(&OBJC_CLASS___DMFRemoveConfigurationRequest);
    [v13 setType:0];
    [v13 setProfile:v8];
    id v22 = 0LL;
    unsigned __int8 v18 = +[DMDRemoveConfigurationOperation validateRequest:error:]( &OBJC_CLASS___DMDRemoveConfigurationOperation,  "validateRequest:error:",  v13,  &v22);
    id v15 = v22;
    if ((v18 & 1) == 0)
    {
      uint64_t v20 = DMFConfigurationEngineLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100060100(v15);
      }
      goto LABEL_11;
    }

- (id)dmf_removeSynthesizedProfileRequestWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CEMConfigurationBase synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:]( self,  "synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:",  v5,  0LL,  &__NSDictionary0__struct));
  uint64_t v7 = DMFConfigurationEngineLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000601F0();
  }

  uint64_t v9 = (void *)objc_opt_new(&OBJC_CLASS___DMFRemoveConfigurationRequest);
  [v9 setType:0];
  [v9 setProfile:v6];
  id v16 = 0LL;
  unsigned __int8 v10 = +[DMDRemoveConfigurationOperation validateRequest:error:]( &OBJC_CLASS___DMDRemoveConfigurationOperation,  "validateRequest:error:",  v9,  &v16);
  id v11 = v16;
  if ((v10 & 1) != 0)
  {
    id v12 = v9;
  }

  else
  {
    uint64_t v13 = DMFConfigurationEngineLog();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100060100(v11);
    }

    id v12 = 0LL;
    if (a3) {
      *a3 = v11;
    }
  }

  return v12;
}

@end