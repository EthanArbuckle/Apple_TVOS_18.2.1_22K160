@interface HMKTDumpHistory
- (int)main:(id)a3;
@end

@implementation HMKTDumpHistory

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  unsigned int v6 = [v5 isEqualToString:@"-h"];

  if (v6)
  {
    self->_useHomeModelIDs = 1;
    [v4 removeObjectAtIndex:0];
  }

  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  v38 = __stdoutp;
  if ([v4 count] == (id)2)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v4 lastObject]);
    v8 = fopen((const char *)[v7 cString], "w");

    if (v8) {
      v36[3] = (uint64_t)v8;
    }
    [v4 removeLastObject];
  }

  if ([v4 count] == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v11 = sub_10000A4D4((uint64_t)self, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      uint64_t v31 = 0LL;
      v32 = &v31;
      uint64_t v33 = 0x2020000000LL;
      int v34 = 0;
      v13 = (NSManagedObjectContext *)[v12 newBackgroundContext];
      context = self->_context;
      self->_context = v13;

      v15 = self->_context;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100008DC0;
      v30[3] = &unk_100028878;
      v30[4] = self;
      v30[5] = &v31;
      v30[6] = &v35;
      -[NSManagedObjectContext performBlockAndWait:](v15, "performBlockAndWait:", v30);
      v16 = (FILE *)v36[3];
      if (v16 && v16 != __stdoutp && v16 != __stderrp && v16 != __stdinp)
      {
        fflush(v16);
        fclose((FILE *)v36[3]);
        v36[3] = 0LL;
      }

      int v17 = *((_DWORD *)v32 + 6);
      _Block_object_dispose(&v31, 8);
    }

    else
    {
      v27 = (FILE *)v36[3];
      int v17 = 2;
      if (v27 && v27 != __stdoutp && v27 != __stderrp && v27 != __stdinp)
      {
        fflush(v27);
        fclose((FILE *)v36[3]);
        v36[3] = 0LL;
      }
    }
  }

  else
  {
    v18 = __stderrp;
    id v19 = objc_msgSend((id)objc_opt_class(self, v9), "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v19);
    sub_100004368( v18,  @"Usage: %@ %@ [-h] <sqlite store file>\n",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)@"hmktool");

    v26 = (FILE *)v36[3];
    int v17 = 1;
    if (v26 && v26 != __stdoutp && v26 != __stderrp && v26 != __stdinp)
    {
      fflush(v26);
      fclose((FILE *)v36[3]);
      v36[3] = 0LL;
    }
  }

  _Block_object_dispose(&v35, 8);

  return v17;
}

- (void).cxx_destruct
{
}

@end