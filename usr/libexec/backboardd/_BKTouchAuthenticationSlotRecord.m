@interface _BKTouchAuthenticationSlotRecord
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _BKTouchAuthenticationSlotRecord

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[BKSTouchAuthenticationSpecification slotID](self->_authenticationSpecification, "slotID")));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS____BKTouchAuthenticationSlotRecord, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0) {
    return 0;
  }
  if (a3) {
    v6 = (void *)*((void *)a3 + 2);
  }
  else {
    v6 = 0LL;
  }
  id v7 = v6;
  unsigned int v8 = [v7 slotID];
  BOOL v9 = v8 == -[BKSTouchAuthenticationSpecification slotID](self->_authenticationSpecification, "slotID");

  return v9;
}

- (void).cxx_destruct
{
}

@end