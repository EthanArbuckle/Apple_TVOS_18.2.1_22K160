id sub_188784328(void *a1)
{
  void *v1;
  void *v2;
  if (a1)
  {
    sub_188787B98(MEMORY[0x189607AB8], a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 UUIDString];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

uint64_t sub_188784378(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v3 = [v2 BOOLValue];
    int v4 = 0;
  }

  else
  {
    uint64_t v3 = 0LL;
    int v4 = 2;
  }

  *__error() = v4;

  return v3;
}

uint64_t sub_1887843FC(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = [v4 intValue];
    int v5 = 0;
  }

  else
  {
    int v5 = 2;
  }

  *__error() = v5;

  return a3;
}

uint64_t sub_188784480(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = [v4 unsignedIntValue];
    int v5 = 0;
  }

  else
  {
    int v5 = 2;
  }

  *__error() = v5;

  return a3;
}

uint64_t sub_188784504(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = [v4 longLongValue];
    int v5 = 0;
  }

  else
  {
    int v5 = 2;
  }

  *__error() = v5;

  return a3;
}

uint64_t sub_188784588(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = [v4 unsignedLongLongValue];
    int v5 = 0;
  }

  else
  {
    int v5 = 2;
  }

  *__error() = v5;

  return a3;
}

id sub_18878460C(void *a1, uint64_t a2)
{
  if (a1)
  {
    [a1 objectForKey:a2];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *int v4 = 0;
      id v5 = v2;
    }

    else
    {
      id v5 = 0LL;
      *int v4 = 2;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

id sub_188784688(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  [a1 objectForKey:a2];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *__error() = 2;

            v8 = 0LL;
            goto LABEL_14;
          }

          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(MEMORY[0x189604010], "setWithArray:", v3, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
LABEL_14:
  }

  else
  {
    v8 = 0LL;
    *__error() = 2;
  }

  return v8;
}

id sub_188784820(void *a1, uint64_t a2)
{
  if (a1)
  {
    [a1 objectForKey:a2];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_188787B98(MEMORY[0x189607AB8], v2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      int v4 = 2 * (v3 == 0LL);
    }

    else
    {
      id v3 = 0LL;
      int v4 = 2;
    }

    *__error() = v4;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id sub_1887848B8(void *a1, uint64_t a2)
{
  if (a1)
  {
    [a1 objectForKey:a2];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *int v4 = 0;
      id v5 = v2;
    }

    else
    {
      id v5 = 0LL;
      *int v4 = 2;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

id sub_188784934(void *a1, uint64_t a2)
{
  if (a1)
  {
    [a1 objectForKey:a2];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *int v4 = 0;
      id v5 = v2;
    }

    else
    {
      id v5 = 0LL;
      *int v4 = 2;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

id sub_1887849B0(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v9 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a1 format:200 options:0 error:&v9];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  id v2 = v9;
  if (!v1)
  {
    if (qword_18C7258D8 != -1) {
      dispatch_once(&qword_18C7258D8, &unk_18A27E118);
    }
    id v3 = (os_log_s *)(id)qword_18C7258D0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unsigned int v4 = sub_18878BC68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        unsigned int v5 = v4;
      }
      else {
        unsigned int v5 = v4 & 0xFFFFFFFE;
      }
      if (v5)
      {
        int v10 = 138543362;
        id v11 = v2;
        uint64_t v6 = _os_log_send_and_compose_impl();
        uint64_t v7 = (void *)v6;
        if (v6) {
          sub_18878BC90(v6);
        }
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      free(v7);
    }
  }

  return v1;
}

id sub_188784B2C(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v9 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a1 format:200 options:0 error:&v9];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  id v2 = v9;
  if (!v1)
  {
    if (qword_18C7258D8 != -1) {
      dispatch_once(&qword_18C7258D8, &unk_18A27E118);
    }
    id v3 = (os_log_s *)(id)qword_18C7258D0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unsigned int v4 = sub_18878BC68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        unsigned int v5 = v4;
      }
      else {
        unsigned int v5 = v4 & 0xFFFFFFFE;
      }
      if (v5)
      {
        int v10 = 138412290;
        id v11 = v2;
        uint64_t v6 = _os_log_send_and_compose_impl();
        uint64_t v7 = (void *)v6;
        if (v6) {
          sub_18878BC90(v6);
        }
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      free(v7);
    }
  }

  return v1;
}

id sub_188784CA8(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v15 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:a1 options:0 format:0 error:&v15];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    id v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_18C7258D8 != -1) {
          dispatch_once(&qword_18C7258D8, &unk_18A27E118);
        }
        id v3 = (os_log_s *)(id)qword_18C7258D0;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0LL;
          unsigned int v4 = sub_18878BC68();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            unsigned int v5 = v4;
          }
          else {
            unsigned int v5 = v4 & 0xFFFFFFFE;
          }
          if (v5)
          {
            uint64_t v6 = _os_log_send_and_compose_impl();
            uint64_t v7 = (void *)v6;
            if (v6) {
              sub_18878BC90(v6);
            }
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          free(v7);
        }

        id v13 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
      if (qword_18C7258D8 != -1) {
        dispatch_once(&qword_18C7258D8, &unk_18A27E118);
      }
      v8 = (os_log_s *)(id)qword_18C7258D0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_18878BC68();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(void *)((char *)v16 + 4) = v2;
          uint64_t v11 = _os_log_send_and_compose_impl();
          uint64_t v12 = (void *)v11;
          if (v11) {
            sub_18878BC90(v11);
          }
        }

        else
        {
          uint64_t v12 = 0LL;
        }

        free(v12);
      }
    }

    id v13 = v1;
LABEL_29:

    return v13;
  }

  return 0LL;
}

id sub_188784F24(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v15 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:a1 options:0 format:0 error:&v15];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    id v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_18C7258D8 != -1) {
          dispatch_once(&qword_18C7258D8, &unk_18A27E118);
        }
        id v3 = (os_log_s *)(id)qword_18C7258D0;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0LL;
          unsigned int v4 = sub_18878BC68();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            unsigned int v5 = v4;
          }
          else {
            unsigned int v5 = v4 & 0xFFFFFFFE;
          }
          if (v5)
          {
            uint64_t v6 = _os_log_send_and_compose_impl();
            uint64_t v7 = (void *)v6;
            if (v6) {
              sub_18878BC90(v6);
            }
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          free(v7);
        }

        id v13 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
      if (qword_18C7258D8 != -1) {
        dispatch_once(&qword_18C7258D8, &unk_18A27E118);
      }
      v8 = (os_log_s *)(id)qword_18C7258D0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_18878BC68();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(void *)((char *)v16 + 4) = v2;
          uint64_t v11 = _os_log_send_and_compose_impl();
          uint64_t v12 = (void *)v11;
          if (v11) {
            sub_18878BC90(v11);
          }
        }

        else
        {
          uint64_t v12 = 0LL;
        }

        free(v12);
      }
    }

    id v13 = v1;
LABEL_29:

    return v13;
  }

  return 0LL;
}

void sub_1887851A0()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "default");
  v1 = (void *)qword_18C7258D0;
  qword_18C7258D0 = (uint64_t)v0;
}

id sub_1887851D4(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      [&stru_18A27E240 dataUsingEncoding:4];
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v3 = v3;
    a1 = v3;
  }

  return a1;
}

LABEL_32:
    v19 = 0LL;
    goto LABEL_33;
  }

  [MEMORY[0x189603F48] dataWithBytes:v27 length:40];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v19;
}

LABEL_37:
        v21 = 0LL;
LABEL_38:
        free(v21);
      }
    }

    if (a4)
    {
      v22 = (void *)MEMORY[0x189607870];
      v23 = *MEMORY[0x189607630];
      v24 = v13;
      goto LABEL_41;
    }

LABEL_42:
    v17 = 0LL;
    goto LABEL_43;
  }

  [MEMORY[0x189603F48] dataWithBytes:v29 length:32];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v17;
}

      v27 = 0LL;
LABEL_43:
      free(v27);
LABEL_44:

      if (a5)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v10 userInfo:0];
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v33 = 0;
      }

      goto LABEL_138;
    }
  }

  uint64_t v11 = v9;
  uint64_t v12 = open_dprotected_np((const char *)[v11 UTF8String], 3585, 4, 0, 420);
  if (v12 == -1)
  {
    unsigned int v10 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v21 = (os_log_s *)(id)qword_18C4EC2A0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    v24 = sub_18878BC68();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v25 = v24;
    }
    else {
      v25 = v24 & 0xFFFFFFFE;
    }
    if (v25)
    {
      v87 = 138543874;
      v88 = v8;
      v89 = 2114;
      *(void *)v90 = v11;
      *(_WORD *)&v90[8] = 1024;
      *(_DWORD *)&v90[10] = v10;
LABEL_32:
      v26 = _os_log_send_and_compose_impl();
      v27 = (void *)v26;
      if (v26) {
        sub_18878BC90(v26);
      }
      goto LABEL_43;
    }

    goto LABEL_42;
  }

  id v13 = v12;
  v14 = v7;
  id v15 = write(v13, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
  if (v15 < 0)
  {
    v28 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v29 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_18878BC68();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        v30 &= ~1u;
      }
      if (v30)
      {
        v31 = v29;
        v87 = 138544130;
        v88 = v8;
        v89 = 1024;
        *(_DWORD *)v90 = v13;
        *(_WORD *)&v90[4] = 2048;
        *(void *)&v90[6] = [v14 length];
        v91 = 1024;
        LODWORD(v92) = v28;
        LODWORD(v85) = 34;
        v84 = &v87;
        v32 = (void *)_os_log_send_and_compose_impl();

        if (v32) {
          sub_18878BC90((uint64_t)v32);
        }
      }

      else
      {
        v32 = 0LL;
      }

      free(v32);
    }

    if (a5)
    {
      v34 = v28;
LABEL_90:
      v58 = (void *)MEMORY[0x189607870];
      v59 = *MEMORY[0x189607688];
LABEL_91:
      objc_msgSend(v58, "errorWithDomain:code:userInfo:", v59, v34, 0, v84, v85);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_125;
    }

    goto LABEL_124;
  }

  v16 = v15;
  if (v15 != [v14 length])
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v17 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v86 = v7;
      v18 = sub_18878BC68();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        v18 &= ~1u;
      }
      if (v18)
      {
        v19 = v17;
        v87 = 138544130;
        v88 = v8;
        v89 = 1024;
        *(_DWORD *)v90 = v13;
        *(_WORD *)&v90[4] = 2048;
        *(void *)&v90[6] = [v14 length];
        v91 = 2048;
        v92 = v16;
        LODWORD(v85) = 38;
        v84 = &v87;
        v20 = (void *)_os_log_send_and_compose_impl();

        if (v20) {
          sub_18878BC90((uint64_t)v20);
        }
      }

      else
      {
        v20 = 0LL;
      }

      uint64_t v7 = v86;
      free(v20);
    }
  }

  if (!fsync(v13))
  {
    v41 = v11;
    v42 = (const char *)[v41 UTF8String];
    v43 = v8;
    if (renamex_np(v42, (const char *)[v43 UTF8String], 2u))
    {
      v35 = *__error();
      if (v35 != 2)
      {
        if (qword_18C4EC2B0 != -1) {
          dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
        }
        v60 = (os_log_s *)(id)qword_18C4EC2A0;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v61 = sub_18878BC68();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            v62 = v61;
          }
          else {
            v62 = v61 & 0xFFFFFFFE;
          }
          if (v62)
          {
            v87 = 138543618;
            v88 = v43;
            v89 = 1024;
            *(_DWORD *)v90 = v35;
            LODWORD(v85) = 18;
            v84 = &v87;
            v63 = _os_log_send_and_compose_impl();
            v64 = (void *)v63;
            if (v63) {
              sub_18878BC90(v63);
            }
          }

          else
          {
            v64 = 0LL;
          }

          free(v64);
        }

        if (a5) {
          goto LABEL_89;
        }
        goto LABEL_124;
      }

      v44 = (const char *)[v41 UTF8String];
      v45 = v43;
      if (rename(v44, (const char *)[v45 UTF8String]))
      {
        v46 = *__error();
        if (qword_18C4EC2B0 != -1) {
          dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
        }
        v47 = (os_log_s *)(id)qword_18C4EC2A0;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = sub_18878BC68();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            v49 = v48;
          }
          else {
            v49 = v48 & 0xFFFFFFFE;
          }
          if (v49)
          {
            v87 = 138543874;
            v88 = v45;
            v89 = 1024;
            *(_DWORD *)v90 = 2;
            *(_WORD *)&v90[4] = 1024;
            *(_DWORD *)&v90[6] = v46;
            LODWORD(v85) = 24;
            v84 = &v87;
            v50 = _os_log_send_and_compose_impl();
            v51 = (void *)v50;
            if (v50) {
              sub_18878BC90(v50);
            }
          }

          else
          {
            v51 = 0LL;
          }

          free(v51);
        }

        if (a5)
        {
          v58 = (void *)MEMORY[0x189607870];
          v59 = *MEMORY[0x189607688];
          v34 = 2LL;
          goto LABEL_91;
        }

        goto LABEL_124;
      }
    }

    if (fcntl(v13, 85, v84, v85))
    {
      v52 = *__error();
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v53 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = sub_18878BC68();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          v55 = v54;
        }
        else {
          v55 = v54 & 0xFFFFFFFE;
        }
        if (v55)
        {
          v87 = 138543874;
          v88 = v43;
          v89 = 1024;
          *(_DWORD *)v90 = v13;
          *(_WORD *)&v90[4] = 1024;
          *(_DWORD *)&v90[6] = v52;
          v56 = _os_log_send_and_compose_impl();
          v57 = (void *)v56;
          if (v56) {
            sub_18878BC90(v56);
          }
        }

        else
        {
          v57 = 0LL;
        }

        free(v57);
      }
    }

    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v65 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      v66 = sub_18878BC68();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        v67 = v66;
      }
      else {
        v67 = v66 & 0xFFFFFFFE;
      }
      if (v67)
      {
        v87 = 138543362;
        v88 = v43;
        v68 = _os_log_send_and_compose_impl();
        v69 = (void *)v68;
        if (v68) {
          sub_18878BC90(v68);
        }
      }

      else
      {
        v69 = 0LL;
      }

      free(v69);
    }

    v33 = 1;
    goto LABEL_125;
  }

  v35 = *__error();
  if (qword_18C4EC2B0 != -1) {
    dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
  }
  v36 = (os_log_s *)(id)qword_18C4EC2A0;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = sub_18878BC68();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      v38 = v37;
    }
    else {
      v38 = v37 & 0xFFFFFFFE;
    }
    if (v38)
    {
      v87 = 138543874;
      v88 = v8;
      v89 = 1024;
      *(_DWORD *)v90 = v13;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v35;
      LODWORD(v85) = 24;
      v84 = &v87;
      v39 = _os_log_send_and_compose_impl();
      v40 = (void *)v39;
      if (v39) {
        sub_18878BC90(v39);
      }
    }

    else
    {
      v40 = 0LL;
    }

    free(v40);
  }

  if (a5)
  {
LABEL_89:
    v34 = v35;
    goto LABEL_90;
  }

LABEL_28:
        id v13 = 0LL;
LABEL_29:
        free(v13);
      }
    }

    else
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      unsigned int v5 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        unsigned int v10 = sub_18878BC68();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = v10 & 0xFFFFFFFE;
        }
        if (v11) {
          goto LABEL_26;
        }
        goto LABEL_28;
      }
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v5 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_18878BC68();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9) {
        goto LABEL_26;
      }
      goto LABEL_28;
    }
  }

  return v4 == 0;
}

LABEL_43:
    CFRelease(v16);
    goto LABEL_44;
  }

  if (qword_18C4EC2A8 != -1) {
    dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
  }
  v18 = (os_log_s *)(id)qword_18C4EC298;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = sub_18878BC68();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v20 = v19;
    }
    else {
      v20 = v19 & 0xFFFFFFFE;
    }
    if (v20)
    {
      v21 = _os_log_send_and_compose_impl();
      v22 = (void *)v21;
      if (v21) {
        sub_18878BC90(v21);
      }
    }

    else
    {
      v22 = 0LL;
    }

    free(v22);
  }

  if (v10) {
    goto LABEL_43;
  }
LABEL_44:

  return v17;
}

void sub_188787B64()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "sideeffect");
  v1 = (void *)qword_18C4EC298;
  qword_18C4EC298 = (uint64_t)v0;
}

id sub_188787B98(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_self();
  id v3 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v2];

  return v3;
}

id sub_188787BE4(uint64_t a1, const __CFUUID *a2)
{
  if (a2)
  {
    id v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (!v3) {
      sub_188791F50();
    }
    unsigned int v4 = v3;
    sub_188787B98(MEMORY[0x189607AB8], v3);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  return v5;
}

CFUUIDRef sub_188787C54(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  [a1 UUIDString];
  id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUUIDRef v3 = CFUUIDCreateFromString(v1, v2);

  if (!v3) {
    sub_188791F50();
  }
  return v3;
}

id sub_188787CB0()
{
  if (qword_18C7258E8 != -1) {
    dispatch_once(&qword_18C7258E8, &unk_18A27E158);
  }
  return (id)qword_18C7258E0;
}

void sub_188787CF4()
{
  os_log_t v0 = objc_alloc_init(&OBJC_CLASS___UMLProviderSideEffects);
  v1 = (void *)qword_18C7258E0;
  qword_18C7258E0 = (uint64_t)v0;
}

id sub_188787DA8()
{
  return sub_188787CB0();
}

uint64_t sub_188787DB4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_188787DC0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

uint64_t sub_188787DD0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

void sub_188787DDC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

LABEL_46:
        sub_18878BC90((uint64_t)v25);
        goto LABEL_48;
      }
    }

    v25 = 0LL;
    goto LABEL_48;
  }

  if (qword_18C4EC2B0 != -1) {
    dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
  }
  v27 = (os_log_s *)(id)qword_18C4EC2A0;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = sub_18878BC68();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      v29 = v28;
    }
    else {
      v29 = v28 & 0xFFFFFFFE;
    }
    if (v29)
    {
      v36 = 138543618;
      v37 = v5;
      v38 = 2114;
      v39 = v8;
      v30 = _os_log_send_and_compose_impl();
      v31 = (void *)v30;
      if (v30) {
        sub_18878BC90(v30);
      }
    }

    else
    {
      v31 = 0LL;
    }

    free(v31);
  }

  *a4 = v8;
LABEL_28:

  return v6;
}

LABEL_124:
  v33 = 0;
LABEL_125:
  if (close(v13))
  {
    v70 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v71 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = sub_18878BC68();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
        v73 = v72;
      }
      else {
        v73 = v72 & 0xFFFFFFFE;
      }
      if (v73)
      {
        v87 = 138543874;
        v88 = v8;
        v89 = 1024;
        *(_DWORD *)v90 = v13;
        *(_WORD *)&v90[4] = 1024;
        *(_DWORD *)&v90[6] = v70;
        v74 = _os_log_send_and_compose_impl();
        v75 = (void *)v74;
        if (v74) {
          sub_18878BC90(v74);
        }
      }

      else
      {
        v75 = 0LL;
      }

      free(v75);
    }
  }

LABEL_138:
  v76 = v9;
  if (unlink((const char *)[v76 UTF8String]))
  {
    v77 = *__error();
    if (v77 != 2)
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v78 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        v79 = sub_18878BC68();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT)) {
          v80 = v79;
        }
        else {
          v80 = v79 & 0xFFFFFFFE;
        }
        if (v80)
        {
          v87 = 138543874;
          v88 = v8;
          v89 = 2114;
          *(void *)v90 = v76;
          *(_WORD *)&v90[8] = 1024;
          *(_DWORD *)&v90[10] = v77;
          v81 = _os_log_send_and_compose_impl();
          v82 = (void *)v81;
          if (v81) {
            sub_18878BC90(v81);
          }
        }

        else
        {
          v82 = 0LL;
        }

        free(v82);
      }
    }
  }

  return v33;
}

LABEL_31:
    id v13 = 0LL;
LABEL_32:
    free(v13);
LABEL_33:

    v20 = 1;
    goto LABEL_39;
  }

  if (*__error() == 2)
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    uint64_t v7 = (os_log_s *)(id)qword_18C4EC2A0;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    v8 = sub_18878BC68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v8 & 0xFFFFFFFE;
    }
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }

  v14 = *__error();
  if (qword_18C4EC2B0 != -1) {
    dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
  }
  id v15 = (os_log_s *)(id)qword_18C4EC2A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_18878BC68();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v17 = v16;
    }
    else {
      v17 = v16 & 0xFFFFFFFE;
    }
    if (v17)
    {
      v18 = _os_log_send_and_compose_impl();
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

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v14 userInfo:0];
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v20 = 0;
  }

LABEL_39:
  return v20;
}

uint64_t sub_188789704(uint64_t a1, void *a2, _removefile_state *a3, void *a4)
{
  v38[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  if (a1)
  {
    if (a4) {
      *a4 = 0LL;
    }
    HIDWORD(v36) = 0;
    if (removefile_state_set(a3, 3u, sub_188789D24))
    {
      int v8 = *__error();
      HIDWORD(v36) = v8;
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      unsigned int v9 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(void *)v37 = 0LL;
        unsigned int v10 = sub_18878BC68();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          unsigned int v11 = v10;
        }
        else {
          unsigned int v11 = v10 & 0xFFFFFFFE;
        }
        if (v11)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = v8;
          LODWORD(v36) = 8;
          v35 = v38;
          goto LABEL_22;
        }

        goto LABEL_24;
      }

      goto LABEL_26;
    }

    if (removefile_state_set(a3, 4u, (char *)&v36 + 4))
    {
      HIDWORD(v36) = *__error();
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      unsigned int v9 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(void *)v37 = 0LL;
        unsigned int v12 = sub_18878BC68();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = v12 & 0xFFFFFFFE;
        }
        if (v13)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = HIDWORD(v36);
          LODWORD(v36) = 8;
          v35 = v38;
LABEL_22:
          uint64_t v14 = _os_log_send_and_compose_impl();
          id v15 = (void *)v14;
          if (v14) {
            sub_18878BC90(v14);
          }
          goto LABEL_25;
        }

LABEL_24:
        id v15 = 0LL;
LABEL_25:
        free(v15);
      }

LABEL_26:
      if (a4)
      {
LABEL_27:
        objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607688],  SHIDWORD(v36),  0,  v35,  v36,  *(void *)v37,  *(_OWORD *)&v37[8]);
        a1 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_73;
      }

LABEL_72:
      a1 = 0LL;
      goto LABEL_73;
    }

    id v16 = v7;
    if (removefile((const char *)[v16 UTF8String], a3, 1u))
    {
      HIDWORD(v36) = *__error();
      if (HIDWORD(v36) != 2)
      {
        if (qword_18C4EC2B0 != -1) {
          dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
        }
        v22 = (os_log_s *)(id)qword_18C4EC2A0;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38[0] = 0LL;
          unsigned int v23 = sub_18878BC68();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            unsigned int v24 = v23;
          }
          else {
            unsigned int v24 = v23 & 0xFFFFFFFE;
          }
          if (v24)
          {
LABEL_58:
            *(_DWORD *)v37 = 138543618;
            *(void *)&v37[4] = v16;
            *(_WORD *)&v37[12] = 1024;
            *(_DWORD *)&v37[14] = HIDWORD(v36);
            LODWORD(v36) = 18;
            v35 = v37;
            uint64_t v27 = _os_log_send_and_compose_impl();
            v28 = (void *)v27;
            if (v27) {
              sub_18878BC90(v27);
            }
            goto LABEL_70;
          }

        v22 = 0LL;
LABEL_73:
        free(v22);
LABEL_74:

        goto LABEL_75;
      }

      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      unsigned int v26 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = sub_18878BC68();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
          v28 = v27;
        }
        else {
          v28 = v27 & 0xFFFFFFFE;
        }
        if (v28)
        {
          *(_DWORD *)v40 = 136446210;
          *(void *)&v40[4] = a2;
          v29 = _os_log_send_and_compose_impl();
          unsigned int v30 = (void *)v29;
          if (v29) {
            sub_18878BC90(v29);
          }
        }

        else
        {
          unsigned int v30 = 0LL;
        }

        free(v30);
      }

      if (unlink(a2))
      {
        unsigned int v31 = *__error();
        if (v31 != 2)
        {
          if (qword_18C4EC2B0 != -1) {
            dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
          }
          unsigned int v18 = (os_log_s *)(id)qword_18C4EC2A0;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          uint64_t v32 = sub_18878BC68();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            v33 = v32;
          }
          else {
            v33 = v32 & 0xFFFFFFFE;
          }
          if (v33)
          {
            *(_DWORD *)v40 = 136446466;
            *(void *)&v40[4] = a2;
            v41 = 1024;
            v42 = v31;
LABEL_31:
            v21 = _os_log_send_and_compose_impl();
            v22 = (void *)v21;
            if (v21) {
              sub_18878BC90(v21);
            }
            goto LABEL_73;
          }

          goto LABEL_72;
        }
      }

      dst = 0;
    }

LABEL_69:
          v28 = 0LL;
LABEL_70:
          free(v28);
        }

LABEL_71:
        if (a4) {
          goto LABEL_27;
        }
        goto LABEL_72;
      }

      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v17 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v38[0] = 0LL;
        unsigned int v18 = sub_18878BC68();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          unsigned int v19 = v18;
        }
        else {
          unsigned int v19 = v18 & 0xFFFFFFFE;
        }
        if (v19)
        {
          *(_DWORD *)v37 = 138543362;
          *(void *)&v37[4] = v16;
          LODWORD(v36) = 12;
          v35 = v37;
          uint64_t v20 = _os_log_send_and_compose_impl();
          v21 = (void *)v20;
          if (v20) {
            sub_18878BC90(v20);
          }
        }

        else
        {
          v21 = 0LL;
        }

        free(v21);
      }
    }

    if ((v36 & 0xFFFFFFFD00000000LL) != 0)
    {
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      v22 = (os_log_s *)(id)qword_18C4EC2A0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v38[0] = 0LL;
        unsigned int v25 = sub_18878BC68();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26) {
          goto LABEL_58;
        }
        goto LABEL_69;
      }

      goto LABEL_71;
    }

    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v29 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v38[0] = 0LL;
      unsigned int v30 = sub_18878BC68();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v31 = v30;
      }
      else {
        unsigned int v31 = v30 & 0xFFFFFFFE;
      }
      if (v31)
      {
        *(_DWORD *)v37 = 138543362;
        *(void *)&v37[4] = v16;
        uint64_t v32 = _os_log_send_and_compose_impl();
        v33 = (void *)v32;
        if (v32) {
          sub_18878BC90(v32);
        }
      }

      else
      {
        v33 = 0LL;
      }

      free(v33);
    }

    a1 = 1LL;
  }

    free(v41);
LABEL_72:
    unsigned int v25 = 0;
    goto LABEL_100;
  }

  if (qword_18C725920 != -1) {
    dispatch_once(&qword_18C725920, &unk_18A27E200);
  }
  uint64_t v20 = (os_log_s *)(id)qword_18C725918;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(void *)v63 = 0LL;
    v21 = sub_18878BC68();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      v22 = v21;
    }
    else {
      v22 = v21 & 0xFFFFFFFE;
    }
    if (v22)
    {
      LOWORD(v66) = 0;
      unsigned int v23 = _os_log_send_and_compose_impl();
      unsigned int v24 = (void *)v23;
      if (v23) {
        sub_18878BC90(v23);
      }
    }

    else
    {
      unsigned int v24 = 0LL;
    }

    free(v24);
  }

  if (a7)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    unsigned int v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v25 = 0;
  }

LABEL_73:
  return a1;
}

uint64_t sub_188789D24(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    int v5 = *__error();
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    uint64_t v6 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(void *)&v43.st_dev = 0LL;
      unsigned int v7 = sub_18878BC68();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        *(_DWORD *)v40 = 67109120;
        *(_DWORD *)&v40[4] = v5;
        uint64_t v9 = _os_log_send_and_compose_impl();
        unsigned int v10 = (void *)v9;
        if (v9) {
          sub_18878BC90(v9);
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }

    return 0LL;
  }

  int v11 = dst;
  if (dst == 1)
  {
    memset(&v43, 0, sizeof(v43));
    if (lstat(a2, &v43))
    {
      int v17 = *__error();
      if (qword_18C4EC2B0 != -1) {
        dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
      }
      unsigned int v18 = (os_log_s *)(id)qword_18C4EC2A0;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
      unsigned int v19 = sub_18878BC68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20) {
        goto LABEL_30;
      }
      goto LABEL_72;
    }

    if ((v43.st_flags & 2) != 0)
    {
      if (lchflags(a2, v43.st_flags & 0xFFFFFFFD))
      {
        int v17 = *__error();
        if (qword_18C4EC2B0 != -1) {
          dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
        }
        unsigned int v18 = (os_log_s *)(id)qword_18C4EC2A0;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_74;
        }
        unsigned int v24 = sub_18878BC68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
LABEL_30:
          *(_DWORD *)v40 = 136446466;
          *(void *)&v40[4] = a2;
          __int16 v41 = 1024;
          int v42 = v17;
          goto LABEL_31;
        }

LABEL_75:
    int v11 = dst;
    goto LABEL_76;
  }

  if (dst == 2)
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    unsigned int v12 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(void *)v40 = 0LL;
      unsigned int v13 = sub_18878BC68();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        v43.st_dev = 136446210;
        *(void *)&v43.st_mode = a2;
        uint64_t v15 = _os_log_send_and_compose_impl();
        id v16 = (void *)v15;
        if (v15) {
          sub_18878BC90(v15);
        }
      }

      else
      {
        id v16 = 0LL;
      }

      free(v16);
    }

    return 0LL;
  }

LABEL_76:
  if (v11)
  {
    if (qword_18C4EC2B0 != -1) {
      dispatch_once(&qword_18C4EC2B0, &unk_18A27E178);
    }
    v34 = (os_log_s *)(id)qword_18C4EC2A0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(void *)v40 = 0LL;
      unsigned int v35 = sub_18878BC68();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = v35 & 0xFFFFFFFE;
      }
      if (v36)
      {
        v43.st_dev = 136446466;
        *(void *)&v43.st_mode = a2;
        WORD2(v43.st_ino) = 1024;
        *(_DWORD *)((char *)&v43.st_ino + 6) = dst;
        uint64_t v37 = _os_log_send_and_compose_impl();
        v38 = (void *)v37;
        if (v37) {
          sub_18878BC90(v37);
        }
      }

      else
      {
        v38 = 0LL;
      }

      free(v38);
    }

    if (!*a3) {
      *a3 = dst;
    }
  }

  return 0LL;
}

uint64_t sub_18878AEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a5];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v12 = (uint64_t (**)(void, void, void, void, void))MEMORY[0x1895CBD74](a6);
  uint64_t v13 = ((uint64_t (**)(void, uint64_t, uint64_t, void *, void *))v12)[2](v12, a1, a2, v10, v11);

  return v13;
}

void sub_18878AF48()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "sideeffect");
  v1 = (void *)qword_18C4EC2A0;
  qword_18C4EC2A0 = (uint64_t)v0;
}

uint64_t UMLCreatePrimaryUserLayout(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  uint64_t v9 = [v8 createUserLayoutForUserwithUserID:501 withAKSSetup:a3 onUserVolumePath:a2 fromSystemVolumePath:a1 withError:&v13];
  id v10 = v13;
  int v11 = v10;
  if (a4 && (v9 & 1) == 0 && v10) {
    *a4 = v10;
  }

  return v9;
}

void sub_18878BC00()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "userlayout");
  v1 = (void *)qword_18C7258F0;
  qword_18C7258F0 = (uint64_t)v0;
}

void UMLSetLogHandler()
{
  uint64_t v0 = MEMORY[0x1895CBD74]();
  v1 = (void *)qword_18C725900;
  qword_18C725900 = v0;
}

void *UMLSetInternalLogHandlers(void *result, void *a2)
{
  off_18C4EC290 = result;
  off_18C4EC288 = a2;
  return result;
}

uint64_t sub_18878BC68()
{
  if (off_18C4EC290) {
    return off_18C4EC290();
  }
  else {
    return 2 * (qword_18C725900 != 0);
  }
}

uint64_t sub_18878BC90(uint64_t a1)
{
  if (off_18C4EC288) {
    return off_18C4EC288(a1);
  }
  if (!qword_18C725900) {
    sub_188791F68();
  }
  return (*(uint64_t (**)(void))(qword_18C725900 + 16))();
}

void sub_18878BD10()
{
  uint64_t v0 = objc_alloc(&OBJC_CLASS___UMLManager);
  sub_188787DA8();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = sub_18878BD6C((id *)&v0->super.isa, v3);
  id v2 = (void *)qword_18C725908;
  qword_18C725908 = (uint64_t)v1;
}

id *sub_18878BD6C(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___UMLManager;
    int v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (!v5) {
      sub_188791F50();
    }
    a1 = v5;

    objc_storeStrong(a1 + 1, a2);
    uint64_t v6 = objc_opt_new();
    id v7 = a1[2];
    a1[2] = (id)v6;
  }

  return a1;
}

LABEL_58:
        goto LABEL_62;
      }

      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      stat v43 = (id)qword_18C725918;
      if (!os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        if (a4)
        {
          [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:5 userInfo:0];
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v38 = (os_log_s *)v22;
        v22 = 0LL;
        goto LABEL_58;
      }

      uint64_t v44 = v5;
      v56 = 0LL;
      v47 = sub_18878BC68();
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
        v48 = v47;
      }
      else {
        v48 = v47 & 0xFFFFFFFE;
      }
      if (v48)
      {
        v55 = 0;
LABEL_51:
        v49 = _os_log_send_and_compose_impl();
        v50 = (void *)v49;
        if (v49) {
          sub_18878BC90(v49);
        }
        goto LABEL_54;
      }
    }

    else
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      stat v43 = (id)qword_18C725918;
      if (!os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      uint64_t v44 = v5;
      v56 = 0LL;
      v45 = sub_18878BC68();
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
        v46 = v45;
      }
      else {
        v46 = v45 & 0xFFFFFFFE;
      }
      if (v46)
      {
        v55 = 0;
        goto LABEL_51;
      }
    }

    v50 = 0LL;
LABEL_54:
    free(v50);
    int v5 = v44;
    goto LABEL_55;
  }

  if (qword_18C725920 != -1) {
    dispatch_once(&qword_18C725920, &unk_18A27E200);
  }
  int v31 = (os_log_s *)(id)qword_18C725918;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v56 = 0LL;
    unsigned int v32 = sub_18878BC68();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      unsigned int v33 = v32;
    }
    else {
      unsigned int v33 = v32 & 0xFFFFFFFE;
    }
    if (v33)
    {
      v55 = 0;
      v34 = _os_log_send_and_compose_impl();
      unsigned int v35 = (void *)v34;
      if (v34) {
        sub_18878BC90(v34);
      }
    }

    else
    {
      unsigned int v35 = 0LL;
    }

    free(v35);
  }

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
  v22 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

  return v22;
}

LABEL_97:
        v56 = 0LL;
LABEL_98:
        free(v56);
LABEL_99:
        unsigned int v25 = 1;
        goto LABEL_100;
      }

      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      int v42 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(void *)v63 = 0LL;
        stat v43 = sub_18878BC68();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          uint64_t v44 = v43;
        }
        else {
          uint64_t v44 = v43 & 0xFFFFFFFE;
        }
        if (v44)
        {
          LODWORD(v66) = 67109120;
          HIDWORD(v66) = a3;
          v45 = _os_log_send_and_compose_impl();
          v46 = (void *)v45;
          if (v45) {
            sub_18878BC90(v45);
          }
        }

        else
        {
          v46 = 0LL;
        }

        free(v46);
      }

      if (self) {
        v49 = self->_se;
      }
      else {
        v49 = 0LL;
      }
      v50 = v49;
      sub_188787DB4((uint64_t)v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = [v51 bootstrapVolumeWithMountPoint:v11 user:a3 error:a7];

      if ((v52 & 1) != 0)
      {
        if (qword_18C725920 != -1) {
          dispatch_once(&qword_18C725920, &unk_18A27E200);
        }
        uint64_t v37 = (os_log_s *)(id)qword_18C725918;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_99;
        }
        *(void *)v63 = 0LL;
        v53 = sub_18878BC68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          v54 = v53;
        }
        else {
          v54 = v53 & 0xFFFFFFFE;
        }
        if (v54)
        {
          LOWORD(v66) = 0;
LABEL_86:
          v55 = _os_log_send_and_compose_impl();
          v56 = (void *)v55;
          if (v55) {
            sub_18878BC90(v55);
          }
          goto LABEL_98;
        }

        goto LABEL_97;
      }

      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v37 = (os_log_s *)(id)qword_18C725918;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      *(void *)v63 = 0LL;
      v57 = sub_18878BC68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        v58 = v57;
      }
      else {
        v58 = v57 & 0xFFFFFFFE;
      }
      if (!v58)
      {
        __int16 v41 = 0LL;
        goto LABEL_71;
      }

      LOWORD(v66) = 0;
      v40 = _os_log_send_and_compose_impl();
      __int16 v41 = (void *)v40;
      if (v40) {
        goto LABEL_96;
      }
    }

    else
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      int v31 = v29;
      uint64_t v37 = (os_log_s *)(id)qword_18C725918;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        unsigned int v25 = 0;
LABEL_100:

        goto LABEL_101;
      }

      v66 = 0LL;
      v38 = sub_18878BC68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        v39 = v38;
      }
      else {
        v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        *(_DWORD *)v63 = 138543618;
        *(void *)&v63[4] = v29;
        v64 = 2114;
        v65 = v11;
        v40 = _os_log_send_and_compose_impl();
        __int16 v41 = (void *)v40;
        if (v40) {
LABEL_96:
        }
          sub_18878BC90(v40);
      }

      else
      {
        __int16 v41 = 0LL;
      }
    }

LABEL_101:
  return v25;
}

uint64_t sub_18878D134(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 2)
  {
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    id v10 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = sub_18878BC68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        unsigned int v14 = (void *)v13;
        if (v13) {
          sub_18878BC90(v13);
        }
      }

      else
      {
        unsigned int v14 = 0LL;
      }

      free(v14);
    }

    id v16 = *(void **)(a1 + 32);
    if (v16) {
      id v16 = (void *)v16[1];
    }
    int v17 = v16;
    sub_188787DD0((uint64_t)v17);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 chownPath:v9 toUser:*(unsigned int *)(a1 + 40) group:*(unsigned int *)(a1 + 40) error:0];

    if ((v19 & 1) != 0)
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      unsigned int v20 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v21 = sub_18878BC68();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          unsigned int v22 = v21;
        }
        else {
          unsigned int v22 = v21 & 0xFFFFFFFE;
        }
        if (v22)
        {
          uint64_t v23 = _os_log_send_and_compose_impl();
          unsigned int v24 = (void *)v23;
          if (v23) {
            sub_18878BC90(v23);
          }
        }

        else
        {
          unsigned int v24 = 0LL;
        }

        free(v24);
      }

      uint64_t v15 = 0LL;
    }

    else
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      unsigned int v20 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        unsigned int v25 = sub_18878BC68();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26)
        {
          uint64_t v27 = _os_log_send_and_compose_impl();
          unsigned int v28 = (void *)v27;
          if (v27) {
            sub_18878BC90(v27);
          }
        }

        else
        {
          unsigned int v28 = 0LL;
        }

        free(v28);
      }

      uint64_t v15 = 2LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

LABEL_27:
    char v19 = 0LL;
LABEL_28:
    free(v19);
LABEL_29:

    unsigned int v11 = 0LL;
    goto LABEL_30;
  }

  +[UMLUserManifest manifestFromData:](&OBJC_CLASS___UMLUserManifest, "manifestFromData:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_188787DDC((uint64_t)self, v10);

  if (!self || !self->_manifest)
  {
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    uint64_t v13 = (os_log_s *)(id)qword_18C725918;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    id v16 = sub_18878BC68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      int v17 = v16;
    }
    else {
      int v17 = v16 & 0xFFFFFFFE;
    }
    if (v17) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }

  unsigned int v11 = self->_manifest;
LABEL_30:

  return v11;
}

LABEL_15:
  }

  else
  {
    unsigned int v21 = 0;
  }

  return v21;
}

LABEL_54:
    v46 = 0;
    goto LABEL_55;
  }

  if (qword_18C725920 != -1) {
    dispatch_once(&qword_18C725920, &unk_18A27E200);
  }
  uint64_t v27 = (os_log_s *)(id)qword_18C725918;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v51 = 0LL;
    unsigned int v28 = sub_18878BC68();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = v28 & 0xFFFFFFFE;
    }
    if (v29)
    {
      v50 = 0;
      LODWORD(v49) = 2;
      v48 = &v50;
      unsigned int v30 = _os_log_send_and_compose_impl();
      int v31 = (void *)v30;
      if (v30) {
        sub_18878BC90(v30);
      }
    }

    else
    {
      int v31 = 0LL;
    }

    free(v31);
  }

  int v42 = a9;
  if (!a9) {
    goto LABEL_54;
  }
  stat v43 = (void *)MEMORY[0x189607870];
  uint64_t v44 = *MEMORY[0x189607688];
  v45 = 22LL;
LABEL_52:
  objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, v45, 0, v48, v49);
  v46 = 0;
  *int v42 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v32 = (os_log_s *)v14;
  unsigned int v14 = 0LL;
LABEL_53:

LABEL_55:
  return v46;
}

void sub_18878E93C()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "userlayout");
  v1 = (void *)qword_18C725918;
  qword_18C725918 = (uint64_t)v0;
}

LABEL_56:
        sub_18878BC90((uint64_t)v21);
        goto LABEL_58;
      }

LABEL_57:
      unsigned int v21 = 0LL;
      goto LABEL_58;
    }
  }

LABEL_59:
  sub_18878460C(v3, (uint64_t)@"MKBUserSessionUUID");
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserUUID:](v4, "setUserUUID:", v24);

  -[UMLUser userUUID](v4, "userUUID");
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v30 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      int v31 = v30;
    }
    else {
      int v31 = v30 & 0xFFFFFFFE;
    }
    if (!v31) {
      goto LABEL_173;
    }
LABEL_171:
    v75 = _os_log_send_and_compose_impl();
    v76 = (void *)v75;
    if (v75) {
      sub_18878BC90(v75);
    }
    goto LABEL_174;
  }

  if (qword_18C725930 != -1) {
    dispatch_once(&qword_18C725930, &unk_18A27E220);
  }
  unsigned int v26 = (os_log_s *)(id)qword_18C725928;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = sub_18878BC68();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      v27 &= ~1u;
    }
    if (v27)
    {
      unsigned int v28 = v26;
      v93 = -[UMLUser userUUID](v4, "userUUID");
      uint64_t v29 = (void *)_os_log_send_and_compose_impl();

      if (v29) {
        sub_18878BC90((uint64_t)v29);
      }
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    free(v29);
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionAlternateUUID");
  unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setAlternateDSID:](v4, "setAlternateDSID:", v32);

  -[UMLUser alternateDSID](v4, "alternateDSID");
  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    v34 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v35 = sub_18878BC68();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        v35 &= ~1u;
      }
      if (v35)
      {
        unsigned int v36 = v34;
        v94 = -[UMLUser alternateDSID](v4, "alternateDSID");
        uint64_t v37 = (void *)_os_log_send_and_compose_impl();

        if (!v37) {
          goto LABEL_97;
        }
        goto LABEL_95;
      }

      goto LABEL_96;
    }
  }

  else
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    v34 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v38 = sub_18878BC68();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        v39 = v38;
      }
      else {
        v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        uint64_t v37 = (void *)_os_log_send_and_compose_impl();
        if (!v37)
        {
LABEL_97:
          free(v37);
          goto LABEL_98;
        }

LABEL_95:
        sub_18878BC90((uint64_t)v37);
        goto LABEL_97;
      }

LABEL_96:
      uint64_t v37 = 0LL;
      goto LABEL_97;
    }
  }

LABEL_98:
  sub_18878460C(v3, (uint64_t)@"MKBUserTypeKey");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserType:](v4, "setUserType:", v40);

  -[UMLUser userType](v4, "userType");
  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v46 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v47 = v46;
    }
    else {
      v47 = v46 & 0xFFFFFFFE;
    }
    if (!v47) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  if (qword_18C725930 != -1) {
    dispatch_once(&qword_18C725930, &unk_18A27E220);
  }
  int v42 = (os_log_s *)(id)qword_18C725928;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    stat v43 = sub_18878BC68();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      v43 &= ~1u;
    }
    if (v43)
    {
      uint64_t v44 = v42;
      v95 = -[UMLUser userType](v4, "userType");
      v45 = (void *)_os_log_send_and_compose_impl();

      if (v45) {
        sub_18878BC90((uint64_t)v45);
      }
    }

    else
    {
      v45 = 0LL;
    }

    free(v45);
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionShortName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUsername:](v4, "setUsername:", v48);
  v49 = -[UMLUser username](v4, "username");
  if (!v49)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v65 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v66 = v65;
    }
    else {
      v66 = v65 & 0xFFFFFFFE;
    }
    if (!v66) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionFirstName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstName:](v4, "setFirstName:", v50);
  v51 = -[UMLUser firstName](v4, "firstName");
  if (!v51)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v67 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v68 = v67;
    }
    else {
      v68 = v67 & 0xFFFFFFFE;
    }
    if (!v68) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionLastName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastName:](v4, "setLastName:", v52);
  v53 = -[UMLUser lastName](v4, "lastName");
  if (!v53)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v69 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v70 = v69;
    }
    else {
      v70 = v69 & 0xFFFFFFFE;
    }
    if (!v70) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionDisplayName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setDisplayName:](v4, "setDisplayName:", v54);
  v55 = -[UMLUser displayName](v4, "displayName");
  if (!v55)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v71 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v72 = v71;
    }
    else {
      v72 = v71 & 0xFFFFFFFE;
    }
    if (!v72) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionLibinfoHomeDir");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLibInfoPath:](v4, "setLibInfoPath:", v56);
  v57 = -[UMLUser libInfoPath](v4, "libInfoPath");
  if (!v57)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    v73 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v74 = v73;
    }
    else {
      v74 = v73 & 0xFFFFFFFE;
    }
    if (!v74) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionHomeDir");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setHomeDirPath:](v4, "setHomeDirPath:", v58);
  v59 = -[UMLUser homeDirPath](v4, "homeDirPath");
  if (!v59)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    v60 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v61 = sub_18878BC68();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
        v62 = v61;
      }
      else {
        v62 = v61 & 0xFFFFFFFE;
      }
      if (v62)
      {
        v63 = _os_log_send_and_compose_impl();
        v64 = (void *)v63;
        if (v63) {
          sub_18878BC90(v63);
        }
      }

      else
      {
        v64 = 0LL;
      }

      free(v64);
    }
  }

  -[UMLUser setNeedsMount:](v4, "setNeedsMount:", sub_188784378(v3, (uint64_t)@"MKBUserSessionNeedsMount"));
  -[UMLUser setIsForeground:](v4, "setIsForeground:", sub_188784378(v3, (uint64_t)@"MKBUserSessionForeground"));
  -[UMLUser setIsDirty:](v4, "setIsDirty:", sub_188784378(v3, (uint64_t)@"MKBUserSessionDirty"));
  -[UMLUser setIsPrimaryUser:](v4, "setIsPrimaryUser:", sub_188784378(v3, (uint64_t)@"MKBUserSessionisPrimary"));
  -[UMLUser setIsAdminUser:](v4, "setIsAdminUser:", sub_188784378(v3, (uint64_t)@"MKBUserSessionisAdminKey"));
  -[UMLUser setIsDisabledUser:](v4, "setIsDisabledUser:", sub_188784378(v3, (uint64_t)@"MKBUserSessionDisabled"));
  -[UMLUser setIsLoginUser:](v4, "setIsLoginUser:", sub_188784378(v3, (uint64_t)@"MKBUserSessionLoginUser"));
  -[UMLUser setIsAuditor:](v4, "setIsAuditor:", sub_188784378(v3, (uint64_t)@"MKBUserSessionAuditor"));
  -[UMLUser setHasSyncBag:](v4, "setHasSyncBag:", sub_188784378(v3, (uint64_t)@"MKBUserSessionHasSyncBag"));
  sub_18878460C(v3, (uint64_t)@"MKBUserSessionLanguage");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserLanguauge:](v4, "setUserLanguauge:", v79);

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionFileInfo");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFileInfoPath:](v4, "setFileInfoPath:", v80);

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionVolumeDeviceNode");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setDiskNode:](v4, "setDiskNode:", v81);

  sub_18878460C(v3, (uint64_t)@"MKBUserSessionVolumeUUID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setVolumeUUID:](v4, "setVolumeUUID:", v82);

  sub_188784934(v3, (uint64_t)@"MKBUserSessionOpaque");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setOpaqueData:](v4, "setOpaqueData:", v83);

  sub_188784934(v3, (uint64_t)@"MKBUserSessionKeybagOpaqueData");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setKeybagOpaqueData:](v4, "setKeybagOpaqueData:", v84);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCreateTimeStamp");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCreationDate:](v4, "setCreationDate:", v85);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCreateTimeStamp");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCreationDate:](v4, "setCreationDate:", v86);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCachedLoginStartTime");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastLoginStart:](v4, "setLastLoginStart:", v87);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCachedLoginEndTime");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastLoginEnd:](v4, "setLastLoginEnd:", v88);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionFirstLoginStartTime");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstLoginStart:](v4, "setFirstLoginStart:", v89);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionFirstLoginEndTime");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstLoginEnd:](v4, "setFirstLoginEnd:", v90);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCachedLoginStartTime");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCachedLoginStart:](v4, "setCachedLoginStart:", v91);

  sub_1887848B8(v3, (uint64_t)@"MKBUserSessionCachedLoginEndTime");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCachedLoginEnd:](v4, "setCachedLoginEnd:", v92);

  -[UMLUser setGracePeriod:]( v4,  "setGracePeriod:",  sub_1887843FC(v3, (uint64_t)@"MKBUserSessionRequiresPasscode", 0LL));
  v77 = v4;
LABEL_176:

  return v77;
}

void sub_188791F1C()
{
  os_log_t v0 = os_log_create(off_18C7258C8, "userlayout");
  v1 = (void *)qword_18C725928;
  qword_18C725928 = (uint64_t)v0;
}

void sub_188791F50()
{
}

void sub_188791F68()
{
}

uint64_t AKSIdentityAddPersona()
{
  return MEMORY[0x18960D130]();
}

uint64_t AKSIdentityCreate()
{
  return MEMORY[0x18960D138]();
}

uint64_t AKSIdentityDelete()
{
  return MEMORY[0x18960D140]();
}

uint64_t AKSIdentityDeletePersona()
{
  return MEMORY[0x18960D148]();
}

uint64_t AKSIdentityLoad()
{
  return MEMORY[0x18960D158]();
}

uint64_t AKSIdentityLogin()
{
  return MEMORY[0x18960D160]();
}

uint64_t AKSIdentityUnload()
{
  return MEMORY[0x18960D168]();
}

uint64_t AKSVolumeBootstrapFS()
{
  return MEMORY[0x18960D170]();
}

uint64_t AKSVolumeMap()
{
  return MEMORY[0x18960D178]();
}

uint64_t AKSVolumeUnmap()
{
  return MEMORY[0x18960D180]();
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x18960D258]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x18960D438]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x18960D440]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x18960D458]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1895FAA68]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1895FAA70](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1895FAA78](s, *(void *)&flag, src);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FB9A8](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1895FCD68](a1, a2, *(void *)&a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t objc_msgSend_createUserLayoutForUserwithUserID_withAKSSetup_onUserVolumePath_fromSystemVolumePath_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createUserLayoutForUserwithUserID_withAKSSetup_onUserVolumePath_fromSystemVolumePath_withError_);
}

uint64_t objc_msgSend_updateUser_inManifest_withDiskNode_volumeUUID_volumeName_withSharedDataVolumePath_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateUser_inManifest_withDiskNode_volumeUUID_volumeName_withSharedDataVolumePath_withError_);
}