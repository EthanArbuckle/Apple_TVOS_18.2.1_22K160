@interface _BKDisplayDisabledAssertions
- (_BKDisplayDisabledAssertions)init;
@end

@implementation _BKDisplayDisabledAssertions

- (_BKDisplayDisabledAssertions)init
{
  v13.receiver = self;
  v13.super_class = [BKDisplayDisabledAssertions class];
  _BKDisplayDisabledAssertions *v2 = [[_BKDisplayDisabledAssertions alloc] init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [NSMutableDictionary dictionary];
    lock_assertionsByVPID = v3->_lock_assertionsByVPID;
    v3->_lock_assertionsByVPID = (NSMutableDictionary *)v4;

    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x3032000000LL;
    v11[3] = sub_10001914C;
    v11[4] = sub_10001915C;
    id v12 = [NSSet set];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100019164;
    v10[3] = &unk_1000B5ED8;
    v10[4] = v11;
    uint64_t v6 = [BSCompoundAssertion assertionWithIdentifier:@"com.apple.backboardd.display-disabled" stateDidChangeHandler:v10];
    displayDisabledAssertion = v3->_displayDisabledAssertion;
    v3->_displayDisabledAssertion = (BSCompoundAssertion *)v6;

    v8 = v3;
    _Block_object_dispose(v11, 8);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end