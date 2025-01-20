@interface OSVersion
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)description;
@end

@implementation OSVersion

- (void)description
{
  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%lu",  a1[1]));
    v3 = v2;
    if ((uint64_t)v1[2] > 0 || (uint64_t)v1[3] >= 1)
    {
      objc_msgSend(v2, "appendFormat:", @".%lu", v1[2]);
    }

    v1 = [v3 copy];
  }

  return v1;
}

- (unint64_t)hash
{
  return (self->_version.minor << 8) | (self->_version.major << 16) | self->_version.patch;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (OSVersion *)a3;
  if (self == v5)
  {
    LOBYTE(self) = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      if (self) {
        LOBYTE(self) = v7->_version.major == self->_version.major
      }
                    && v7->_version.minor == self->_version.minor
                    && v7->_version.patch == self->_version.patch;
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

@end