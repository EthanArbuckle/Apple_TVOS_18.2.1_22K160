@interface TVPMyPSImageLoadTask
- (BOOL)isLoading;
- (BOOL)perform;
- (BOOL)shouldPerformLoad;
- (TVPMyPSImageLoadTask)init;
- (TVPMyPSImageLoadTaskDelegate)delegate;
- (unint64_t)loadID;
- (void)setDelegate:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadID:(unint64_t)a3;
- (void)setShouldPerformLoad:(BOOL)a3;
- (void)stop;
@end

@implementation TVPMyPSImageLoadTask

- (TVPMyPSImageLoadTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPMyPSImageLoadTask;
  return -[TVPMyPSImageLoadTask initWithType:interval:delay:async:]( &v3,  "initWithType:interval:delay:async:",  0LL,  1LL,  0.0,  0.0);
}

- (BOOL)perform
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSImageLoadTask delegate](self, "delegate"));
  [v3 imageLoadTaskDidChangeShouldPerformLoad:self];

  return 1;
}

- (void)stop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPMyPSImageLoadTask delegate](self, "delegate"));
  [v3 imageLoadTaskDidChangeShouldPerformLoad:self];
}

- (BOOL)shouldPerformLoad
{
  return self->_shouldPerformLoad;
}

- (void)setShouldPerformLoad:(BOOL)a3
{
  self->_shouldPerformLoad = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (TVPMyPSImageLoadTaskDelegate)delegate
{
  return (TVPMyPSImageLoadTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)loadID
{
  return self->_loadID;
}

- (void)setLoadID:(unint64_t)a3
{
  self->_loadID = a3;
}

- (void).cxx_destruct
{
}

@end