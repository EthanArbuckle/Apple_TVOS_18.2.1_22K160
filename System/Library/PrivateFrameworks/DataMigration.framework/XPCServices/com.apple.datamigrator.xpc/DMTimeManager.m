@interface DMTimeManager
+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4;
+ (double)intervalSinceTimestamp:(unint64_t)a3;
@end

@implementation DMTimeManager

+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4
{
  if (qword_10002CC30 != -1) {
    dispatch_once(&qword_10002CC30, &stru_100020AB8);
  }
  *(double *)&unint64_t v7 = (double)a3;
  LODWORD(v7) = dword_10002CC28;
  LODWORD(v4) = *(_DWORD *)algn_10002CC2C;
  return ((double)a4 - (double)a3) * (double)v7 / (double)v4 / 1000000000.0;
}

+ (double)intervalSinceTimestamp:(unint64_t)a3
{
  return result;
}

@end