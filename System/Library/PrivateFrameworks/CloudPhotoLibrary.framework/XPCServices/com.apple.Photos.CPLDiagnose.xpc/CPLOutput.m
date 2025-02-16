@interface CPLOutput
- (BOOL)isATTY;
- (BOOL)supportsEscapeSequences;
- (BOOL)usesColor;
- (CPLOutput)init;
- (CPLOutput)initWithFileDescriptor:(int)a3;
- (CPLOutput)initWithFileDescriptor:(int)a3 isATTY:(BOOL)a4 supportsEscapeSequences:(BOOL)a5 usesColor:(BOOL)a6;
- (char)printHeader;
- (id)openOutputToPagerWithInterruptionHandler:(id)a3;
- (int)outputFd;
- (int)remainingSpace;
- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)a6 force:(BOOL)a7;
- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4;
- (void)_startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5 force:(BOOL)a6;
- (void)clearScreen;
- (void)closeOutput;
- (void)cursorDown:(unsigned int)a3;
- (void)cursorGotoLineStart;
- (void)cursorLeft:(unsigned int)a3;
- (void)cursorRestore;
- (void)cursorRight:(unsigned int)a3;
- (void)cursorSave;
- (void)cursorToStartOfLine;
- (void)cursorToTopLeft;
- (void)cursorUp:(unsigned int)a3;
- (void)endLine;
- (void)endLineIfNecessary;
- (void)eraseEndOfLine;
- (void)eraseLine;
- (void)eraseScreenDown;
- (void)eraseScreenUp;
- (void)eraseStartOfLine;
- (void)flush;
- (void)forceResetColorsAndAttributes;
- (void)forgetRemainingSpace;
- (void)printError:(id)a3;
- (void)printError:(id)a3 arguments:(char *)a4;
- (void)printFormat:(id)a3;
- (void)printFormat:(id)a3 arguments:(char *)a4;
- (void)printHeaderIfNecessary:(char)a3;
- (void)printJSONData:(id)a3;
- (void)printJSONObject:(id)a3;
- (void)put:(id)a3;
- (void)putBright:(id)a3;
- (void)putBrightF:(id)a3;
- (void)putF:(id)a3;
- (void)putF:(id)a3 arguments:(char *)a4;
- (void)putHighlight:(id)a3;
- (void)putUnderline:(id)a3;
- (void)puts:(const char *)a3;
- (void)puts:(const char *)a3 len:(unint64_t)a4;
- (void)resetColorsAndAttributes;
- (void)setPrintHeader:(char)a3;
- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (void)startNewLine;
@end

@implementation CPLOutput

- (CPLOutput)init
{
  return -[CPLOutput initWithFileDescriptor:](self, "initWithFileDescriptor:", 1LL);
}

- (CPLOutput)initWithFileDescriptor:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = isatty(a3);
  v6 = getenv("TERM");
  if (v5) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = !v7;
  if (v7)
  {
    BOOL v10 = 0LL;
  }

  else
  {
    v9 = v6;
    if (strcasestr(v6, "ansi")) {
      BOOL v10 = 1LL;
    }
    else {
      BOOL v10 = strstr(v9, "color") != 0LL;
    }
  }

  return -[CPLOutput initWithFileDescriptor:isATTY:supportsEscapeSequences:usesColor:]( self,  "initWithFileDescriptor:isATTY:supportsEscapeSequences:usesColor:",  v3,  v5 != 0,  v8,  v10);
}

- (CPLOutput)initWithFileDescriptor:(int)a3 isATTY:(BOOL)a4 supportsEscapeSequences:(BOOL)a5 usesColor:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLOutput;
  result = -[CPLOutput init](&v10, "init", *(void *)&a3, a4, a5, a6);
  if (result)
  {
    result->_fd = a3;
    result->_isATTY = a4;
    result->_supportsEscapeSequences = a5;
    result->_usesColor = a5;
    *(void *)&result->_curFg = 0x900000009LL;
  }

  return result;
}

- (id)openOutputToPagerWithInterruptionHandler:(id)a3
{
  id v4 = a3;
  if (self->_fd != 1
    || !-[CPLOutput isATTY](self, "isATTY")
    || (int v5 = -[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]( objc_alloc(&OBJC_CLASS___CPLPagerOutput),  "initWithInputFromOutput:interruptionHandler:",  self,  v4)) == 0LL)
  {
    int v5 = self;
  }

  return v5;
}

- (void)setPrintHeader:(char)a3
{
  if (!a3)
  {
    BOOL v3 = 0;
    goto LABEL_5;
  }

  if (!self->_printHeader)
  {
    BOOL v3 = 1;
LABEL_5:
    self->_needsHeader = v3;
  }

  self->_printHeader = a3;
}

- (void)printFormat:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  BOOL v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

  -[CPLOutput put:](self, "put:", v7);
  -[CPLOutput endLine](self, "endLine");
}

- (void)printFormat:(id)a3
{
}

- (void)printError:(id)a3
{
}

- (void)printError:(id)a3 arguments:(char *)a4
{
  int v5 = __stderrp;
  id v6 = a3;
  BOOL v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

  uint64_t v8 = v7;
  fprintf(v5, "%s\n", -[NSString UTF8String](v8, "UTF8String"));
}

- (int)outputFd
{
  return self->_fd;
}

- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)a6 force:(BOOL)a7
{
  unsigned int curAttrs = a6;
  int curBg = a5;
  int curFg = a4;
  if (a5 == -1) {
    int curBg = self->_curBg;
  }
  if (a4 == -1) {
    int curFg = self->_curFg;
  }
  if (a6 == -1) {
    unsigned int curAttrs = self->_curAttrs;
  }
  strcpy(a3, "\x1B[");
  if (a7 || curAttrs != self->_curAttrs)
  {
    strcpy(a3 + 2, "0;");
    unint64_t v14 = 4LL;
    for (uint64_t i = 1LL; i != 32; ++i)
    {
      if (((curAttrs >> i) & 1) != 0) {
        v14 += snprintf(&a3[v14], 256 - v14, "%zd;", i);
      }
    }

    self->_unsigned int curAttrs = curAttrs;
    *(void *)&self->_int curFg = 0x900000009LL;
    if (a7) {
      goto LABEL_17;
    }
    int v13 = 9;
  }

  else
  {
    int v13 = self->_curFg;
    unint64_t v14 = 2LL;
  }

  if (curFg == v13) {
    goto LABEL_18;
  }
LABEL_17:
  v14 += snprintf(&a3[v14], 256 - v14, "%d;", curFg + 30);
  self->_int curFg = curFg;
  if (!a7)
  {
LABEL_18:
    if (curBg == self->_curBg) {
      goto LABEL_20;
    }
  }

  v14 += snprintf(&a3[v14], 256 - v14, "%d;", curBg + 40);
  self->_int curBg = curBg;
LABEL_20:
  if (v14 < 3) {
    return 0LL;
  }
  a3[v14 - 1] = 109;
  return v14;
}

- (void)putBright:(id)a3
{
  id v4 = a3;
  -[CPLOutput startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 2LL);
  -[CPLOutput put:](self, "put:", v4);

  -[CPLOutput resetColorsAndAttributes](self, "resetColorsAndAttributes");
}

- (void)putHighlight:(id)a3
{
  id v4 = a3;
  -[CPLOutput startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 4LL, 0xFFFFFFFFLL, 128LL);
  -[CPLOutput put:](self, "put:", v4);

  -[CPLOutput resetColorsAndAttributes](self, "resetColorsAndAttributes");
}

- (void)putUnderline:(id)a3
{
  id v4 = a3;
  -[CPLOutput startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 16LL);
  -[CPLOutput put:](self, "put:", v4);

  -[CPLOutput resetColorsAndAttributes](self, "resetColorsAndAttributes");
}

- (void)_startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5 force:(BOOL)a6
{
  if ((self->_fd & 0x80000000) == 0)
  {
    BOOL v6 = a6;
    uint64_t v7 = *(void *)&a5;
    uint64_t v8 = *(void *)&a4;
    uint64_t v9 = *(void *)&a3;
    if (-[CPLOutput usesColor](self, "usesColor"))
    {
      unint64_t v11 = -[CPLOutput _startInCString:fgColor:bgColor:attr:force:]( self,  "_startInCString:fgColor:bgColor:attr:force:",  __buf,  v9,  v8,  v7,  v6);
      if (v11)
      {
        size_t v12 = v11;
        int fd = self->_fd;
        if (fd != -1)
        {
          p_printHeader = &self->_printHeader;
          if (self->_printHeader)
          {
            if (self->_needsHeader)
            {
              size_t v15 = 1LL;
              while (v15)
              {
                ssize_t v16 = write(fd, p_printHeader, v15);
                p_printHeader += v16;
                v15 -= v16;
                if (v16 <= 0)
                {
                  if (v16 < 0) {
                    -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
                  }
                  break;
                }
              }

              self->_needsHeader = 0;
              int fd = self->_fd;
            }
          }
        }

        v17 = __buf;
        while (v12)
        {
          ssize_t v18 = write(fd, v17, v12);
          v17 += v18;
          v12 -= v18;
          if (v18 <= 0)
          {
            if (v18 < 0) {
              -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
            }
            return;
          }
        }
      }
    }
  }

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
}

- (void)resetColorsAndAttributes
{
}

- (void)forceResetColorsAndAttributes
{
}

- (void)clearScreen
{
  v2 = self;
  uint64_t v3 = v2;
  if ((v2->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](v2, "supportsEscapeSequences"))
  {
    int fd = v3->_fd;
    if (fd != -1)
    {
      p_printHeader = &v3->_printHeader;
      if (v3->_printHeader)
      {
        if (v3->_needsHeader)
        {
          size_t v6 = 1LL;
          while (v6)
          {
            ssize_t v7 = write(fd, p_printHeader, v6);
            p_printHeader += v7;
            v6 -= v7;
            if (v7 <= 0)
            {
              if (v7 < 0) {
                -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
              }
              break;
            }
          }

          v3->_needsHeader = 0;
          int fd = v3->_fd;
        }
      }
    }

    uint64_t v8 = "\x1B[2J";
    size_t v9 = 4LL;
    while (v9)
    {
      ssize_t v10 = write(fd, v8, v9);
      v8 += v10;
      v9 -= v10;
      if (v10 <= 0)
      {
        if (v10 < 0) {
          -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
        }
        break;
      }
    }
  }

  -[CPLOutput cursorToTopLeft](v3, "cursorToTopLeft");
}

- (void)eraseEndOfLine
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1BK";
    size_t v7 = 2LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)eraseStartOfLine
{
  v2 = self;
  uint64_t v3 = v2;
  if ((v2->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](v2, "supportsEscapeSequences"))
  {
    int fd = v3->_fd;
    if (fd != -1)
    {
      p_printHeader = &v3->_printHeader;
      if (v3->_printHeader)
      {
        if (v3->_needsHeader)
        {
          size_t v6 = 1LL;
          while (v6)
          {
            ssize_t v7 = write(fd, p_printHeader, v6);
            p_printHeader += v7;
            v6 -= v7;
            if (v7 <= 0)
            {
              if (v7 < 0) {
                -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
              }
              break;
            }
          }

          v3->_needsHeader = 0;
          int fd = v3->_fd;
        }
      }
    }

    ssize_t v8 = "\x1B[1K";
    size_t v9 = 4LL;
    while (v9)
    {
      ssize_t v10 = write(fd, v8, v9);
      v8 += v10;
      v9 -= v10;
      if (v10 <= 0)
      {
        if (v10 < 0) {
          -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
        }
        break;
      }
    }
  }

  v3->_needsHeader = 1;
}

- (void)eraseLine
{
  v2 = self;
  uint64_t v3 = v2;
  if ((v2->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](v2, "supportsEscapeSequences"))
  {
    int fd = v3->_fd;
    if (fd != -1)
    {
      p_printHeader = &v3->_printHeader;
      if (v3->_printHeader)
      {
        if (v3->_needsHeader)
        {
          size_t v6 = 1LL;
          while (v6)
          {
            ssize_t v7 = write(fd, p_printHeader, v6);
            p_printHeader += v7;
            v6 -= v7;
            if (v7 <= 0)
            {
              if (v7 < 0) {
                -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
              }
              break;
            }
          }

          v3->_needsHeader = 0;
          int fd = v3->_fd;
        }
      }
    }

    ssize_t v8 = "\x1B[2K";
    size_t v9 = 4LL;
    while (v9)
    {
      ssize_t v10 = write(fd, v8, v9);
      v8 += v10;
      v9 -= v10;
      if (v10 <= 0)
      {
        if (v10 < 0) {
          -[CPLOutput _fdIsInvalid](v3, "_fdIsInvalid");
        }
        break;
      }
    }
  }

  v3->_needsHeader = 1;
}

- (void)eraseScreenDown
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1B[J";
    size_t v7 = 3LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)eraseScreenUp
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1B[1J";
    size_t v7 = 4LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)cursorSave
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1B[s";
    size_t v7 = 3LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)cursorRestore
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1B[u";
    size_t v7 = 3LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)cursorToStartOfLine
{
  if (self->_usedTermWidth) {
    -[CPLOutput cursorLeft:](self, "cursorLeft:");
  }
}

- (void)cursorToTopLeft
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    size_t v6 = "\x1B[0;0H";
    size_t v7 = 6LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)cursorUp:(unsigned int)a3
{
  size_t v4 = self;
  ssize_t v5 = v4;
  if ((v4->_fd & 0x80000000) == 0)
  {
    size_t v7 = v4;
    unsigned int v6 = -[CPLOutput supportsEscapeSequences](v4, "supportsEscapeSequences");
    ssize_t v5 = v7;
    if (v6)
    {
      dprintf(v7->_fd, "\x1B[%d%c", a3, 65LL);
      ssize_t v5 = v7;
    }
  }
}

- (void)cursorDown:(unsigned int)a3
{
  size_t v4 = self;
  ssize_t v5 = v4;
  if ((v4->_fd & 0x80000000) == 0)
  {
    size_t v7 = v4;
    unsigned int v6 = -[CPLOutput supportsEscapeSequences](v4, "supportsEscapeSequences");
    ssize_t v5 = v7;
    if (v6)
    {
      dprintf(v7->_fd, "\x1B[%d%c", a3, 66LL);
      ssize_t v5 = v7;
    }
  }
}

- (void)cursorRight:(unsigned int)a3
{
  size_t v4 = self;
  ssize_t v5 = v4;
  if ((v4->_fd & 0x80000000) == 0)
  {
    size_t v7 = v4;
    unsigned int v6 = -[CPLOutput supportsEscapeSequences](v4, "supportsEscapeSequences");
    ssize_t v5 = v7;
    if (v6)
    {
      dprintf(v7->_fd, "\x1B[%d%c", a3, 67LL);
      ssize_t v5 = v7;
    }
  }
}

- (void)cursorLeft:(unsigned int)a3
{
  size_t v4 = self;
  ssize_t v5 = v4;
  if ((v4->_fd & 0x80000000) == 0)
  {
    size_t v7 = v4;
    unsigned int v6 = -[CPLOutput supportsEscapeSequences](v4, "supportsEscapeSequences");
    ssize_t v5 = v7;
    if (v6)
    {
      dprintf(v7->_fd, "\x1B[%d%c", a3, 68LL);
      ssize_t v5 = v7;
    }
  }
}

- (void)cursorGotoLineStart
{
  __buf = self;
  if ((__buf->_fd & 0x80000000) == 0 && -[CPLOutput supportsEscapeSequences](__buf, "supportsEscapeSequences"))
  {
    int fd = __buf->_fd;
    if (fd != -1)
    {
      p_printHeader = &__buf->_printHeader;
      if (__buf->_printHeader)
      {
        if (__buf->_needsHeader)
        {
          size_t v4 = 1LL;
          while (v4)
          {
            ssize_t v5 = write(fd, p_printHeader, v4);
            p_printHeader += v5;
            v4 -= v5;
            if (v5 <= 0)
            {
              if (v5 < 0) {
                -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
              }
              break;
            }
          }

          __buf->_needsHeader = 0;
          int fd = __buf->_fd;
        }
      }
    }

    unsigned int v6 = "\r";
    size_t v7 = 1LL;
    while (v7)
    {
      ssize_t v8 = write(fd, v6, v7);
      v6 += v8;
      v7 -= v8;
      if (v8 <= 0)
      {
        if (v8 < 0) {
          -[CPLOutput _fdIsInvalid](__buf, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)startNewLine
{
  if (!self->_termWidth)
  {
    ioctl(1, 0x40087468uLL, v3);
    self->_termWidth = v4;
  }

  -[CPLOutput cursorGotoLineStart](self, "cursorGotoLineStart");
  self->_usedTermWidth = 0LL;
}

- (void)endLine
{
  self->_usedTermWidth = 0LL;
  if (self->_fd >= 1)
  {
    -[CPLOutput forgetRemainingSpace](self, "forgetRemainingSpace");
    -[CPLOutput puts:len:](self, "puts:len:", "\n", 1LL);
    fsync(self->_fd);
  }

- (void)endLineIfNecessary
{
  if (self->_usedTermWidth || self->_termWidth) {
    -[CPLOutput endLine](self, "endLine");
  }
}

- (void)flush
{
  int fd = self->_fd;
  if (fd >= 1) {
    fsync(fd);
  }
}

- (int)remainingSpace
{
  int v3 = v6;
  self->_termWidth = v6;
  return v3 - LODWORD(self->_usedTermWidth);
}

- (void)forgetRemainingSpace
{
  self->_termWidth = 0LL;
}

- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    p_int printHeader = &self->_printHeader;
    int printHeader = self->_printHeader;
    unint64_t usedTermWidth = self->_usedTermWidth;
    if (self->_termWidth - usedTermWidth >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = self->_termWidth - usedTermWidth;
    }
    self->_unint64_t usedTermWidth = v10 + usedTermWidth;
    if (printHeader && self->_needsHeader)
    {
      size_t v11 = 1LL;
      do
      {
        if (!v11) {
          goto LABEL_12;
        }
        ssize_t v12 = write(fd, p_printHeader, v11);
        p_printHeader += v12;
        v11 -= v12;
      }

      while (v12 > 0);
      if (v12 < 0) {
        -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
      }
LABEL_12:
      self->_needsHeader = 0;
      int fd = self->_fd;
    }

    while (v10)
    {
      ssize_t v13 = write(fd, a3, v10);
      a3 += v13;
      v10 -= v13;
      if (v13 <= 0)
      {
        if (v13 < 0) {
          -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
        }
        return;
      }
    }
  }

- (void)puts:(const char *)a3 len:(unint64_t)a4
{
  if (a4)
  {
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0)
    {
      size_t v6 = a4;
      size_t v7 = a3;
      if (self->_termWidth)
      {
        -[CPLOutput _putsAndCrop:len:](self, "_putsAndCrop:len:");
      }

      else
      {
        p_int printHeader = &self->_printHeader;
        if (self->_printHeader)
        {
          if (a4 == 1 && *a3 == 10)
          {
            if (self->_needsHeader)
            {
              size_t v9 = 1LL;
              while (v9)
              {
                ssize_t v10 = write(fd, p_printHeader, v9);
                p_printHeader += v10;
                v9 -= v10;
                if (v10 <= 0)
                {
                  if (v10 < 0) {
                    -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
                  }
                  break;
                }
              }

              self->_needsHeader = 0;
              int fd = self->_fd;
            }

            write(fd, v7, 1uLL);
            self->_needsHeader = 1;
          }

          else
          {
            ssize_t v12 = strchr(a3, 10);
            if (v12)
            {
              ssize_t v13 = v12;
              do
              {
                int v14 = self->_fd;
                if (v14 != -1 && *p_printHeader && self->_needsHeader)
                {
                  size_t v15 = &self->_printHeader;
                  size_t v16 = 1LL;
                  while (v16)
                  {
                    ssize_t v17 = write(v14, v15, v16);
                    v15 += v17;
                    v16 -= v17;
                    if (v17 <= 0)
                    {
                      if (v17 < 0) {
                        -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
                      }
                      break;
                    }
                  }

                  self->_needsHeader = 0;
                  int v14 = self->_fd;
                }

                size_t v18 = v13 - v7 + 1;
                while (v18)
                {
                  ssize_t v19 = write(v14, v7, v18);
                  v7 += v19;
                  v18 -= v19;
                  if (v19 <= 0)
                  {
                    if (v19 < 0) {
                      -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
                    }
                    break;
                  }
                }

                self->_needsHeader = 1;
                size_t v7 = v13 + 1;
                ssize_t v13 = strchr(v13 + 1, 10);
              }

              while (v13);
            }

            if (*v7)
            {
              int v20 = self->_fd;
              if (v20 != -1 && *p_printHeader && self->_needsHeader)
              {
                size_t v21 = 1LL;
                while (v21)
                {
                  ssize_t v22 = write(v20, p_printHeader, v21);
                  p_printHeader += v22;
                  v21 -= v22;
                  if (v22 <= 0)
                  {
                    if (v22 < 0) {
                      -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
                    }
                    break;
                  }
                }

                self->_needsHeader = 0;
                int v20 = self->_fd;
              }

              size_t v23 = strlen(v7);
              while (v23)
              {
                ssize_t v11 = write(v20, v7, v23);
                v7 += v11;
                v23 -= v11;
                if (v11 <= 0) {
                  goto LABEL_49;
                }
              }
            }
          }
        }

        else
        {
          while (v6)
          {
            ssize_t v11 = write(fd, v7, v6);
            v7 += v11;
            v6 -= v11;
            if (v11 <= 0)
            {
LABEL_49:
              if (v11 < 0) {
                -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
              }
              return;
            }
          }
        }
      }
    }
  }

- (void)puts:(const char *)a3
{
}

- (void)put:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    if (self->_termWidth)
    {
      unsigned __int16 v4 = objc_autoreleasePoolPush();
      ssize_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"\t" withString:@"    "]);

      id v6 = v5;
      -[CPLOutput puts:](self, "puts:", [v6 UTF8String]);
      objc_autoreleasePoolPop(v4);
    }

    else
    {
      id v6 = v6;
      -[CPLOutput puts:](self, "puts:", [v6 UTF8String]);
    }
  }
}

- (void)putBrightF:(id)a3
{
  id v4 = a3;
  -[CPLOutput startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 2LL);
  -[CPLOutput putF:arguments:](self, "putF:arguments:", v4, &v5);

  -[CPLOutput resetColorsAndAttributes](self, "resetColorsAndAttributes");
}

- (void)putF:(id)a3
{
}

- (void)putF:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  size_t v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

  -[CPLOutput put:](self, "put:", v7);
}

- (void)printHeaderIfNecessary:(char)a3
{
  char __buf = a3;
  if (self->_needsHeader)
  {
    int fd = self->_fd;
    if (fd != -1)
    {
      write(fd, &__buf, 1uLL);
      self->_needsHeader = 0;
    }
  }

- (void)printJSONObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_autoreleasePoolPush();
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0)
      {
        ssize_t v11 = @"value";
        ssize_t v12 = v5;
        uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

        uint64_t v5 = (void *)v9;
      }
    }

    ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  0LL));
    if (v10) {
      -[CPLOutput printJSONData:](self, "printJSONData:", v10);
    }

    objc_autoreleasePoolPop(v6);
  }

- (void)printJSONData:(id)a3
{
  id v18 = a3;
  id v4 = (char *)[v18 bytes];
  uint64_t v5 = (char *)[v18 length];
  int fd = self->_fd;
  if (self->_printHeader)
  {
    write(self->_fd, "[\n", 2uLL);
    if (v5)
    {
      while (1)
      {
        uint64_t v7 = (char *)memchr(v4, 10, (size_t)v5);
        write(self->_fd, ".", 1uLL);
        if (!v7) {
          break;
        }
        uint64_t v8 = v7 - v4 + 1;
        int v9 = self->_fd;
        size_t v10 = v8;
        while (v10)
        {
          ssize_t v11 = write(v9, v4, v10);
          v4 += v11;
          v10 -= v11;
          if (v11 <= 0)
          {
            if (v11 < 0) {
              -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
            }
            break;
          }
        }

        id v4 = v7 + 1;
        v5 -= v8;
        if (!v5) {
          goto LABEL_10;
        }
      }

      int v16 = self->_fd;
      while (v5)
      {
        ssize_t v17 = write(v16, v4, (size_t)v5);
        v4 += v17;
        v5 -= v17;
        if (v17 <= 0)
        {
          if (v17 < 0) {
            -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
          }
          break;
        }
      }

      int v12 = self->_fd;
      ssize_t v13 = "\n]\n";
      size_t v14 = 3LL;
    }

    else
    {
LABEL_10:
      int v12 = self->_fd;
      ssize_t v13 = "]\n";
      size_t v14 = 2LL;
    }

    write(v12, v13, v14);
    self->_needsHeader = 1;
  }

  else
  {
    while (v5)
    {
      ssize_t v15 = write(fd, v4, (size_t)v5);
      v4 += v15;
      v5 -= v15;
      if (v15 <= 0)
      {
        if (v15 < 0) {
          -[CPLOutput _fdIsInvalid](self, "_fdIsInvalid");
        }
        break;
      }
    }
  }
}

- (void)closeOutput
{
  int fd = self->_fd;
  if ((fd - 1) >= 2)
  {
    close(fd);
    self->_int fd = -1;
  }

- (BOOL)isATTY
{
  return !self->_printHeader && self->_isATTY;
}

- (BOOL)supportsEscapeSequences
{
  return !self->_printHeader && self->_supportsEscapeSequences;
}

- (BOOL)usesColor
{
  return !self->_printHeader && self->_usesColor;
}

- (char)printHeader
{
  return self->_printHeader;
}

@end