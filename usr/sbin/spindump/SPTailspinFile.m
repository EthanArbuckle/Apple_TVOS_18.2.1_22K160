@interface SPTailspinFile
+ (id)sampleStoreForFile:(const char *)a3 stackshotsOnly:(BOOL)a4 parsePastLastStackshot:(BOOL)a5;
@end

@implementation SPTailspinFile

+ (id)sampleStoreForFile:(const char *)a3 stackshotsOnly:(BOOL)a4 parsePastLastStackshot:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v7 = a3;
  uint64_t v72 = 0LL;
  if ((+[SASampleStore canOpenFileAsKTraceFile:errorOut:]( &OBJC_CLASS___SASampleStore,  "canOpenFileAsKTraceFile:errorOut:",  a3,  &v72) & 1) == 0)
  {
    if (v72)
    {
      if (byte_1000DFD38)
      {
        int v18 = *__error();
        v19 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1000835EC();
        }
        *__error() = v18;
      }

      if (byte_1000DFD39) {
        BOOL v20 = dword_1000DF4B8 <= 0;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        int v21 = *__error();
        v22 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Could not open %s as a ktrace file: %@",  v7,  v72);
        if (!v22)
        {
          v23 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            sub_10008358C();
          }
          goto LABEL_124;
        }

        goto LABEL_113;
      }
    }

    else
    {
      if (byte_1000DFD38)
      {
        int v24 = *__error();
        v25 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_100083520();
        }
        *__error() = v24;
      }

      if (byte_1000DFD39) {
        BOOL v26 = dword_1000DF4B8 <= 0;
      }
      else {
        BOOL v26 = 0;
      }
      if (v26)
      {
        int v21 = *__error();
        v22 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Could not open %s as a ktrace file for unknown reason",  v7);
        if (!v22)
        {
          v28 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            sub_1000834C0();
          }
          goto LABEL_124;
        }

        goto LABEL_113;
      }
    }

    return 0LL;
  }

  id v67 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = -[SASampleStore initForFileParsing](objc_alloc(&OBJC_CLASS___SASampleStore), "initForFileParsing");
  if ((byte_1000DFCFC & 2) != 0 && sub_100020154())
  {
    if (byte_1000DFD38)
    {
      int v9 = *__error();
      v10 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Avoiding inspecting live processes for tailspin file due to audio running",  buf,  2u);
      }

      *__error() = v9;
    }

    if (byte_1000DFD39) {
      BOOL v11 = dword_1000DF4B8 <= 2;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      int v12 = *__error();
      v13 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Avoiding inspecting live processes for tailspin file due to audio running");
      if (v13)
      {
        v14 = v13;
        CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
        if (CStringPtr)
        {
          v16 = (char *)CStringPtr;
          v17 = 0LL;
        }

        else
        {
          v16 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v14, v16, 1024LL, 0x8000100u);
          v17 = v16;
        }

        if (qword_1000DFD40) {
          v31 = (FILE *)qword_1000DFD40;
        }
        else {
          v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        CFRelease(v14);
      }

      else
      {
        v29 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          sub_100083480(v29);
        }
        if (qword_1000DFD40) {
          v30 = (FILE *)qword_1000DFD40;
        }
        else {
          v30 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
      }

      *__error() = v12;
    }

    [v8 setDataGatheringOptions:((unint64_t)[v8 dataGatheringOptions] & 0xFFFFFFFFFFFFFFFDLL)];
  }

  sub_10004C368( v8,  (byte_1000DFCFC >> 3) & 1,  (byte_1000DFCFC >> 2) & 1,  (byte_1000DFCFC & 0x10) == 0);
  id v66 = v8;
  if (v6)
  {
    v32 = v67;
    unsigned __int8 v33 = [v8 parseStackshotsFromKTraceFile:v7 warningsOut:v67 errorOut:&v72];
  }

  else
  {
    if (v5) {
      [v8 setKPerfPETParsePastLastStackshot:1];
    }
    v32 = v67;
    unsigned __int8 v33 = [v8 parseKTraceFile:v7 warningsOut:v67 errorOut:&v72];
  }

  unsigned __int8 v65 = v33;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v34 = [v32 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(v32);
        }
        uint64_t v38 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        if (byte_1000DFD38)
        {
          int v39 = *__error();
          v40 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = v7;
            __int16 v75 = 2112;
            uint64_t v76 = v38;
            _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "WARNING creating sample store from %s: %@",  buf,  0x16u);
          }

          *__error() = v39;
        }

        if (byte_1000DFD39) {
          BOOL v41 = dword_1000DF4B8 <= 3;
        }
        else {
          BOOL v41 = 0;
        }
        if (v41)
        {
          int v42 = *__error();
          v43 = v7;
          v44 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"WARNING creating sample store from %s: %@",  v7,  v38);
          if (v44)
          {
            v45 = v44;
            v46 = CFStringGetCStringPtr(v44, 0x8000100u);
            if (v46)
            {
              v47 = (char *)v46;
              v48 = 0LL;
            }

            else
            {
              v47 = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v45, v47, 1024LL, 0x8000100u);
              v48 = v47;
            }

            if (qword_1000DFD40) {
              v51 = (FILE *)qword_1000DFD40;
            }
            else {
              v51 = __stderrp;
            }
            fprintf(v51, "%s\n", v47);
            if (v48) {
              free(v48);
            }
            CFRelease(v45);
            v7 = v43;
          }

          else
          {
            v49 = (os_log_s *)sub_10005C68C();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v74 = v7;
              __int16 v75 = 2112;
              uint64_t v76 = v38;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_FAULT,  "Unable to format: WARNING creating sample store from %s: %@",  buf,  0x16u);
            }

            if (qword_1000DFD40) {
              v50 = (FILE *)qword_1000DFD40;
            }
            else {
              v50 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v50);
          }

          v32 = v67;
          *__error() = v42;
        }
      }

      id v35 = [v32 countByEnumeratingWithState:&v68 objects:v77 count:16];
    }

    while (v35);
  }

  if ((v65 & 1) != 0) {
    return v66;
  }

  if (v72)
  {
    if (byte_1000DFD38)
    {
      int v52 = *__error();
      v53 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_100083410();
      }
      *__error() = v52;
    }

    id result = 0LL;
    if (byte_1000DFD39 && dword_1000DF4B8 <= 3)
    {
      int v21 = *__error();
      v22 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"ERROR trying to create sample store from %s: %@",  v7,  v72);
      if (!v22)
      {
        v54 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
          sub_1000833B0();
        }
LABEL_124:
        if (qword_1000DFD40) {
          v63 = (FILE *)qword_1000DFD40;
        }
        else {
          v63 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
LABEL_128:
        v64 = __error();
        id result = 0LL;
        int *v64 = v21;
        return result;
      }

      goto LABEL_113;
    }
  }

  else
  {
    if (byte_1000DFD38)
    {
      int v55 = *__error();
      v56 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_100083344();
      }
      *__error() = v55;
    }

    id result = 0LL;
    if (byte_1000DFD39 && dword_1000DF4B8 <= 3)
    {
      int v21 = *__error();
      v22 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"ERROR trying to create sample store from %s: Unknown error",  v7);
      if (!v22)
      {
        v62 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          sub_1000832E4();
        }
        goto LABEL_124;
      }

@end