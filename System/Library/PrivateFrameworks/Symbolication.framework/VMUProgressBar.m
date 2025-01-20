@interface VMUProgressBar
- (VMUProgressBar)init;
- (void)colorize:(unsigned int)a3;
- (void)itemCompleteWithStatus:(BOOL)a3;
- (void)setTitle:(id)a3 withTotalItems:(unint64_t)a4;
- (void)updateItemName:(id)a3;
@end

@implementation VMUProgressBar

- (void)setTitle:(id)a3 withTotalItems:(unint64_t)a4
{
  id v7 = a3;
  itemName = self->_itemName;
  self->_totalItems = a4;
  self->_itemName = 0LL;

  self->_itemsDone = 0LL;
  self->_successes = 0LL;
  self->_color = 0;
  self->_failures = 0LL;
  v9 = (FILE *)*MEMORY[0x1895F89D0];
  id v10 = +[VMUTerminalColorizer controlCodeResetString](&OBJC_CLASS___VMUTerminalColorizer, "controlCodeResetString");
  fprintf( v9,  "\n%s%s\n",  (const char *)[v10 UTF8String],  -[NSString UTF8String](self->_title, "UTF8String"));
}

- (VMUProgressBar)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMUProgressBar;
  v2 = -[VMUProgressBar init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemCompletionLock = v2->_itemCompletionLock;
    v2->_itemCompletionLock = (NSLock *)v3;
  }

  return v2;
}

- (void)updateItemName:(id)a3
{
}

- (void)itemCompleteWithStatus:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSLock lock](self->_itemCompletionLock, "lock");
  ++self->_itemsDone;
  uint64_t v5 = 6LL;
  if (v3) {
    uint64_t v5 = 5LL;
  }
  ++(&self->super.isa)[v5];
  -[VMUProgressBar _printProgressBar](self, "_printProgressBar");
  -[NSLock unlock](self->_itemCompletionLock, "unlock");
}

- (void)colorize:(unsigned int)a3
{
  self->_color = a3;
  BOOL v3 = (FILE *)*MEMORY[0x1895F89D0];
  id v4 = +[VMUTerminalColorizer startColorCodeString:](&OBJC_CLASS___VMUTerminalColorizer, "startColorCodeString:", 238LL);
  fputs((const char *)[v4 UTF8String], v3);
}

- (void).cxx_destruct
{
}

@end