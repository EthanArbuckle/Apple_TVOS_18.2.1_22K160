@interface PBAnimationStage
+ (id)stageWithDuration:(double)a3 animationBlock:(id)a4;
+ (id)stageWithDuration:(double)a3 animationBlock:(id)a4 postAnimationBlock:(id)a5;
+ (id)stageWithDuration:(double)a3 preAnimationBlock:(id)a4 animationBlock:(id)a5;
+ (id)stageWithDuration:(double)a3 preAnimationBlock:(id)a4 animationBlock:(id)a5 postAnimationBlock:(id)a6;
- (double)duration;
- (id)animationBlock;
- (id)postAnimationBlock;
- (id)preAnimationBlock;
@end

@implementation PBAnimationStage

+ (id)stageWithDuration:(double)a3 animationBlock:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBAnimationStage stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:]( &OBJC_CLASS___PBAnimationStage,  "stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:",  0LL,  a4,  0LL,  a3));
}

+ (id)stageWithDuration:(double)a3 preAnimationBlock:(id)a4 animationBlock:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBAnimationStage stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:]( &OBJC_CLASS___PBAnimationStage,  "stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:",  a4,  a5,  0LL,  a3));
}

+ (id)stageWithDuration:(double)a3 animationBlock:(id)a4 postAnimationBlock:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBAnimationStage stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:]( &OBJC_CLASS___PBAnimationStage,  "stageWithDuration:preAnimationBlock:animationBlock:postAnimationBlock:",  0LL,  a4,  a5,  a3));
}

+ (id)stageWithDuration:(double)a3 preAnimationBlock:(id)a4 animationBlock:(id)a5 postAnimationBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(&OBJC_CLASS___PBAnimationStage);
  v12->_duration = a3;
  id v13 = objc_retainBlock(v11);

  id preAnimationBlock = v12->_preAnimationBlock;
  v12->_id preAnimationBlock = v13;

  id v15 = objc_retainBlock(v10);
  id animationBlock = v12->_animationBlock;
  v12->_id animationBlock = v15;

  id v17 = objc_retainBlock(v9);
  id postAnimationBlock = v12->_postAnimationBlock;
  v12->_id postAnimationBlock = v17;

  return v12;
}

- (double)duration
{
  return self->_duration;
}

- (id)preAnimationBlock
{
  return self->_preAnimationBlock;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (id)postAnimationBlock
{
  return self->_postAnimationBlock;
}

- (void).cxx_destruct
{
}

@end