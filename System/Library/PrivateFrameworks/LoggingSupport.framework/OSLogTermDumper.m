@interface OSLogTermDumper
- (BOOL)isBold;
- (BOOL)isFancy;
- (BOOL)isOblique;
- (BOOL)isUnderlined;
- (OSLogTermDumper)init;
- (OSLogTermDumper)initWithFd:(int)a3 colorMode:(unsigned __int8)a4;
- (unsigned)bgColor;
- (unsigned)colorMode;
- (unsigned)fgColor;
- (unsigned)format:(const char *)a3;
- (unsigned)style;
- (unsigned)vformat:(const char *)a3 args:(char *)a4;
- (void)_flushAttrs;
- (void)_resetAttrsForNewline;
- (void)beginEditing;
- (void)close;
- (void)dealloc;
- (void)endEditing;
- (void)flush:(BOOL)a3;
- (void)hexdump:(const void *)a3 length:(unint64_t)a4;
- (void)pad:(int)a3 count:(unint64_t)a4;
- (void)putUUID:(unsigned __int8)a3[16];
- (void)putc:(int)a3;
- (void)puts:(const char *)a3;
- (void)resetStyle;
- (void)setBgColor:(unsigned __int8)a3;
- (void)setBold:(BOOL)a3;
- (void)setFgColor:(unsigned __int8)a3;
- (void)setOblique:(BOOL)a3;
- (void)setStyle:(unsigned __int16)a3;
- (void)setUnderline:(BOOL)a3;
- (void)startPager;
- (void)write:(const void *)a3 size:(unint64_t)a4;
- (void)writeln;
@end

@implementation OSLogTermDumper

- (BOOL)isBold
{
  return (self->_cur_attrs >> 5) & 1;
}

- (BOOL)isOblique
{
  return (self->_cur_attrs >> 6) & 1;
}

- (BOOL)isUnderlined
{
  return (self->_cur_attrs >> 7) & 1;
}

- (unsigned)bgColor
{
  return self->_cur_attrs & 0x1F;
}

- (unsigned)fgColor
{
  return HIBYTE(self->_cur_attrs) & 0x1F;
}

- (void)setBold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  self->_cur_attrs = self->_cur_attrs & 0xFFDF | v3;
}

- (void)setOblique:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  self->_cur_attrs = self->_cur_attrs & 0xFFBF | v3;
}

- (void)setUnderline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  self->_cur_attrs = self->_cur_attrs & 0xFF7F | v3;
}

- (void)setBgColor:(unsigned __int8)a3
{
  self->_cur_attrs = self->_cur_attrs & 0xFFE0 | a3;
}

- (void)setFgColor:(unsigned __int8)a3
{
  self->_cur_attrs = self->_cur_attrs & 0xE0FF | (a3 << 8);
}

- (void)resetStyle
{
  self->_cur_attrs = 4112;
}

- (OSLogTermDumper)init
{
  return -[OSLogTermDumper initWithFd:colorMode:](self, "initWithFd:colorMode:", 1LL, 0LL);
}

- (OSLogTermDumper)initWithFd:(int)a3 colorMode:(unsigned __int8)a4
{
  int v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OSLogTermDumper;
  v6 = -[OSLogTermDumper init](&v15, sel_init);
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_ob.var0.ob_b = (char *)v6->_ob_slop;
  *(void *)&v6->_ob.ob_len = 0x100000000LL;
  v6->_ob.ob_flags = 0;
  v6->_ob.ob_binary = 0;
  v6->_ob.ob_maxsize = 0x100000;
  v6->_fd = a3;
  v6->_last_attrs = 4112;
  v6->_cur_attrs = 4112;
  v6->_colorMode = v4;
  v8 = getenv("LOG_USE_ESCAPECNTRLCHARS");
  BOOL v9 = !v8 || strcmp(v8, "0");
  v7->_vis = v9;
  v10 = getenv("TERM");
  switch(v4)
  {
    case 0:
      v11 = v10;
      int v12 = isatty(a3);
      if (!v11 || !v12 || !strcmp(v11, "dummy")) {
        return v7;
      }
      if (!strcasestr(v11, "ansi"))
      {
        BOOL v13 = strcasestr(v11, "color") != 0LL;
        goto LABEL_15;
      }

- (void)close
{
  if ((self->_ob.ob_flags & 1) != 0)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928LL;
    self->_ob.ob_flags = 0;
    free(ob_b);
  }

  self->_ob.var0.ob_b = (char *)self->_ob_slop;
  *(void *)&self->_ob.ob_len = 0x100000000LL;
  self->_ob.ob_maxsize = 0;
  self->_ob.ob_flags = 0;
  self->_ob.ob_binary = 0;
}

- (void)dealloc
{
  if ((self->_ob.ob_flags & 1) != 0)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928LL;
    self->_ob.ob_flags = 0;
    free(ob_b);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSLogTermDumper;
  -[OSLogTermDumper dealloc](&v4, sel_dealloc);
}

- (void)startPager
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!self->_fancy) {
    return;
  }
  ioctl(self->_fd, 0x40087468uLL, v12);
  if (!getenv("LESS")) {
    putenv("LESS=FnRSX");
  }
  if (!getenv("LESSCHARSET")) {
    putenv("LESSCHARSET=utf-8");
  }
  if (pipe(v13) < 0) {
    return;
  }
  pid_t v2 = fork();
  if (v2 < 0) {
    return;
  }
  pid_t v3 = v2;
  if (v2)
  {
    dup2(v13[1], 1);
    if (close(v13[1]) == -1)
    {
      int v4 = *__error();
      uint64_t v5 = *__error();
      if (v4 == 9)
      {
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v5;
        __break(1u);
LABEL_25:
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v5;
        __break(1u);
LABEL_26:
        perror("execvp");
        exit(1);
      }

      _os_assumes_log();
    }

    if (close(v13[0]) != -1)
    {
LABEL_11:
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __29__OSLogTermDumper_startPager__block_invoke;
      v10[3] = &__block_descriptor_36_e5_v8__0l;
      pid_t v11 = v3;
      atexit_b(v10);
      return;
    }

    int v6 = *__error();
    uint64_t v5 = *__error();
    if (v6 != 9)
    {
      _os_assumes_log();
      goto LABEL_11;
    }

    goto LABEL_25;
  }

  dup2(v13[0], 0);
  if (close(v13[0]) == -1)
  {
    int v7 = *__error();
    uint64_t v8 = *__error();
    if (v7 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = v8;
      __break(1u);
      goto LABEL_28;
    }

    _os_assumes_log();
  }

  if (close(v13[1]) != -1) {
    goto LABEL_14;
  }
  int v9 = *__error();
  uint64_t v8 = *__error();
  if (v9 == 9)
  {
LABEL_28:
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = v8;
    __break(1u);
    return;
  }

  _os_assumes_log();
LABEL_14:
  if (execlp("less", "less", "-", 0LL) < 0) {
    goto LABEL_26;
  }
}

- (void)_flushAttrs
{
  int cur_attrs = self->_cur_attrs;
  __int16 v9 = cur_attrs ^ self->_last_attrs;
  if (v9)
  {
    p_ob = &self->_ob;
    unsigned __int16 ob_flags = self->_ob.ob_flags;
    if (cur_attrs == 4112)
    {
      if ((ob_flags & 2) == 0)
      {
        uint64_t ob_len = self->_ob.ob_len;
        if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 3)
        {
          os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[0m", 4uLL);
        }

        else
        {
          *(_DWORD *)&self->_ob.var0.ob_b[ob_len] = 1831885595;
          unsigned int v14 = self->_ob.ob_len + 4;
          self->_ob.uint64_t ob_len = v14;
          if (!self->_ob.ob_binary) {
            p_ob->var0.ob_b[v14] = 0;
          }
        }
      }

- (void)_resetAttrsForNewline
{
  if (self->_last_attrs)
  {
    if ((self->_cur_attrs & 0x1F) != 0x10 && (self->_ob.ob_flags & 2) == 0)
    {
      p_ob = &self->_ob;
      uint64_t ob_len = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 2)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, "\x1B[K", 3uLL);
      }

      else
      {
        uint64_t v5 = &self->_ob.var0.ob_b[ob_len];
        v5[2] = 75;
        *(_WORD *)uint64_t v5 = 23323;
        unsigned int v6 = self->_ob.ob_len + 3;
        self->_ob.uint64_t ob_len = v6;
        if (!self->_ob.ob_binary) {
          p_ob->var0.ob_b[v6] = 0;
        }
      }
    }

    unsigned __int16 cur_attrs = self->_cur_attrs;
    self->_unsigned __int16 cur_attrs = 4112;
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
    self->_unsigned __int16 cur_attrs = cur_attrs;
  }

- (void)beginEditing
{
  if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
  }
}

- (void)endEditing
{
  if (self->_ob.ob_len >= 0x2000) {
    -[OSLogTermDumper flush:](self, "flush:", 0LL);
  }
}

- (void)flush:(BOOL)a3
{
  if (a3 && self->_fancy && self->_last_attrs != self->_cur_attrs) {
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
  }
  _os_trace_write();
  self->_ob.uint64_t ob_len = 0;
  if (!self->_ob.ob_binary) {
    *self->_ob.var0.ob_b = 0;
  }
}

- (void)write:(const void *)a3 size:(unint64_t)a4
{
  size_t v4 = a4;
  uint64_t v5 = (void *)a3;
  if (self->_fancy)
  {
    if (a4)
    {
      p_ob = &self->_ob;
      do
      {
        uint64_t v8 = (char *)memchr(v5, 10, v4);
        __int16 v9 = v8;
        int64_t v10 = v8 - (_BYTE *)v5;
        if (v8) {
          unint64_t v11 = v8 - (_BYTE *)v5;
        }
        else {
          unint64_t v11 = v4;
        }
        if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
          -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
        }
        if (self->_vis)
        {
          os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)v5, v11);
        }

        else if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t ob_len = self->_ob.ob_len;
          if (v11 > (self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1))
          {
            os_trace_blob_add_slow((uint64_t)&self->_ob, v5, v11);
          }

          else
          {
            memcpy(&self->_ob.var0.ob_b[ob_len], v5, v11);
            unsigned int v13 = self->_ob.ob_len + v11;
            self->_ob.uint64_t ob_len = v13;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v13] = 0;
            }
          }
        }

        size_t v14 = v4;
        if (v9)
        {
          if (self->_fancy && self->_last_attrs) {
            -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
          }
          char v15 = *v9;
          char __src = *v9;
          if ((self->_ob.ob_flags & 2) == 0)
          {
            uint64_t v16 = self->_ob.ob_len;
            if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)v16)
            {
              os_trace_blob_add_slow((uint64_t)&self->_ob, &__src, 1uLL);
            }

            else
            {
              self->_ob.var0.ob_b[v16] = v15;
              unsigned int v17 = self->_ob.ob_len + 1;
              self->_ob.uint64_t ob_len = v17;
              if (!self->_ob.ob_binary) {
                p_ob->var0.ob_b[v17] = 0;
              }
            }
          }

          uint64_t v5 = v9 + 1;
          size_t v14 = v10 + 1;
        }

        if (self->_ob.ob_len >= 0x2000) {
          -[OSLogTermDumper flush:](self, "flush:", 0LL);
        }
        v4 -= v14;
      }

      while (v4);
    }
  }

  else
  {
    uint64_t v18 = &self->_ob;
    if (self->_vis)
    {
      os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)a3, a4);
    }

    else if ((self->_ob.ob_flags & 2) == 0)
    {
      uint64_t v19 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v19 - 1) < a4)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, (void *)a3, a4);
      }

      else
      {
        memcpy(&self->_ob.var0.ob_b[v19], a3, a4);
        unsigned int v20 = self->_ob.ob_len + v4;
        self->_ob.uint64_t ob_len = v20;
        if (!self->_ob.ob_binary) {
          v18->var0.ob_b[v20] = 0;
        }
      }
    }

    if (self->_ob.ob_len >= 0x2000) {
      -[OSLogTermDumper flush:](self, "flush:", 0LL);
    }
  }

- (void)putc:(int)a3
{
  if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
  }
  if (a3 == 10 && self->_fancy && self->_last_attrs) {
    -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
  }
  char __src = a3;
  if ((self->_ob.ob_flags & 2) == 0)
  {
    p_ob = &self->_ob;
    uint64_t ob_len = self->_ob.ob_len;
    if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)ob_len)
    {
      os_trace_blob_add_slow((uint64_t)p_ob, &__src, 1uLL);
    }

    else
    {
      self->_ob.var0.ob_b[ob_len] = a3;
      unsigned int v7 = self->_ob.ob_len + 1;
      self->_ob.uint64_t ob_len = v7;
      if (!self->_ob.ob_binary) {
        p_ob->var0.ob_b[v7] = 0;
      }
    }
  }

  if (self->_ob.ob_len >= 0x2000) {
    -[OSLogTermDumper flush:](self, "flush:", 0LL);
  }
}

- (unsigned)vformat:(const char *)a3 args:(char *)a4
{
  uint64_t v8 = 0LL;
  unsigned int v5 = vasprintf(&v8, a3, a4);
  if (!v8) {
    return 0;
  }
  unsigned int v6 = v5;
  -[OSLogTermDumper write:size:](self, "write:size:", v8, v5);
  free(v8);
  return v6;
}

- (void)hexdump:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    uint64_t v7 = 0LL;
    p_ob = &self->_ob;
    do
    {
      uint64_t v8 = v7 & 0xF;
      if ((v7 & 0xF) == 0)
      {
        __sprintf_chk(__src, 0, 0x4AuLL, "%08x:", v7);
        *(void *)&__int128 v9 = 0x2020202020202020LL;
        *((void *)&v9 + 1) = 0x2020202020202020LL;
        *(_OWORD *)&__src[9] = v9;
        *(_OWORD *)&__src[25] = v9;
        *(_OWORD *)&__src[41] = v9;
        *(_OWORD *)&__src[57] = v9;
        __src[73] = 32;
      }

      int v10 = *((char *)a3 + v7);
      unint64_t v11 = &__src[3 * v8 + 10];
      _BYTE *v11 = a0123456789abcd[*((_BYTE *)a3 + v7) >> 4];
      v11[1] = a0123456789abcd[v10 & 0xF];
      __src[v8 + 58] = v10;
      if (v8 == 15)
      {
        if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
          -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
        }
        if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t ob_len = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 0x49)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
          }

          else
          {
            unsigned int v13 = &self->_ob.var0.ob_b[ob_len];
            *(_OWORD *)unsigned int v13 = *(_OWORD *)__src;
            __int128 v14 = *(_OWORD *)&__src[16];
            __int128 v15 = *(_OWORD *)&__src[32];
            __int128 v16 = *(_OWORD *)&__src[48];
            *(_OWORD *)(v13 + 58) = *(_OWORD *)&__src[58];
            *((_OWORD *)v13 + 2) = v15;
            *((_OWORD *)v13 + 3) = v16;
            *((_OWORD *)v13 + 1) = v14;
            unsigned int v17 = self->_ob.ob_len + 74;
            self->_ob.uint64_t ob_len = v17;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v17] = 0;
            }
          }
        }

        if (self->_fancy && self->_last_attrs) {
          -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
        }
        char v27 = 10;
        if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t v18 = self->_ob.ob_len;
          if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)v18)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, &v27, 1uLL);
          }

          else
          {
            self->_ob.var0.ob_b[v18] = 10;
            unsigned int v19 = self->_ob.ob_len + 1;
            self->_ob.uint64_t ob_len = v19;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v19] = 0;
            }
          }
        }
      }

      if (self->_ob.ob_len >= 0x2000) {
        -[OSLogTermDumper flush:](self, "flush:", 0LL);
      }
      ++v7;
    }

    while (a4 != v7);
    if ((a4 & 0xF) != 0 && (self->_ob.ob_flags & 2) == 0)
    {
      uint64_t v20 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v20 - 1) <= 0x49)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
      }

      else
      {
        uint64_t v21 = &self->_ob.var0.ob_b[v20];
        *(_OWORD *)uint64_t v21 = *(_OWORD *)__src;
        __int128 v22 = *(_OWORD *)&__src[16];
        __int128 v23 = *(_OWORD *)&__src[32];
        __int128 v24 = *(_OWORD *)&__src[48];
        *(_OWORD *)(v21 + 58) = *(_OWORD *)&__src[58];
        *((_OWORD *)v21 + 2) = v23;
        *((_OWORD *)v21 + 3) = v24;
        *((_OWORD *)v21 + 1) = v22;
        unsigned int v25 = self->_ob.ob_len + 74;
        self->_ob.uint64_t ob_len = v25;
        if (!self->_ob.ob_binary) {
          p_ob->var0.ob_b[v25] = 0;
        }
      }
    }
  }

  if (self->_ob.ob_len >= 0x2000) {
    -[OSLogTermDumper flush:](self, "flush:", 0LL);
  }
}

- (void)writeln
{
}

- (void)pad:(int)a3 count:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1895F89C0];
  unsigned int v6 = (char *)v7 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  memset(v6, a3, a4);
  -[OSLogTermDumper write:size:](self, "write:size:", v6, a4);
}

- (unsigned)format:(const char *)a3
{
  return -[OSLogTermDumper vformat:args:](self, "vformat:args:", a3, &v4);
}

- (void)puts:(const char *)a3
{
}

- (void)putUUID:(unsigned __int8)a3[16]
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uuid_unparse_upper(a3, out);
  -[OSLogTermDumper write:size:](self, "write:size:", out, 36LL);
}

- (unsigned)colorMode
{
  return self->_colorMode;
}

- (BOOL)isFancy
{
  return self->_fancy;
}

- (unsigned)style
{
  return self->_cur_attrs;
}

- (void)setStyle:(unsigned __int16)a3
{
  self->_unsigned __int16 cur_attrs = a3;
}

void __29__OSLogTermDumper_startPager__block_invoke(uint64_t a1)
{
  if (close(1) == -1)
  {
    int v2 = *__error();
    uint64_t v3 = *__error();
    if (v2 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = v3;
      __break(1u);
      goto LABEL_11;
    }

    _os_assumes_log();
  }

  if (close(2) != -1) {
    goto LABEL_3;
  }
  int v4 = *__error();
  uint64_t v3 = *__error();
  if (v4 == 9)
  {
LABEL_11:
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = v3;
    __break(1u);
    return;
  }

  _os_assumes_log();
LABEL_3:
  if (waitpid(*(_DWORD *)(a1 + 32), &v5, 0) < 0) {
    perror("waitpid");
  }
}

@end