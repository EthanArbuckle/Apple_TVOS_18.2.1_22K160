@interface PBSystemGestureTableChangeResult
+ (id)resultWithGestureRecognizer:(id)a3 count:(unint64_t)a4 previousCount:(unint64_t)a5 activeCount:(unint64_t)a6 previousActiveCount:(unint64_t)a7;
- (UIGestureRecognizer)gestureRecognizer;
- (unint64_t)activeCount;
- (unint64_t)count;
- (unint64_t)previousActiveCount;
- (unint64_t)previousCount;
@end

@implementation PBSystemGestureTableChangeResult

+ (id)resultWithGestureRecognizer:(id)a3 count:(unint64_t)a4 previousCount:(unint64_t)a5 activeCount:(unint64_t)a6 previousActiveCount:(unint64_t)a7
{
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)v14 + 1, a3);
    v15[2] = a4;
    v15[3] = a5;
    v15[4] = a6;
    v15[5] = a7;
  }

  return v15;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)previousCount
{
  return self->_previousCount;
}

- (unint64_t)activeCount
{
  return self->_activeCount;
}

- (unint64_t)previousActiveCount
{
  return self->_previousActiveCount;
}

- (void).cxx_destruct
{
}

@end