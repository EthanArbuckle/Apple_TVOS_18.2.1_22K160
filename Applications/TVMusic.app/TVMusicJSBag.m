@interface TVMusicJSBag
- (AMSBag)amsBag;
- (BOOL)registerKeys:(id)a3;
- (NSArray)supportedTypes;
- (NSDictionary)bagOptions;
- (NSString)profile;
- (NSString)profileVersion;
- (TVMusicJSBag)init;
- (id)amsBagRequestBlock;
- (id)getArray:(id)a3;
- (id)getValue:(id)a3 :(id)a4;
- (unint64_t)_AMSTypeFromString:(id)a3;
- (void)_setDefaultAMSBagRequestBlock;
- (void)setAmsBagRequestBlock:(id)a3;
- (void)setBagOptions:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation TVMusicJSBag

- (TVMusicJSBag)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicJSBag;
  v2 = -[TVMusicJSBag init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TVMusicJSBag setBagOptions:](v2, "setBagOptions:", &off_100282600);
  }
  return v3;
}

- (NSDictionary)bagOptions
{
  return self->_bagOptions;
}

- (NSArray)supportedTypes
{
  v3[0] = @"array";
  v3[1] = @"BOOL";
  v3[2] = @"double";
  v3[3] = @"integer";
  v3[4] = @"string";
  v3[5] = @"url";
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  6LL));
}

- (void)setBagOptions:(id)a3
{
  id v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"profile"]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"profileVersion"]);
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag profile](self, "profile")),
        unsigned __int8 v7 = [v6 isEqualToString:v4],
        v6,
        (v7 & 1) == 0))
  {
    -[TVMusicJSBag setProfile:](self, "setProfile:", v4);
    int v8 = 1;
    if (!v5) {
      goto LABEL_7;
    }
  }

  else
  {
    int v8 = 0;
    if (!v5)
    {
LABEL_7:
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag profileVersion](self, "profileVersion"));
  unsigned __int8 v10 = [v9 isEqualToString:v5];

  if ((v10 & 1) != 0) {
    goto LABEL_7;
  }
  -[TVMusicJSBag setProfileVersion:](self, "setProfileVersion:", v5);
LABEL_10:
  amsBag = self->_amsBag;
  if (amsBag)
  {
    self->_amsBag = 0LL;
  }

- (BOOL)registerKeys:(id)a3
{
  return 1;
}

- (id)getValue:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[TVMusicJSBag _AMSTypeFromString:](self, "_AMSTypeFromString:", v7);
  switch(v8)
  {
    case 1uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 BOOLForKey:v6]);
      goto LABEL_9;
    case 2uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 doubleForKey:v6]);
      goto LABEL_9;
    case 3uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 integerForKey:v6]);
LABEL_9:
      id v14 = (void *)v10;

      if (!v14)
      {
        v12 = 0LL;
        goto LABEL_18;
      }

      id v24 = 0LL;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueWithError:&v24]);
      v12 = (os_log_s *)v24;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
LABEL_15:

      if (!v13) {
        goto LABEL_18;
      }
      goto LABEL_21;
    case 4uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v16 stringForKey:v6]);

      id v26 = 0LL;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v15 valueWithError:&v26]);
      v12 = (os_log_s *)v26;
      goto LABEL_14;
    case 5uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v17 URLForKey:v6]);

      id v25 = 0LL;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 valueWithError:&v25]);
      v12 = (os_log_s *)v25;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);

LABEL_14:
      id v14 = 0LL;
      goto LABEL_15;
    default:
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v11 = sub_10005D910();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "bag.getValue type %@ not found",  buf,  0xCu);
        }

        v13 = 0LL;
      }

      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported type: %@",  v7));
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        v34 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVMusicJSBagErrorDomain",  1LL,  v20));

        id v14 = 0LL;
LABEL_18:
        id v21 = sub_10005D910();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v28 = v6;
          __int16 v29 = 2112;
          id v30 = v7;
          __int16 v31 = 2112;
          v32 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "bag.getValue could not get value for key %@ of type %@. Error: %@",  buf,  0x20u);
        }

        v13 = 0LL;
LABEL_21:
      }

      return v13;
  }

- (id)getArray:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBag](self, "amsBag"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayForKey:v4]);

  id v12 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueWithError:&v12]);
  id v8 = v12;
  if (!v7)
  {
    id v9 = sub_10005D910();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "bag.getArray could not get array for key %@. Error: %@",  buf,  0x16u);
    }
  }

  return v7;
}

- (void)setAmsBagRequestBlock:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    id amsBagRequestBlock = self->_amsBagRequestBlock;
    self->_id amsBagRequestBlock = v4;
  }

  else
  {
    -[TVMusicJSBag _setDefaultAMSBagRequestBlock](self, "_setDefaultAMSBagRequestBlock");
  }

  amsBag = self->_amsBag;
  self->_amsBag = 0LL;
}

- (AMSBag)amsBag
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag amsBagRequestBlock](self, "amsBagRequestBlock"));

  if (!v3) {
    -[TVMusicJSBag _setDefaultAMSBagRequestBlock](self, "_setDefaultAMSBagRequestBlock");
  }
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    objc_super v5 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVMusicJSBag amsBagRequestBlock]( self,  "amsBagRequestBlock"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag profile](self, "profile"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSBag profileVersion](self, "profileVersion"));
    uint64_t v8 = ((uint64_t (**)(void, void *, void *))v5)[2](v5, v6, v7);
    id v9 = (AMSBag *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = self->_amsBag;
    self->_amsBag = v9;

    amsBag = self->_amsBag;
  }

  return amsBag;
}

- (void)_setDefaultAMSBagRequestBlock
{
  id amsBagRequestBlock = self->_amsBagRequestBlock;
  self->_id amsBagRequestBlock = &stru_10026B510;
}

- (unint64_t)_AMSTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"array"])
  {
    unint64_t v4 = 0LL;
  }

  else if ([v3 isEqualToString:@"BOOL"])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"double"])
  {
    unint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"integer"])
  {
    unint64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"string"])
  {
    unint64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:@"url"])
  {
    unint64_t v4 = 5LL;
  }

  else
  {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)amsBagRequestBlock
{
  return self->_amsBagRequestBlock;
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end