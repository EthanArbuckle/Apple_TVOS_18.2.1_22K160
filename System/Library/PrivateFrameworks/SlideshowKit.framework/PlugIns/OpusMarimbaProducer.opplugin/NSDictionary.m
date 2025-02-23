@interface NSDictionary
- (int64_t)sortPatchworkAscendingHorizontal:(id)a3;
- (int64_t)sortPatchworkAscendingVertical:(id)a3;
- (int64_t)sortPatchworkDescendingHorizontal:(id)a3;
- (int64_t)sortPatchworkDescendingVertical:(id)a3;
@end

@implementation NSDictionary

- (int64_t)sortPatchworkAscendingVertical:(id)a3
{
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"rectangle"), "CGRectValue");
  if (v5 < v6) {
    return -1LL;
  }
  else {
    return v5 > v6;
  }
}

- (int64_t)sortPatchworkDescendingVertical:(id)a3
{
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"rectangle"), "CGRectValue");
  if (v5 > v6) {
    return -1LL;
  }
  else {
    return v5 < v6;
  }
}

- (int64_t)sortPatchworkAscendingHorizontal:(id)a3
{
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"rectangle"), "CGRectValue");
  if (v5 < v6) {
    return -1LL;
  }
  else {
    return v5 > v6;
  }
}

- (int64_t)sortPatchworkDescendingHorizontal:(id)a3
{
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"rectangle"), "CGRectValue");
  if (v5 > v6) {
    return -1LL;
  }
  else {
    return v5 < v6;
  }
}

@end