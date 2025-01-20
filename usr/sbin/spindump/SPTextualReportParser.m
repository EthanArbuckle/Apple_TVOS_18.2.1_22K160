@interface SPTextualReportParser
+ (BOOL)isSpindumpFile:(const char *)a3;
- (BOOL)isHeavy;
- (BOOL)parseSpindumpFile:(const char *)a3 andReportToStream:(__sFILE *)a4;
- (BOOL)symbolicate;
- (BOOL)useDsymForUUIDForEverything;
- (NSArray)findDsymsForIDs;
- (int)endIndex;
- (int)omitFramesBelowSampleCount;
- (int)startIndex;
- (void)dealloc;
- (void)setEndIndex:(int)a3;
- (void)setFindDsymsForIDs:(id)a3;
- (void)setIsHeavy:(BOOL)a3;
- (void)setOmitFramesBelowSampleCount:(int)a3;
- (void)setStartIndex:(int)a3;
- (void)setSymbolicate:(BOOL)a3;
- (void)setUseDsymForUUIDForEverything:(BOOL)a3;
@end

@implementation SPTextualReportParser

+ (BOOL)isSpindumpFile:(const char *)a3
{
  v4 = fopen(a3, "r");
  if (v4)
  {
    v5 = v4;
    v6 = (char *)malloc(0x4000uLL);
    while (fgets(v6, 0x4000, v5))
    {
      if (!strncmp("Report Version:", v6, 0xFuLL))
      {
        BOOL v7 = strtol(v6 + 15, 0LL, 0) != 0;
        goto LABEL_16;
      }
    }

    BOOL v7 = 0;
LABEL_16:
    free(v6);
    fclose(v5);
  }

  else
  {
    if (byte_1000DFD38)
    {
      int v8 = *__error();
      v9 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100085890();
      }
      *__error() = v8;
    }

    if (byte_1000DFD39) {
      BOOL v10 = dword_1000DF4B8 <= 3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      int v11 = *__error();
      uint64_t v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Unable to open %s: %d (%s)", a3, v12, v14);
      if (v15)
      {
        v16 = v15;
        CStringPtr = CFStringGetCStringPtr(v15, 0x8000100u);
        if (CStringPtr)
        {
          v18 = (char *)CStringPtr;
          v19 = 0LL;
        }

        else
        {
          v18 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v16, v18, 1024LL, 0x8000100u);
          v19 = v18;
        }

        if (qword_1000DFD40) {
          v22 = (FILE *)qword_1000DFD40;
        }
        else {
          v22 = __stderrp;
        }
        fprintf(v22, "%s\n", v18);
        if (v19) {
          free(v19);
        }
        CFRelease(v16);
      }

      else
      {
        v20 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100085810();
        }
        if (qword_1000DFD40) {
          v21 = (FILE *)qword_1000DFD40;
        }
        else {
          v21 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
      }

      BOOL v7 = 0;
      *__error() = v11;
    }

    else
    {
      return 0;
    }
  }

  return v7;
}

- (BOOL)parseSpindumpFile:(const char *)a3 andReportToStream:(__sFILE *)a4
{
  v6 = objc_autoreleasePoolPush();
  uint64_t v693 = 0LL;
  v694 = &v693;
  uint64_t v695 = 0x2020000000LL;
  uint64_t v696 = 0LL;
  uint64_t v689 = 0LL;
  v690 = &v689;
  uint64_t v691 = 0x2020000000LL;
  int v692 = 0;
  v14 = fopen(a3, "r");
  if (!v14)
  {
    if (byte_1000DFD38)
    {
      int v37 = *__error();
      v38 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v84 = *__error();
        v85 = __error();
        v86 = strerror(*v85);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v84;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v86;
        _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Parsing spindump text: Unable to open %s: %d (%s)",  buf,  0x1Cu);
      }

      *__error() = v37;
    }

    if (byte_1000DFD39) {
      BOOL v39 = dword_1000DF4B8 <= 3;
    }
    else {
      BOOL v39 = 0;
    }
    if (v39)
    {
      int v23 = *__error();
      uint64_t v40 = *__error();
      v41 = __error();
      v42 = strerror(*v41);
      v43 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Parsing spindump text: Unable to open %s: %d (%s)",  a3,  v40,  v42);
      v44 = v43;
      if (v43)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v43, 0x8000100u);
        if (CStringPtr)
        {
          v46 = 0LL;
        }

        else
        {
          CStringPtr = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v44, CStringPtr, 1024LL, 0x8000100u);
          v46 = CStringPtr;
        }

        if (qword_1000DFD40) {
          v64 = (FILE *)qword_1000DFD40;
        }
        else {
          v64 = __stderrp;
        }
        fprintf(v64, "%s\n", CStringPtr);
        if (v46) {
          free(v46);
        }
        CFRelease(v44);
      }

      else
      {
        v54 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          int v92 = *__error();
          v93 = __error();
          v94 = strerror(*v93);
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = a3;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v92;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v94;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_FAULT,  "Unable to format: Parsing spindump text: Unable to open %s: %d (%s)",  buf,  0x1Cu);
        }

        if (qword_1000DFD40) {
          v55 = (FILE *)qword_1000DFD40;
        }
        else {
          v55 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v55);
      }

      v65 = __error();
      goto LABEL_806;
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SPTextualReportParser;
  -[SPTextualReportParser dealloc](&v3, "dealloc");
}

- (BOOL)isHeavy
{
  return self->_isHeavy;
}

- (void)setIsHeavy:(BOOL)a3
{
  self->_isHeavy = a3;
}

- (int)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int)a3
{
  self->_int startIndex = a3;
}

- (int)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(int)a3
{
  self->_int endIndex = a3;
}

- (int)omitFramesBelowSampleCount
{
  return self->_omitFramesBelowSampleCount;
}

- (void)setOmitFramesBelowSampleCount:(int)a3
{
  self->_int omitFramesBelowSampleCount = a3;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
}

@end