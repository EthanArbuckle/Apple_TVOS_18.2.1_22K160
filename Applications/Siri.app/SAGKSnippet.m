@interface SAGKSnippet
- (BOOL)_isWikiSnippet;
- (BOOL)_sr_objects:(id)a3 matchClassOrder:(id)a4;
- (id)sr_sirilandShim;
@end

@implementation SAGKSnippet

- (BOOL)_sr_objects:(id)a3 matchClassOrder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 count];
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  v19[3] = 0LL;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100045774;
  v10[3] = &unk_1000BAE60;
  id v8 = v6;
  id v11 = v8;
  v12 = v19;
  v13 = &v15;
  id v14 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  LOBYTE(v7) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v7;
}

- (BOOL)_isWikiSnippet
{
  v14[0] = v3;
  objc_opt_class(&OBJC_CLASS___SAGKSummaryPod, v4);
  v14[1] = v5;
  objc_opt_class(&OBJC_CLASS___SAGKPropertyPod, v6);
  v14[2] = v7;
  *(void *)&double v9 = objc_opt_class(&OBJC_CLASS___SAGKSourceLinkPod, v8).n128_u64[0];
  v14[3] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet pods](self, "pods"));
  LOBYTE(self) = sub_100034934(v12, v11);

  return (char)self;
}

- (id)sr_sirilandShim
{
  if (-[SAGKSnippet _isWikiSnippet](self, "_isWikiSnippet"))
  {
    id v3 = objc_alloc_init((Class)&OBJC_CLASS___SFCard);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));
    [v3 setTitle:v4];

    [v3 setType:1];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet aceId](self, "aceId"));
    [v3 setCardId:v5];

    [v3 setSource:2];
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));

    if (v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___SFRichTitleCardSection);
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));
      [v8 setTitle:v9];

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet subtitle](self, "subtitle"));
      [v8 setSubtitle:v10];

      [v8 setIsCentered:1];
      [v8 setSeparatorStyle:5];
      -[NSMutableArray addObject:](v6, "addObject:", v8);
    }

    v48[0] = 0LL;
    v48[1] = v48;
    v48[2] = 0x2020000000LL;
    v48[3] = 0LL;
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x2020000000LL;
    char v47 = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet pods](self, "pods"));
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472LL;
    v39 = sub_100045E04;
    v40 = &unk_1000BB218;
    v12 = v6;
    v41 = v12;
    v42 = v48;
    v43 = &v44;
    [v11 enumerateObjectsUsingBlock:&v37];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet appPunchOut](self, "appPunchOut"));
    if (v13 && !*((_BYTE *)v45 + 24))
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___SFRowCardSection);
      id v15 = objc_alloc(&OBJC_CLASS___SFURLImage);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 appIcon]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 resourceUrl]);
      id v18 = [v15 initWithURL:v17];

      [v14 setImage:v18];
      [v18 setIsTemplate:1];
      id v19 = objc_alloc_init(&OBJC_CLASS___SFRichText);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v13 punchOutName]);
      [v19 setText:v20];

      [v14 setLeadingText:v19];
      [v14 setImageIsRightAligned:1];
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v13 _convertedPunchout]);
      v22 = (void *)v21;
      if (v21)
      {
        uint64_t v49 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
        [v14 setPunchoutOptions:v23];
      }

      -[NSMutableArray addObject:](v12, "addObject:", v14);
    }

    id v24 = -[NSMutableArray copy](v12, "copy");
    [v3 setCardSections:v24];

    v25 = (SAGKSnippet *)objc_alloc_init(&OBJC_CLASS___SACardSnippet);
    id v26 = [[_SFPBCard alloc] initWithFacade:v3];
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 data]);
    -[SAGKSnippet setCardData:](v25, "setCardData:", v27);

    id v28 = objc_alloc_init(&OBJC_CLASS___SAUISash);
    id v29 = [v28 setApplicationBundleIdentifier:@"com.apple.siri"];
    if (AFIsInternalInstall(v29, v30))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v32 = [v31 debugButtonIsEnabled];

      if (v32)
      {
        id v33 = sub_1000348D4(@"KNOWLEDGE");
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (INTERNAL ONLY: LEGACY FLOW)",  v34,  v37,  v38,  v39,  v40));
        [v28 setTitle:v35];
      }
    }

    -[SAGKSnippet setSash:](v25, "setSash:", v28);
    -[SAGKSnippet sr_applySnippetProperties:](v25, "sr_applySnippetProperties:", self);
    -[SAGKSnippet setTitle:](v25, "setTitle:", 0LL);

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v48, 8);
  }

  else
  {
    v25 = self;
  }

  return v25;
}

@end