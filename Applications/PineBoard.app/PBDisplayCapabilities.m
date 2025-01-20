@interface PBDisplayCapabilities
- ($F24F406B2B787EFB06265DBA3D28CBD5)highestDisplayResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLikelyUpgradeFrom:(id)a3;
- (BOOL)supports120Hz;
- (BOOL)supports4K;
- (BOOL)supportsDolbyVision;
- (BOOL)supportsDynamicRange:(int64_t)a3;
- (BOOL)supportsFilm;
- (BOOL)supportsHD;
- (BOOL)supportsHDR;
- (BOOL)supportsHDR10Plus;
- (BOOL)supportsNTSC;
- (BOOL)supportsPAL;
- (BOOL)supportsQMS;
- (BOOL)supportsVRR;
- (NSData)dataRepresentation;
- (PBDisplayCapabilities)initWithAvailableModes:(id)a3 forDisplay:(id)a4;
- (PBDisplayCapabilities)initWithDataRepresentation:(id)a3;
- (id)debugDescription;
- (int64_t)bestDynamicRange;
- (unsigned)gamutCapability;
- (unsigned)modeCapability;
- (unsigned)modeSwitchCapability;
- (unsigned)refreshCapability;
- (unsigned)resolutionCapability;
@end

@implementation PBDisplayCapabilities

- (PBDisplayCapabilities)initWithAvailableModes:(id)a3 forDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___PBDisplayCapabilities;
  v8 = -[PBDisplayCapabilities init](&v60, "init");
  if (v8)
  {
    v52 = v7;
    id v53 = v6;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v10)
    {
      id v11 = v10;
      v12 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
      uint64_t v13 = *(void *)v57;
      id v54 = v9;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v14);
          if (([v15 isVirtual] & 1) == 0)
          {
            id v16 = objc_alloc((Class)v12[346]);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
            id v18 = [v16 initWithCADisplayMode:v15 usePineBoardPolicy:0 encodedPromotedModes:v17];

            if ([v18 isValid])
            {
              uint64_t v19 = PBSDisplayResolutionIs4K([v18 resolution]);
              if ((v19 & 1) != 0)
              {
                __int16 v20 = 1;
              }

              else
              {
                uint64_t v21 = PBSDisplayResolutionIs1080p(v19);
                if ((v21 & 1) != 0)
                {
                  __int16 v20 = 2;
                }

                else
                {
                  uint64_t v22 = PBSDisplayResolutionIs720p(v21);
                  if ((v22 & 1) != 0)
                  {
                    __int16 v20 = 4;
                  }

                  else
                  {
                    uint64_t v23 = PBSDisplayResolutionIs576p(v22);
                    if ((v23 & 1) != 0)
                    {
                      __int16 v20 = 8;
                    }

                    else if (PBSDisplayResolutionIs480p(v23))
                    {
                      __int16 v20 = 16;
                    }

                    else
                    {
                      __int16 v20 = 0;
                    }
                  }
                }
              }

              id refreshed = [v18 refreshRate];
              uint64_t v25 = 0LL;
              while (1)
              {
                id refreshed = (id)PBSDisplayRefreshRateEqualToRefreshRate(refreshed);
                if ((_DWORD)refreshed) {
                  break;
                }
                if (++v25 == 9)
                {
                  char v26 = 0;
                  goto LABEL_25;
                }
              }

              char v26 = byte_1002EC840[v25];
LABEL_25:
              id v27 = v18;
              LOWORD(v28) = 32;
              switch((unint64_t)[v27 dynamicRange])
              {
                case 0x2017B102uLL:
                  break;
                case 0x2017B103uLL:
                  LOWORD(v28) = 64;
                  break;
                case 0x2017B104uLL:
                  v29 = (char *)[v27 HDR10ChromaSubsampling];
                  else {
                    LOWORD(v28) = 0x20001000080uLL >> (16 * (v29 - 2));
                  }
                  break;
                case 0x2017B105uLL:
                  v30 = (char *)[v27 SDRChromaSubsampling];
                  id v31 = [v27 SDRColorMapping];
                  if (v31 == (id)538424068)
                  {
                    LOWORD(v28) = 16;
                  }

                  else if (v31 == (id)538424067)
                  {
                    LOWORD(v28) = 8;
                  }

                  else
                  {
                    unint64_t v28 = 0x400020001uLL >> (16 * (v30 - 2));
                  }

                  break;
                default:
LABEL_35:
                  LOWORD(v28) = 0;
                  break;
              }

              id v32 = [v27 colorGamut];
              if (v32 == (id)538424323) {
                char v33 = 2;
              }
              else {
                char v33 = 4;
              }
              if (v32 == (id)538424324) {
                char v33 = 1;
              }
              v8->_resolution |= v20;
              v8->_refresh |= v26;
              v8->_mode |= v28;
              v8->_gamut |= v33;
              id v9 = v54;
              v12 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
            }
          }

          v14 = (char *)v14 + 1;
        }

        while (v14 != v11);
        id v34 = [v9 countByEnumeratingWithState:&v56 objects:v61 count:16];
        id v11 = v34;
      }

      while (v34);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = v52;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v52 externalDisplayAttributes]);
    id v37 = [v36 discreteMediaRefreshRate];

    if (v37 == (id)2)
    {
      id v38 = sub_100082A9C();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Display supports QMS/VRR", buf, 2u);
      }

      v8->_modeSwitch |= 3u;
    }

    if ([v35 BOOLForKey:@"FakeVRRSupport"])
    {
      id v40 = sub_100082A9C();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Enabling fake VRR support", buf, 2u);
      }

      v8->_modeSwitch |= 1u;
    }

    id v6 = v53;
    if ([v35 BOOLForKey:@"FakeQMSSupport"])
    {
      id v42 = sub_100082A9C();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Enabling fake QMS support", buf, 2u);
      }

      v8->_modeSwitch |= 2u;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue([v52 externalDisplayAttributes]);
    id v45 = [v44 hdr10PlusMetadata];

    if (v45 == (id)2)
    {
      id v46 = sub_100082A9C();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Display supports HDR10+", buf, 2u);
      }

      v8->_mode |= 0x800u;
    }

    if ([v35 BOOLForKey:@"FakeHDR10+Support"])
    {
      id v48 = sub_100082A9C();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Enabling fake HDR10+ support", buf, 2u);
      }

      v8->_mode |= 0x800u;
    }

    v50 = v8;
  }

  return v8;
}

- (PBDisplayCapabilities)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 6
    && (v8.receiver = self,
        v8.super_class = (Class)&OBJC_CLASS___PBDisplayCapabilities,
        v5 = -[PBDisplayCapabilities init](&v8, "init"),
        (self = v5) != 0LL))
  {
    sub_100039FAC(v4, &v5->_resolution, &v5->_refresh, &v5->_gamut, &v5->_mode, &v5->_modeSwitch);
    self = self;
    id v6 = self;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)debugDescription
{
  id v2 = sub_100039944(self->_resolution, self->_refresh, self->_gamut, self->_mode, self->_modeSwitch);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (NSData)dataRepresentation
{
  id v2 = sub_100039F24(self->_resolution, self->_refresh, self->_gamut, self->_mode, self->_modeSwitch);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (int64_t)bestDynamicRange
{
  unsigned __int16 mode = self->_mode;
  int64_t v3 = 538423557LL;
  if ((mode & 0x1F) == 0) {
    int64_t v3 = 538423807LL;
  }
  if ((self->_mode & 0x780) != 0) {
    int64_t v3 = 538423556LL;
  }
  if ((mode & 0x40) != 0) {
    int64_t v3 = 538423555LL;
  }
  if ((mode & 0x20) != 0) {
    return 538423554LL;
  }
  else {
    return v3;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highestDisplayResolution
{
  switch(self->_resolution & (unsigned __int16)-self->_resolution)
  {
    case 1:
      v2.n128_u64[0] = 0x40AE000000000000LL;
      v3.n128_u64[0] = 0x40A0E00000000000LL;
      goto LABEL_10;
    case 2:
      v2.n128_u64[0] = 0x409E000000000000LL;
      v3.n128_u64[0] = 0x4090E00000000000LL;
      goto LABEL_10;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_4;
    case 4:
      v2.n128_u64[0] = 0x4094000000000000LL;
      v3.n128_u64[0] = 0x4086800000000000LL;
      goto LABEL_10;
    case 8:
      goto LABEL_6;
    default:
LABEL_4:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCode]);
      double refreshed = PBSPreferredRefreshRateForCountryCode(v5);

      if (PBSDisplayRefreshRateIsNTSC(refreshed))
      {
LABEL_5:
        v2.n128_u64[0] = 0x4086800000000000LL;
        uint64_t v7 = 0x407E000000000000LL;
      }

      else
      {
LABEL_6:
        v2.n128_u64[0] = 0x4086800000000000LL;
        uint64_t v7 = 0x4082000000000000LL;
      }

      v3.n128_u64[0] = v7;
LABEL_10:
      PBSDisplayResolutionMake(v2, v3);
      result.var1 = v9;
      result.var0 = v8;
      return result;
  }

- (BOOL)supportsDolbyVision
{
  return (self->_mode & 0x60) != 0;
}

- (BOOL)supportsHDR
{
  return (self->_mode & 0x7E0) != 0;
}

- (BOOL)supports4K
{
  return self->_mode & 1;
}

- (BOOL)supportsHD
{
  return (self->_mode & 0x27) != 0;
}

- (BOOL)supportsPAL
{
  return (self->_refresh & 7) != 0;
}

- (BOOL)supportsNTSC
{
  return (self->_refresh & 0x18) != 0;
}

- (BOOL)supportsFilm
{
  return (self->_refresh & 0x24) != 0;
}

- (BOOL)supports120Hz
{
  return self->_refresh >> 7;
}

- (BOOL)supportsVRR
{
  return self->_modeSwitch & 1;
}

- (BOOL)supportsQMS
{
  return (self->_modeSwitch >> 1) & 1;
}

- (BOOL)supportsHDR10Plus
{
  return (self->_mode >> 11) & 1;
}

- (BOOL)supportsDynamicRange:(int64_t)a3
{
  return (unint64_t)(a3 - 538423554) <= 3
      && ((0x1F078000400020uLL >> (16 * (a3 - 2))) & self->_mode) != 0;
}

- (BOOL)isLikelyUpgradeFrom:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBDisplayCapabilities);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (unsigned __int16 *)v4;
    BOOL v7 = self->_resolution == v6[4]
      && self->_mode == v6[5]
      && self->_gamut == *((unsigned __int8 *)v6 + 12)
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unsigned)resolutionCapability
{
  return self->_resolution;
}

- (unsigned)refreshCapability
{
  return self->_refresh;
}

- (unsigned)gamutCapability
{
  return self->_gamut;
}

- (unsigned)modeCapability
{
  return self->_mode;
}

- (unsigned)modeSwitchCapability
{
  return self->_modeSwitch;
}

@end