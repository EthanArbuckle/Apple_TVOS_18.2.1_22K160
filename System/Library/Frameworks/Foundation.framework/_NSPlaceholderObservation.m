@interface _NSPlaceholderObservation
- (_NSPlaceholderObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5;
- (_NSPlaceholderObservation)initWithObservable:(id)a3 observer:(id)a4;
- (unint64_t)retainCount;
@end

@implementation _NSPlaceholderObservation

- (_NSPlaceholderObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v8 = [a3 conformsToProtocol:&unk_18C65FFF0];
  v9 = off_189C62218;
  if (!v8) {
    v9 = off_189C62198;
  }
  return (_NSPlaceholderObservation *)[objc_alloc(*v9) initWithObservable:a3 blockSink:a4 tag:v5];
}

- (_NSPlaceholderObservation)initWithObservable:(id)a3 observer:(id)a4
{
  int v6 = [a3 conformsToProtocol:&unk_18C65FFF0];
  int v7 = [a4 conformsToProtocol:&unk_18C661D08];
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && [a3 conformsToProtocol:&unk_18C661D08])
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Observable object %@ cannot also be an owning observer.", a3), 0 reason userInfo]);
    JUMPOUT(0x18357C830LL);
  }

  int v9 = [a4 conformsToProtocol:&unk_18C65FF90];
  v10 = off_189C621A8;
  if (v9) {
    v10 = off_189C62210;
  }
  v11 = off_189C62220;
  if (v9) {
    v11 = off_189C621F0;
  }
  if (v6) {
    v10 = v11;
  }
  if (v9) {
    v12 = off_189C62228;
  }
  else {
    v12 = off_189C62230;
  }
  if (v7) {
    v10 = v12;
  }
  return (_NSPlaceholderObservation *)[objc_alloc(*v10) initWithObservable:a3 observer:a4];
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end