@interface BKTouchContact
- (BKTouchContact)init;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKTouchContact

- (BKTouchContact)init
{
  v6.receiver = self;
  v6.super_class = [BKTouchContact class];
  BKTouchContact *v2 = [[BKTouchContact alloc] init];
  if (v2)
  {
    NSMutableSet *v3 = [[NSMutableSet alloc] init];
    destinations = v2->_destinations;
    v2->_destinations = v3;
  }

  return v2;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithInteger:self->_pathIndex];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = [BKTouchContact class];
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

  if (v9) {
    BOOL v10 = v9[1] == self->_pathIndex;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5 = [a3 appendInteger:self->_pathIndex withName:@"pathIndex"];
  id v6 = [a3 appendInteger:self->_touchIdentifier withName:@"touchIdentifier"];
  unint64_t presence = self->_presence;
  if (presence > 2) {
    v8 = @"<unknown>";
  }
  else {
    v8 = [off_1000B7C40[presence] retain];
  }
  [a3 appendString:v8 withName:0];
  v9 = @"startAvoiding";
  switch(self->_hitTestPolicy)
  {
    case 0LL:
      goto LABEL_10;
    case 1LL:
      goto LABEL_9;
    case 2LL:
      v9 = @"avoid";
      goto LABEL_9;
    case 3LL:
      v9 = @"avoidThenReset";
      goto LABEL_9;
    case 4LL:
      v9 = @"locked";
      goto LABEL_9;
    default:
      v9 = @"<unknown>";
LABEL_9:
      [a3 appendString:v9 withName:0];
LABEL_10:
      if (self->_hitTestContextCategory)
      {
        uint64_t v10 = NSStringFromBKSTouchHitTestContextCategory();
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        [a3 appendString:v11 withName:@"hitTestCategory"];
      }

      id v12 = [a3 appendBool:self->_touchDetached withName:@"detached" ifEqualTo:1];
      uint64_t userIdentifier = self->_userIdentifier;
      if ((_DWORD)userIdentifier) {
        id v15 = [a3 appendUInt64:userIdentifier withName:@"userIdentifier" format:1];
      }
      uint64_t v16 = [BSDescriptionStream class];
      id v17 = a3;
      v18 = v17;
      if (v16)
      {
        if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0) {
          v19 = v18;
        }
        else {
          v19 = 0LL;
        }
      }

      else
      {
        v19 = 0LL;
      }

      id v22 = v19;

      v20 = v22;
      if (v22)
      {
        destinations = self->_destinations;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100063154;
        v23[3] = &unk_1000B7C20;
        id v24 = v22;
        [v24 appendCollection:destinations withName:@"destinations" itemBlock:v23];

        v20 = v22;
      }

      return;
  }

- (void).cxx_destruct
{
}

@end