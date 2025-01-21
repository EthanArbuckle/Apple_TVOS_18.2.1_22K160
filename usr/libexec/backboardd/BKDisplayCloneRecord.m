@interface BKDisplayCloneRecord
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation BKDisplayCloneRecord

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [BKDisplayCloneRecord class];
  id v7 = v4;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  id v10 = v9;

  if (v10
    && (unsigned int v11 = -[CAWindowServerDisplay displayId](self->_sourceDisplay, "displayId"),
        v11 == [*((id *)v10 + 2) displayId])
    && (unsigned int v12 = -[CAWindowServerDisplay displayId](self->_destinationDisplay, "displayId"),
        v12 == [*((id *)v10 + 3) displayId])
    && self->_clientPID == *((_DWORD *)v10 + 2))
  {
    BOOL v13 = [self->_options isEqual:*((void *)v10 + 4)];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return [self->_destinationDisplay hash];
}

- (void).cxx_destruct
{
}

@end