@interface ProcessAssertion
- (id)description;
- (unint64_t)secondsLeft;
- (void)setSecondsLeft:(unint64_t)a3;
@end

@implementation ProcessAssertion

- (id)description
{
  v3 = -[ProcessAssertion name];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %lus",  v3,  -[ProcessAssertion secondsLeft](self, "secondsLeft")));

  return v4;
}

- (unint64_t)secondsLeft
{
  return self->_secondsLeft;
}

- (void)setSecondsLeft:(unint64_t)a3
{
  self->_secondsLeft = a3;
}

@end