@interface MRCAMLUtilities
+ (double)valueAtIndex:(int64_t)a3 forAnimationPath:(id)a4 atTime:(double)a5;
@end

@implementation MRCAMLUtilities

+ (double)valueAtIndex:(int64_t)a3 forAnimationPath:(id)a4 atTime:(double)a5
{
  double v9 = *((double *)a4 + 1);
  double v8 = *((double *)a4 + 2);
  id v10 = [a4 keyframes];
  v11 = (char *)[v10 count];
  if (v11 == (_BYTE *)&dword_0 + 1 || (double v12 = a5 - v9, a5 - v9 <= 0.0))
  {
    v17 = (char *)objc_msgSend(v10, "objectAtIndex:", 0, v12);
    goto LABEL_10;
  }

  if (v12 >= *((double *)a4 + 2) || (v13 = v11, (unint64_t)v11 < 2))
  {
LABEL_8:
    v17 = (char *)[v10 lastObject];
LABEL_10:
    uint64_t v18 = 24LL;
    if (!a3) {
      uint64_t v18 = 16LL;
    }
    return *(double *)&v17[v18];
  }

  unsigned int v14 = 0;
  unint64_t v15 = 1LL;
  double v16 = v12 / v8;
  while (v16 > *((double *)[v10 objectAtIndex:v15] + 4))
  {
    unint64_t v15 = v14 + 2;
    ++v14;
  }

  v20 = (double *)[v10 objectAtIndex:v14];
  v21 = (double *)[v10 objectAtIndex:v15];
  objc_msgSend(objc_msgSend(v20, "spline"), "evaluatAtTime:", (v16 - v20[4]) / (v21[4] - v20[4]));
  uint64_t v23 = 3LL;
  if (!a3) {
    uint64_t v23 = 2LL;
  }
  return v20[v23] + (v21[v23] - v20[v23]) * v22;
}

@end