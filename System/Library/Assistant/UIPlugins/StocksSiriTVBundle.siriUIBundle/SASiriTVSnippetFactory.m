@interface SASiriTVSnippetFactory
- (SASiriTVSnippetViewController)snippetViewController;
- (id)viewControllerForSnippet:(id)a3;
- (void)setSnippetViewController:(id)a3;
@end

@implementation SASiriTVSnippetFactory

- (id)viewControllerForSnippet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAStockSnippet);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetFactory snippetViewController](self, "snippetViewController"));

    if (!v6)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___SASiriTVSnippetViewController);
      -[SASiriTVSnippetFactory setSnippetViewController:](self, "setSnippetViewController:", v7);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetFactory snippetViewController](self, "snippetViewController"));
    [v8 setAceObject:v4];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetFactory snippetViewController](self, "snippetViewController"));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Expected SAStockSnippet, got %@",  (uint8_t *)&v11,  0xCu);
    }

    v9 = 0LL;
  }

  return v9;
}

- (SASiriTVSnippetViewController)snippetViewController
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