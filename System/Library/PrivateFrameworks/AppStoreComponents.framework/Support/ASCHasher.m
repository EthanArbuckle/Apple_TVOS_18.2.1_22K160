@interface ASCHasher
+ (unint64_t)executionSeed;
- (ASCHasher)init;
- (BOOL)isFinalized;
- (NSMutableData)buffer;
- (unint64_t)finalizeHash;
- (void)combineBool:(BOOL)a3;
- (void)combineBytes:(const void *)a3 length:(unint64_t)a4;
- (void)combineDouble:(double)a3;
- (void)combineInteger:(int64_t)a3;
- (void)combineObject:(id)a3;
- (void)combineUnsignedInteger:(unint64_t)a3;
- (void)setIsFinalized:(BOOL)a3;
@end

@implementation ASCHasher

+ (unint64_t)executionSeed
{
  if (qword_1001407E0 != -1) {
    dispatch_once(&qword_1001407E0, &stru_10011F0C8);
  }
  return qword_1001407E8;
}

- (ASCHasher)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASCHasher;
  v2 = -[ASCHasher init](&v7, "init");
  if (v2)
  {
    unint64_t v6 = +[ASCHasher executionSeed](&OBJC_CLASS___ASCHasher, "executionSeed");
    v3 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v6,  8LL);
    buffer = v2->_buffer;
    v2->_buffer = v3;

    v2->_isFinalized = 0;
  }

  return v2;
}

- (void)combineBytes:(const void *)a3 length:(unint64_t)a4
{
  if (-[ASCHasher isFinalized](self, "isFinalized"))
  {
    objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Cannot combine additional values into finalized hasher",  0LL));
    -[ASCHasher combineBool:](v7, v8, v9);
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ASCHasher buffer](self, "buffer"));
    [v10 appendBytes:a3 length:a4];
  }

- (void)combineBool:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCHasher combineObject:](self, "combineObject:", v4);
}

- (void)combineDouble:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[ASCHasher combineObject:](self, "combineObject:", v4);
}

- (void)combineInteger:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[ASCHasher combineObject:](self, "combineObject:", v4);
}

- (void)combineUnsignedInteger:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[ASCHasher combineObject:](self, "combineObject:", v4);
}

- (void)combineObject:(id)a3
{
  id v4 = [a3 hash];
  -[ASCHasher combineBytes:length:](self, "combineBytes:length:", &v4, 8LL);
}

- (unint64_t)finalizeHash
{
  if (-[ASCHasher isFinalized](self, "isFinalized"))
  {
    objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Cannot finalize hasher multiple times",  0LL));
    return (unint64_t)-[ASCHasher buffer](v7, v8);
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCHasher buffer](self, "buffer"));
    id v4 = [v3 hash];

    -[ASCHasher setIsFinalized:](self, "setIsFinalized:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCHasher buffer](self, "buffer"));
    [v5 setLength:0];

    return (unint64_t)v4;
  }

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (BOOL)isFinalized
{
  return self->_isFinalized;
}

- (void)setIsFinalized:(BOOL)a3
{
  self->_isFinalized = a3;
}

- (void).cxx_destruct
{
}

@end