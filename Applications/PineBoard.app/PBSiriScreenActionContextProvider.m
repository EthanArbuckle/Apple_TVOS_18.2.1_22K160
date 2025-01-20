@interface PBSiriScreenActionContextProvider
+ (id)_JSONSerializedSemanticContext:(id)a3;
- (BOOL)allowContextProvider:(id)a3;
- (PBSiriScreenActionContextProvider)initWithScreenActionManager:(id)a3;
- (PBSiriScreenActionManager)screenActionManager;
- (id)_screenActionInfoForScreenItem:(id)a3;
- (id)getCurrentContext;
- (void)dealloc;
@end

@implementation PBSiriScreenActionContextProvider

- (PBSiriScreenActionContextProvider)initWithScreenActionManager:(id)a3
{
  id v6 = a3;
  Class v7 = NSClassFromString(@"PBSiriScreenActionManager");
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002813EC(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x100109AF0LL);
  }

  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSiriScreenActionManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002813EC(a2);
    }
    goto LABEL_11;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSiriScreenActionContextProvider;
  v8 = -[PBSiriScreenActionContextProvider init](&v13, "init");
  if (v8)
  {
    id v9 = [sub_100109B58() defaultContextManager];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v10 addContextProvider:v8];

    objc_storeStrong((id *)&v8->_screenActionManager, a3);
    -[PBSiriScreenActionManager setEnabled:](v8->_screenActionManager, "setEnabled:", 1LL);
  }

  return v8;
}

- (void)dealloc
{
  id v3 = [sub_100109B58() defaultContextManager];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 removeContextProvider:self];

  -[PBSiriScreenActionManager setEnabled:](self->_screenActionManager, "setEnabled:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSiriScreenActionContextProvider;
  -[PBSiriScreenActionContextProvider dealloc](&v5, "dealloc");
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionManager currentScreenActionApplication]( self->_screenActionManager,  "currentScreenActionApplication"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v35 semanticContext]);
  id v2 = sub_1000F7654();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Application semantic context: %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2050000000LL;
  v4 = (void *)qword_100470F20;
  uint64_t v45 = qword_100470F20;
  if (!qword_100470F20)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v49 = sub_10010A594;
    v50 = &unk_1003D0790;
    v51 = &v42;
    sub_10010A594((uint64_t)&buf);
    v4 = (void *)v43[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v42, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 list]);
  if (v36)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v35 bundleIdentifier]);
    [v36 setAppId:v6];

    Class v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities tvSchemaViewIdentifierKeyCompactIRI]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "tvSchemaViewIdentifierKeyCompactIRI"));
    uint64_t v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tvs_stringForKey:", v7));

    if (v30)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
      [v36 setViewId:v8];
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v10 currentApplicationSceneHandle]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sceneIfExists]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientSettings]);
      if ([v12 containsSearchView])
      {
        id v13 = sub_1000F7654();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Search view is on screen.",  (uint8_t *)&buf,  2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"searchViewVisible"));
        [v36 setViewId:v15];
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities tvSchemaMainEntityKeyCompactIRI]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "tvSchemaMainEntityKeyCompactIRI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tvs_dictionaryForKey:", v16));

    if (v33)
    {
      id v17 = [(id)objc_opt_class(self) _JSONSerializedSemanticContext:v33];
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      [v36 setMainEntitySemanticData:v18];
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "currentScreenActionItems", v30));
    if ([v32 count])
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v20 = v32;
      id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v39;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            id v25 = sub_1000F7654();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue([v24 semanticContext]);
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Creating ACE object for screen action item semantic context: %@",  (uint8_t *)&buf,  0xCu);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionContextProvider _screenActionInfoForScreenItem:]( self,  "_screenActionInfoForScreenItem:",  v24));
            if (v28) {
              -[NSMutableArray addObject:](v19, "addObject:", v28);
            }
          }

          id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }

        while (v21);
      }

      [v36 setDomainObjects:v19];
    }

    v46 = v36;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)_screenActionInfoForScreenItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 semanticContext]);
  if (v5)
  {
    uint64_t v24 = 0LL;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000LL;
    id v6 = (void *)qword_100470F30;
    uint64_t v27 = qword_100470F30;
    if (!qword_100470F30)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10010A694;
      v23[3] = &unk_1003D0790;
      v23[4] = &v24;
      sub_10010A694((uint64_t)v23);
      id v6 = (void *)v25[3];
    }

    id v21 = self;
    id v7 = v6;
    _Block_object_dispose(&v24, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    [v8 setElementId:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_stringForKey:", TVSCSchemaDotOrgNameKey));
    [v8 setValue:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_dictionaryForKey:", TVSCJSONLinkedDataContextKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_stringForKey:", TVSCJSONLinkedDataTypeKey));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities absoluteIRIForProperty:linkedDataContext:]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "absoluteIRIForProperty:linkedDataContext:",  v12,  v11));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13, self));
      [v8 setType:v14];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_stringForKey:", TVSCJSONLinkedDataIDKey, v21));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities absoluteIRIForProperty:linkedDataContext:]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "absoluteIRIForProperty:linkedDataContext:",  v15,  v11));
    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));
      [v8 setSemanticId:v17];
    }

    id v18 = [(id)objc_opt_class(v22) _JSONSerializedSemanticContext:v5];
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v8 setSemanticData:v19];
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)_JSONSerializedSemanticContext:(id)a3
{
  id v3 = a3;
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  0LL,  0LL));
    id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (PBSiriScreenActionManager)screenActionManager
{
  return self->_screenActionManager;
}

- (void).cxx_destruct
{
}

@end