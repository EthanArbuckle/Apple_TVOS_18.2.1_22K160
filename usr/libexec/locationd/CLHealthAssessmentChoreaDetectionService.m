@interface CLHealthAssessmentChoreaDetectionService
- (CLHealthAssessmentChoreaDetectionService)init;
- (CLHealthAssessmentResultDelegate)delegate;
- (void)dealloc;
- (void)feedAccelSample:(id)a3 time:(double)a4;
- (void)feedTremor:(id)a3;
- (void)onResultAvailable:(ChoreaScore *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CLHealthAssessmentChoreaDetectionService

- (CLHealthAssessmentChoreaDetectionService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLHealthAssessmentChoreaDetectionService;
  v2 = -[CLHealthAssessmentChoreaDetectionService init](&v6, "init");
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v2,  "feedTremor:",  off_1019901F0,  0LL);
    v4 = (char *)operator new(0x6090uLL);
    bzero(v4, 0x6010uLL);
    *((_DWORD *)v4 + 1) = 1024;
    *(_OWORD *)(v4 + 24584) = 0u;
    *(_OWORD *)(v4 + 24600) = 0u;
    *(_OWORD *)(v4 + 24616) = 0u;
    *(_OWORD *)(v4 + 24632) = 0u;
    *(_OWORD *)(v4 + 24648) = 0u;
    *(_OWORD *)(v4 + 24664) = 0u;
    *(_OWORD *)(v4 + 24680) = 0u;
    *((void *)v4 + 3087) = 0LL;
    qword_1019A14D8 = (uint64_t)v4;
    *((void *)v4 + 3088) = sub_1006B3280;
    *((void *)v4 + 3089) = v2;
    sub_1007446E0(v4);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)qword_1019A14D8;
  if (qword_1019A14D8)
  {
    sub_100210A00((void *)(qword_1019A14D8 + 24648));
    sub_100210A00(v3 + 3074);
    operator delete(v3);
  }

  qword_1019A14D8 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLHealthAssessmentChoreaDetectionService;
  -[CLHealthAssessmentChoreaDetectionService dealloc](&v4, "dealloc");
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_1007447D0((unsigned __int16 *)qword_1019A14D8, (uint64_t *)&v4, a4);
}

- (void)feedTremor:(id)a3
{
  id v4 = [a3 name];
  if ([v4 isEqual:off_1019901F0])
  {
    id v5 = [a3 userInfo];
    int v9 = 0;
    objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", @"time"), "doubleValue");
    v8.n128_u64[0] = v6;
    v8.n128_u32[2] = objc_msgSend( objc_msgSend(v5, "objectForKeyedSubscript:", @"score"),  "intValue");
    objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", @"displacement"), "floatValue");
    v8.n128_u32[3] = v7;
    sub_100744D3C((void *)qword_1019A14D8, &v8);
  }

- (void)onResultAvailable:(ChoreaScore *)a3
{
  v7[0] = @"time";
  v8[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3->var0);
  v7[1] = @"score";
  v8[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3->var1);
  v7[2] = @"likelihood";
  *(float *)&double v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5);
  v7[3] = @"strength";
  *(float *)&double v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6);
  v7[4] = @"tremorScore";
  v8[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3->var4);
  -[CLHealthAssessmentResultDelegate syncgetResultReady:ForAnalyzer:]( -[CLHealthAssessmentChoreaDetectionService delegate](self, "delegate"),  "syncgetResultReady:ForAnalyzer:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  5LL),  1LL);
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