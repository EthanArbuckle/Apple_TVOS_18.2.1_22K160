@interface ADSyncChunkInfo
- (NSArray)toAdd;
- (NSArray)toRemove;
- (NSString)post;
- (NSString)pre;
- (NSString)validity;
- (void)setPost:(id)a3;
- (void)setPre:(id)a3;
- (void)setToAdd:(id)a3;
- (void)setToRemove:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation ADSyncChunkInfo

- (NSString)pre
{
  return self->_pre;
}

- (void)setPre:(id)a3
{
}

- (NSString)post
{
  return self->_post;
}

- (void)setPost:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setValidity:(id)a3
{
}

- (NSArray)toAdd
{
  return self->_toAdd;
}

- (void)setToAdd:(id)a3
{
}

- (NSArray)toRemove
{
  return self->_toRemove;
}

- (void)setToRemove:(id)a3
{
}

- (void).cxx_destruct
{
}

@end