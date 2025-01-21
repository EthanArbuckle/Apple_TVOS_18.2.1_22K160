@interface _BKTouchSensitiveButtonKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _BKTouchSensitiveButtonKey

- (unint64_t)hash
{
  return self->_usage;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [BKTouchSensitiveButtonKey class]
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

  v10 = v9;

  BOOL v11 = v10
     && self->_senderID == v10[2]

  return v11;
}

- (NSString)description
{
  NSString *returnValue = [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001C898;
  v4[3] = &unk_1000B8030;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 appendProem:0 block:v4];
}

@end