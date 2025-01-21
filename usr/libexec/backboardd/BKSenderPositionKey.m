@interface BKSenderPositionKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKSenderPositionKey

- (unint64_t)hash
{
  return self->_positionID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [BKSenderPositionKey class];
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

  BOOL v11 = v10 && self->_senderID == v10[1] && self->_positionID == v10[2];
  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = [v6 appendUInt64:self->_senderID withName:@"senderID" format:1];
  id v5 = [v6 appendInteger:self->_positionID withName:@"positionID"];
}

@end