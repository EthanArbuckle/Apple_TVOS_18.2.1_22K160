@interface AMSBag
+ (id)wlk_defaultBag;
@end

@implementation AMSBag

+ (id)wlk_defaultBag
{
  uint64_t v2 = WLKStartupSignpostLogObject(a1, a2);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WLKBag.DefaultAMSBag",  (const char *)&unk_100031029,  buf,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"TVApp",  @"1"));
  uint64_t v6 = WLKStartupSignpostLogObject(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WLKBag.DefaultAMSBag",  (const char *)&unk_100031029,  v9,  2u);
  }

  return v4;
}

@end