@interface NSString(KCJoiningMessages)
+ (id)decodeFromDER:()KCJoiningMessages error:;
@end

@implementation NSString(KCJoiningMessages)

+ (id)decodeFromDER:()KCJoiningMessages error:
{
  id v20 = 0LL;
  id v5 = a3;
  uint64_t v6 = [v5 bytes];
  id v7 = v5;
  unint64_t v8 = kcder_decode_string((uint64_t *)&v20, a4, v6, [v7 bytes] + objc_msgSend(v7, "length"));
  id v9 = v20;
  if (v8)
  {
    id v10 = v7;
    uint64_t v11 = [v10 bytes];
    if (v8 == v11 + [v10 length])
    {
      id v17 = v9;
      goto LABEL_6;
    }

    KCJoiningErrorCreate(1LL, a4, @"extra data in string", v12, v13, v14, v15, v16, v19);
  }

  id v17 = 0LL;
LABEL_6:

  return v17;
}

@end