@interface CFICULoggingEnabled
@end

@implementation CFICULoggingEnabled

const char *_____CFICULoggingEnabled_block_invoke()
{
  result = (const char *)__CFProcessIsRestricted();
  if (!(_DWORD)result)
  {
    result = getenv("CFICULogging");
    if (result)
    {
      v1 = result;
      int v2 = strncasecmp(result, "-", 1uLL);
      v3 = (FILE **)MEMORY[0x1895F89E0];
      if (v2) {
        v4 = fopen(v1, "w");
      }
      else {
        v4 = (FILE *)*MEMORY[0x1895F89E0];
      }
      ___CFICULoggingFD = (uint64_t)v4;
      v5 = (FILE *)*MEMORY[0x1895F89D0];
      if (v4)
      {
        if (v4 == *v3) {
          v6 = "stdout";
        }
        else {
          v6 = v1;
        }
        fprintf(v5, "CFICULogging: Logging to %s.\n", v6);
        ___CFICULoggingEnabled_loggingEnabled = 1;
        v7 = getenv("CFICULogging");
        ___CFICULogWithArguments(0, @"// cc %s -o test_program -licucore", v7);
        ___CFICULogWithArguments(0, &stru_1899EF170);
        ___CFICULogWithArguments(0, @"#include <stdio.h>");
        ___CFICULogWithArguments(0, @"#include <math.h>");
        ___CFICULogWithArguments(0, @"#include <float.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ustring.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ucal.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/udatpg.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/udat.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/unum.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ucurr.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ustdio.h>");
        ___CFICULogWithArguments(0, &stru_1899EF170);
        ___CFICULogWithArguments(0, &stru_1899EF170);
        ___CFICULogWithArguments(0, @"int main(int argc, char *argv[]) {");
        ___CFICULogWithArguments(1, @"int TEMP_BUFFER_SIZE = 500;");
        ___CFICULogWithArguments(1, &stru_1899EF170);
        return (const char *)atexit(___CFICUEmitPostamble);
      }

      else
      {
        return (const char *)fprintf(v5, "CFICULogging: error: Failed to open %s.\n", v1);
      }
    }
  }

  return result;
}

@end