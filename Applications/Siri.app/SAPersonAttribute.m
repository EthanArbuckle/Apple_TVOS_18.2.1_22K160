@interface SAPersonAttribute
- (id)_applicableEmail;
- (id)_applicablePhone;
- (id)sr_inPerson;
@end

@implementation SAPersonAttribute

- (id)sr_inPerson
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute displayText](self, "displayText"));
  v4 = INPersonHandleLabelMain;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  v58 = v5;
  if (([v5 isEqualToString:@"PhoneNumber"] & 1) != 0
    || [v5 isEqualToString:@"PhoneLabel"])
  {
    objc_opt_class(&OBJC_CLASS___SAPhone, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      objc_opt_class(&OBJC_CLASS___NSString, v9);
      if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0) {
        id v11 = v6;
      }
      else {
        id v11 = 0LL;
      }
      uint64_t v13 = 2LL;
      goto LABEL_29;
    }

    id v10 = v6;
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 number]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 label]);

    uint64_t v13 = 2LL;
LABEL_11:
    v4 = (NSString *)v12;
LABEL_29:
    v30 = v6;
    goto LABEL_30;
  }

  if (([v5 isEqualToString:@"EmailAddress"] & 1) != 0
    || [v5 isEqualToString:@"EmailLabel"])
  {
    objc_opt_class(&OBJC_CLASS___SAEmail, v15);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) == 0)
    {
      objc_opt_class(&OBJC_CLASS___NSString, v17);
      if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0) {
        id v11 = v6;
      }
      else {
        id v11 = 0LL;
      }
      uint64_t v13 = 1LL;
      goto LABEL_29;
    }

    id v18 = v6;
    id v11 = (id)objc_claimAutoreleasedReturnValue([v18 emailAddress]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v18 label]);

    uint64_t v13 = 1LL;
    goto LABEL_11;
  }

  v55 = v3;
  v56 = v4;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006BF88();
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data", v6));
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 phones]);

  id v23 = [v22 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v64;
LABEL_20:
    uint64_t v26 = 0LL;
    while (1)
    {
      if (*(void *)v64 != v25) {
        objc_enumerationMutation(v22);
      }
      v27 = *(void **)(*((void *)&v63 + 1) + 8 * v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 number]);
      unsigned __int8 v29 = [v28 isEqualToString:v20];

      if ((v29 & 1) != 0) {
        break;
      }
      if (v24 == (id)++v26)
      {
        id v24 = [v22 countByEnumeratingWithState:&v63 objects:v68 count:16];
        if (v24) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }

    id v11 = v20;
    v4 = (NSString *)objc_claimAutoreleasedReturnValue([v27 label]);

    uint64_t v13 = 2LL;
    v3 = v55;
    if (v11) {
      goto LABEL_43;
    }
  }

  else
  {
LABEL_26:

    uint64_t v13 = 0LL;
    v3 = v55;
    v4 = v56;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 emails]);

  v48 = v47;
  id v11 = [v47 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v11)
  {
    v57 = v4;
    uint64_t v49 = *(void *)v60;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v60 != v49) {
          objc_enumerationMutation(v48);
        }
        v51 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        v52 = (void *)objc_claimAutoreleasedReturnValue([v51 emailAddress]);
        unsigned int v53 = [v52 isEqualToString:v20];

        if (v53)
        {
          id v11 = v20;
          v4 = (NSString *)objc_claimAutoreleasedReturnValue([v51 label]);

          uint64_t v13 = 1LL;
          v3 = v55;
          goto LABEL_42;
        }
      }

      id v11 = [v48 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    v3 = v55;
    v4 = v57;
  }

- (id)_applicablePhone
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  objc_opt_class(&OBJC_CLASS___SAPhone, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = v3;
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006BFF4();
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object", 0LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 phones]);

    id v6 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 number]);
          unsigned int v14 = [v13 isEqualToString:v7];

          if (v14)
          {
            id v6 = v12;
            goto LABEL_15;
          }
        }

        id v6 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)_applicableEmail
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  objc_opt_class(&OBJC_CLASS___SAEmail, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = v3;
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C060();
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object", 0LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 emails]);

    id v6 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 emailAddress]);
          unsigned int v14 = [v13 isEqualToString:v7];

          if (v14)
          {
            id v6 = v12;
            goto LABEL_15;
          }
        }

        id v6 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

@end