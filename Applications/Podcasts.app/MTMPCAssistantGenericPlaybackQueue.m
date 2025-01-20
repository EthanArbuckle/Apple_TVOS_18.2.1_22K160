@interface MTMPCAssistantGenericPlaybackQueue
- (MTMPCAssistantGenericPlaybackQueue)initWithContextID:(id)a3 playbackQueueRef:(_MRSystemAppPlaybackQueue *)a4;
- (MTMPCAssistantGenericPlaybackQueue)initWithPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3;
- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue;
- (_MRSystemAppPlaybackQueue)playbackQueueRef;
- (void)setPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3;
@end

@implementation MTMPCAssistantGenericPlaybackQueue

- (MTMPCAssistantGenericPlaybackQueue)initWithPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3
{
  return -[MTMPCAssistantGenericPlaybackQueue initWithContextID:playbackQueueRef:]( self,  "initWithContextID:playbackQueueRef:",  0LL,  a3);
}

- (MTMPCAssistantGenericPlaybackQueue)initWithContextID:(id)a3 playbackQueueRef:(_MRSystemAppPlaybackQueue *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTMPCAssistantGenericPlaybackQueue;
  result = -[MTMPCAssistantGenericPlaybackQueue initWithContextID:](&v6, "initWithContextID:", a3);
  if (result) {
    result->_playbackQueueRef = a4;
  }
  return result;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  return self->_playbackQueueRef;
}

- (_MRSystemAppPlaybackQueue)playbackQueueRef
{
  return self->_playbackQueueRef;
}

- (void)setPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3
{
  self->_playbackQueueRef = a3;
}

@end