@interface LabPepperFile
- (LabPepperFile)initWithLabPepperURL:(id)a3;
- (NSURL)url;
- (OS_os_log)log;
- (id)nextEntry;
- (unint64_t)fileOffset;
- (unsigned)lpVersion;
- (void)nextEntry;
- (void)resetOffset;
- (void)setFileOffset:(unint64_t)a3;
@end

@implementation LabPepperFile

- (LabPepperFile)initWithLabPepperURL:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___LabPepperFile;
  v5 = -[LabPepperFile init](&v21, "init");
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;

    id v8 = MTLoggingContinuousRecordingFilterManager();
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    log = v5->_log;
    v5->_log = (OS_os_log *)v9;

    id v20 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v4,  &v20));
    id v12 = v20;
    if (v12)
    {
      id v13 = v12;
      v14 = 0LL;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v11 readDataOfLength:2]);
      if ([v15 length] == (id)2)
      {
        v5->_lpVersion = *(_WORD *)[v15 bytes];
        v5->_fileOffset = 2LL;
        id v19 = 0LL;
        unsigned __int8 v16 = [v11 closeAndReturnError:&v19];
        id v13 = v19;
        if ((v16 & 1) != 0)
        {
          v14 = v5;
        }

        else
        {
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[LabPepperFile log](v5, "log"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[LabPepperFile initWithLabPepperURL:].cold.1();
          }

          v14 = 0LL;
        }
      }

      else
      {
        v14 = 0LL;
        id v13 = 0LL;
      }
    }
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)resetOffset
{
}

- (id)nextEntry
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LabPepperFile url](self, "url"));
  id v22 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v3,  &v22));
  id v5 = v22;

  if (v4)
  {
    id v21 = 0LL;
    unsigned __int8 v6 = objc_msgSend(v4, "seekToOffset:error:", -[LabPepperFile fileOffset](self, "fileOffset"), &v21);
    id v7 = v21;

    if ((v6 & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 readDataOfLength:4]);
      if ([v8 length] == (id)4)
      {
        uint64_t v9 = (unsigned __int16 *)[v8 bytes];
        uint64_t v10 = *v9;
        v11 = (char *)v9[1];
        -[LabPepperFile setFileOffset:]( self,  "setFileOffset:",  (char *)-[LabPepperFile fileOffset](self, "fileOffset") + 4);
        objc_msgSend(v4, "seekToFileOffset:", -[LabPepperFile fileOffset](self, "fileOffset"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 readDataOfLength:v11]);
        if ([v12 length] == v11)
        {
          id v13 = -[LabPepperEntry initWithLPDataSource:data:]( objc_alloc(&OBJC_CLASS___LabPepperEntry),  "initWithLPDataSource:data:",  v10,  v12);
          -[LabPepperFile setFileOffset:](self, "setFileOffset:", &v11[-[LabPepperFile fileOffset](self, "fileOffset")]);
          id v5 = v7;
        }

        else
        {
          id v19 = 0LL;
          unsigned __int8 v15 = [v4 closeAndReturnError:&v19];
          id v5 = v19;

          if ((v15 & 1) == 0)
          {
            unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[LabPepperFile log](self, "log"));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[LabPepperFile nextEntry].cold.2();
            }
          }

          id v13 = 0LL;
        }
      }

      else
      {
        id v20 = 0LL;
        [v4 closeAndReturnError:&v20];
        id v5 = v20;
        id v13 = 0LL;
        id v12 = v7;
      }
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LabPepperFile log](self, "log"));
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = -[LabPepperFile fileOffset](self, "fileOffset");
        *(_DWORD *)buf = 134218498;
        unint64_t v24 = v18;
        __int16 v25 = 2112;
        v26 = v4;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Error seeking to offset %lu for file %@ when getting next entry: %@",  buf,  0x20u);
      }

      id v13 = 0LL;
      id v5 = v7;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LabPepperFile log](self, "log"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LabPepperFile url](self, "url"));
      -[LabPepperFile nextEntry].cold.1(v14, (uint64_t)v5, (uint64_t)buf, (os_log_s *)v8);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (unsigned)lpVersion
{
  return self->_lpVersion;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (unint64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(unint64_t)a3
{
  self->_fileOffset = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithLabPepperURL:.cold.1()
{
}

- (void)nextEntry
{
}

@end