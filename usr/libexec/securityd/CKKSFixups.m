@interface CKKSFixups
+ (id)fixupOperation:(unint64_t)a3;
@end

@implementation CKKSFixups

+ (id)fixupOperation:(unint64_t)a3
{
  if (!a3)
  {
    v3 = off_100290540;
    return *v3;
  }

  if (a3 != 5)
  {
    if (a3 == 1)
    {
      v3 = off_100290548;
      return *v3;
    }

    if (a3 < 3)
    {
      v3 = off_100290550;
      return *v3;
    }

    if (a3 == 3)
    {
      v3 = off_100290558;
      return *v3;
    }

    if (a3 <= 4)
    {
      v3 = off_100290560;
      return *v3;
    }
  }

  return 0LL;
}

@end