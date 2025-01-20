void sub_2504(void *a1)
{
  id v1;
  _UNKNOWN **v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  NSFileProtectionType v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  NSFileProtectionType v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  NSFileAttributeKey v29;
  NSFileProtectionType v30;
  NSFileAttributeKey v31;
  NSFileProtectionType v32;
  v1 = a1;
  v28 = 0;
  v2 = &MCCloudConfigurationDetailsFilePath_ptr;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  else {
    v4 = 1;
  }
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v27 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v1 error:&v27]);
    v7 = v27;

    if (!v7)
    {
      v8 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSFileProtectionKey]);

      if (v8 == NSFileProtectionNone
        || (v31 = NSFileProtectionKey,
            v32 = NSFileProtectionNone,
            v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1)),  v26 = 0,  [v3 setAttributes:v9 ofItemAtPath:v1 error:&v26],  v7 = v26,  v9,  !v7))
      {
        v22 = v3;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtPath:", v1, v6));
        v10 = objc_claimAutoreleasedReturnValue([v23 nextObject]);
        if (v10)
        {
          v11 = (void *)v10;
          v12 = 0LL;
          do
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:v11]);
            v14 = v2;
            v15 = (void *)objc_claimAutoreleasedReturnValue([v2[15] defaultManager]);
            v25 = v12;
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 attributesOfItemAtPath:v13 error:&v25]);
            v7 = v25;

            v17 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSFileProtectionKey]);
            if (v17 != NSFileProtectionNone)
            {
              v29 = NSFileProtectionKey;
              v30 = NSFileProtectionNone;
              v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
              v24 = v7;
              [v22 setAttributes:v18 ofItemAtPath:v13 error:&v24];
              v19 = v24;

              v7 = v19;
            }

            v20 = objc_claimAutoreleasedReturnValue([v23 nextObject]);
            v11 = (void *)v20;
            v12 = v7;
            v2 = v14;
          }

          while (v20);
        }

        else
        {
          v7 = 0LL;
        }

        v6 = v21;
        v3 = v22;
      }
    }
  }
}

void sub_27BC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  _DMLogFunc(v1, 5LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", v3));
  objc_msgSend( v4,  "migrateWithContext:passcodeWasSetInBackup:completion:",  *(unsigned int *)(a1 + 48),  objc_msgSend(*(id *)(a1 + 40), "wasPasscodeSetInBackup"),  0);
}
}

void sub_2EC8(id a1, NSError *a2)
{
  if (a2) {
    _DMLogFunc(v2, 3LL);
  }
  else {
    _DMLogFunc(v2, 5LL);
  }
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}