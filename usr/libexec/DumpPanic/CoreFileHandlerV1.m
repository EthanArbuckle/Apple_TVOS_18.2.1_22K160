@interface CoreFileHandlerV1
- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5;
- (CoreFileHandlerV1)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5;
- (const)getCoreDumpNameWithIndex:(unint64_t)a3;
- (id)getCorefileZeroRanges;
- (unint64_t)getNumCoreDumps;
- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6;
@end

@implementation CoreFileHandlerV1

- (CoreFileHandlerV1)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5
{
  v5 = -[CoreFileHandler initWithCoreFilePath::::::]( self,  "initWithCoreFilePath::::::",  a3,  a4,  a5,  0x63614D20646152LL,  &self->_corefileHeader,  544LL);
  if (v5)
  {
    v6 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t num_files = v5->_corefileHeader.num_files;
      int v9 = 134217984;
      uint64_t v10 = num_files;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "opened corefile, header indicates %llu files present",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v5;
}

- (id)getCorefileZeroRanges
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  uint64_t num_files = self->_corefileHeader.num_files;
  if (num_files)
  {
    uint64_t v5 = *(&self->_corefileHeader.log_offset + 4 * num_files) + *(&self->_corefileHeader.signature + 4 * num_files);
  }

  else
  {
    uint64_t log_offset = self->_corefileHeader.log_offset;
    if (log_offset)
    {
      uint64_t log_length = self->_corefileHeader.log_length;
      uint64_t v8 = log_length + log_offset;
      if (log_length) {
        uint64_t v5 = v8;
      }
      else {
        uint64_t v5 = 544LL;
      }
    }

    else
    {
      uint64_t v5 = 544LL;
    }
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v9, v10, 0LL));
  [v3 addObject:v11];

  return v3;
}

- (unint64_t)getNumCoreDumps
{
  return self->_corefileHeader.num_files;
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  if (self->_corefileHeader.num_files > a3) {
    return self->_corefileHeader.files[a3].core_name;
  }
  uint64_t v4 = _os_assert_log(0LL, a2);
  result = (const char *)_os_crash(v4);
  __break(1u);
  return result;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  if (self->_corefileHeader.num_files <= a3)
  {
    uint64_t v7 = _os_assert_log(0LL, a2);
    _os_crash(v7);
    __break(1u);
    goto LABEL_7;
  }

  if (!a4)
  {
LABEL_7:
    uint64_t v8 = _os_assert_log(0LL, a2);
    _os_crash(v8);
    __break(1u);
    goto LABEL_8;
  }

  if (!a5)
  {
LABEL_8:
    uint64_t v9 = _os_assert_log(0LL, a2);
    _os_crash(v9);
    __break(1u);
    goto LABEL_9;
  }

  if (a6)
  {
    v6 = (char *)&self->_corefileHeader + 32 * a3;
    *a4 = *((void *)v6 + 4);
    *a5 = *((void *)v6 + 5);
    *a6 = 1;
    return;
  }

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  if (!a3)
  {
    uint64_t v7 = _os_assert_log(0LL, a2);
    _os_crash(v7);
    __break(1u);
    goto LABEL_8;
  }

  if (!a4)
  {
LABEL_8:
    uint64_t v8 = _os_assert_log(0LL, a2);
    _os_crash(v8);
    __break(1u);
    goto LABEL_9;
  }

  if (!a5)
  {
LABEL_9:
    uint64_t v9 = _os_assert_log(0LL, a2);
    BOOL result = _os_crash(v9);
    __break(1u);
    return result;
  }

  *a4 = self->_corefileHeader.log_length;
  uint64_t log_length = self->_corefileHeader.log_length;
  if (log_length)
  {
    *a3 = self->_corefileHeader.log_offset;
    *a5 = 0;
  }

  return log_length != 0;
}

@end