@interface _NSCallStackArray
+ (id)arrayWithFrames:(void *)a3 count:(unint64_t)a4 symbols:(BOOL)a5;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)_descriptionWithBuffer:(char *)a3 size:(int64_t)a4;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation _NSCallStackArray

+ (id)arrayWithFrames:(void *)a3 count:(unint64_t)a4 symbols:(BOOL)a5
{
  uint64_t v8 = objc_opt_new();
  *(void *)(v8 + 24) = 2LL;
  *(void *)(v8 + 8) = a3;
  unint64_t v9 = a4 - 2;
  if (a4 < 2) {
    unint64_t v9 = 0LL;
  }
  *(void *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = 0LL;
  *(_BYTE *)(v8 + 40) = a5;
  return (id)v8;
}

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t cnt = self->_cnt;
  if (cnt <= a3)
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) beyond bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_cnt), 0 reason userInfo];
    objc_exception_throw(v10);
    return -[_NSCallStackArray descriptionWithLocale:indent:](v11, v12, v13, v14);
  }

  else if (self->_wantSyms {
         && ((pcstrs = self->_pcstrs) != 0LL
  }
          || ((pcstrs = backtrace_symbols(&self->_frames[self->_ignore], cnt), self->_pcstrs = pcstrs, self->_wantSyms)
            ? (BOOL v8 = pcstrs == 0LL)
            : (BOOL v8 = 1),
              !v8)))
  {
    return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", pcstrs[a3]);
  }

  else
  {
    return +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *((void *)&self->_frames[self->_ignore] + a3));
  }

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  v5 = +[NSString string](&OBJC_CLASS___NSMutableString, "string", a3, a4);
  if (self->_wantSyms)
  {
    v6 = CFSTR("(\n");
    if (!self->_pcstrs)
    {
      self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt);
      if (!self->_wantSyms) {
        v6 = CFSTR("(");
      }
    }
  }

  else
  {
    v6 = CFSTR("(");
  }

  -[NSString appendString:](v5, "appendString:", v6);
  unint64_t cnt = self->_cnt;
  if (cnt)
  {
    unint64_t v8 = 0LL;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0LL)
      {
        -[NSString appendFormat:](v5, "appendFormat:", @"\t%s\n", pcstrs[v8++]);
      }

      else
      {
        unint64_t v10 = self->_ignore + v8++;
        if (v8 >= cnt) {
          v11 = "";
        }
        else {
          v11 = " ";
        }
        -[NSString appendFormat:](v5, "appendFormat:", @"%p%s", self->_frames[v10], v11);
      }

      unint64_t cnt = self->_cnt;
    }

    while (v8 < cnt);
  }

  -[NSString appendString:](v5, "appendString:", @""));
  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  free(self->_frames);
  pcstrs = self->_pcstrs;
  if (pcstrs) {
    free(pcstrs);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSCallStackArray;
  -[_NSCallStackArray dealloc](&v4, sel_dealloc);
}

- (unint64_t)_descriptionWithBuffer:(char *)a3 size:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a4 <= 0) {
    __break(1u);
  }
  *a3 = 0;
  if (self->_wantSyms
    && (self->_pcstrs || (self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt), self->_wantSyms)))
  {
    v7 = "(\n";
  }

  else
  {
    v7 = "(";
  }

  strlcat(a3, v7, a4);
  unint64_t cnt = self->_cnt;
  if (cnt)
  {
    unint64_t v9 = 0LL;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0LL)
      {
        snprintf(__str, 0x100uLL, "\t%s\n", pcstrs[v9]);
        strlcat(a3, __str, a4);
        ++v9;
      }

      else
      {
        unint64_t v11 = self->_ignore + v9++;
        if (v9 >= cnt) {
          SEL v12 = "";
        }
        else {
          SEL v12 = " ";
        }
        snprintf(__str, 0x100uLL, "%p%s", self->_frames[v11], v12);
        strlcat(a3, __str, a4);
      }

      unint64_t cnt = self->_cnt;
    }

    while (v9 < cnt);
  }

  strlcat(a3, ")", a4);
  return strlen(a3);
}

@end