@interface _BKKeyDownKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _BKKeyDownKey

- (unint64_t)hash
{
  unint64_t v2 = self->_page ^ self->_senderID ^ self->_usage;
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9LL * (v2 ^ (v2 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v2 ^ (v2 >> 30))) >> 27));
  return v3 ^ (v3 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BKKeyDownKey *v6 = [BKKeyDownKey class];
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

  BOOL v11 = v10 && self->_senderID == v10[1] && self->_page == v10[2] && self->_usage == v10[3];
  return v11;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000300E4;
  v5[3] = &unk_1000B8030;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 appendProem:0 block:v5];
}

@end