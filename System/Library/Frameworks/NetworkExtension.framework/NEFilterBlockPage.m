@interface NEFilterBlockPage
- (NEFilterBlockPage)init;
- (id)page;
@end

@implementation NEFilterBlockPage

- (NEFilterBlockPage)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterBlockPage;
  v2 = -[NEFilterBlockPage init](&v11, sel_init);
  if (v2)
  {
    [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    formActionURL = v2->_formActionURL;
    v2->_formActionURL = (NSString *)&stru_18A0915E8;

    remediationButtonText = v2->_remediationButtonText;
    v2->_remediationButtonText = (NSString *)@"Request Access";

    uint64_t v6 = [v3 URLForResource:@"blockpage" withExtension:@"html"];
    pageTemplateURL = v2->_pageTemplateURL;
    v2->_pageTemplateURL = (NSURL *)v6;

    unblockStyle = v2->_unblockStyle;
    v2->_unblockStyle = (NSString *)&stru_18A0915E8;

    organization = v2->_organization;
    v2->_organization = (NSString *)&stru_18A0915E8;
  }

  return v2;
}

- (void).cxx_destruct
{
}

- (id)page
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = a1[2];
  if (v2)
  {
    id v17 = 0LL;
    [NSString stringWithContentsOfURL:v2 encoding:4 error:&v17];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v17;
    v5 = v4;
    if (v3)
    {

      [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 URLForResource:@"blockpage_style" withExtension:@"css"];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        *(void *)buf = 0LL;
        [NSString stringWithContentsOfURL:v7 encoding:4 error:buf];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v8 = 0LL;
      }

      [v3 stringByReplacingOccurrencesOfString:@"UNBLOCK_URL_NO_LOC" withString:a1[4]];
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringByReplacingOccurrencesOfString:@"UNBLOCK_BUTTON_TEXT_NO_LOC" withString:a1[6]];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      [v12 stringByReplacingOccurrencesOfString:@"UNBLOCK_STYLE_NO_LOC" withString:a1[5]];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      [v13 stringByReplacingOccurrencesOfString:@"PROVIDER_ORGANIZATION_NO_LOC" withString:a1[1]];
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (a1[3])
      {
        uint64_t v14 = objc_msgSend( v10,  "stringByReplacingOccurrencesOfString:withString:",  @"USER_VISIBLE_RESTRICTED_URL_NO_LOC");

        v10 = (void *)v14;
      }

      if (v8)
      {
        uint64_t v15 = [v10 stringByReplacingOccurrencesOfString:@"INCLUDE_CSS_FILE_NO_LOC" withString:v8];

        v10 = (void *)v15;
      }

      goto LABEL_16;
    }

    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_INFO, "Error loading block page: %@", buf, 0xCu);
    }
  }

  v3 = 0LL;
  v10 = 0LL;
LABEL_16:

  return v10;
}

@end