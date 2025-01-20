@interface CLHealthAssessmentTremorDetectionService
- (CLHealthAssessmentResultDelegate)delegate;
- (CLHealthAssessmentTremorDetectionService)init;
- (void)dealloc;
- (void)feedAccelSample:(id)a3 time:(double)a4;
- (void)feedGyroSample:(id)a3 time:(double)a4;
- (void)onResultAvailable:(TremorScore *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CLHealthAssessmentTremorDetectionService

- (CLHealthAssessmentTremorDetectionService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLHealthAssessmentTremorDetectionService;
  v2 = -[CLHealthAssessmentTremorDetectionService init](&v5, "init");
  if (v2)
  {
    v3 = operator new(0x3090uLL);
    bzero(v3, 0x3090uLL);
    *((_DWORD *)v3 + 1) = 256;
    *((_DWORD *)v3 + 1539) = 256;
    *((void *)v3 + 1538) = 0LL;
    sub_100FE4B74((uint64_t)v3 + 12312, 9uLL);
    sub_100FE4B74((uint64_t)v3 + 12360, 9uLL);
    *((_BYTE *)v3 + 12408) = 1;
    qword_1019A4108 = (uint64_t)v3;
    *((void *)v3 + 1552) = sub_100FE4924;
    *((void *)v3 + 1553) = v2;
    sub_1002E53F0((uint64_t)v3);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)qword_1019A4108;
  if (qword_1019A4108)
  {
    v4 = *(void **)(qword_1019A4108 + 12360);
    if (v4)
    {
      *(void *)(qword_1019A4108 + 12368) = v4;
      operator delete(v4);
    }

    objc_super v5 = (void *)v3[1539];
    if (v5)
    {
      v3[1540] = v5;
      operator delete(v5);
    }

    operator delete(v3);
  }

  qword_1019A4108 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLHealthAssessmentTremorDetectionService;
  -[CLHealthAssessmentTremorDetectionService dealloc](&v6, "dealloc");
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_1002E571C((unsigned __int16 *)qword_1019A4108, (uint64_t *)&v4, a4);
}

- (void)feedGyroSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_1002E5CEC((unsigned __int16 *)qword_1019A4108, (uint64_t *)&v4, a4);
}

- (void)onResultAvailable:(TremorScore *)a3
{
  v7[0] = @"time";
  v8[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3->var0);
  v7[1] = @"score";
  v8[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3->var1);
  v7[2] = @"displacement";
  *(float *)&double v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5);
  v7[3] = @"freq";
  *(float *)&double v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6);
  -[CLHealthAssessmentResultDelegate syncgetResultReady:ForAnalyzer:]( -[CLHealthAssessmentTremorDetectionService delegate](self, "delegate"),  "syncgetResultReady:ForAnalyzer:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL),  0LL);
}

- (CLHealthAssessmentResultDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHealthAssessmentResultDelegate *)a3;
}

@end