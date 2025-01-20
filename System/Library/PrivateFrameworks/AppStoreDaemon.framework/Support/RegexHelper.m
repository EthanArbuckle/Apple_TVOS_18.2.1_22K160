@interface RegexHelper
+ (id)matchURL:(id)a3 toPatterns:(id)a4;
@end

@implementation RegexHelper

+ (id)matchURL:(id)a3 toPatterns:(id)a4
{
  id v19 = a3;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v23;
    *(void *)&__int128 v6 = 138543362LL;
    __int128 v18 = v6;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v21 = 0LL;
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v9,  1LL,  &v21,  v18));
        id v11 = v21;
        if (v11)
        {
          uint64_t v12 = ASDLogHandleForCategory(14LL);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v27 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error parsing regex: %{public}@",  buf,  0xCu);
          }
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
          id v16 = objc_msgSend(v10, "numberOfMatchesInString:options:range:", v14, 2, 0, objc_msgSend(v15, "length"));

          if (v16)
          {
            id v5 = v9;

            goto LABEL_15;
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

@end