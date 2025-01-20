@interface FPOutputFormatterJSON
- (void)close;
- (void)configureForMultipleOutputs;
- (void)dealloc;
- (void)endAtTime:(id)a3;
- (void)printGlobalAuxData:(id)a3;
- (void)printProcessAuxData:(id)a3 forProcess:(id)a4;
- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5;
- (void)printProcessHeader:(id)a3;
- (void)printProcessTotal:(id)a3 forProcess:(id)a4;
- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5;
- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6;
- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7;
- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5;
- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4;
- (void)startAtTime:(id)a3;
@end

@implementation FPOutputFormatterJSON

- (void)dealloc
{
  json = self->_json;
  if (json)
  {
    fclose(json->var0);
    free(self->_json);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FPOutputFormatterJSON;
  -[FPOutputFormatterJSON dealloc](&v4, "dealloc");
}

- (void)configureForMultipleOutputs
{
  self->_multipleOutputs = 1;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("samples:", 0xAuLL, 1uLL, json->var0);
    objc_super v4 = self->_json;
    v4->var1 = 0;
    fputc(91, v4->var0);
    self->_json->var1 = 0;
  }

- (void)startAtTime:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_multipleOutputs)
  {
    json = self->_json;
    if (json)
    {
      if (json->var1)
      {
        fputc(44, json->var0);
        json = self->_json;
      }

      fputc(123, json->var0);
      self->_json->var1 = 0;
      id v4 = v12;
    }
  }

  sub_100015F10((uint64_t)self, v4, "start_time");
  v6 = self->_json;
  if (v6)
  {
    if (v6->var1)
    {
      fputc(44, v6->var0);
      v6 = self->_json;
    }

    fwrite("processes:", 0xCuLL, 1uLL, v6->var0);
    v7 = self->_json;
    v7->var1 = 0;
    fputc(91, v7->var0);
    self->_json->var1 = 0;
  }

  v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  shared = self->_shared;
  self->_shared = v8;

  v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  addedProcessGroups = self->_addedProcessGroups;
  self->_addedProcessGroups = v10;
}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  self->_verbose = 1;
}

- (void)printProcessHeader:(id)a3
{
  id v4 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fputc(123, json->var0);
    v6 = self->_json;
    v6->var1 = 0;
    fwrite("name:", 7uLL, 1uLL, v6->var0);
    v7 = self->_json;
    v7->var1 = 0;
    var0 = v7->var0;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v10 = objc_claimAutoreleasedReturnValue( [v9 stringByReplacingOccurrencesOfString:@" withString:@"\\]);
    fprintf(var0, "\"%s\", (const char *)[v10 UTF8String]);

    v11 = self->_json;
    v11->var1 = 1;
    fputc(44, v11->var0);
    fwrite("pid:", 6uLL, 1uLL, self->_json->var0);
    id v12 = self->_json;
    v12->var1 = 0;
    fprintf(v12->var0, "%d", [v4 pid]);
    v13 = self->_json;
    v13->var1 = 1;
    fputc(44, v13->var0);
    fwrite("translated:", 0xDuLL, 1uLL, self->_json->var0);
    v14 = self->_json;
    v14->var1 = 0;
    v15 = v14->var0;
    else {
      v16 = "false";
    }
    fputs(v16, v15);
    v17 = self->_json;
    v17->var1 = 1;
    fputc(44, v17->var0);
    fwrite("page size:", 0xCuLL, 1uLL, self->_json->var0);
    v18 = self->_json;
    v18->var1 = 0;
    fprintf(v18->var0, "%lu", [v4 pageSize]);
    self->_json->var1 = 1;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 errors]);
  id v20 = [v19 count];

  if (v20)
  {
    v21 = self->_json;
    if (v21)
    {
      if (v21->var1)
      {
        fputc(44, v21->var0);
        v21 = self->_json;
      }

      fwrite("errors:", 9uLL, 1uLL, v21->var0);
      v22 = self->_json;
      v22->var1 = 0;
      fputc(91, v22->var0);
      self->_json->var1 = 0;
    }

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 errors]);
    id v24 = [v23 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = self->_json;
          if (v28)
          {
            v29 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
            if (!v28->var1 || (fputc(44, v28->var0), (v28 = self->_json) != 0LL))
            {
              fprintf(v28->var0, "\"%s\", (const char *)[v29 UTF8String]);
              self->_json->var1 = 1;
            }
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v25);
    }

    v30 = self->_json;
    if (v30)
    {
      fputc(93, v30->var0);
      self->_json->var1 = 1;
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 warnings]);
  id v32 = [v31 count];

  if (v32)
  {
    v33 = self->_json;
    if (v33)
    {
      if (v33->var1)
      {
        fputc(44, v33->var0);
        v33 = self->_json;
      }

      fwrite("warnings:", 0xBuLL, 1uLL, v33->var0);
      v34 = self->_json;
      v34->var1 = 0;
      fputc(91, v34->var0);
      self->_json->var1 = 0;
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v4 warnings]);
    id v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v49;
      do
      {
        for (j = 0LL; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = self->_json;
          if (v40)
          {
            v41 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
            if (!v40->var1 || (fputc(44, v40->var0), (v40 = self->_json) != 0LL))
            {
              fprintf(v40->var0, "\"%s\", (const char *)[v41 UTF8String]);
              self->_json->var1 = 1;
            }
          }
        }

        id v37 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }

      while (v37);
    }

    v42 = self->_json;
    if (v42)
    {
      fputc(93, v42->var0);
      self->_json->var1 = 1;
    }
  }

  if (self->_verbose)
  {
    v43 = self->_json;
    if (v43)
    {
      if (v43->var1)
      {
        fputc(44, v43->var0);
        v43 = self->_json;
      }

      fwrite("regions:", 0xAuLL, 1uLL, v43->var0);
      v44 = self->_json;
      v44->var1 = 0;
      fputc(91, v44->var0);
      self->_json->var1 = 0;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue([v4 memoryRegions]);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10001676C;
    v47[3] = &unk_100029DE8;
    v47[4] = self;
    [v45 fp_enumerateObjectsWithBatchSize:128 usingBlock:v47];

    v46 = self->_json;
    if (v46)
    {
      fputc(93, v46->var0);
      self->_json->var1 = 1;
    }
  }

  if (!self->_pageSize) {
    self->_pageSize = (unint64_t)[v4 pageSize];
  }
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("footprint:", 0xCuLL, 1uLL, json->var0);
    v8 = self->_json;
    v8->var1 = 0;
    fprintf(v8->var0, "%llu", [v9 unsignedLongLongValue]);
    self->_json->var1 = 1;
  }
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("categories:", 0xDuLL, 1uLL, json->var0);
    id v9 = self->_json;
    v9->var1 = 0;
    fputc(123, v9->var0);
    self->_json->var1 = 0;
  }

  sub_100016F68((uint64_t)self, v11);
  id v10 = self->_json;
  if (v10)
  {
    fputc(125, v10->var0);
    self->_json->var1 = 1;
  }
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v7)
  {
    -[NSMutableSet addObject:](self->_addedProcessGroups, "addObject:", v12);
  }

  uint64_t v26 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 processes]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 count]));

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 processes]);
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v27 + 1) + 8 * (void)v20) asNumber]);
        [v15 addObject:v21];

        id v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }

    while (v18);
  }

  v22 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v31[0] = @"pids";
  v31[1] = @"categories";
  v32[0] = v15;
  v32[1] = v11;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
  id v24 = -[NSMutableDictionary initWithDictionary:](v22, "initWithDictionary:", v23);

  id v13 = v26;
  if (v7)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v26 asNumber]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v25,  @"specific_to_pid");
  }

  -[NSMutableArray addObject:](self->_shared, "addObject:", v24);

LABEL_14:
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 processes]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v14 = (void *)[v11 processes];
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v18) asNumber]);
        [v13 addObject:v19];

        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }

    while (v16);
  }

  v27[0] = @"pids";
  v27[1] = @"categories";
  v28[0] = v13;
  v28[1] = v10;
  v27[2] = @"shared-cache";
  if (v9) {
    id v20 = (void *)v9[2];
  }
  else {
    id v20 = 0LL;
  }
  id v21 = v20;
  v28[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));

  -[NSMutableArray addObject:](self->_shared, "addObject:", v22);
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("auxiliary:", 0xCuLL, 1uLL, json->var0);
    self->_json->var1 = 0;
  }

  sub_1000174B8((uint64_t)self, v9);
  v8 = self->_json;
  if (v8)
  {
    fputc(125, v8->var0);
    self->_json->var1 = 1;
  }
}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  json = self->_json;
  if (json)
  {
    fputc(93, json->var0);
    self->_json->var1 = 1;
  }

  __int128 v48 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));
  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v61 + 1) + 8 * (void)i) warnings]);
        -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v19);
      }

      id v16 = [v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }

    while (v16);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v58 != v23) {
          objc_enumerationMutation(v20);
        }
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)j) errors]);
        [v12 addObjectsFromArray:v25];
      }

      id v22 = [v20 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }

    while (v22);
  }

  __int128 v26 = self->_json;
  if (v26)
  {
    if (v26->var1)
    {
      fputc(44, v26->var0);
      __int128 v26 = self->_json;
    }

    fwrite("errors:", 9uLL, 1uLL, v26->var0);
    __int128 v27 = self->_json;
    v27->var1 = 0;
    fputc(91, v27->var0);
    self->_json->var1 = 0;
  }

  v46 = v20;
  v47 = v14;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v28 = v12;
  id v29 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (k = 0LL; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = self->_json;
        if (v33)
        {
          v34 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)k);
          if (!v33->var1 || (fputc(44, v33->var0), (v33 = self->_json) != 0LL))
          {
            fprintf(v33->var0, "\"%s\", (const char *)[v34 UTF8String]);
            self->_json->var1 = 1;
          }
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }

    while (v30);
  }

  v35 = self->_json;
  if (v35)
  {
    fputc(93, v35->var0);
    id v36 = self->_json;
    v36->var1 = 1;
    fputc(44, v36->var0);
    fwrite("warnings:", 0xBuLL, 1uLL, self->_json->var0);
    id v37 = self->_json;
    v37->var1 = 0;
    fputc(91, v37->var0);
    self->_json->var1 = 0;
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v38 = v13;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v49,  v65,  16LL);
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v50;
    do
    {
      for (m = 0LL; m != v40; m = (char *)m + 1)
      {
        if (*(void *)v50 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = self->_json;
        if (v43)
        {
          v44 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)m);
          if (!v43->var1 || (fputc(44, v43->var0), (v43 = self->_json) != 0LL))
          {
            fprintf(v43->var0, "\"%s\", (const char *)[v44 UTF8String]);
            self->_json->var1 = 1;
          }
        }
      }

      id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v49,  v65,  16LL);
    }

    while (v40);
  }

  v45 = self->_json;
  if (v45)
  {
    fputc(93, v45->var0);
    self->_json->var1 = 1;
  }
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7 = a3;
  json = self->_json;
  id v27 = v7;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("summary:", 0xAuLL, 1uLL, json->var0);
    id v9 = self->_json;
    v9->var1 = 0;
    fputc(123, v9->var0);
    json = self->_json;
    json->var1 = 0;
    id v7 = v27;
  }

  if (v7)
  {
    sub_100016F68((uint64_t)self, v27);
    id v7 = v27;
    json = self->_json;
  }

  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("total:", 8uLL, 1uLL, json->var0);
    id v10 = self->_json;
    v10->var1 = 0;
    fputc(123, v10->var0);
    id v11 = self->_json;
    v11->var1 = 0;
    fwrite("dirty:", 8uLL, 1uLL, v11->var0);
    id v12 = self->_json;
    v12->var1 = 0;
    fprintf(v12->var0, "%llu", a4->var1 + a4->var0);
    id v13 = self->_json;
    v13->var1 = 1;
    fputc(44, v13->var0);
    fwrite("swapped:", 0xAuLL, 1uLL, self->_json->var0);
    id v14 = self->_json;
    v14->var1 = 0;
    fprintf(v14->var0, "%llu", a4->var1);
    id v15 = self->_json;
    v15->var1 = 1;
    fputc(44, v15->var0);
    fwrite("clean:", 8uLL, 1uLL, self->_json->var0);
    id v16 = self->_json;
    v16->var1 = 0;
    fprintf(v16->var0, "%llu", a4->var2);
    uint64_t v17 = self->_json;
    v17->var1 = 1;
    fputc(44, v17->var0);
    fwrite("reclaimable:", 0xEuLL, 1uLL, self->_json->var0);
    id v18 = self->_json;
    v18->var1 = 0;
    fprintf(v18->var0, "%llu", a4->var3);
    uint64_t v19 = self->_json;
    v19->var1 = 1;
    fputc(44, v19->var0);
    fwrite("wired:", 8uLL, 1uLL, self->_json->var0);
    id v20 = self->_json;
    v20->var1 = 0;
    fprintf(v20->var0, "%llu", a4->var4);
    id v21 = self->_json;
    v21->var1 = 1;
    fputc(44, v21->var0);
    fwrite("regions:", 0xAuLL, 1uLL, self->_json->var0);
    id v22 = self->_json;
    v22->var1 = 0;
    fprintf(v22->var0, "%u", a4->var5);
    uint64_t v23 = self->_json;
    v23->var1 = 1;
    fputc(125, v23->var0);
    __int128 v24 = self->_json;
    v24->var1 = 1;
    fputc(125, v24->var0);
    __int128 v25 = self->_json;
    v25->var1 = 1;
    fputc(44, v25->var0);
    fwrite("total footprint:", 0x12uLL, 1uLL, self->_json->var0);
    __int128 v26 = self->_json;
    v26->var1 = 0;
    fprintf(v26->var0, "%llu", a4->var1 + a4->var0);
    self->_json->var1 = 1;
    id v7 = v27;
  }
}

- (void)printGlobalAuxData:(id)a3
{
  id v5 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("auxiliary:", 0xCuLL, 1uLL, json->var0);
    self->_json->var1 = 0;
  }

  sub_1000174B8((uint64_t)self, v5);
}

- (void)endAtTime:(id)a3
{
  id v4 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }

    fwrite("shared:", 9uLL, 1uLL, json->var0);
    id v6 = self->_json;
    v6->var1 = 0;
    fputc(91, v6->var0);
    self->_json->var1 = 0;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  obj = self->_shared;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v36)
  {
    uint64_t v35 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        id v9 = self->_json;
        if (v9)
        {
          if (v9->var1)
          {
            fputc(44, v9->var0);
            id v9 = self->_json;
          }

          fputc(123, v9->var0);
          id v10 = self->_json;
          v10->var1 = 0;
          fwrite("pids:", 7uLL, 1uLL, v10->var0);
          id v11 = self->_json;
          v11->var1 = 0;
          fputc(91, v11->var0);
          self->_json->var1 = 0;
        }

        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v37 = v8;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"pids"]);
        id v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = self->_json;
              if (v17)
              {
                id v18 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
                if (!v17->var1 || (fputc(44, v17->var0), (uint64_t v17 = self->_json) != 0LL))
                {
                  fprintf(v17->var0, "%d", [v18 intValue]);
                  self->_json->var1 = 1;
                }
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v14);
        }

        uint64_t v19 = self->_json;
        if (v19)
        {
          fputc(93, v19->var0);
          self->_json->var1 = 1;
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"specific_to_pid"]);
        if (v20)
        {
          id v21 = self->_json;
          if (v21)
          {
            if (v21->var1)
            {
              fputc(44, v21->var0);
              id v21 = self->_json;
            }

            fwrite("specific_to_pid:", 0x12uLL, 1uLL, v21->var0);
            id v22 = self->_json;
            v22->var1 = 0;
            fprintf(v22->var0, "%d", [v20 intValue]);
            self->_json->var1 = 1;
          }
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"shared-cache"]);
        __int128 v24 = self->_json;
        if (v23)
        {
          if (!v24) {
            goto LABEL_41;
          }
          if (v24->var1)
          {
            fputc(44, v24->var0);
            __int128 v24 = self->_json;
          }

          fwrite("shared-cache:", 0xFuLL, 1uLL, v24->var0);
          __int128 v25 = self->_json;
          v25->var1 = 0;
          var0 = v25->var0;
          id v27 = objc_claimAutoreleasedReturnValue([v23 UUIDString]);
          fprintf(var0, "\"%s\", (const char *)[v27 UTF8String]);

          __int128 v24 = self->_json;
          v24->var1 = 1;
LABEL_39:
          fputc(44, v24->var0);
          __int128 v24 = self->_json;
          goto LABEL_40;
        }

        if (!v24) {
          goto LABEL_41;
        }
        if (v24->var1) {
          goto LABEL_39;
        }
LABEL_40:
        fwrite("categories:", 0xDuLL, 1uLL, v24->var0);
        id v28 = self->_json;
        v28->var1 = 0;
        fputc(123, v28->var0);
        self->_json->var1 = 0;
LABEL_41:
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"categories"]);
        sub_100016F68((uint64_t)self, v29);

        id v30 = self->_json;
        if (v30)
        {
          fputc(125, v30->var0);
          uint64_t v31 = self->_json;
          v31->var1 = 1;
          fputc(125, v31->var0);
          self->_json->var1 = 1;
        }
      }

      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v36);
  }

  id v32 = self->_json;
  if (v32)
  {
    fputc(93, v32->var0);
    self->_json->var1 = 1;
  }

  sub_100015F10((uint64_t)self, v4, "end_time");
  if (self->_multipleOutputs)
  {
    v33 = self->_json;
    if (v33)
    {
      fputc(125, v33->var0);
      self->_json->var1 = 1;
    }
  }
}

- (void)close
{
  if (self->_multipleOutputs)
  {
    json = self->_json;
    if (json)
    {
      fputc(93, json->var0);
      self->_json->var1 = 1;
    }
  }

  if (!self->_pageSize) {
    self->_unint64_t pageSize = vm_kernel_page_size;
  }
  id v4 = self->_json;
  if (v4)
  {
    if (v4->var1)
    {
      fputc(44, v4->var0);
      id v4 = self->_json;
    }

    fwrite("page size:", 0xCuLL, 1uLL, v4->var0);
    unint64_t pageSize = self->_pageSize;
    id v5 = self->_json;
    v5->var1 = 0;
    fprintf(v5->var0, "%lu", pageSize);
    id v7 = self->_json;
    v7->var1 = 1;
    fputc(125, v7->var0);
    id v8 = self->_json;
    v8->var1 = 1;
    fclose(v8->var0);
    free(self->_json);
  }

  self->_json = 0LL;
}

- (void).cxx_destruct
{
}

@end