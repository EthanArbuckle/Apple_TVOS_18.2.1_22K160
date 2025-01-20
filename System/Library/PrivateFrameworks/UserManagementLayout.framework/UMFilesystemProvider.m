@interface UMFilesystemProvider
- (BOOL)atomicallyWriteData:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)chmodPath:(id)a3 withMode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)chownPath:(id)a3 toUser:(unsigned int)a4 group:(unsigned int)a5 error:(id *)a6;
- (BOOL)clonePath:(id)a3 toPath:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)fixupPath:(id)a3 withMode:(unsigned __int16)a4 toUser:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7;
- (BOOL)makePath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)removePath:(id)a3 error:(id *)a4;
- (BOOL)renameFileFromPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)writeToFileWithDescriptor:(int)a3 string:(id)a4 error:(id *)a5;
- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4;
- (int)openFileForAppendingAtPath:(id)a3 error:(id *)a4;
- (int64_t)sizeOfFileWithDescriptor:(int)a3 error:(id *)a4;
- (void)closeFileWithDescriptor:(int)a3;
@end

@implementation UMFilesystemProvider

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  v5 = (void *)MEMORY[0x1896078A8];
  id v6 = a3;
  [v5 defaultManager];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = [v7 fileExistsAtPath:v6 isDirectory:a4];

  return (char)a4;
}

- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v35 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfFile:v5 options:0 error:&v35];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v35;
  v8 = v7;
  if (v6)
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v9 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v10 = sub_18878BC68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        int v36 = 138412290;
        id v37 = v5;
        uint64_t v12 = _os_log_send_and_compose_impl();
        v13 = (void *)v12;
        if (v12) {
          sub_18878BC90(v12);
        }
      }

      else
      {
        v13 = 0LL;
      }

      free(v13);
    }

    goto LABEL_28;
  }

  if (!a4 || !v7) {
    goto LABEL_28;
  }
  [v7 userInfo];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = *MEMORY[0x189607798];
  [v14 objectForKeyedSubscript:*MEMORY[0x189607798]];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [v8 userInfo];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:v15];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v18 domain];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v19 isEqualToString:*MEMORY[0x189607688]];

    if (v20)
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v21 = (os_log_s *)(id)qword_18C4EC2A0;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      int v22 = sub_18878BC68();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        v22 &= ~1u;
      }
      if (v22)
      {
        v23 = v21;
        int v24 = [v18 code];
        int v36 = 138543618;
        id v37 = v5;
        __int16 v38 = 1024;
        LODWORD(v39) = v24;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25) {
          goto LABEL_48;
        }
        goto LABEL_46;
      }
    }

    else
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v21 = (os_log_s *)(id)qword_18C4EC2A0;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      unsigned int v32 = sub_18878BC68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v33 = v32;
      }
      else {
        unsigned int v33 = v32 & 0xFFFFFFFE;
      }
      if (v33)
      {
        int v36 = 138543618;
        id v37 = v5;
        __int16 v38 = 2114;
        v39 = v18;
        v25 = (void *)_os_log_send_and_compose_impl();
        if (!v25)
        {
LABEL_48:
          free(v25);
LABEL_49:

          id v34 = v18;
          *a4 = v34;

          goto LABEL_28;
        }

- (BOOL)atomicallyWriteData:(id)a3 toPath:(id)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    *a5 = 0LL;
  }
  id v9 = [NSString stringWithFormat:@"%@.writing", v8];
  if (unlink((const char *)[v9 UTF8String]))
  {
    int v10 = *__error();
    if (v10 != 2)
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v21 = (os_log_s *)(id)qword_18C4EC2A0;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      unsigned int v22 = sub_18878BC68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        int v87 = 138543874;
        id v88 = v8;
        __int16 v89 = 2114;
        *(void *)v90 = v9;
        *(_WORD *)&v90[8] = 1024;
        *(_DWORD *)&v90[10] = v10;
        goto LABEL_32;
      }

- (int)openFileForAppendingAtPath:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  int v5 = open_dprotected_np((const char *)[a3 UTF8String], 777, 4, 0, 420);
  if (v5 == -1)
  {
    id v6 = __error();
    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v6 userInfo:0];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (void)closeFileWithDescriptor:(int)a3
{
}

- (BOOL)writeToFileWithDescriptor:(int)a3 string:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  id v7 = a4;
  id v8 = (const void *)[v7 UTF8String];
  size_t v9 = [v7 length];

  ssize_t v10 = write(a3, v8, v9);
  if (v10 == -1)
  {
    id v11 = __error();
    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v11 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10 != -1;
}

- (int64_t)sizeOfFileWithDescriptor:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  if (!fstat(a3, &v7)) {
    return v7.st_size;
  }
  int v5 = __error();
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v5 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return -1LL;
}

- (BOOL)renameFileFromPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  id v7 = a3;
  id v8 = a4;
  size_t v9 = (const char *)[v7 UTF8String];
  id v10 = v8;
  id v11 = (const char *)[v10 UTF8String];

  int v12 = rename(v9, v11);
  if (v12)
  {
    int v13 = __error();
    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v13 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12 == 0;
}

- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v6 = v5;
  if (!unlink((const char *)[v6 UTF8String]))
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    id v7 = (os_log_s *)(id)qword_18C4EC2A0;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    unsigned int v10 = sub_18878BC68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v10 & 0xFFFFFFFE;
    }
    if (v11)
    {
LABEL_20:
      uint64_t v12 = _os_log_send_and_compose_impl();
      int v13 = (void *)v12;
      if (v12) {
        sub_18878BC90(v12);
      }
      goto LABEL_32;
    }

- (BOOL)removePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = removefile_state_alloc();
  LOBYTE(a4) = sub_188789704((uint64_t)self, v6, v7, a4);

  removefile_state_free(v7);
  return (char)a4;
}

- (BOOL)chownPath:(id)a3 toUser:(unsigned int)a4 group:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0LL;
  }
  id v10 = v9;
  int v11 = lchown((const char *)[v10 UTF8String], a4, a5);
  if (v11)
  {
    int v12 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    int v13 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = sub_18878BC68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_18878BC90(v16);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }

    if (a6)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v12 userInfo:0];
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11 == 0;
}

- (BOOL)chmodPath:(id)a3 withMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  id v8 = v7;
  int v9 = chmod((const char *)[v8 UTF8String], a4);
  if (v9)
  {
    int v10 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    int v11 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = sub_18878BC68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_18878BC90(v14);
        }
      }

      else
      {
        unsigned int v15 = 0LL;
      }

      free(v15);
    }

    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v10 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9 == 0;
}

- (BOOL)fixupPath:(id)a3 withMode:(unsigned __int16)a4 toUser:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  if (a7) {
    *a7 = 0LL;
  }
  id v13 = v12;
  if (lchmod((const char *)[v13 UTF8String], a4))
  {
    int v14 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    unsigned int v15 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_18878BC68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18) {
          sub_18878BC90(v18);
        }
      }

      else
      {
        v19 = 0LL;
      }

      free(v19);
    }

    if (a7)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v14 userInfo:0];
      BOOL v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v20 = 0;
    }
  }

  else
  {
    BOOL v20 = -[UMFilesystemProvider chownPath:toUser:group:error:](self, "chownPath:toUser:group:error:", v13, v9, v8, a7);
  }

  return v20;
}

- (BOOL)makePath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  id v8 = v7;
  int v9 = mkpath_np((const char *)[v8 UTF8String], a4);
  if (v9)
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    int v10 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_18878BC68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        int v14 = (void *)v13;
        if (v13) {
          sub_18878BC90(v13);
        }
      }

      else
      {
        int v14 = 0LL;
      }

      free(v14);
    }

    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v9 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9 == 0;
}

- (BOOL)clonePath:(id)a3 toPath:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  if (a5) {
    *a5 = 0LL;
  }
  id v11 = a6;
  unsigned int v12 = copyfile_state_alloc();
  copyfile_state_set(v12, 7u, v11);

  copyfile_state_set(v12, 6u, sub_18878AEAC);
  id v13 = v9;
  int v14 = (const char *)[v13 UTF8String];
  id v15 = v10;
  int v16 = copyfile(v14, (const char *)[v15 UTF8String], v12, 0xC800Fu);
  copyfile_state_free(v12);
  if (v16)
  {
    int v17 = *__error();
    if (v17)
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      uint64_t v18 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = sub_18878BC68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          int v34 = 138543874;
          id v35 = v13;
          __int16 v36 = 2114;
          id v37 = v15;
          __int16 v38 = 1024;
          int v39 = v17;
          LODWORD(v33) = 28;
          unsigned int v32 = &v34;
          uint64_t v21 = _os_log_send_and_compose_impl();
          unsigned int v22 = (void *)v21;
          if (v21) {
            sub_18878BC90(v21);
          }
        }

        else
        {
          unsigned int v22 = 0LL;
        }

        free(v22);
      }

      if (a5)
      {
        uint64_t v28 = v17;
        unsigned int v29 = (void *)MEMORY[0x189607870];
        uint64_t v30 = *MEMORY[0x189607688];
LABEL_31:
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v28, 0, v32, v33);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      unsigned int v23 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = sub_18878BC68();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
          int v34 = 138543618;
          id v35 = v13;
          __int16 v36 = 2114;
          id v37 = v15;
          LODWORD(v33) = 22;
          unsigned int v32 = &v34;
          uint64_t v26 = _os_log_send_and_compose_impl();
          v27 = (void *)v26;
          if (v26) {
            sub_18878BC90(v26);
          }
        }

        else
        {
          v27 = 0LL;
        }

        free(v27);
      }

      if (a5)
      {
        unsigned int v29 = (void *)MEMORY[0x189607870];
        uint64_t v30 = *MEMORY[0x189607688];
        uint64_t v28 = 89LL;
        goto LABEL_31;
      }
    }
  }

  return v16 == 0;
}

@end