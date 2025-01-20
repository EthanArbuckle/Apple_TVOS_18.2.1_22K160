@interface PBMRPictureInPicturePlayerTransaction
- (BOOL)_canBeInterrupted;
- (MRPlayerPath)pictureInPicturePlayerPath;
- (PBMRPictureInPicturePlayerTransaction)init;
- (PBMRPictureInPicturePlayerTransaction)initWithClient:(id)a3;
- (void)_begin;
@end

@implementation PBMRPictureInPicturePlayerTransaction

- (PBMRPictureInPicturePlayerTransaction)initWithClient:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBMRPictureInPicturePlayerTransaction;
  v3 = -[PBMediaRemoteTransaction initWithClient:](&v7, "initWithClient:", a3);
  v4 = v3;
  if (v3)
  {
    pictureInPicturePlayerPath = v3->_pictureInPicturePlayerPath;
    v3->_pictureInPicturePlayerPath = 0LL;
  }

  return v4;
}

- (PBMRPictureInPicturePlayerTransaction)init
{
  id v3 = [(id)objc_opt_class(self) _defaultClient];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[PBMRPictureInPicturePlayerTransaction initWithClient:](self, "initWithClient:", v4);

  return v5;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBMRPictureInPicturePlayerTransaction;
  -[PBMediaRemoteTransaction _begin](&v7, "_begin");
  -[PBMRPictureInPicturePlayerTransaction addMilestone:]( self,  "addMilestone:",  @"kPBMRGetPictureInPicturePlayerMilestone");
  objc_initWeak(&location, self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction client](self, "client"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001C258C;
  v4[3] = &unk_1003DB990;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 getActivePlayersForLocalOriginWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (MRPlayerPath)pictureInPicturePlayerPath
{
  return self->_pictureInPicturePlayerPath;
}

- (void).cxx_destruct
{
}

@end