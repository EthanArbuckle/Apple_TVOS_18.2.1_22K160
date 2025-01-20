@interface StructuredDataReport
- (BOOL)isActionable;
- (StructuredDataReport)initWithType:(int)a3 withFile:(id)a4;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)generateCustomLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
@end

@implementation StructuredDataReport

- (StructuredDataReport)initWithType:(int)a3 withFile:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___StructuredDataReport;
  v6 = -[OSAReport init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_log_type = a3;
    v6->_raw_logfile = (NSString *)a4;
    *(CFAbsoluteTime *)((char *)&v7->super.super.isa + (int)*MEMORY[0x189611B30]) = CFAbsoluteTimeGetCurrent();
    [*(id *)((char *)&v7->super.super.isa + (int)*MEMORY[0x189611B38]) setObject:@"ips.synced" forKeyedSubscript:*MEMORY[0x189611C10]];
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StructuredDataReport;
  -[StructuredDataReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_log_type);
}

- (BOOL)isActionable
{
  return GetNameForLogType(self->_log_type) != 0LL;
}

- (id)appleCareDetails
{
  return 0LL;
}

- (id)reportNamePrefix
{
  return (id)GetNameForLogType(self->_log_type);
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
}

- (void)generateCustomLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v6 = (void *)NSString;
  uint64_t v7 = OSADateFormat();
  uint64_t v8 = [(id)objc_msgSend( v6 stringWithFormat:@"Date:%@\nIncident ID:%@\n%@\n", v7, -[OSAReport incidentID](self, "incidentID"), GetDeviceConfig()), "dataUsingEncoding:allowLossyConversion:", 4, 1];
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v8);
  objc_super v9 = fopen(-[NSString fileSystemRepresentation](self->_raw_logfile, "fileSystemRepresentation"), "r");
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = [MEMORY[0x189603FB8] dataWithLength:0x10000];
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        size_t v13 = fread((void *)[v12 mutableBytes], 1uLL, 0x10000uLL, v10);
        int v14 = ferror(v10);
        if (!v13) {
          break;
        }
        if (v14) {
          break;
        }
        [v12 setLength:v13];
        (*((void (**)(id, void *))a4 + 2))(a4, v12);
      }

      while (!feof(v10));
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    raw_logfile = self->_raw_logfile;
    v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)buf = 138412546;
    v19 = raw_logfile;
    __int16 v20 = 2080;
    v21 = v17;
    _os_log_impl(&dword_186224000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unable to open '%@': %s", buf, 0x16u);
  }

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke;
  v6[3] = &unk_189E35AA8;
  v6[4] = a4;
  v6[5] = &v7;
  -[StructuredDataReport generateCustomLogAtLevel:withBlock:](self, "generateCustomLogAtLevel:withBlock:", a3, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke(uint64_t result, void *a2)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = result;
    result = [a2 length];
    if (result)
    {
      result = (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16LL))();
      *(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = result;
    }
  }

  return result;
}

@end