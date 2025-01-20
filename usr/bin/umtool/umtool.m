LABEL_11:
  return v5;
}

void sub_100005630(id a1)
{
  v3[0] = @"uid";
  v3[1] = @"alternateDSID";
  v3[2] = @"username";
  v3[3] = @"givenName";
  v3[4] = @"familyName";
  v3[5] = @"displayName";
  v3[6] = @"photoURL";
  v3[7] = @"userAuxiliaryString";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 8LL));
  v2 = (void *)qword_100010BF8;
  qword_100010BF8 = v1;
}

void sub_1000057B4(id a1)
{
  v3[0] = @"personastring";
  v3[1] = @"personatype";
  v3[2] = @"bundleid";
  v3[3] = @"imagepath";
  v3[4] = @"puid";
  v3[5] = @"ptestcount";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 6LL));
  v2 = (void *)qword_100010C08;
  qword_100010C08 = v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  +[UMTestPrint println](&OBJC_CLASS___UMTestPrint, "println");
  uint64_t v1 = (void *)objc_opt_class(&OBJC_CLASS___UMTool);
  id v8 = 0LL;
  unsigned __int8 v2 = [v1 executeWithOutError:&v8];
  id v3 = v8;
  v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (v3) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v1 helpDetailsForDepth:0]);
    }
    v6 = (void *)v5;
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"%@", v5);
  }

  +[UMTestPrint println](&OBJC_CLASS___UMTestPrint, "println");

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100006F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

uint64_t sub_100006FB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006FC4(uint64_t a1)
{
}

void sub_100006FCC(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100007728(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
      v13 = (void *)[v5 objectForKeyedSubscript:v12];
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
      id v15 = [v13 compare:v14 options:64];

      if (v15) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v15 = 0LL;
  }

  return v15;
}
}

id objc_msgSend_volumeUUID(void *a1, const char *a2, ...)
{
  return [a1 volumeUUID];
}