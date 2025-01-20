@interface NSString(LSPluginQueryAdditions)
- (BOOL)ls_matchesStringForPluginQuery:()LSPluginQueryAdditions;
- (id)ls_cleanForPluginQuery;
- (uint64_t)ls_matchesForPluginQuery:()LSPluginQueryAdditions;
@end

@implementation NSString(LSPluginQueryAdditions)

- (id)ls_cleanForPluginQuery
{
  id v2 = (id)[a1 length];
  if (v2)
  {
    uint64_t v3 = [a1 characterAtIndex:0];
    if ((_DWORD)v3 == 61)
    {
      [a1 substringFromIndex:1];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v4 = v3;
      [MEMORY[0x189607810] alphanumericCharacterSet];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = [v5 characterIsMember:v4];

      if ((_DWORD)v4) {
        id v2 = a1;
      }
      else {
        id v2 = 0LL;
      }
    }
  }

  return v2;
}

- (BOOL)ls_matchesStringForPluginQuery:()LSPluginQueryAdditions
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (![v4 hasPrefix:@"?"])
  {
    if ([v4 hasPrefix:@"<>"])
    {
      [v4 substringFromIndex:2];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == 0;
    }

    else if ([v4 hasPrefix:@"<="])
    {
      [v4 substringFromIndex:2];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == 1;
    }

    else
    {
      if (![v4 hasPrefix:@"=>"])
      {
        if ([v4 hasPrefix:@"="])
        {
          [v4 substringFromIndex:1];
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == 0;
        }

        else if ([v4 hasPrefix:@"<"])
        {
          [v4 substringFromIndex:1];
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == -1;
        }

        else
        {
          if (![v4 hasPrefix:@">"])
          {
            BOOL v8 = -[__CFString compare:options:](a1, "compare:options:", v4, 64LL) == 0;
            goto LABEL_20;
          }

          [v4 substringFromIndex:1];
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v11 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == 1;
        }

        BOOL v8 = v11;
        goto LABEL_19;
      }

      [v4 substringFromIndex:2];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = -[__CFString compare:options:](a1, "compare:options:", v6, 64LL) == -1;
    }

    BOOL v8 = !v7;
LABEL_19:

    goto LABEL_20;
  }

  if ([v4 hasPrefix:@"?UT-CONFORMS:"])
  {
    int v5 = UTTypeConformsTo(a1, (CFStringRef)[v4 substringFromIndex:13]);
LABEL_8:
    BOOL v8 = v5 != 0;
    goto LABEL_20;
  }

  if ([v4 hasPrefix:@"?UT-IS:"])
  {
    int v5 = UTTypeConformsTo((CFStringRef)[v4 substringFromIndex:7], a1);
    goto LABEL_8;
  }

  _LSDefaultLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_183E58000, v9, OS_LOG_TYPE_DEFAULT, "Unrecognized match operator %@", (uint8_t *)&v12, 0xCu);
  }

  BOOL v8 = 0LL;
LABEL_20:

  return v8;
}

- (uint64_t)ls_matchesForPluginQuery:()LSPluginQueryAdditions
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  if (_NSIsNSString())
  {
    char v5 = objc_msgSend(a1, "ls_matchesStringForPluginQuery:", v4);
    *((_BYTE *)v12 + 24) = v5;
  }

  else if (_NSIsNSArray())
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke;
    v8[3] = &unk_189D77CC8;
    v10 = &v11;
    v8[4] = a1;
    id v9 = v4;
    [v9 enumerateObjectsUsingBlock:v8];
  }

  uint64_t v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end