@interface SATVFlowDescriptionProviderFactory
+ (id)_appleTVFlowDescriptionProvider;
+ (id)flowDescriptionProvider;
@end

@implementation SATVFlowDescriptionProviderFactory

+ (id)flowDescriptionProvider
{
  return [a1 _appleTVFlowDescriptionProvider];
}

+ (id)_appleTVFlowDescriptionProvider
{
  id v2 = sub_100049EE0();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "+[SATVFlowDescriptionProviderFactory _appleTVFlowDescriptionProvider]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Creating AppleTV CLI flow description provider",  (uint8_t *)&v10,  0xCu);
  }

  v4 = objc_alloc_init(&OBJC_CLASS___SATVAppleTVCommandLineFlowDescriptionProvider);
  if (!v4)
  {
LABEL_15:
    id v5 = sub_100049EE0();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "+[SATVFlowDescriptionProviderFactory _appleTVFlowDescriptionProvider]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Creating Chameleon flow description provider",  (uint8_t *)&v10,  0xCu);
    }

    v4 = objc_alloc_init(&OBJC_CLASS___SATVChameleonFlowDescriptionProvider);
    if (!v4)
    {
LABEL_9:
      id v7 = sub_100049EE0();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        v11 = "+[SATVFlowDescriptionProviderFactory _appleTVFlowDescriptionProvider]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Creating AppleTV flow description provider",  (uint8_t *)&v10,  0xCu);
      }

      v4 = objc_alloc_init(&OBJC_CLASS___SATVAppleTVFlowDescriptionProvider);
    }
  }

  return v4;
}

@end