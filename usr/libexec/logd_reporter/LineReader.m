@interface LineReader
- (BOOL)_readNextChunk;
- (LineReader)initWithFile:(id)a3;
- (LineReader)initWithFile:(id)a3 andReadingWindowSize:(unint64_t)a4;
- (id)nextLine;
- (void)dealloc;
@end

@implementation LineReader

- (LineReader)initWithFile:(id)a3 andReadingWindowSize:(unint64_t)a4
{
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___LineReader;
  v8 = -[LineReader init](&v34, "init");
  v9 = v8;
  if (v8)
  {
    p_path = (id *)&v8->_path;
    objc_storeStrong((id *)&v8->_path, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9->_path));
    id v33 = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v11,  &v33));
    id v13 = v33;
    handle = v9->_handle;
    v9->_handle = (NSFileHandle *)v12;

    if (v9->_handle)
    {
      v9->_window = a4;
      v9->_cursor = 0LL;

      v15 = v9->_handle;
      id v32 = 0LL;
      unsigned __int8 v16 = -[NSFileHandle seekToEndReturningOffset:error:](v15, "seekToEndReturningOffset:error:", &v9->_end, &v32);
      id v13 = v32;
      if ((v16 & 1) != 0)
      {
        v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        lines = v9->_lines;
        v9->_lines = v17;

        leftovers = v9->_leftovers;
        v9->_leftovers = (NSString *)&stru_100008430;

        v20 = v9;
LABEL_12:

        goto LABEL_13;
      }

      id v28 = sub_100002A70();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_claimAutoreleasedReturnValue([*p_path description]);
        id v29 = [v23 UTF8String];
        id v25 = objc_claimAutoreleasedReturnValue([v13 description]);
        id v30 = [v25 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v36 = v29;
        __int16 v37 = 2082;
        id v38 = v30;
        v27 = "Error trying to determine end of file, file: %{public}s, error: %{public}s";
        goto LABEL_10;
      }
    }

    else
    {
      id v21 = sub_100002A70();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_claimAutoreleasedReturnValue([*p_path description]);
        id v24 = [v23 UTF8String];
        id v25 = objc_claimAutoreleasedReturnValue([v13 description]);
        id v26 = [v25 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v36 = v24;
        __int16 v37 = 2082;
        id v38 = v26;
        v27 = "Error getting filehandle, file: %{public}s, error: %{public}s";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
      }
    }

    v20 = 0LL;
    goto LABEL_12;
  }

  v20 = 0LL;
LABEL_13:

  return v20;
}

- (LineReader)initWithFile:(id)a3
{
  return -[LineReader initWithFile:andReadingWindowSize:](self, "initWithFile:andReadingWindowSize:", a3, 4096LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LineReader;
  -[LineReader dealloc](&v3, "dealloc");
}

- (BOOL)_readNextChunk
{
  handle = self->_handle;
  unint64_t cursor = self->_cursor;
  id v42 = 0LL;
  unsigned __int8 v5 = -[NSFileHandle seekToOffset:error:](handle, "seekToOffset:error:", cursor, &v42);
  id v6 = v42;
  if ((v5 & 1) != 0)
  {
    id v7 = self->_handle;
    unint64_t window = self->_window;
    id v41 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataUpToLength:error:](v7, "readDataUpToLength:error:", window, &v41));
    id v10 = v41;

    if (v9)
    {
      if (![v9 length])
      {
        BOOL v26 = 0;
        goto LABEL_17;
      }

      self->_cursor += (unint64_t)[v9 length];
      v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
      uint64_t v12 = v11;
      if (v11 && -[NSString length](v11, "length"))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v12, "componentsSeparatedByString:", @"\n"));
        v14 = (NSMutableArray *)[v13 mutableCopy];
        lines = self->_lines;
        self->_lines = v14;

        if (self->_leftovers)
        {
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0LL));

          if (v16)
          {
            leftovers = self->_leftovers;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0LL));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](leftovers, "stringByAppendingString:", v18));
            -[NSMutableArray setObject:atIndexedSubscript:](self->_lines, "setObject:atIndexedSubscript:", v19, 0LL);
          }

          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", self->_leftovers));
            -[NSMutableArray setObject:atIndexedSubscript:](self->_lines, "setObject:atIndexedSubscript:", v18, 0LL);
          }
        }

        unint64_t v35 = self->_cursor;
        unint64_t end = self->_end;
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_lines, "lastObject"));
        id v38 = v37;
        if (v35 >= end)
        {
          id v40 = [v37 length];

          if (v40)
          {
LABEL_24:
            BOOL v26 = 1;
            goto LABEL_15;
          }
        }

        else
        {
          v39 = self->_leftovers;
          self->_leftovers = (NSString *)v37;
        }

        -[NSMutableArray removeLastObject](self->_lines, "removeLastObject");
        goto LABEL_24;
      }
    }

    else
    {
      id v27 = sub_100002A70();
      uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = objc_claimAutoreleasedReturnValue(-[NSString description](self->_path, "description"));
        id v29 = [v28 UTF8String];
        unint64_t v31 = self->_window;
        unint64_t v30 = self->_cursor;
        id v32 = objc_claimAutoreleasedReturnValue([v10 description]);
        id v33 = [v32 UTF8String];
        *(_DWORD *)buf = 136446978;
        id v44 = v29;
        __int16 v45 = 2048;
        unint64_t v46 = v30;
        __int16 v47 = 2048;
        unint64_t v48 = v31;
        __int16 v49 = 2082;
        id v50 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Error while reading data chunk, file: %{public}s, offset: %llu, window: %lu, error: %{public}s",  buf,  0x2Au);
      }
    }

    BOOL v26 = 0;
LABEL_15:

    goto LABEL_17;
  }

  id v20 = sub_100002A70();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_claimAutoreleasedReturnValue(-[NSString description](self->_path, "description"));
    id v22 = [v21 UTF8String];
    unint64_t v23 = self->_cursor;
    id v24 = objc_claimAutoreleasedReturnValue([v6 description]);
    id v25 = [v24 UTF8String];
    *(_DWORD *)buf = 136446722;
    id v44 = v22;
    __int16 v45 = 2048;
    unint64_t v46 = v23;
    __int16 v47 = 2082;
    unint64_t v48 = (unint64_t)v25;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Error seeking while reading file, file: %{public}s, offset: %llu, error: %{public}s",  buf,  0x20u);
  }

  BOOL v26 = 0;
  id v10 = v6;
LABEL_17:

  return v26;
}

- (id)nextLine
{
  while (!-[NSMutableArray count](self->_lines, "count"))
  {
    if (!-[LineReader _readNextChunk](self, "_readNextChunk"))
    {
      objc_super v3 = 0LL;
      return v3;
    }
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0LL));
  -[NSMutableArray removeObjectAtIndex:](self->_lines, "removeObjectAtIndex:", 0LL);
  return v3;
}

- (void).cxx_destruct
{
}

@end