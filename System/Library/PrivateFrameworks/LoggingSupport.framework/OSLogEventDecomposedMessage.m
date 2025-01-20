@interface OSLogEventDecomposedMessage
- (OSLogEventDecomposedMessage)initWithEventProxy:(id)a3;
- (OSLogEventProxy)proxy;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)literalPrefixAtIndex:(unint64_t)a3;
- (id)placeholderAtIndex:(unint64_t)a3;
- (os_log_fmt_raw_placeholder)_rawPlaceholderForIndex:(unsigned __int16)a3;
- (unint64_t)placeholderCount;
- (unint64_t)sizeOfLong;
- (unint64_t)state;
- (void)_initializePlaceholders;
- (void)_populateFields;
- (void)_unmake;
- (void)dealloc;
@end

@implementation OSLogEventDecomposedMessage

- (void)_unmake
{
  self->_hasPopulatedFields = 0;
}

- (os_log_fmt_raw_placeholder)_rawPlaceholderForIndex:(unsigned __int16)a3
{
  uint64_t v5 = a3;
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount", a3, a4, a5) <= a3) {
    return 0LL;
  }
  else {
    return (os_log_fmt_raw_placeholder *)((char *)self->_rawPlaceholders + 104 * v5);
  }
}

- (void)_initializePlaceholders
{
  if (!self->_messageState)
  {
    if (!self->_rawPlaceholders) {
      self->_rawPlaceholders = (os_log_fmt_raw_placeholder *)calloc(0x60uLL, 0x68uLL);
    }
    fmt = self->_fmt;
    hdr = self->_hdr;
    var2 = hdr->var2;
    unsigned __int16 var1 = hdr->var1;
    unsigned int v18 = (hdr->var0 >> 5) & 3;
    unint64_t v5 = 0LL;
    if (-[OSLogEventProxy _shouldIncludeSensitive](self->_proxy, "_shouldIncludeSensitive")) {
      unsigned int v6 = 3;
    }
    else {
      unsigned int v6 = 1;
    }
    do
    {
      v7 = (char *)&fmt[strcspn(fmt, "%")];
      if (!*v7) {
        return;
      }
      if (v7[1] != 37)
      {
        rawPlaceholders = self->_rawPlaceholders;
        uint64_t v9 = (uint64_t)&rawPlaceholders->var1 + 104 * v5;
        v10 = os_log_fmt_delimit(v7, self->_variant, v9);
        if (v10)
        {
          if ((*(&rawPlaceholders->var1.var1 + 52 * v5) & 1) != 0)
          {
            self->_messageState = 3LL;
            return;
          }

          v11 = v10;
          ++self->_placeholderCount;
          os_log_fmt_read_aster_if_necessary(v9, &var1, &var2);
          unsigned __int16 v13 = var1;
          if (var1)
          {
            v14 = var2;
            unsigned __int16 v13 = --var1;
            var2 += var2[1] + 2;
          }

          else
          {
            v14 = 0LL;
          }

          char data = os_log_fmt_get_data( v9,  v18,  v6,  v14,  v13,  self->_sizeof_long,  (unsigned __int8 **)self->_rawPlaceholders + 13 * v5,  (_WORD *)&self->_rawPlaceholders[1].var0 + 52 * v5 + 1,  v12,  (BOOL *)&self->_rawPlaceholders[1].var1.var1 + 104 * v5,  (uint64_t)self->_pubdata,  self->_pubsize,  (uint64_t)self->_privdata,  self->_privsize);
          v16 = self->_rawPlaceholders;
          *((_BYTE *)&v16[1].var0 + 104 * v5) = data;
          if (v14)
          {
            *((_BYTE *)&v16[1].var0 + 104 * v5 + 1) = *v14 >> 4;
            if ((*v14 & 1) != 0)
            {
              uint64_t v17 = 2LL;
LABEL_22:
              *((void *)&v16[1].var1.var0 + 13 * v5) = v17;
            }

            else if ((*v14 & 2) != 0)
            {
              uint64_t v17 = 1LL;
              goto LABEL_22;
            }
          }

          fmt = &v11[(void)v7];
          ++v5;
          continue;
        }

        if (!v7[1]) {
          return;
        }
      }

      fmt = v7 + 2;
    }

    while (v5 < 0x60);
  }

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  if (self->_messageState || !self->_fmt) {
    return 0LL;
  }
  if (!(-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") | a3)) {
    return (id)[NSString stringWithCString:self->_fmt encoding:4];
  }
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") < a3 || !self->_rawPlaceholders) {
    return 0LL;
  }
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") > a3)
  {
    rawPlaceholders = self->_rawPlaceholders;
    v7 = &rawPlaceholders->var1.var0 + 13 * a3;
    if (a3)
    {
      int64_t v9 = *v7 - v8;
      goto LABEL_13;
    }

    int64_t v9 = *v7 - self->_fmt;
    goto LABEL_17;
  }

  if (!a3)
  {
    int64_t v9 = strlen(self->_fmt);
LABEL_17:
    if (v9 >= 1)
    {
      id v10 = objc_alloc(NSString);
      fmt = self->_fmt;
      return (id)[v10 initWithBytes:fmt length:v9 encoding:4];
    }

    return 0LL;
  }

  int64_t v9 = strlen(v8);
LABEL_13:
  if (v9 < 1) {
    return 0LL;
  }
  id v10 = objc_alloc(NSString);
  fmt = v8;
  return (id)[v10 initWithBytes:fmt length:v9 encoding:4];
}

- (id)placeholderAtIndex:(unint64_t)a3
{
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") > a3 && self->_rawPlaceholders) {
    return  -[OSLogMessagePlaceholder initWithPlaceholderStruct:]( objc_alloc(&OBJC_CLASS___OSLogMessagePlaceholder),  "initWithPlaceholderStruct:",  (char *)&self->_rawPlaceholders->var1 + 104 * a3);
  }
  else {
    return 0LL;
  }
}

- (id)argumentAtIndex:(unint64_t)a3
{
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") <= a3) {
    return 0LL;
  }
  else {
    return  -[OSLogEventMessageArgument initWithProxy:index:]( objc_alloc(&OBJC_CLASS___OSLogEventMessageArgument),  "initWithProxy:index:",  self,  a3);
  }
}

- (void)dealloc
{
  hdr_buffer = self->_hdr_buffer;
  if (hdr_buffer) {
    free(hdr_buffer);
  }
  rawPlaceholders = self->_rawPlaceholders;
  if (rawPlaceholders) {
    free(rawPlaceholders);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OSLogEventDecomposedMessage;
  -[OSLogEventDecomposedMessage dealloc](&v5, sel_dealloc);
}

- (unint64_t)placeholderCount
{
  if (self->_messageState) {
    return 0LL;
  }
  else {
    return self->_placeholderCount;
  }
}

- (void)_populateFields
{
  if (self->_hasPopulatedFields) {
    return;
  }
  self->_hasPopulatedFields = 1;
  proxy = self->_proxy;
  if ((proxy->_efv & 3) == 1)
  {
    _resolve_uuid_slow((uint64_t)self->_proxy);
    proxy = self->_proxy;
  }

  if (!proxy->_eint.var0.activity_create.creator_aid && !proxy->_eint.common.message)
  {
LABEL_33:
    unint64_t v5 = 2LL;
    goto LABEL_9;
  }

  self->_messageState = 0LL;
  unint64_t unique_pid = proxy->_eint.var0.activity_create.unique_pid;
  if (proxy->_eint.type == 768)
  {
    if (unique_pid - 1733 >= 0xFFFFFFFFFFFFF93CLL)
    {
      buffer = proxy->_eint.var0.log_message.buffer;
      uint64_t v7 = buffer[unique_pid - 1];
      if ((_WORD)unique_pid + ~(_WORD)v7 + 2 * (_WORD)v7 != 0xFFFE)
      {
        hdr_buffer = (os_log_fmt_hdr_s *)self->_hdr_buffer;
        if (!hdr_buffer)
        {
          hdr_buffer = (os_log_fmt_hdr_s *)malloc(0x6C4uLL);
          self->_hdr_buffer = hdr_buffer;
          buffer = proxy->_eint.var0.log_message.buffer;
          unint64_t unique_pid = proxy->_eint.var0.activity_create.unique_pid;
          uint64_t v7 = buffer[unique_pid - 1];
        }

        hdr_buffer->var0 = 0;
        hdr_buffer->unsigned __int16 var1 = v7;
        if ((_DWORD)v7)
        {
          uint64_t v9 = -v7;
          id v10 = &buffer[unique_pid + ~v7];
          var2 = hdr_buffer->var2;
          uint64_t v12 = (uint64_t)&buffer[unique_pid - 1];
          while (1)
          {
            char v13 = *(_BYTE *)(v12 + v9);
            uint64_t v14 = v13 & 0x3F;
            v15 = &buffer[v14];
            if (&buffer[v14] > v10) {
              break;
            }
            unsigned __int8 *var2 = 0;
            var2[1] = v14;
            v16 = var2 + 2;
            memcpy(var2 + 2, buffer, v13 & 0x3F);
            var2 = &v16[v14];
            buffer = v15;
            if (__CFADD__(v9++, 1LL)) {
              goto LABEL_21;
            }
          }

          self->_hdr = 0LL;
          goto LABEL_8;
        }

- (unint64_t)state
{
  return self->_messageState;
}

- (OSLogEventDecomposedMessage)initWithEventProxy:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OSLogEventDecomposedMessage;
  v4 = -[OSLogEventDecomposedMessage init](&v7, sel_init);
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_proxy = (OSLogEventProxy *)a3;
    -[OSLogEventDecomposedMessage _populateFields](v4, "_populateFields");
  }

  return v5;
}

- (OSLogEventProxy)proxy
{
  return self->_proxy;
}

- (unint64_t)sizeOfLong
{
  return self->_sizeof_long;
}

@end