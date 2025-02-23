@interface SKIOIterator
- (BOOL)invalidated;
- (SKIOIterator)initWithClassName:(id)a3;
- (unint64_t)attempt;
- (unsigned)copyNextObject;
- (void)setAttempt:(unint64_t)a3;
@end

@implementation SKIOIterator

- (SKIOIterator)initWithClassName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  mach_port_t v5 = *MEMORY[0x1896086A8];
  id v6 = v4;
  v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  if (IOServiceGetMatchingServices(v5, v7, &existing)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = existing == 0;
  }
  if (v8)
  {
    SKGetOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_188F75000, v9, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v10 = 0LL;
  }

  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v10 = self;
  }

  return v10;
}

- (unsigned)copyNextObject
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[SKIOIterator setAttempt:](self, "setAttempt:", 0LL);
  if (-[SKIOIterator attempt](self, "attempt") > 0x3E7)
  {
LABEL_5:
    SKGetOSLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = 1000;
      _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "IOKit iterator invalidated %d time(s)", (uint8_t *)v5, 8u);
    }

    return 0;
  }

  else
  {
    while (1)
    {
      unsigned int result = IOIteratorNext(-[SKIOObject ioObj](self, "ioObj"));
      if (result) {
        break;
      }
      if (IOIteratorIsValid(-[SKIOObject ioObj](self, "ioObj"))) {
        return 0;
      }
      -[SKIOIterator setAttempt:](self, "setAttempt:", -[SKIOIterator attempt](self, "attempt") + 1);
      MEMORY[0x1895DB568](-[SKIOObject ioObj](self, "ioObj"));
      if (-[SKIOIterator attempt](self, "attempt") >= 0x3E8) {
        goto LABEL_5;
      }
    }
  }

  return result;
}

- (BOOL)invalidated
{
  return -[SKIOIterator attempt](self, "attempt") != 0;
}

- (unint64_t)attempt
{
  return self->_attempt;
}

- (void)setAttempt:(unint64_t)a3
{
  self->_attempt = a3;
}

@end