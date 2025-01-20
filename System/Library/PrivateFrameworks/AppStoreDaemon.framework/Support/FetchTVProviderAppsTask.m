@interface FetchTVProviderAppsTask
- (void)main;
@end

@implementation FetchTVProviderAppsTask

- (void)main
{
  if (!self)
  {
    id v67 = 0LL;
LABEL_63:
    -[Task completeWithSuccess](self, "completeWithSuccess");
    id v58 = 0LL;
    goto LABEL_64;
  }

  id v2 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForKey:@"atv-headboard-url"]);
  id location = 0LL;
  v76 = (void *)objc_claimAutoreleasedReturnValue([v4 valueWithError:&location]);
  id v77 = location;

  if (v77)
  {
    uint64_t v5 = ASDLogHandleForCategory(40LL);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      headboardApps = self->_headboardApps;
      *(_DWORD *)buf = 138412546;
      v95 = headboardApps;
      __int16 v96 = 2114;
      id v97 = v77;
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "[%@] Unable to find headboard url: %{public}@",  buf,  0x16u);
    }

- (void).cxx_destruct
{
}

@end