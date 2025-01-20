@interface WTVSnippetPlugin
- (WTVSnippetViewController)snippetViewController;
- (id)viewControllerForSnippet:(id)a3;
- (void)setSnippetViewController:(id)a3;
@end

@implementation WTVSnippetPlugin

- (id)viewControllerForSnippet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAWeatherForecastSnippet);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    uint64_t v13 = WALogForCategory(0LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_11C50((uint64_t)v4, v6, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }

  v6 = (os_log_s *)v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aceWeathers](v6, "aceWeathers"));
  id v8 = [v7 count];

  if (!v8)
  {
    uint64_t v20 = WALogForCategory(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_11BE8((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
    }

LABEL_11:
    v12 = 0LL;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetPlugin snippetViewController](self, "snippetViewController"));

  if (!v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___WTVSnippetViewController);
    -[WTVSnippetPlugin setSnippetViewController:](self, "setSnippetViewController:", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetPlugin snippetViewController](self, "snippetViewController"));
  [v11 setSnippet:v6];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WTVSnippetPlugin snippetViewController](self, "snippetViewController"));
LABEL_12:

  return v12;
}

- (WTVSnippetViewController)snippetViewController
{
  return self->_snippetViewController;
}

- (void)setSnippetViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end