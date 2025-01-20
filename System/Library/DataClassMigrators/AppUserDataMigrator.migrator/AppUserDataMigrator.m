id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17) {
    v19 = (NSMutableDictionary *)[v17 mutableCopy];
  }
  else {
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v20 = v19;
  if (v18)
  {
    v21 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  a8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  NSLocalizedDescriptionKey);
  }

  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, MIFunctionNameErrorKey);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  MISourceFileLineErrorKey);

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a4,  v20));
  return v24;
}

id _CreateError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id ErrorV = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(ErrorV);
}

id _CreateAndLogError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id _CreateAndLogErrorV( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id ErrorV = _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(ErrorV);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

  uint64_t v20 = gLogHandle;
  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
      [v15 code];
      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
      MOLogWrite(v20, 3LL, a1, @"%d: %@ (%@:%ld %@)");
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite(gLogHandle, 3LL, a1, @"%d: %@");
  }

  return v17;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain]
    && [v1 code] == &dword_C)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (char *)&dword_8 + 3)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
      else {
        BOOL v4 = 0LL;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
    free(v1);
  }

  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

id MIBooleanValue(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3) & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v5)) & 1) == 0)
        {
          uint64_t v6 = 0LL;
          goto LABEL_11;
        }

        v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = 1LL;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v1 count]));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v8) & 1) != 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  id v9 = [v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_2E54;
  v8[3] = &unk_41D8;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_2E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_2E54(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass(v8) & 1) == 0 || a1[6] && (objc_opt_isKindOfClass(v7) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0) {
      id v2 = v1;
    }
    else {
      id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v1));
    }
    id v3 = v2;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_11;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      id v2 = v1;
LABEL_7:
      id v3 = v2;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    id v6 = v1;
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    goto LABEL_7;
  }

  objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(v1) & 1) == 0)
  {
LABEL_11:
    id v3 = 0LL;
    goto LABEL_12;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 allObjects]);
  else {
    id v3 = 0LL;
  }

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}