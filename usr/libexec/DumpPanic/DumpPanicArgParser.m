@interface DumpPanicArgParser
+ (id)withArgs:(char *)a3 count:(int)a4;
- (BOOL)force_run;
- (BOOL)help;
- (BOOL)restoreos;
- (DumpPanicArgParser)initWithArgs:(char *)a3 count:(int)a4;
- (NSURL)output_dir;
- (void)setForce_run:(BOOL)a3;
- (void)setHelp:(BOOL)a3;
- (void)setOutput_dir:(id)a3;
- (void)setRestoreos:(BOOL)a3;
- (void)usage;
@end

@implementation DumpPanicArgParser

- (DumpPanicArgParser)initWithArgs:(char *)a3 count:(int)a4
{
  optreset = 1;
  optind = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        int v7 = getopt_long(a4, a3, "ar:chf", (const option *)&off_100035A70, 0LL);
        if (v7 <= 103) {
          break;
        }
        if (v7 == 114)
        {
          -[DumpPanicArgParser setRestoreos:](self, "setRestoreos:", 1LL);
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
          -[DumpPanicArgParser setOutput_dir:](self, "setOutput_dir:", v9);
        }

        else if (v7 == 104)
        {
          -[DumpPanicArgParser setHelp:](self, "setHelp:", 1LL);
        }
      }

      if (v7 != 102) {
        break;
      }
      -[DumpPanicArgParser setForce_run:](self, "setForce_run:", 1LL);
    }
  }

  while (v7 != -1);
  return self;
}

- (void)usage
{
}

- (BOOL)help
{
  return self->_help;
}

- (void)setHelp:(BOOL)a3
{
  self->_help = a3;
}

- (BOOL)restoreos
{
  return self->_restoreos;
}

- (void)setRestoreos:(BOOL)a3
{
  self->_restoreos = a3;
}

- (NSURL)output_dir
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOutput_dir:(id)a3
{
}

- (BOOL)force_run
{
  return self->_force_run;
}

- (void)setForce_run:(BOOL)a3
{
  self->_force_run = a3;
}

- (void).cxx_destruct
{
}

+ (id)withArgs:(char *)a3 count:(int)a4
{
  return  -[DumpPanicArgParser initWithArgs:count:]( objc_alloc(&OBJC_CLASS___DumpPanicArgParser),  "initWithArgs:count:",  a3,  *(void *)&a4);
}

@end