@interface ACTAcceptCandidate
- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4;
- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4 intendedCandidate:(id)a5;
- (NSString)intendedCandidate;
- (TIKeyboardCandidate)candidate;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTAcceptCandidate

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4
{
  return -[ACTAcceptCandidate initWithCandidate:timestamp:intendedCandidate:]( self,  "initWithCandidate:timestamp:intendedCandidate:",  a3,  0LL,  a4);
}

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4 intendedCandidate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ACTAcceptCandidate;
  v11 = -[ACTAcceptCandidate init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_candidate, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_intendedCandidate, a5);
  }

  return v12;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTAcceptCandidate candidate](self, "candidate"));
  -[ACTAcceptCandidate timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: candidate=%@, t=%.2f>",  v5,  v6,  v7));

  return v8;
}

- (id)shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTAcceptCandidate candidate](self, "candidate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 input]);
  v5 = @"Prediction Accepted";
  if (([v4 isEqualToString:@" "] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTAcceptCandidate candidate](self, "candidate"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 input]);
    unsigned int v8 = [v7 isEqualToString:&stru_89E80];
    id v9 = @"Completion Accepted";
    if (v8) {
      id v9 = @"Prediction Accepted";
    }
    v5 = v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTAcceptCandidate candidate](self, "candidate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 candidate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@ ", v5, v11));

  return v12;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ACTAcceptCandidate candidate](self, "candidate"));
  -[ACTAcceptCandidate timestamp](self, "timestamp");
  objc_msgSend( v7,  "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:",  v8,  v6,  1,  self->_intendedCandidate);
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (NSString)intendedCandidate
{
  return self->_intendedCandidate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end