@interface ACTRejectCandidate
- (ACTRejectCandidate)initWithCandidate:(id)a3 timestamp:(double)a4;
- (TIKeyboardCandidate)candidate;
- (double)timestamp;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTRejectCandidate

- (ACTRejectCandidate)initWithCandidate:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACTRejectCandidate;
  v8 = -[ACTRejectCandidate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_candidate, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTRejectCandidate candidate](self, "candidate"));
  -[ACTRejectCandidate timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: candidate=%@, t=%.2f>",  v5,  v6,  v7));

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ACTRejectCandidate candidate](self, "candidate"));
  -[ACTRejectCandidate timestamp](self, "timestamp");
  objc_msgSend(v7, "_performRejectCandidate:timestamp:typingLog:", v8, v6);
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end