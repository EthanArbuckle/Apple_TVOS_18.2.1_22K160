@interface TVDAStepTrack
- (NSMutableArray)steps;
- (TVDAStepTrack)initWithSteps:(id)a3;
- (id)currentStep;
- (id)nextStepByAdvancing;
- (unint64_t)currentStepIndex;
- (void)decrementCurrentIndexIfPossible;
@end

@implementation TVDAStepTrack

- (TVDAStepTrack)initWithSteps:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] count])
  {
    id v3 = v10;
    id v10 = 0LL;
    v7.receiver = v3;
    v7.super_class = (Class)&OBJC_CLASS___TVDAStepTrack;
    id v10 = -[TVDAStepTrack init](&v7, "init");
    objc_storeStrong(&v10, v10);
    if (v10)
    {
      id v4 = [location[0] mutableCopy];
      v5 = (void *)*((void *)v10 + 1);
      *((void *)v10 + 1) = v4;
    }

    v11 = (TVDAStepTrack *)v10;
    int v8 = 1;
  }

  else
  {
    v11 = 0LL;
    int v8 = 1;
  }

  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v11;
}

- (id)nextStepByAdvancing
{
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = 0LL;
  ++self->_currentStepIndex;
  unint64_t currentStepIndex = v8->_currentStepIndex;
  if (currentStepIndex < (unint64_t)-[NSMutableArray count](v8->_steps, "count"))
  {
    id v2 = -[NSMutableArray objectAtIndexedSubscript:](v8->_steps, "objectAtIndexedSubscript:", v8->_currentStepIndex);
    id v3 = v7[0];
    v7[0] = v2;
  }

  id v5 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v5;
}

- (void)decrementCurrentIndexIfPossible
{
  if (self->_currentStepIndex) {
    --self->_currentStepIndex;
  }
}

- (id)currentStep
{
  return -[NSMutableArray objectAtIndexedSubscript:]( self->_steps,  "objectAtIndexedSubscript:",  self->_currentStepIndex,  a2,  self);
}

- (NSMutableArray)steps
{
  return self->_steps;
}

- (unint64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (void).cxx_destruct
{
}

@end