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
  id v4 = a3;
  v5 = IOServiceMatching((const char *)[v4 UTF8String]);
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = existing == 0;
  }
  if (v6)
  {
    id v7 = sub_10000E2BC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v9 = 0LL;
  }

  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v9 = self;
  }

  return v9;
}

- (unsigned)copyNextObject
{
  if (-[SKIOIterator attempt](self, "attempt") > 0x3E7)
  {
LABEL_5:
    id v4 = sub_10000E2BC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = 1000;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "IOKit iterator invalidated %d time(s)",  (uint8_t *)v6,  8u);
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
      -[SKIOIterator setAttempt:](self, "setAttempt:", (char *)-[SKIOIterator attempt](self, "attempt") + 1);
      IOIteratorReset(-[SKIOObject ioObj](self, "ioObj"));
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