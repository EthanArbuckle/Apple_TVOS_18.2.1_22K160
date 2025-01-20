@interface HMKTDumpObjects
- (int)main:(id)a3;
@end

@implementation HMKTDumpObjects

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  unsigned int v6 = [v5 isEqualToString:@"-r"];

  if (v6)
  {
    self->_useRawValues = 1;
    [v4 removeObjectAtIndex:0];
  }

  v7 = __stdoutp;
  if ([v4 count] == (id)2)
  {
    id v8 = objc_claimAutoreleasedReturnValue([v4 lastObject]);
    v9 = fopen((const char *)[v8 cString], "w");

    if (v9) {
      v7 = v9;
    }
    [v4 removeLastObject];
  }

  if ([v4 count] == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v12 = sub_10000A4D4((uint64_t)self, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
    {
      uint64_t v35 = 0LL;
      v36 = &v35;
      uint64_t v37 = 0x2020000000LL;
      int v38 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectModel]);
      id v15 = [v13 newBackgroundContext];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100009BA4;
      v29[3] = &unk_1000288B8;
      id v16 = v14;
      id v30 = v16;
      id v17 = v15;
      v33 = &v35;
      v34 = v7;
      id v31 = v17;
      v32 = self;
      [v17 performBlockAndWait:v29];
      if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
      {
        fflush(v7);
        fclose(v7);
      }

      int v18 = *((_DWORD *)v36 + 6);

      _Block_object_dispose(&v35, 8);
    }

    else
    {
      int v18 = 2;
      if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
      {
        fflush(v7);
        fclose(v7);
      }
    }
  }

  else
  {
    v19 = __stderrp;
    id v20 = objc_msgSend((id)objc_opt_class(self, v10), "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v20);
    sub_100004368( v19,  @"Usage: %@ %@ [-r] <sqlite store file>\n",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)@"hmktool");

    int v18 = 1;
    if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
    {
      fflush(v7);
      fclose(v7);
    }
  }

  return v18;
}

@end