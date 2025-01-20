void sub_100002DBC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  v3 = a2;
  sleep(1u);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier", (void)v16));
        if ([v10 isEqual:@"test"])
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 actions]);
          v12 = [v11 count];

          if (!v12)
          {
            [v9 setTitle:@"Zero Action After"];
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=APPLE_ACCOUNT"));
            v14 = (void *)objc_claimAutoreleasedReturnValue( +[FLFollowUpAction actionWithLabel:url:]( &OBJC_CLASS___FLFollowUpAction,  "actionWithLabel:url:",  @"ADDED LATER",  v13));
            v20 = v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL));
            [v9 setActions:v15];

            [*(id *)(a1 + 32) postFollowUpItem:v9 error:0];
          }
        }

        else
        {
        }
      }

      v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_100003454(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_10000345C(id a1, UIAlertAction *a2)
{
  id v2 = [(id)0x3039 stringValue];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}