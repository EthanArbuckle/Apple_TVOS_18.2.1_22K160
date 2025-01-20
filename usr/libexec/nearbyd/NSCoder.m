@interface NSCoder
- (__n128)decodeMatrix4x4ForKey:(void *)a3;
- (__n128)decodeQuatForKey:(void *)a3;
- (__n128)decodeVector3ForKey:(void *)a3;
- (void)encodeMatrix4x4:(__n128)a3 forKey:(__n128)a4;
- (void)encodeQuat:(uint64_t)a3 forKey:(void *)a4;
- (void)encodeVector3:(id)a3 forKey:;
@end

@implementation NSCoder

- (void)encodeMatrix4x4:(__n128)a3 forKey:(__n128)a4
{
  __n128 v10 = a2;
  __n128 v11 = a3;
  __n128 v12 = a4;
  __n128 v13 = a5;
  id v8 = a7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v10, 64LL));
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13);
}

- (__n128)decodeMatrix4x4ForKey:(void *)a3
{
  id v4 = a3;
  if ([a1 containsValueForKey:v4])
  {
    id v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    if ((unint64_t)[v7 length] <= 0x3F)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      __n128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "simd_float4x4 GetMatrix4x4FromNSData(NSData *__strong)"));
      [v9 handleFailureInFunction:v10 file:@"NIVisionSupport.mm" lineNumber:111 description:@"NSData must contain enough bytes for simd_float4x4"];
    }

    [v7 getBytes:&v12 length:64];

    simd_float4 v11 = v12;
  }

  else
  {
    simd_float4 v11 = matrix_identity_float4x4.columns[0];
  }

  return (__n128)v11;
}

- (void)encodeVector3:(id)a3 forKey:
{
  __int128 v7 = v3;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v7, 16LL));
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", v6, v5, v7);
}

- (__n128)decodeVector3ForKey:(void *)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  if ((unint64_t)[v7 length] <= 0xF)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __n128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "simd_float3 GetVector3FromNSData(NSData *__strong)"));
    [v9 handleFailureInFunction:v10 file:@"NINearbyObject.mm" lineNumber:663 description:@"NSData must contain enough bytes for simd_float3"];
  }

  [v7 getBytes:&v12 length:16];
  __int128 v11 = v12;

  return (__n128)v11;
}

- (void)encodeQuat:(uint64_t)a3 forKey:(void *)a4
{
  __n128 v7 = a2;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v7, 16LL));
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);
}

- (__n128)decodeQuatForKey:(void *)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  if ((unint64_t)[v7 length] <= 0xF)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __n128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "simd_quatf GetQuaternionFromNSData(NSData *__strong)"));
    [v9 handleFailureInFunction:v10 file:@"NINearbyObject.mm" lineNumber:670 description:@"NSData must contain enough bytes for simd_quatf"];
  }

  [v7 getBytes:&v12 length:16];

  __int128 v11 = v12;
  return (__n128)v11;
}

@end