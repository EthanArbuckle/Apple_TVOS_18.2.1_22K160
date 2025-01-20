@interface BKHitTestResultKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation BKHitTestResultKey

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___BKHitTestResultKey, a2);
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  v9 = v8;

  BOOL v10 = v7 && BSEqualObjects(self->_destination, v9[2]) && self->_userIdentifier == *((_DWORD *)v9 + 2);
  return v10;
}

- (unint64_t)hash
{
  return -[BKCAContextDestination hash](self->_destination, "hash");
}

- (void).cxx_destruct
{
}

@end