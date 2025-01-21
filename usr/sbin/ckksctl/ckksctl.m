double sub_100003B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  double result;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_100003C1C(a2);
  v5 = malloc(104 * v4 + 208);
  *(void *)(a1 + 16) = v5;
  v5[4] = unk_10000C300;
  v5[5] = unk_10000C310;
  *((void *)v5 + 12) = 0LL;
  *v5 = unk_10000C2C0;
  v5[1] = *(_OWORD *)algn_10000C2D0;
  v5[2] = xmmword_10000C2E0;
  v5[3] = unk_10000C2F0;
  if (!v4)
  {
    v7 = 1LL;
    goto LABEL_10;
  }

  v6 = 0LL;
  v7 = 1LL;
  do
  {
    v8 = *(void *)(a2 + 16);
    if (*(_BYTE *)(v8 + v6 + 80))
    {
      v8 = *(void *)(a2 + 16);
    }

    v9 = *(void *)(a1 + 16) + 104 * v7++;
    v10 = (__int128 *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(void *)(v9 + 96) = *((void *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
LABEL_7:
    v6 += 104LL;
    --v4;
  }

  while (v4);
  v5 = *(_OWORD **)(a1 + 16);
LABEL_10:
  v16 = (char *)v5 + 104 * v7;
  *((void *)v16 + 12) = 0LL;
  result = 0.0;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  return result;
}

uint64_t sub_100003C1C(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = *(char **)(a1 + 16);
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = 0LL;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL)) {
        break;
      }
      ++v2;
      v1 += 104;
    }

    while (v2 != 1024);
  }

  return v2;
}

uint64_t sub_100003C90(uint64_t result)
{
  if (!result) {
    return result;
  }
  memset(v36, 170, sizeof(v36));
  sub_100003B04((uint64_t)v36, result);
  uint64_t v1 = sub_100003C1C((uint64_t)v36);
  uint64_t v2 = (const char *)v36[0];
  if (!v36[0]) {
    uint64_t v2 = "command";
  }
  printf("usage: %s", v2);
  if (v1)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = v1;
    while (!*(_BYTE *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104LL;
      if (!--v4)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = v1;
        while (2)
        {
          if (!*(void *)(v36[2] + v7 + 8) || *(_BYTE *)(v36[2] + v7)) {
            goto LABEL_31;
          }
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            uint64_t v9 = *(void *)(v36[2] + v7 + 48);
            if (*(void *)(v36[2] + v7 + 56))
            {
              if (!v9) {
                goto LABEL_30;
              }
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10) {
                v10 = "arg";
              }
              printf(" %s", v10);
            }

            else if (v9 || *(void *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }

LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104LL;
          if (!--v8)
          {
            uint64_t v11 = 16LL;
            uint64_t v12 = v1;
            do
            {
              if (*(void *)(v36[2] + v11)) {
                printf(" [%s]", *(const char **)(v36[2] + v11));
              }
              v11 += 104LL;
              --v12;
            }

            while (v12);
            uint64_t v13 = 0LL;
            uint64_t v14 = v1;
            do
            {
              if (*(void *)(v36[2] + v13 + 24))
              {
                if (*(_BYTE *)(v36[2] + v13 + 32)) {
                  printf(" [<%s>]");
                }
                else {
                  printf(" <%s>");
                }
              }

              v13 += 104LL;
              --v14;
            }

            while (v14);
            goto LABEL_42;
          }

          continue;
        }
      }
    }

    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      uint64_t v5 = *(void *)(v36[2] + v3 + 48);
      if (*(void *)(v36[2] + v3 + 56))
      {
        if (!v5) {
          goto LABEL_16;
        }
      }

      else if (!v5 && !*(void *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }

      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6) {
        v6 = "arg";
      }
      printf(" %s", v6);
    }

LABEL_16:
    putchar(93);
    goto LABEL_17;
  }

LABEL_42:
  putchar(10);
  if (v36[1]) {
    printf("\n%s\n", (const char *)v36[1]);
  }
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }

  uint64_t v15 = 0LL;
  uint64_t v16 = v1;
  do
  {
    if (*(void *)(v36[2] + v15 + 24)) {
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    }
    v15 += 104LL;
    --v16;
  }

  while (v16);
  puts("\noptional arguments:");
  uint64_t v17 = 88LL;
  uint64_t v18 = v1;
  do
  {
    if (!*(_BYTE *)(v36[2] + v17 - 88)) {
      goto LABEL_80;
    }
    if (*(void *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      uint64_t v19 = v36[2];
      uint64_t v20 = *(void *)(v36[2] + v17 - 40);
      if (*(void *)(v36[2] + v17 - 32))
      {
        if (!v20) {
          goto LABEL_63;
        }
      }

      else if (!v20 && !*(void *)(v36[2] + v17))
      {
        goto LABEL_63;
      }

      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22) {
        v22 = "arg";
      }
      printf(" %s", v22);
      uint64_t v19 = v36[2];
LABEL_63:
      uint64_t v23 = v19 + v17;
      if (*(void *)(v19 + v17 - 80))
      {
        uint64_t v25 = v23 - 40;
        uint64_t v24 = *(void *)(v23 - 40);
        if (*(void *)(v25 + 8))
        {
          if (v24) {
            goto LABEL_72;
          }
        }

        else if (v24 || *(void *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(void *)(v19 + v17 - 48)) {
            v27 = *(const char **)(v19 + v17 - 48);
          }
          else {
            v27 = "arg";
          }
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }

        if (*(void *)(v19 + v17 - 48)) {
          v26 = *(const char **)(v19 + v17 - 48);
        }
        else {
          v26 = "arg";
        }
        strlen(v26);
        printf(", --%-*s");
      }

      goto LABEL_79;
    }

    uint64_t v21 = *(void *)(v36[2] + v17 - 40);
    if (*(void *)(v36[2] + v17 - 32))
    {
      if (v21) {
        goto LABEL_78;
      }
    }

    else if (v21 || *(void *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }

    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104LL;
    --v18;
  }

  while (v18);
  uint64_t v28 = v1;
  while (2)
  {
    if (*(void *)(v36[2] + v18 + 8) && !*(_BYTE *)(v36[2] + v18))
    {
      uint64_t v29 = *(void *)(v36[2] + v18 + 48);
      if (*(void *)(v36[2] + v18 + 56))
      {
        if (!v29) {
          goto LABEL_86;
        }
LABEL_89:
        memset(v46, 170, 22);
        *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v44 = v30;
        __int128 v42 = v30;
        __int128 v43 = v30;
        __int128 v40 = v30;
        __int128 v41 = v30;
        __int128 v38 = v30;
        __int128 v39 = v30;
        *(_OWORD *)v37 = v30;
        uint64_t v31 = *(void *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32) {
          v32 = "arg";
        }
        if (v31) {
          v33 = "%s %s...";
        }
        else {
          v33 = "%s %s";
        }
        if (v31) {
          v34 = "%s [repeatable]";
        }
        else {
          v34 = "%s";
        }
        snprintf(__str, 0x1EuLL, v33, *(void *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(void *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }

      else
      {
        if (v29 || *(void *)(v36[2] + v18 + 88)) {
          goto LABEL_89;
        }
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }

    v18 += 104LL;
    if (--v28) {
      continue;
    }
    break;
  }

  puts("\noptional commands:");
  uint64_t v35 = 0LL;
  do
  {
    if (*(void *)(v36[2] + v35 + 16)) {
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    }
    v35 += 104LL;
    --v1;
  }

  while (v1);
  return putchar(10);
}

char **sub_100004258(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(_DWORD **)(a1 + 56);
  if (v4) {
    *uint64_t v4 = *(_DWORD *)(a1 + 64);
  }
  result = *(char ***)(a1 + 48);
  if (result) {
    result = (char **)asprintf(result, "%.1048576s", a2);
  }
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    uint64_t v7 = **(void **)(a1 + 96);
    **(void **)(a1 + 88) = realloc(*v6, 8 * (v7 + 1));
    result = (char **)asprintf((char **)(**(void **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(void **)(a1 + 96) = v7 + 1;
  }

  return result;
}

void sub_100004630(_Unwind_Exception *a1)
{
}

void sub_10000480C(_Unwind_Exception *a1)
{
}

void sub_1000049E0(_Unwind_Exception *a1)
{
}

void sub_100004E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000510C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000561C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1000057D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_100005D60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100005EC0(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v4 = objc_claimAutoreleasedReturnValue([a3 description]);
    printf("Error causing havoc: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    if (a2) {
      uint64_t v5 = @"ON";
    }
    else {
      uint64_t v5 = @"OFF";
    }
    printf( "Success. Havoc is now %s\n", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100005F58(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = objc_claimAutoreleasedReturnValue([a2 description]);
    printf("Error deleting zone: %s\n", (const char *)[v3 UTF8String]);
  }

  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100005FCC(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = objc_claimAutoreleasedReturnValue([a2 description]);
    printf("Error modifying tlk shares: %s\n", (const char *)[v3 UTF8String]);
  }

  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006040(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v17 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = objc_claimAutoreleasedReturnValue([v11 description]);
    printf("Error fetching view: %s\n", (const char *)[v13 UTF8String]);
  }

  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v14 setObject:v17 forKeyedSubscript:@"tlk"];
      [v14 setObject:v9 forKeyedSubscript:@"pastTLKs"];
      [v14 setObject:v10 forKeyedSubscript:@"tlkShares"];
      sub_1000061E4(v14);
      putchar(10);
    }

    else
    {
      id v15 = objc_claimAutoreleasedReturnValue([v17 description]);
      printf("TLK: %s\n", (const char *)[v15 UTF8String]);

      id v16 = objc_claimAutoreleasedReturnValue([v9 description]);
      printf("Old TLKs: %s\n", (const char *)[v16 UTF8String]);

      id v14 = objc_claimAutoreleasedReturnValue([v10 description]);
      printf("TLKShares: %s\n", (const char *)[v14 UTF8String]);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000061E4(void *a1)
{
  id v1 = sub_1000062B8(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  3LL,  &v6));
  id v4 = v6;

  if (v3)
  {
    uint64_t v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
    printf("%s", -[NSString UTF8String](v5, "UTF8String"));
  }

  else
  {
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    NSLog(@"error: %@", v5);
  }
}

id sub_1000062B8(void *a1)
{
  if (a1)
  {
    id v1 = [a1 mutableCopy];
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v2 = (void *)[v1 allKeys];
    id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v7]);
          id v9 = sub_1000067C0(v8);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          [v1 setObject:v10 forKeyedSubscript:v7];
        }

        id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v4);
    }
  }

  else
  {
    id v1 = 0LL;
  }

  return v1;
}

void sub_1000063FC(void *a1, int a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)[v3 objectForKeyedSubscript:v11];
        sub_10000654C(v11, v12, a2);
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

void sub_10000654C(void *a1, void *a2, int a3)
{
  id v36 = a1;
  id v5 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a3 == 1)
    {
      sub_1000066EC(@"\n%*s%@ -", v7, v8, v9, v10, v11, v12, v13, 4LL);
      sub_1000066EC(@"%*s------------------------", v29, v30, v31, v32, v33, v34, v35, 4LL);
    }

    else if (a3)
    {
      sub_1000066EC(@"%*s%@ -", v7, v8, v9, v10, v11, v12, v13, (4 * a3));
    }

    else
    {
      sub_1000066EC(@"\n%*s%@ -", v7, v8, v9, v10, v11, v12, v13, 0LL);
      sub_1000066EC(@"%*s========================", v14, v15, v16, v17, v18, v19, v20, 0LL);
    }

    sub_1000063FC(v5, (a3 + 1));
  }

  else
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v21) & 1) != 0)
    {
      sub_1000066EC(@"%*s%@ -", v22, v23, v24, v25, v26, v27, v28, (4 * a3));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100006758;
      v37[3] = &unk_10000C440;
      int v38 = a3 + 1;
      [v5 enumerateObjectsUsingBlock:v37];
    }

    else
    {
      sub_1000066EC(@"%*s%@: %@", v22, v23, v24, v25, v26, v27, v28, (4 * a3));
    }
  }
}

void sub_1000066EC( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  uint64_t v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &a9);

  uint64_t v11 = v10;
  puts(-[NSString UTF8String](v11, "UTF8String"));
}

void sub_100006758(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  sub_10000654C(v6, v5, *(unsigned int *)(a1 + 32));
}

id sub_1000067C0(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v7 = 0LL;
    goto LABEL_17;
  }

  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) == 0)
  {
    if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v1))
    {
LABEL_6:
      id v11 = v1;
LABEL_7:
      id v7 = v11;
      goto LABEL_17;
    }

    if ((objc_opt_respondsToSelector(v1, "jsonDictionary") & 1) != 0)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v1 jsonDictionary]);
      if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v12)) {
        id v13 = v12;
      }
      else {
        id v13 = (id)objc_claimAutoreleasedReturnValue([v1 description]);
      }
      id v7 = v13;
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v1, v14) & 1) != 0) {
        goto LABEL_6;
      }
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v1, v15) & 1) != 0)
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue([v1 base64EncodedStringWithOptions:0]);
        goto LABEL_7;
      }

      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v1, v17) & 1) != 0)
      {
        uint64_t v18 = sub_1000062B8(v1);
        id v11 = (id)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_7;
      }

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v1, v19) & 1) == 0)
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue([v1 description]);
        goto LABEL_7;
      }

      id v20 = v1;
      id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]));
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v12 = v20;
      id v21 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v12);
            }
            uint64_t v25 = sub_1000067C0(*(void *)(*((void *)&v27 + 1) + 8LL * (void)i));
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            [v7 addObject:v26];
          }

          id v22 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v22);
      }
    }

    goto LABEL_17;
  }

  v32[0] = @"code";
  id v3 = v1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 code]));
  v32[1] = @"domain";
  v33[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  v33[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  id v7 = [v6 mutableCopy];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v9 = sub_1000062B8(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setObject:v10 forKeyedSubscript:@"userInfo"];

LABEL_17:
  return v7;
}

uint64_t sub_100006B08(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = objc_claimAutoreleasedReturnValue([a2 description]);
    printf("Error proposing TLK: %s\n", (const char *)[v3 UTF8String]);
  }

  else
  {
    puts("Success.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006B7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    printf("Error sending metric: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1LL;
    }
  }

  else
  {
    puts("Complete.");
    uint64_t v5 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006C1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    printf("Error pushing: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1LL;
    }
  }

  else
  {
    puts("Complete.");
    uint64_t v5 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006CBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    printf("Error fetching: %s\n", (const char *)[v4 UTF8String]);

    if ([v6 code]) {
      uint64_t v5 = (uint64_t)[v6 code];
    }
    else {
      uint64_t v5 = -1LL;
    }
  }

  else
  {
    puts("Complete.");
    uint64_t v5 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006D5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_claimAutoreleasedReturnValue([v6 description]);
    printf("ERROR FETCHING STATUS: %s\n", (const char *)[v8 UTF8String]);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  id v10 = [v9 mutableCopy];

  id v11 = &NSLog_ptr;
  v210 = v10;
  v211 = v5;
  v209 = v7;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"reachability"]);
    [v10 setObject:0 forKeyedSubscript:@"reachability"];
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = 0LL;
    }
    id v252 = v14;

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ckdeviceID"]);
    [v10 setObject:0 forKeyedSubscript:@"ckdeviceID"];
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 0LL;
    }
    id v250 = v17;

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ckdeviceIDError"]);
    [v10 setObject:0 forKeyedSubscript:@"ckdeviceIDError"];
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
      id v20 = v18;
    }
    else {
      id v20 = 0LL;
    }
    id v248 = v20;

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lockstatetracker"]);
    [v10 setObject:0 forKeyedSubscript:@"lockstatetracker"];
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = 0LL;
    }
    id v246 = v23;

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"cloudkitRetryAfter"]);
    [v10 setObject:0 forKeyedSubscript:@"cloudkitRetryAfter"];
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = 0LL;
    }
    id v244 = v26;

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastCKKSPush"]);
    [v10 setObject:0 forKeyedSubscript:@"lastCKKSPush"];
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
      __int128 v29 = v27;
    }
    else {
      __int128 v29 = 0LL;
    }
    id v242 = v29;

    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"policy"]);
    [v10 setObject:0 forKeyedSubscript:@"policy"];
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = 0LL;
    }
    id v240 = v32;

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"viewsFromPolicy"]);
    [v10 setObject:0 forKeyedSubscript:@"viewsFromPolicy"];
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
      uint64_t v35 = v33;
    }
    else {
      uint64_t v35 = 0LL;
    }
    id v36 = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"activeAccount"]);
    [v10 setObject:0 forKeyedSubscript:@"activeAccount"];
    uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0) {
      __int128 v39 = v37;
    }
    else {
      __int128 v39 = 0LL;
    }
    id v227 = v39;

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ckaccountstatus"]);
    [v10 setObject:0 forKeyedSubscript:@"ckaccountstatus"];
    uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0) {
      __int128 v42 = v40;
    }
    else {
      __int128 v42 = 0LL;
    }
    id v43 = v42;

    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"accounttracker"]);
    [v10 setObject:0 forKeyedSubscript:@"accounttracker"];
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0) {
      v46 = v44;
    }
    else {
      v46 = 0LL;
    }
    id v47 = v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"fetcher"]);
    [v10 setObject:0 forKeyedSubscript:@"fetcher"];
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0) {
      v50 = v48;
    }
    else {
      v50 = 0LL;
    }
    id v238 = v50;

    v51 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ckksstate"]);
    [v10 setObject:0 forKeyedSubscript:@"ckksstate"];
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0) {
      v53 = v51;
    }
    else {
      v53 = 0LL;
    }
    id v54 = v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastIncomingQueueOperation"]);
    [v10 setObject:0 forKeyedSubscript:@"lastIncomingQueueOperation"];
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0) {
      v57 = v55;
    }
    else {
      v57 = 0LL;
    }
    id v236 = v57;

    v58 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastNewTLKOperation"]);
    [v10 setObject:0 forKeyedSubscript:@"lastNewTLKOperation"];
    uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0) {
      v60 = v58;
    }
    else {
      v60 = 0LL;
    }
    id v234 = v60;

    v61 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastOutgoingQueueOperation"]);
    [v10 setObject:0 forKeyedSubscript:@"lastOutgoingQueueOperation"];
    uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0) {
      v63 = v61;
    }
    else {
      v63 = 0LL;
    }
    id v232 = v63;

    v64 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastProcessReceivedKeysOperation"]);
    [v10 setObject:0 forKeyedSubscript:@"lastProcessReceivedKeysOperation"];
    uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v64, v65) & 1) != 0) {
      v66 = v64;
    }
    else {
      v66 = 0LL;
    }
    id v230 = v66;

    v67 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lastReencryptOutgoingItemsOperation"]);
    [v10 setObject:0 forKeyedSubscript:@"lastReencryptOutgoingItemsOperation"];
    uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0) {
      v69 = v67;
    }
    else {
      v69 = 0LL;
    }
    id v70 = v69;

    v71 = (void *)objc_claimAutoreleasedReturnValue([v210 objectForKeyedSubscript:@"launchSequence"]);
    [v210 setObject:0 forKeyedSubscript:@"launchSequence"];
    uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0) {
      v73 = v71;
    }
    else {
      v73 = 0LL;
    }
    id v74 = v73;

    if (!*(_BYTE *)(a1 + 40))
    {
      puts("================================================================================\n");
      puts("Global state:\n");
    }

    id v75 = v54;
    printf("CKKS state machine:   %s\n", (const char *)[v75 UTF8String]);
    id v76 = v227;
    printf("Active account:       %s\n", (const char *)[v76 UTF8String]);
    id v77 = v43;
    printf("CloudKit account:     %s\n", (const char *)[v77 UTF8String]);
    id v78 = v47;
    printf("Account tracker:      %s\n", (const char *)[v78 UTF8String]);
    v79 = v240;
    id v80 = objc_claimAutoreleasedReturnValue([v240 description]);
    printf("Syncing Policy:       %s\n", (const char *)[v80 UTF8String]);

    id v81 = objc_claimAutoreleasedReturnValue([v36 description]);
    printf("Views from policy:    %s\n", (const char *)[v81 UTF8String]);

    if (!*(_BYTE *)(a1 + 40))
    {
      id v228 = v76;
      id v82 = objc_claimAutoreleasedReturnValue([v252 description]);
      printf("Reachability:         %s\n", (const char *)[v82 UTF8String]);

      id v83 = objc_claimAutoreleasedReturnValue([v244 description]);
      printf("Retry:                %s\n", (const char *)[v83 UTF8String]);

      id v84 = objc_claimAutoreleasedReturnValue([v250 description]);
      printf("CK DeviceID:          %s\n", (const char *)[v84 UTF8String]);

      id v85 = objc_claimAutoreleasedReturnValue([v248 description]);
      printf("CK DeviceID Error:    %s\n", (const char *)[v85 UTF8String]);

      id v86 = objc_claimAutoreleasedReturnValue([v246 description]);
      printf("Lock state:           %s\n", (const char *)[v86 UTF8String]);

      id v87 = objc_claimAutoreleasedReturnValue([v242 description]);
      printf("Last CKKS push:       %s\n", (const char *)[v87 UTF8String]);

      putchar(10);
      id v88 = objc_claimAutoreleasedReturnValue([v238 description]);
      printf("zone change fetcher:                 %s\n", (const char *)[v88 UTF8String]);

      if (v236) {
        v89 = (const char *)[v236 UTF8String];
      }
      else {
        v89 = "never";
      }
      printf("lastIncomingQueueOperation:          %s\n", v89);
      if (v234) {
        v90 = (const char *)[v234 UTF8String];
      }
      else {
        v90 = "never";
      }
      printf("lastNewTLKOperation:                 %s\n", v90);
      if (v232) {
        v91 = (const char *)[v232 UTF8String];
      }
      else {
        v91 = "never";
      }
      printf("lastOutgoingQueueOperation:          %s\n", v91);
      if (v230) {
        v92 = (const char *)[v230 UTF8String];
      }
      else {
        v92 = "never";
      }
      printf("lastProcessReceivedKeysOperation:    %s\n", v92);
      uint64_t v212 = a1;
      id v223 = v75;
      id v225 = v70;
      if (v70) {
        v93 = (const char *)[v70 UTF8String];
      }
      else {
        v93 = "never";
      }
      printf("lastReencryptOutgoingItemsOperation: %s\n", v93);
      puts("Launch sequence:");
      __int128 v262 = 0u;
      __int128 v263 = 0u;
      __int128 v264 = 0u;
      __int128 v265 = 0u;
      id v94 = v74;
      id v95 = v74;
      id v96 = [v95 countByEnumeratingWithState:&v262 objects:v268 count:16];
      if (v96)
      {
        id v97 = v96;
        uint64_t v98 = *(void *)v263;
        do
        {
          for (i = 0LL; i != v97; i = (char *)i + 1)
          {
            if (*(void *)v263 != v98) {
              objc_enumerationMutation(v95);
            }
            id v100 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v262 + 1) + 8 * (void)i) description]);
            printf("\t%s\n", (const char *)[v100 UTF8String]);
          }

          id v97 = [v95 countByEnumeratingWithState:&v262 objects:v268 count:16];
        }

        while (v97);
      }

      a1 = v212;
      v79 = v240;
      id v74 = v94;
      id v75 = v223;
      id v70 = v225;
      id v76 = v228;
    }

    putchar(10);

    id v5 = v211;
    id v11 = &NSLog_ptr;
  }

  else {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1));
  }
  if (![v101 count]) {
    puts("No CKKS views are active.");
  }
  __int128 v260 = 0u;
  __int128 v261 = 0u;
  __int128 v258 = 0u;
  __int128 v259 = 0u;
  id obj = v101;
  id v102 = [obj countByEnumeratingWithState:&v258 objects:v267 count:16];
  if (v102)
  {
    id v103 = v102;
    uint64_t v243 = *(void *)v259;
    uint64_t v213 = a1;
    do
    {
      v104 = 0LL;
      id v214 = v103;
      do
      {
        if (*(void *)v259 != v243) {
          objc_enumerationMutation(obj);
        }
        int v105 = *(unsigned __int8 *)(a1 + 40);
        id v106 = [*(id *)(*((void *)&v258 + 1) + 8 * (void)v104) mutableCopy];
        v107 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"view"]);
        [v106 setObject:0 forKeyedSubscript:@"view"];
        uint64_t v108 = objc_opt_class(v11[13]);
        if ((objc_opt_isKindOfClass(v107, v108) & 1) != 0) {
          v109 = v107;
        }
        else {
          v109 = 0LL;
        }
        id v110 = v109;

        if (v105)
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"keystate"]);
          [v106 setObject:0 forKeyedSubscript:@"keystate"];
          uint64_t v112 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0) {
            v113 = v111;
          }
          else {
            v113 = 0LL;
          }
          id v114 = v113;

          id v115 = v110;
          v116 = (const char *)[v115 UTF8String];

          id v117 = v114;
          v118 = (const char *)[v117 UTF8String];

          printf("%-25s: %s\n", v116, v118);
        }

        else
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"ckksManaged"]);
          [v106 setObject:0 forKeyedSubscript:@"ckksManaged"];
          uint64_t v120 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v119, v120) & 1) != 0) {
            v121 = v119;
          }
          else {
            v121 = 0LL;
          }
          id v219 = v121;

          v122 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"zoneCreated"]);
          [v106 setObject:0 forKeyedSubscript:@"zoneCreated"];
          uint64_t v123 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v122, v123) & 1) != 0) {
            v124 = v122;
          }
          else {
            v124 = 0LL;
          }
          id v253 = v124;

          v125 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"zoneSubscribed"]);
          [v106 setObject:0 forKeyedSubscript:@"zoneSubscribed"];
          uint64_t v126 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v125, v126) & 1) != 0) {
            v127 = v125;
          }
          else {
            v127 = 0LL;
          }
          id v251 = v127;

          v128 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"zoneInitializeScheduler"]);
          [v106 setObject:0 forKeyedSubscript:@"zoneInitializeScheduler"];
          uint64_t v129 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v128, v129) & 1) != 0) {
            v130 = v128;
          }
          else {
            v130 = 0LL;
          }
          id v247 = v130;

          v131 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"keystate"]);
          [v106 setObject:0 forKeyedSubscript:@"keystate"];
          uint64_t v132 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v131, v132) & 1) != 0) {
            v133 = v131;
          }
          else {
            v133 = 0LL;
          }
          id v216 = v133;

          v134 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"statusError"]);
          [v106 setObject:0 forKeyedSubscript:@"statusError"];
          uint64_t v135 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v134, v135) & 1) != 0) {
            v136 = v134;
          }
          else {
            v136 = 0LL;
          }
          id v137 = v136;

          v138 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"itemsyncing"]);
          [v106 setObject:0 forKeyedSubscript:@"itemsyncing"];
          uint64_t v139 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v138, v139) & 1) != 0) {
            v140 = v138;
          }
          else {
            v140 = 0LL;
          }
          id v241 = v140;

          v141 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentTLK"]);
          [v106 setObject:0 forKeyedSubscript:@"currentTLK"];
          uint64_t v142 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v141, v142) & 1) != 0) {
            v143 = v141;
          }
          else {
            v143 = 0LL;
          }
          id v239 = v143;

          v144 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentClassA"]);
          [v106 setObject:0 forKeyedSubscript:@"currentClassA"];
          uint64_t v145 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v144, v145) & 1) != 0) {
            v146 = v144;
          }
          else {
            v146 = 0LL;
          }
          id v237 = v146;

          v147 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentClassC"]);
          [v106 setObject:0 forKeyedSubscript:@"currentClassC"];
          uint64_t v148 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v147, v148) & 1) != 0) {
            v149 = v147;
          }
          else {
            v149 = 0LL;
          }
          id v235 = v149;

          v150 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentTLKPtr"]);
          [v106 setObject:0 forKeyedSubscript:@"currentTLKPtr"];
          uint64_t v151 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v150, v151) & 1) != 0) {
            v152 = v150;
          }
          else {
            v152 = 0LL;
          }
          id v245 = v152;

          v153 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentClassAPtr"]);
          [v106 setObject:0 forKeyedSubscript:@"currentClassAPtr"];
          uint64_t v154 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v153, v154) & 1) != 0) {
            v155 = v153;
          }
          else {
            v155 = 0LL;
          }
          id v222 = v155;

          v156 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"currentClassCPtr"]);
          [v106 setObject:0 forKeyedSubscript:@"currentClassCPtr"];
          uint64_t v157 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v156, v157) & 1) != 0) {
            v158 = v156;
          }
          else {
            v158 = 0LL;
          }
          id v221 = v158;

          v159 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"launchSequence"]);
          [v106 setObject:0 forKeyedSubscript:@"launchSequence"];
          uint64_t v160 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0) {
            v161 = v159;
          }
          else {
            v161 = 0LL;
          }
          id v218 = v161;

          v162 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"oqe"]);
          [v106 setObject:0 forKeyedSubscript:@"oqe"];
          uint64_t v163 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v162, v163) & 1) != 0) {
            v164 = v162;
          }
          else {
            v164 = 0LL;
          }
          id v233 = v164;

          v165 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"iqe"]);
          [v106 setObject:0 forKeyedSubscript:@"iqe"];
          uint64_t v166 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v165, v166) & 1) != 0) {
            v167 = v165;
          }
          else {
            v167 = 0LL;
          }
          id v231 = v167;

          v168 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"keys"]);
          [v106 setObject:0 forKeyedSubscript:@"keys"];
          uint64_t v169 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v168, v169) & 1) != 0) {
            v170 = v168;
          }
          else {
            v170 = 0LL;
          }
          id v229 = v170;

          v171 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"ckmirror"]);
          [v106 setObject:0 forKeyedSubscript:@"ckmirror"];
          uint64_t v172 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v171, v172) & 1) != 0) {
            v173 = v171;
          }
          else {
            v173 = 0LL;
          }
          id v226 = v173;

          v174 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"devicestates"]);
          [v106 setObject:0 forKeyedSubscript:@"devicestates"];
          uint64_t v175 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v174, v175) & 1) != 0) {
            v176 = v174;
          }
          else {
            v176 = 0LL;
          }
          id v224 = v176;

          v177 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"tlkshares"]);
          [v106 setObject:0 forKeyedSubscript:@"tlkshares"];
          uint64_t v178 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v177, v178) & 1) != 0) {
            v179 = v177;
          }
          else {
            v179 = 0LL;
          }
          id v249 = v179;

          puts("================================================================================\n");
          v180 = v110;
          id v181 = v137;
          id v217 = v180;
          printf("View: %s\n\n", (const char *)[v217 UTF8String]);
          if (v137) {
            printf( "ERROR FETCHING STATUS: %s\n\n", (const char *)[v137 UTF8String]);
          }
          if (![v253 isEqualToString:@"yes"]
            || ([v251 isEqualToString:@"yes"] & 1) == 0)
          {
            id v182 = objc_claimAutoreleasedReturnValue([v253 description]);
            printf("CK Zone Created:            %s\n", (const char *)[v182 UTF8String]);

            id v183 = objc_claimAutoreleasedReturnValue([v251 description]);
            printf("CK Zone Subscribed:         %s\n", (const char *)[v183 UTF8String]);

            id v184 = objc_claimAutoreleasedReturnValue([v247 description]);
            printf("CK Zone initialize retry:   %s\n", (const char *)[v184 UTF8String]);

            putchar(10);
          }

          id v185 = v216;
          printf("Key state:            %s\n", (const char *)[v185 UTF8String]);
          id v186 = v219;
          printf("CKKS managed view:    %s\n", (const char *)[v186 UTF8String]);
          unsigned int v187 = [v186 isEqualToString:@"yes"];
          v220 = v181;
          if (v187)
          {
            v188 = v218;
            if (v239)
            {
              printf( "Current TLK: %s\n", (const char *)[v239 UTF8String]);
            }

            else
            {
              id v190 = [v11[13] stringWithFormat:@"missing; pointer is %@"];
                                                    v245)));
              printf("Current TLK:          %s\n", (const char *)[v190 UTF8String]);
            }

            if (v237)
            {
              printf( "Current ClassA: %s\n", (const char *)[v237 UTF8String]);
            }

            else
            {
              id v191 = [v11[13] stringWithFormat:@"missing; pointer is %@"];
                                                    v222)));
              printf("Current ClassA:       %s\n", (const char *)[v191 UTF8String]);
            }

            if (v235)
            {
              printf( "Current ClassC: %s\n", (const char *)[v235 UTF8String]);
            }

            else
            {
              [v11[13] stringWithFormat:@"missing; pointer is %@",
                                                    v221)));
              printf("Current ClassC:       %s\n", (const char *)[v192 UTF8String]);
            }
          }

          else
          {
            id v189 = objc_claimAutoreleasedReturnValue([v245 description]);
            printf("Current TLK:          %s\n", (const char *)[v189 UTF8String]);

            v188 = v218;
          }

          id v193 = objc_claimAutoreleasedReturnValue([v249 description]);
          printf("TLK shares:           %s\n", (const char *)[v193 UTF8String]);

          if (v187)
          {
            id v194 = objc_claimAutoreleasedReturnValue([v241 description]);
            printf("Item syncing:          %s\n", (const char *)[v194 UTF8String]);

            id v195 = objc_claimAutoreleasedReturnValue([v233 description]);
            printf("Outgoing Queue counts: %s\n", (const char *)[v195 UTF8String]);

            id v196 = objc_claimAutoreleasedReturnValue([v231 description]);
            printf("Incoming Queue counts: %s\n", (const char *)[v196 UTF8String]);

            id v197 = objc_claimAutoreleasedReturnValue([v229 description]);
            printf("Key counts: %s\n", (const char *)[v197 UTF8String]);

            id v198 = objc_claimAutoreleasedReturnValue([v226 description]);
            printf("Item counts (by key):  %s\n", (const char *)[v198 UTF8String]);

            id v199 = objc_claimAutoreleasedReturnValue([v224 description]);
            printf("Peer states:           %s\n", (const char *)[v199 UTF8String]);
          }

          puts("Launch sequence:");
          __int128 v254 = 0u;
          __int128 v255 = 0u;
          __int128 v256 = 0u;
          __int128 v257 = 0u;
          id v200 = v188;
          id v201 = [v200 countByEnumeratingWithState:&v254 objects:v266 count:16];
          if (v201)
          {
            id v202 = v201;
            uint64_t v203 = *(void *)v255;
            do
            {
              for (j = 0LL; j != v202; j = (char *)j + 1)
              {
                if (*(void *)v255 != v203) {
                  objc_enumerationMutation(v200);
                }
                id v205 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v254 + 1) + 8 * (void)j) description]);
                printf("\t%s\n", (const char *)[v205 UTF8String]);
              }

              id v202 = [v200 countByEnumeratingWithState:&v254 objects:v266 count:16];
            }

            while (v202);
          }

          v206 = (void *)objc_claimAutoreleasedReturnValue([v106 allKeys]);
          id v207 = [v206 count];

          if (v207)
          {
            id v208 = objc_claimAutoreleasedReturnValue([v106 description]);
            printf("\nExtra information: %s\n", (const char *)[v208 UTF8String]);
          }

          putchar(10);

          a1 = v213;
          id v103 = v214;
          id v11 = &NSLog_ptr;
        }

        v104 = (char *)v104 + 1;
      }

      while (v104 != v103);
      id v103 = [obj countByEnumeratingWithState:&v258 objects:v267 count:16];
    }

    while (v103);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008758(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"error"];
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = (void *)[v14 objectForKeyedSubscript:@"view"];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000088EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_1000066EC(@"resync errored: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }

  else
  {
    puts("resync success.");
    id v11 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008960(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_1000066EC(@"Reset error: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }

  else
  {
    puts("CloudKit Reset complete.");
    id v11 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000089D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    sub_1000066EC(@"reset error: %@\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = [v12 code];
  }

  else
  {
    puts("reset complete.");
    id v11 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008A48(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 description]);
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"error"];
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008AFC;
  v7[3] = &unk_10000C330;
  id v8 = *(id *)(a1 + 32);
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100008AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t start(int a1, char *const *a2)
{
  unint64_t v2 = sub_100003C1C((uint64_t)v88);
  id v3 = (option *)calloc(v2 + 1, 0x20uLL);
  size_t v4 = 2 * v2 + 2;
  uint64_t v5 = (char *)malloc(v4);
  id v6 = v5;
  unint64_t v7 = 0LL;
  unint64_t v8 = 0LL;
  uint64_t v9 = (char *)v88[2];
  uint64_t v10 = (char *)v88[2] + 48;
  do
  {
    if (v7 >= v2) {
      goto LABEL_13;
    }
    id v11 = (const char *)*((void *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      uint64_t v13 = *(void *)v10;
      id v12 = (int *)*((void *)v10 + 1);
      if (v12)
      {
        int v14 = 2 * (v13 != 0);
      }

      else if (v13)
      {
        int v14 = 1;
      }

      else
      {
        int v14 = *((void *)v10 + 5) != 0LL;
      }

      uint64_t v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }

    ++v8;
    v10 += 104;
  }

  while (v8 <= v2);
  if (v7 < v2)
  {
    uint64_t v16 = &v3[v7];
    v16->name = 0LL;
    v16->has_arg = 0;
    v16->flag = 0LL;
    v16->val = 0;
LABEL_14:
    size_t v17 = 0LL;
    __int128 v18 = v9 + 48;
    unint64_t v19 = v2;
    while (1)
    {
      if (*((_BYTE *)v18 - 48))
      {
        if (v17 >= v4) {
          goto LABEL_25;
        }
        v5[v17] = *((_BYTE *)v18 - 48);
        size_t v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            char v74 = 0;
            goto LABEL_28;
          }

          v5[v20] = 58;
          v17 += 2LL;
        }

        else
        {
          ++v17;
        }
      }

      v18 += 13;
      if (!--v19)
      {
        char v74 = 0;
        goto LABEL_27;
      }
    }
  }

LABEL_13:
  if (v2) {
    goto LABEL_14;
  }
  size_t v17 = 0LL;
  char v74 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  int v87 = 0;
  do
  {
    while (1)
    {
      int v21 = getopt_long(a1, a2, v6, v3, &v87);
      if (v21) {
        break;
      }
      if (!v87)
      {
LABEL_130:
        sub_100003C90((uint64_t)v88);
        exit(1);
      }

      if ((v74 & 1) == 0)
      {
        uint64_t v23 = 0LL;
        p_name = &v3[v87].name;
        unint64_t v25 = v2;
        do
        {
          uint64_t v26 = (char *)v88[2] + v23;
          __int128 v27 = *(const char **)((char *)v88[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              size_t v28 = strlen(*(const char **)((char *)v88[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                __int128 v29 = *((_OWORD *)v26 + 5);
                __int128 v84 = *((_OWORD *)v26 + 4);
                __int128 v85 = v29;
                uint64_t v86 = *((void *)v26 + 12);
                __int128 v30 = *((_OWORD *)v26 + 1);
                __int128 v80 = *(_OWORD *)v26;
                __int128 v81 = v30;
                __int128 v31 = *((_OWORD *)v26 + 3);
                __int128 v82 = *((_OWORD *)v26 + 2);
                __int128 v83 = v31;
                sub_100004258((uint64_t)&v80, optarg);
              }
            }
          }

          v23 += 104LL;
          --v25;
        }

        while (v25);
      }
    }

    if (v21 == -1)
    {
      uint64_t v39 = optind;
      if (optind >= a1)
      {
LABEL_71:
        free(v88[2]);
        free(v3);
        free(v6);
      }

      else
      {
        unint64_t v40 = 0LL;
        do
        {
          unint64_t v41 = v40;
          if ((v74 & 1) == 0)
          {
            uint64_t v42 = 0LL;
            id v43 = (char *)v88[2];
            __int128 v44 = (const char **)((char *)v88[2] + 16);
            while (!*v44 || strcmp(a2[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42) {
                goto LABEL_60;
              }
            }

            id v47 = &v43[104 * v42];
            __int128 v48 = *((_OWORD *)v47 + 5);
            __int128 v84 = *((_OWORD *)v47 + 4);
            __int128 v85 = v48;
            uint64_t v86 = *((void *)v47 + 12);
            __int128 v49 = *((_OWORD *)v47 + 1);
            __int128 v80 = *(_OWORD *)v47;
            __int128 v81 = v49;
            __int128 v50 = *((_OWORD *)v47 + 3);
            __int128 v82 = *((_OWORD *)v47 + 2);
            __int128 v83 = v50;
            sub_100004258((uint64_t)&v80, 0LL);
            goto LABEL_71;
          }

LABEL_60:
          id v36 = v88[2];
          if (v41 >= v2) {
            goto LABEL_50;
          }
          uint64_t v45 = (char *)v88[2] + 104 * v41 + 24;
          unint64_t v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40) {
              goto LABEL_49;
            }
          }

          v46 = (void *)*((void *)v88[2] + 13 * v40 + 6);
          if (v46)
          {
            void *v46 = a2[v39];
            ++v40;
          }

          ++v39;
        }

        while ((_DWORD)v39 != a1);
        free(v88[2]);
        free(v3);
        free(v6);
        if (v41 >= v2) {
          goto LABEL_51;
        }
      }

      v51 = objc_autoreleasePoolPush();
      id v79 = 0LL;
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSControl CKKSControlObject:error:]( &OBJC_CLASS___CKKSControl,  "CKKSControlObject:error:",  0LL,  &v79));
      id v53 = v79;
      if (v53 || !v52)
      {
        v73 = (const char *)objc_msgSend( objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description")), "UTF8String");
        errx(1, "no CKKSControl failed: %s", v73);
      }

      id v54 = -[CKKSControlCLI initWithCKKSControl:]( objc_alloc(&OBJC_CLASS___CKKSControlCLI),  "initWithCKKSControl:",  v52);
      if (qword_100010C10) {
        id v78 = (char **)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  qword_100010C10,  4LL));
      }
      else {
        id v78 = 0LL;
      }
      if (qword_100010C38) {
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  qword_100010C38,  4LL));
      }
      else {
        v55 = 0LL;
      }
      if (qword_100010C40) {
        id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  qword_100010C40,  4LL));
      }
      else {
        id v76 = 0LL;
      }
      uint64_t v56 = &NSLog_ptr;
      if (qword_100010C20)
      {
        uint64_t v57 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        if (qword_100010C20)
        {
          unint64_t v58 = 0LL;
          do
          {
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *(void *)(qword_100010C18 + 8 * v58),  4LL));
            [(id)v57 addObject:v59];

            ++v58;
          }

          while (v58 < qword_100010C20);
          uint64_t v56 = &NSLog_ptr;
        }
      }

      else
      {
        uint64_t v57 = 0LL;
      }

      if (qword_100010C30)
      {
        uint64_t v60 = objc_claimAutoreleasedReturnValue([v56[10] array]);
        if (qword_100010C30)
        {
          unint64_t v61 = 0LL;
          do
          {
            uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *(void *)(qword_100010C28 + 8 * v61),  4LL));
            [(id)v60 addObject:v62];

            ++v61;
          }

          while (v61 < qword_100010C30);
        }
      }

      else
      {
        uint64_t v60 = 0LL;
      }

      if (dword_100010C48)
      {
        v63 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if (dword_100010C00)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchPerformanceCounters](v54, "fetchPerformanceCounters"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v63,  "setObject:forKeyedSubscript:",  v64,  @"performance");
        }

        char v65 = dword_100010C04;
        if (dword_100010C04)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchStatus:](v54, "fetchStatus:", v78));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v66, @"status");

          char v65 = dword_100010C04 != 0;
        }

        if ((v65 & 1) == 0 && !dword_100010C00 || (sub_1000061E4(v63), putchar(10), !dword_100010C04)) {
          -[CKKSControlCLI printHumanReadableStatus:shortenOutput:]( v54,  "printHumanReadableStatus:shortenOutput:",  v78,  dword_100010C08 != 0);
        }
        goto LABEL_106;
      }

      if (dword_100010C00)
      {
        v63 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchPerformanceCounters](v54, "fetchPerformanceCounters"));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v63,  "setObject:forKeyedSubscript:",  v67,  @"performance");

        sub_1000063FC(v63, 0);
LABEL_106:

        uint64_t v37 = 0LL;
LABEL_107:

        objc_autoreleasePoolPop(v51);
        return v37;
      }

      if (dword_100010C4C)
      {
        uint64_t v68 = v78;
        uint64_t v37 = -[CKKSControlCLI fetch:](v54, "fetch:", v78);
LABEL_110:

        goto LABEL_107;
      }

      if (dword_100010C50)
      {
        v69 = v78;
        int64_t v70 = -[CKKSControlCLI push:](v54, "push:", v78);
LABEL_119:
        uint64_t v37 = v70;

        goto LABEL_107;
      }

      if (dword_100010C58)
      {
        v69 = v78;
        int64_t v70 = -[CKKSControlCLI resetLocal:](v54, "resetLocal:", v78);
        goto LABEL_119;
      }

      if (dword_100010C5C)
      {
        v69 = v78;
        int64_t v70 = -[CKKSControlCLI resetCloudKit:](v54, "resetCloudKit:", v78);
        goto LABEL_119;
      }

      if (dword_100010C54)
      {
        v69 = v78;
        int64_t v70 = -[CKKSControlCLI resync:](v54, "resync:", v78);
        goto LABEL_119;
      }

      if (dword_100010C60)
      {
        uint64_t v37 = -[CKKSControlCLI ckmetric](v54, "ckmetric");

        goto LABEL_107;
      }

      if (dword_100010C64)
      {
        if (v78)
        {
          if (v55)
          {
            uint64_t v68 = v78;
            uint64_t v71 = -[CKKSControlCLI proposeSETLK:tlkJson:oldTlkJson:tlkShareJsonStrings:]( v54,  "proposeSETLK:tlkJson:oldTlkJson:tlkShareJsonStrings:",  v78,  v55,  v76,  v57);
LABEL_129:
            uint64_t v37 = v71;
            goto LABEL_110;
          }

          uint64_t v72 = "newTLK is a required argument.\n";
          goto LABEL_132;
        }
      }

      else if (dword_100010C68)
      {
        if (v78)
        {
          uint64_t v68 = v78;
          uint64_t v71 = -[CKKSControlCLI fetchSEView:json:](v54, "fetchSEView:json:", v78, dword_100010C04 != 0);
          goto LABEL_129;
        }
      }

      else if (dword_100010C6C)
      {
        if (v78)
        {
          if (v57 | v60)
          {
            uint64_t v68 = v78;
            uint64_t v71 = -[CKKSControlCLI modifySEZone:tlkShareJsonStrings:deletetlkShareJsonStrings:]( v54,  "modifySEZone:tlkShareJsonStrings:deletetlkShareJsonStrings:",  v78,  v57,  v60);
            goto LABEL_129;
          }

          uint64_t v72 = "At least one of --tlkShare or --deleteTLKShare is required.";
LABEL_132:
          puts(v72);
          sub_100003C90((uint64_t)off_100010BE8);

LABEL_141:
          uint64_t v37 = 1LL;
          goto LABEL_107;
        }
      }

      else
      {
        if (!dword_100010C70)
        {
          if (dword_100010C74)
          {
            uint64_t v37 = -[CKKSControlCLI toggleHavoc](v54, "toggleHavoc");
          }

          else
          {
            sub_100003C90((uint64_t)off_100010BE8);

            uint64_t v37 = 0xFFFFFFFFLL;
          }

          goto LABEL_107;
        }

        if (v78)
        {
          uint64_t v68 = v78;
          uint64_t v71 = -[CKKSControlCLI deleteSEZone:](v54, "deleteSEZone:", v78);
          goto LABEL_129;
        }
      }

      puts("View is a required argument.\n");
      sub_100003C90((uint64_t)off_100010BE8);
      goto LABEL_141;
    }

    if (v21 == 104) {
      goto LABEL_130;
    }
    if ((v74 & 1) != 0)
    {
      uint64_t v22 = 0LL;
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v32 = (char *)v88[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22) {
          goto LABEL_49;
        }
      }

      __int128 v33 = *((_OWORD *)v32 + 5);
      __int128 v84 = *((_OWORD *)v32 + 4);
      __int128 v85 = v33;
      uint64_t v86 = *((void *)v32 + 12);
      __int128 v34 = *((_OWORD *)v32 + 1);
      __int128 v80 = *(_OWORD *)v32;
      __int128 v81 = v34;
      __int128 v35 = *((_OWORD *)v32 + 3);
      __int128 v82 = *((_OWORD *)v32 + 2);
      __int128 v83 = v35;
      sub_100004258((uint64_t)&v80, optarg);
    }
  }

  while (v22 != v2);
LABEL_49:
  id v36 = v88[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_100003C90((uint64_t)off_100010BE8);
  return 0xFFFFFFFFLL;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}