@interface CULogHandle
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logFlags:(unsigned int)a5;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5 logFlags:(unsigned int)a6;
- (NSString)label;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)ulog:(int)a3 message:(id)a4;
- (void)ulogf:(int)a3 format:(id)a4;
- (void)ulogv:(int)a3 format:(id)a4 args:(char *)a5;
@end

@implementation CULogHandle

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5 logFlags:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CULogHandle;
  v12 = -[CULogHandle init](&v19, sel_init);
  if (v12)
  {
    v13 = (const char *)[v10 UTF8String];
    id v14 = v11;
    v15 = (LogCategory *)LogCategoryCreateEx(v13, (const char *)[v14 UTF8String], a5, a6, 0, &v18);
    v12->_ucatPtr = v15;
    if (!v15) {
      FatalErrorF("CULogHandle LogCategoryCreateEx failed: %#m");
    }
    objc_storeStrong((id *)&v12->_categoryName, v14);
    v16 = v12;
  }

  return v12;
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:]( self,  "initWithSubsystem:category:logLevel:logFlags:",  a3,  a4,  *(void *)&a5,  512LL);
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logFlags:(unsigned int)a5
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:]( self,  "initWithSubsystem:category:logLevel:logFlags:",  a3,  a4,  10LL,  *(void *)&a5);
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:]( self,  "initWithSubsystem:category:logLevel:logFlags:",  a3,  a4,  10LL,  512LL);
}

- (void)dealloc
{
  ucatPtr = self->_ucatPtr;
  self->_ucatPtr = 0LL;
  LogCategory_Remove(ucatPtr);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CULogHandle;
  -[CULogHandle dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  -[NSString UTF8String](self->_categoryName, "UTF8String");
  id v6 = v5;
  [v6 UTF8String];

  LogCategoryReplaceF((uint64_t *)&self->_ucatPtr);
}

- (void)ulog:(int)a3 message:(id)a4
{
  id v6 = a4;
  v7 = v6;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    id v15 = v6;
    if (ucatPtr->var0 == -1)
    {
      BOOL v14 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
      v7 = v15;
      if (!v14) {
        goto LABEL_5;
      }
      ucatPtr = self->_ucatPtr;
    }

    char v9 = [v7 UTF8String];
    LogPrintF((uint64_t)ucatPtr, (uint64_t)", a3, (uint64_t)"%s"", v10, v11, v12, v13, v9);
    v7 = v15;
  }

- (void)ulogf:(int)a3 format:(id)a4
{
  id v6 = a4;
  ucatPtr = self->_ucatPtr;
}

- (void)ulogv:(int)a3 format:(id)a4 args:(char *)a5
{
  id v8 = a4;
  char v9 = v8;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    id v12 = v8;
    if (ucatPtr->var0 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
      char v9 = v12;
      if (!v11) {
        goto LABEL_5;
      }
      ucatPtr = self->_ucatPtr;
    }

    LogPrintV((uint64_t)ucatPtr, (uint64_t)", a3, [v9 UTF8String], a5);
    char v9 = v12;
  }

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end