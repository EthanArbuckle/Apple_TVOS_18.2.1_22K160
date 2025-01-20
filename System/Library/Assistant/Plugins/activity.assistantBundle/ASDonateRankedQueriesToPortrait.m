@interface ASDonateRankedQueriesToPortrait
- (id)getPortraitQueryResults;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASDonateRankedQueriesToPortrait

- (void)performWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_7BF0(v4);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v3)
  {
LABEL_3:
    id v5 = [[SACommandFailed alloc] initWithReason:@"Not supported on this platform"];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    v3[2](v3, v6);
  }

- (id)getPortraitQueryResults
{
  return 0LL;
}

@end