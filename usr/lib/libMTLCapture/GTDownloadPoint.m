@interface GTDownloadPoint
- (GTDownloadContext)downloadContext;
- (MTLCommandQueue)downloadQueue;
- (MTLSharedEvent)downloadEvent;
- (MTLSharedEvent)waitEvent;
- (unint64_t)downloadValue;
- (unint64_t)waitValue;
- (void)createContext:(apr_array_header_t *)a3;
- (void)setDownloadEvent:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setDownloadValue:(unint64_t)a3;
- (void)setWaitEvent:(id)a3;
- (void)setWaitValue:(unint64_t)a3;
@end

@implementation GTDownloadPoint

- (void)createContext:(apr_array_header_t *)a3
{
  v4 = -[GTDownloadContext initWithQueue:forRequest:]( objc_alloc(&OBJC_CLASS___GTDownloadContext),  "initWithQueue:forRequest:",  self->_downloadQueue,  a3);
  downloadContext = self->_downloadContext;
  self->_downloadContext = v4;
}

- (GTDownloadContext)downloadContext
{
  return self->_downloadContext;
}

- (unint64_t)downloadValue
{
  return self->downloadValue;
}

- (void)setDownloadValue:(unint64_t)a3
{
  self->downloadValue = a3;
}

- (MTLSharedEvent)downloadEvent
{
  return self->downloadEvent;
}

- (void)setDownloadEvent:(id)a3
{
}

- (MTLCommandQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (unint64_t)waitValue
{
  return self->waitValue;
}

- (void)setWaitValue:(unint64_t)a3
{
  self->waitValue = a3;
}

- (MTLSharedEvent)waitEvent
{
  return self->waitEvent;
}

- (void)setWaitEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end