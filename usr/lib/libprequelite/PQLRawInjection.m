@interface PQLRawInjection
+ (id)rawInjection:(const char *)a3 length:(unint64_t)a4;
+ (void)initialize;
- (NSString)description;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation PQLRawInjection

+ (void)initialize
{
  v2 = -[PQLRawInjection initWithUTF8String:length:]( objc_alloc(&OBJC_CLASS___PQLRawInjection),  "initWithUTF8String:length:",  "",  0LL);
  v3 = (void *)gPQLEmpty;
  gPQLEmpty = (uint64_t)v2;

  v4 = -[PQLRawInjection initWithUTF8String:length:]( objc_alloc(&OBJC_CLASS___PQLRawInjection),  "initWithUTF8String:length:",  "0",  1LL);
  v5 = (void *)gPQLFalse;
  gPQLFalse = (uint64_t)v4;

  v6 = -[PQLRawInjection initWithUTF8String:length:]( objc_alloc(&OBJC_CLASS___PQLRawInjection),  "initWithUTF8String:length:",  "1",  1LL);
  v7 = (void *)gPQLTrue;
  gPQLTrue = (uint64_t)v6;

  v8 = -[PQLRawInjection initWithUTF8String:length:]( objc_alloc(&OBJC_CLASS___PQLRawInjection),  "initWithUTF8String:length:",  "NULL",  4LL);
  v9 = (void *)gPQLNULL;
  gPQLNULL = (uint64_t)v8;
}

+ (id)rawInjection:(const char *)a3 length:(unint64_t)a4
{
  if (a4 == 1)
  {
    int v6 = *(unsigned __int8 *)a3;
    if (v6 == 49)
    {
      v5 = (void *)gPQLTrue;
    }

    else
    {
      if (v6 != 48) {
        goto LABEL_9;
      }
      v5 = (void *)gPQLFalse;
    }

- (NSString)description
{
  return (NSString *)objc_msgSend( MEMORY[0x189607940], "stringWithFormat:", @"<PQLRaw %s>", -[PQLNameInjectionBase bytes](self, "bytes"));
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

@end