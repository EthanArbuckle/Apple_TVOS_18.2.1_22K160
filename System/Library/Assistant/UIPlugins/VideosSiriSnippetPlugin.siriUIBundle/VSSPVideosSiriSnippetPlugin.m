@interface VSSPVideosSiriSnippetPlugin
- (VSSPVideosSiriSnippetPlugin)init;
- (id)_viewControllerForAceObject:(id)a3;
- (id)productPageAceViewControllerWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
- (id)viewControllerForAceObject:(id)a3;
@end

@implementation VSSPVideosSiriSnippetPlugin

- (VSSPVideosSiriSnippetPlugin)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VSSPVideosSiriSnippetPlugin;
  v2 = -[VSSPVideosSiriSnippetPlugin init](&v4, "init");
  if (v2) {
    +[VideosUISwiftExternal initializeUIFactory](&OBJC_CLASS___VideosUISwiftExternal, "initializeUIFactory");
  }
  return v2;
}

- (id)viewControllerForAceObject:(id)a3
{
  return -[VSSPVideosSiriSnippetPlugin _viewControllerForAceObject:](self, "_viewControllerForAceObject:", a3);
}

- (id)_viewControllerForAceObject:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SAVCSContentDetailPage, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
    v9 = (VSSPContentItem *)objc_claimAutoreleasedReturnValue([v8 utsId]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 url]);

    if (v10)
    {
      -[VSSPVideosSiriSnippetPlugin recordMetricsForSelectedResult:](self, "recordMetricsForSelectedResult:", v8);
      v11 = objc_alloc(&OBJC_CLASS___VSSPContentItem);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 contentType]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 url]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 image]);
      v15 = -[VSSPContentItem initWithIdentifier:contentType:tvAppURL:imageResource:]( v11,  "initWithIdentifier:contentType:tvAppURL:imageResource:",  v9,  v12,  v13,  v14);

      if (v15)
      {
        if (!+[VUIGDPRPresentationManager shouldShowWelcomeScreen]( &OBJC_CLASS___VUIGDPRPresentationManager,  "shouldShowWelcomeScreen"))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue([v8 loadingText]);
          -[VSSPContentItem setTitle:](v15, "setTitle:", v56);

          -[VSSPContentItem setEVOD:](v15, "setEVOD:", [v8 isEvod]);
          v57 = (void *)objc_claimAutoreleasedReturnValue([v8 utsSearchUrl]);
          -[VSSPContentItem setSearchTerm:](v15, "setSearchTerm:", v57);

          v39 = (void *)objc_claimAutoreleasedReturnValue( -[VSSPVideosSiriSnippetPlugin productPageAceViewControllerWithContentItem:userDriven:playTrailer:]( self,  "productPageAceViewControllerWithContentItem:userDriven:playTrailer:",  v15,  [v8 userDriven],  0));
LABEL_32:

          goto LABEL_33;
        }

        id v16 = sub_6210();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "VideosSiriSnippetPlugin: GDPR not yet consented. Punch out to TV App",  buf,  2u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem tvAppURL](v15, "tvAppURL"));
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem tvAppURL](v15, "tvAppURL"));
          id v83 = 0LL;
          unsigned __int8 v21 = [v19 openURL:v20 withOptions:&__NSDictionary0__struct error:&v83];
          v22 = (os_log_s *)v83;

          if ((v21 & 1) == 0)
          {
            id v23 = sub_6210();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_B2D8((uint64_t)v22, v24, v25, v26, v27, v28, v29, v30);
            }
          }
        }

        else
        {
          id v74 = sub_6210();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_B2A8(v22, v75, v76, v77, v78, v79, v80, v81);
          }
        }
      }

      else
      {
        id v49 = sub_6210();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_B244((uint64_t)v8, v22, v50, v51, v52, v53, v54, v55);
        }
      }

      v39 = 0LL;
      goto LABEL_32;
    }

    id v40 = sub_6210();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_B214(v41, v42, v43, v44, v45, v46, v47, v48);
    }

    goto LABEL_28;
  }

  uint64_t v31 = objc_opt_class(&OBJC_CLASS___SAVCSPlayTrailer, v7);
  if ((objc_opt_isKindOfClass(v4, v31) & 1) != 0)
  {
    id v32 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 url]);

    if (v33)
    {
      v34 = objc_alloc(&OBJC_CLASS___VSSPContentItem);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v32 utsId]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v32 contentType]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v32 url]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v32 image]);
      v9 = -[VSSPContentItem initWithIdentifier:contentType:tvAppURL:imageResource:]( v34,  "initWithIdentifier:contentType:tvAppURL:imageResource:",  v35,  v36,  v37,  v38);

      if (v9)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue( -[VSSPVideosSiriSnippetPlugin productPageAceViewControllerWithContentItem:userDriven:playTrailer:]( self,  "productPageAceViewControllerWithContentItem:userDriven:playTrailer:",  v9,  0LL,  1LL));
LABEL_33:

        goto LABEL_34;
      }

      id v66 = sub_6210();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_B36C((uint64_t)v32, v67, v68, v69, v70, v71, v72, v73);
      }
    }

    else
    {
      id v58 = sub_6210();
      v9 = (VSSPContentItem *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_B33C((os_log_s *)v9, v59, v60, v61, v62, v63, v64, v65);
      }
    }

- (id)productPageAceViewControllerWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = -[VSSPProductPageAceViewController initWithContentItem:userDriven:playTrailer:]( objc_alloc(&OBJC_CLASS___VSSPProductPageAceViewController),  "initWithContentItem:userDriven:playTrailer:",  v7,  v6,  v5);

  return v8;
}

@end