@interface OSLogEventMessageArgument
- (NSObject)objectRepresentation;
- (OSLogEventMessageArgument)initWithProxy:(id)a3 index:(unint64_t)a4;
- (const)rawBytes;
- (double)doubleValue;
- (double)longDoubleValue;
- (int64_t)int64Value;
- (unint64_t)availability;
- (unint64_t)category;
- (unint64_t)privacy;
- (unint64_t)scalarCategory;
- (unint64_t)scalarType;
- (unint64_t)unsignedInt64Value;
- (unsigned)rawBytesLength;
@end

@implementation OSLogEventMessageArgument

- (OSLogEventMessageArgument)initWithProxy:(id)a3 index:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSLogEventMessageArgument;
  v6 = -[OSLogEventMessageArgument init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_decomposedMessage = (OSLogEventDecomposedMessage *)a3;
    v6->_rawArg = (os_log_fmt_raw_placeholder *)[a3 _rawPlaceholderForIndex:a4];
    v7->_sizeofLong = [a3 sizeOfLong];
  }

  return v7;
}

- (unint64_t)availability
{
  rawArg = self->_rawArg;
  unint64_t result = 2LL;
  switch(LOBYTE(rawArg[1].var0))
  {
    case 0:
      if (LOBYTE(rawArg[1].var1.var1)) {
        unint64_t result = 3LL;
      }
      else {
        unint64_t result = 0LL;
      }
      break;
    case 1:
    case 5:
    case 6:
    case 7:
      return result;
    case 2:
      unint64_t result = 1LL;
      break;
    default:
      unint64_t result = 4LL;
      break;
  }

  return result;
}

- (unint64_t)privacy
{
  return (unint64_t)self->_rawArg[1].var1.var0;
}

- (const)rawBytes
{
  return self->_rawArg->var0;
}

- (unsigned)rawBytesLength
{
  return WORD1(self->_rawArg[1].var0);
}

- (unint64_t)scalarCategory
{
  unint64_t result = -[OSLogEventMessageArgument category](self, "category");
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (unsigned int v5 = rawArg->var1.var2 - 1, v5 <= 0xE)) {
      return qword_1869D8EA8[v5];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (unint64_t)scalarType
{
  unint64_t result = -[OSLogEventMessageArgument category](self, "category");
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (unsigned int v5 = rawArg->var1.var2 - 1, v5 <= 0xE)) {
      return qword_1869D8F20[v5];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (unint64_t)category
{
  rawArg = self->_rawArg;
  if ((rawArg->var1.var1 & 0x10) != 0) {
    return 1LL;
  }
  if ((rawArg->var1.var2 & 0xFC) != 0x10) {
    return 0LL;
  }
  if (BYTE1(rawArg[1].var0) == 3) {
    return 3LL;
  }
  return 2LL;
}

- (NSObject)objectRepresentation
{
  rawArg = self->_rawArg;
  if (LOBYTE(rawArg[1].var0)) {
    return 0LL;
  }
  uint64_t p_var1 = (uint64_t)&rawArg->var1;
  if ((rawArg->var1.var1 & 0x10) == 0) {
    return  os_log_fmt_object_for_data( p_var1,  BYTE1(rawArg[1].var0),  (char *)rawArg->var0,  WORD1(rawArg[1].var0),  self->_sizeofLong);
  }
  uint64_t scalar = os_log_fmt_read_scalar(p_var1, (char *)rawArg->var0, WORD1(rawArg[1].var0));
  switch(-[OSLogEventMessageArgument scalarCategory](self, "scalarCategory"))
  {
    case 1uLL:
      unint64_t result = [MEMORY[0x189607968] numberWithUnsignedLongLong:scalar];
      break;
    case 2uLL:
      unint64_t result = [MEMORY[0x189607968] numberWithLongLong:scalar];
      break;
    case 3uLL:
    case 4uLL:
      unint64_t result = [MEMORY[0x189607968] numberWithDouble:*(double *)&scalar];
      break;
    default:
      return 0LL;
  }

  return result;
}

- (unint64_t)unsignedInt64Value
{
  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      double v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (char *)rawArg->var0, WORD1(rawArg[1].var0)));
      unint64_t v6 = -[OSLogEventMessageArgument scalarCategory](self, "scalarCategory");
      if (v6 - 1 < 2) {
        return *(void *)&v4;
      }
      if (v6 == 4 || v6 == 3)
      {
        *(void *)&double v4 = (unint64_t)v4;
        return *(void *)&v4;
      }
    }
  }

  double v4 = 0.0;
  return *(void *)&v4;
}

- (int64_t)int64Value
{
  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      double v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (char *)rawArg->var0, WORD1(rawArg[1].var0)));
      unint64_t v6 = -[OSLogEventMessageArgument scalarCategory](self, "scalarCategory");
      if (v6 - 1 < 2) {
        return *(void *)&v4;
      }
      if (v6 == 4 || v6 == 3)
      {
        *(void *)&double v4 = (uint64_t)v4;
        return *(void *)&v4;
      }
    }
  }

  double v4 = 0.0;
  return *(void *)&v4;
}

- (double)doubleValue
{
  double v3 = 0.0;
  if (!-[OSLogEventMessageArgument availability](self, "availability"))
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      uint64_t scalar = os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (char *)rawArg->var0, WORD1(rawArg[1].var0));
      switch(-[OSLogEventMessageArgument scalarCategory](self, "scalarCategory"))
      {
        case 1uLL:
          double v3 = (double)(unint64_t)scalar;
          break;
        case 2uLL:
          double v3 = (double)scalar;
          break;
        case 3uLL:
        case 4uLL:
          double v3 = *(double *)&scalar;
          break;
        default:
          return v3;
      }
    }
  }

  return v3;
}

- (double)longDoubleValue
{
  double v2 = 0.0;
  if (![a1 availability])
  {
    uint64_t v3 = a1[2];
    if ((*(_WORD *)(v3 + 16) & 0x10) != 0)
    {
      uint64_t scalar = os_log_fmt_read_scalar(v3 + 8, *(char **)v3, *(unsigned __int16 *)(v3 + 82));
      switch([a1 scalarCategory])
      {
        case 1LL:
          double v2 = (double)(unint64_t)scalar;
          break;
        case 2LL:
          double v2 = (double)scalar;
          break;
        case 3LL:
        case 4LL:
          double v2 = *(double *)&scalar;
          break;
        default:
          return v2;
      }
    }
  }

  return v2;
}

@end