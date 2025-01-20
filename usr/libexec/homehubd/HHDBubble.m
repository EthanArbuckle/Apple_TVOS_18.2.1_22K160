@interface HHDBubble
- (HHDBubble)initWithIdentifier:(id)a3;
- (HHDBubble)initWithIdentifier:(id)a3 state:(unint64_t)a4;
- (NSMutableArray)jobs;
- (NSUUID)identifier;
- (unint64_t)state;
- (void)setJobs:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HHDBubble

- (HHDBubble)initWithIdentifier:(id)a3 state:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HHDBubble;
  v8 = -[HHDBubble init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_state = a4;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    jobs = v9->_jobs;
    v9->_jobs = v10;
  }

  return v9;
}

- (HHDBubble)initWithIdentifier:(id)a3
{
  return -[HHDBubble initWithIdentifier:state:](self, "initWithIdentifier:state:", a3, 1LL);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end