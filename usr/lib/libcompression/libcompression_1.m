void BlockSplitterFinishBlockCommand()
{
  void *v0;
  int v1;
  int v2;
  double *v3;
  void *v4;
  unsigned int *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  double v10;
  unsigned int *v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  unsigned int *v17;
  uint64_t v18;
  unsigned int v19;
  double v20;
  double v21;
  uint64_t v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unsigned int *v30;
  uint64_t v31;
  unsigned int v32;
  double v33;
  double v34;
  uint64_t v35;
  unsigned int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  char v42;
  char v43;
  double *v44;
  double v45;
  char *v46;
  uint64_t v47;
  unsigned int *v48;
  unsigned int *v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  double v53;
  uint64_t v54;
  unsigned int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  unsigned int v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  BOOL v69;
  uint64_t v70;
  unint64_t v71;
  unsigned int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int *v78;
  uint64_t v79;
  unsigned int *v80;
  unint64_t v81;
  uint64_t v82;
  int v83;
  void *v84;
  int v85;
  unsigned int *__src;
  void *v87;
  double v88;
  double v89;
  void v90[2];
  _OWORD v91[177];
  _BYTE v92[2832];
  uint64_t v93;
  v0 = (void *)MEMORY[0x1895F8858]();
  v2 = v1;
  v3 = (double *)v0;
  v93 = *MEMORY[0x1895F89C0];
  v4 = (void *)v0[4];
  v5 = (unsigned int *)v0[5];
  v6 = v0[1];
  if (v0[8] > v6) {
    v6 = v0[8];
  }
  v0[8] = v6;
  if (!v0[3])
  {
    v13 = 0LL;
    v14 = 0LL;
    *(_DWORD *)v4[3] = v6;
    *(_BYTE *)v4[2] = 0;
    v15 = (unint64_t)&v5[*v0];
    v16 = 0.0;
    v17 = v5;
    if ((*v0 & 1) != 0) {
      goto LABEL_13;
    }
    while (1)
    {
      if ((unint64_t)v17 >= v15)
      {
        v26 = (double)v13;
        if (v13)
        {
          if (v13 > 0xFF) {
            v27 = log2((double)v13);
          }
          else {
            v27 = kBrotliLog2Table[v13];
          }
          v16 = v16 + v26 * v27;
        }

        if (v16 >= v26) {
          v28 = v16;
        }
        else {
          v28 = (double)v13;
        }
        v3[12] = v28;
        v3[13] = v28;
        ++*((void *)v3 + 3);
        ++*v4;
        v29 = *((void *)v3 + 9) + 1LL;
        *((void *)v3 + 9) = v29;
        if (v29 < **((void **)v3 + 6))
        {
          v30 = &v5[708 * v29];
          bzero(v30, 0xB08uLL);
          *((void *)v30 + 353) = 0x7FF0000000000000LL;
        }

        v3[8] = 0.0;
        goto LABEL_83;
      }

      v19 = *v17++;
      v18 = v19;
      v14 = v13 + v19;
      v20 = (double)v19;
      if (v19 > 0xFF) {
        v21 = log2(v20);
      }
      else {
        v21 = kBrotliLog2Table[v18];
      }
      v16 = v16 - v20 * v21;
LABEL_13:
      v23 = *v17++;
      v22 = v23;
      v13 = v14 + v23;
      v24 = (double)v23;
      if (v23 > 0xFF) {
        v25 = log2(v24);
      }
      else {
        v25 = kBrotliLog2Table[v22];
      }
      v16 = v16 - v24 * v25;
    }
  }

  if (!v6) {
    goto LABEL_83;
  }
  v82 = v0[3];
  v83 = v6;
  v85 = v1;
  v7 = 0LL;
  v8 = 0LL;
  v9 = &v5[708 * v0[9]];
  v10 = *(double *)v0;
  v11 = &v9[*v0];
  v12 = 0.0;
  __src = v9;
  v87 = v0 + 12;
  if ((*v0 & 1) == 0) {
    goto LABEL_28;
  }
  while (1)
  {
    v36 = *v9++;
    v35 = v36;
    v7 = v8 + v36;
    v37 = (double)v36;
    v38 = v36 > 0xFF ? log2(v37) : kBrotliLog2Table[v35];
    v12 = v12 - v37 * v38;
LABEL_28:
    if (v9 >= v11) {
      break;
    }
    v32 = *v9++;
    v31 = v32;
    v8 = v7 + v32;
    v33 = (double)v32;
    if (v32 > 0xFF) {
      v34 = log2(v33);
    }
    else {
      v34 = kBrotliLog2Table[v31];
    }
    v12 = v12 - v33 * v34;
  }

  v39 = (double)v7;
  v84 = v4;
  if (v7)
  {
    if (v7 > 0xFF) {
      v40 = log2((double)v7);
    }
    else {
      v40 = kBrotliLog2Table[v7];
    }
    v12 = v12 + v39 * v40;
  }

  v41 = 0LL;
  v42 = 1;
  if (v12 < v39) {
    v12 = (double)v7;
  }
  do
  {
    v43 = v42;
    v44 = v3;
    v45 = v3[v41 + 10];
    v46 = (char *)&v91[177 * v41];
    memcpy(v46, __src, 0xB10uLL);
    v47 = 0LL;
    v48 = v5;
    v49 = &v5[708 * *(void *)&v45];
    *((void *)v46 + 352) += *((void *)v49 + 352);
    do
    {
      *(_DWORD *)&v46[v47 * 4] += v49[v47];
      ++v47;
    }

    while (v47 != 704);
    v50 = 0LL;
    v51 = 0LL;
    v52 = &v46[4 * *(void *)&v10];
    v53 = 0.0;
    if ((LOBYTE(v10) & 1) != 0) {
      goto LABEL_56;
    }
    while (v46 < v52)
    {
      v55 = *(_DWORD *)v46;
      v46 += 4;
      v54 = v55;
      v51 = v50 + v55;
      v56 = (double)v55;
      if (v55 > 0xFF) {
        v57 = log2(v56);
      }
      else {
        v57 = kBrotliLog2Table[v54];
      }
      v53 = v53 - v56 * v57;
LABEL_56:
      v61 = *(_DWORD *)v46;
      v46 += 4;
      v60 = v61;
      v50 = v51 + v61;
      v62 = (double)v61;
      if (v61 > 0xFF) {
        v63 = log2(v62);
      }
      else {
        v63 = kBrotliLog2Table[v60];
      }
      v53 = v53 - v62 * v63;
    }

    v58 = (double)v50;
    if (v50)
    {
      if (v50 > 0xFF) {
        v59 = log2((double)v50);
      }
      else {
        v59 = kBrotliLog2Table[v50];
      }
      v5 = v48;
      v53 = v53 + v58 * v59;
    }

    else
    {
      v5 = v48;
    }

    v3 = v44;
    v42 = 0;
    if (v53 >= v58) {
      v64 = v53;
    }
    else {
      v64 = v58;
    }
    *(double *)&v90[v41] = v64;
    *(&v88 + v41) = v64 - v12 - *(double *)&v87[v41];
    v41 = 1LL;
  }

  while ((v43 & 1) != 0);
  v4 = v84;
  v65 = *v84;
  if (*v84 >= 0x100uLL)
  {
    v68 = v88;
    v67 = v89;
    v2 = v85;
  }

  else
  {
    v66 = v44[2];
    v68 = v88;
    v67 = v89;
    v69 = v88 <= v66 || v89 <= v66;
    v2 = v85;
    if (!v69)
    {
      *(_DWORD *)(v84[3] + 4 * v82) = v83;
      *(_BYTE *)(v84[2] + v82) = v65;
      v44[11] = v44[10];
      *((void *)v44 + 10) = *(unsigned __int8 *)v84;
      v70 = *((void *)v44 + 12);
      v44[12] = v12;
      *((void *)v44 + 13) = v70;
      ++*((void *)v44 + 3);
      ++*v84;
      v71 = *((void *)v44 + 9) + 1LL;
      *((void *)v44 + 9) = v71;
      if (v71 < **((void **)v44 + 6))
      {
        v72 = &v5[708 * v71];
        bzero(v72, 0xB08uLL);
        *((void *)v72 + 353) = 0x7FF0000000000000LL;
      }

      v44[14] = 0.0;
      v73 = *((void *)v44 + 1);
      v44[8] = 0.0;
LABEL_82:
      *((void *)v44 + 7) = v73;
      goto LABEL_83;
    }
  }

  v74 = v84[3];
  if (v67 < v68 + -20.0)
  {
    *(_DWORD *)(v74 + 4 * v82) = v83;
    *(_BYTE *)(v84[2] + v82) = *(_BYTE *)(v84[2] + v82 - 2);
    v75 = *((void *)v44 + 10);
    v76 = *((void *)v44 + 11);
    *((void *)v44 + 10) = v76;
    *((void *)v44 + 11) = v75;
    memcpy(&v5[708 * v76], v92, 0xB10uLL);
    v77 = *((void *)v44 + 12);
    v44[12] = *(double *)&v90[1];
    *((void *)v44 + 13) = v77;
    ++*((void *)v44 + 3);
    v44[8] = 0.0;
    v78 = &v5[708 * *((void *)v44 + 9)];
    bzero(v78, 0xB08uLL);
    *((void *)v78 + 353) = 0x7FF0000000000000LL;
    v44[14] = 0.0;
    v73 = *((void *)v44 + 1);
    goto LABEL_82;
  }

  *(_DWORD *)(v74 + 4 * v82 - 4) += v83;
  memcpy(&v5[708 * *((void *)v44 + 10)], v91, 0xB10uLL);
  v79 = v90[0];
  v44[12] = *(double *)v90;
  if (*v84 == 1LL) {
    *((void *)v44 + 13) = v79;
  }
  v44[8] = 0.0;
  v80 = &v5[708 * *((void *)v44 + 9)];
  bzero(v80, 0xB08uLL);
  *((void *)v80 + 353) = 0x7FF0000000000000LL;
  v81 = *((void *)v44 + 14) + 1LL;
  *((void *)v44 + 14) = v81;
  if (v81 >= 2)
  {
    v73 = *((void *)v44 + 7) + *((void *)v44 + 1);
    goto LABEL_82;
  }

void BlockSplitterFinishBlockDistance()
{
  v0 = (void *)MEMORY[0x1895F8858]();
  int v2 = v1;
  v3 = (double *)v0;
  uint64_t v93 = *MEMORY[0x1895F89C0];
  v4 = (void *)v0[4];
  v5 = (unsigned int *)v0[5];
  unint64_t v6 = v0[1];
  if (v0[8] > v6) {
    unint64_t v6 = v0[8];
  }
  v0[8] = v6;
  if (!v0[3])
  {
    unint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    *(_DWORD *)v4[3] = v6;
    *(_BYTE *)v4[2] = 0;
    unint64_t v15 = (unint64_t)&v5[*v0];
    double v16 = 0.0;
    v17 = v5;
    if ((*v0 & 1) != 0) {
      goto LABEL_13;
    }
    while (1)
    {
      if ((unint64_t)v17 >= v15)
      {
        double v26 = (double)v13;
        if (v13)
        {
          if (v13 > 0xFF) {
            double v27 = log2((double)v13);
          }
          else {
            double v27 = kBrotliLog2Table[v13];
          }
          double v16 = v16 + v26 * v27;
        }

        if (v16 >= v26) {
          double v28 = v16;
        }
        else {
          double v28 = (double)v13;
        }
        v3[12] = v28;
        v3[13] = v28;
        ++*((void *)v3 + 3);
        ++*v4;
        unint64_t v29 = *((void *)v3 + 9) + 1LL;
        *((void *)v3 + 9) = v29;
        if (v29 < **((void **)v3 + 6))
        {
          v30 = &v5[548 * v29];
          bzero(v30, 0x888uLL);
          *((void *)v30 + 273) = 0x7FF0000000000000LL;
        }

        v3[8] = 0.0;
        goto LABEL_83;
      }

      unsigned int v19 = *v17++;
      uint64_t v18 = v19;
      unint64_t v14 = v13 + v19;
      double v20 = (double)v19;
      if (v19 > 0xFF) {
        double v21 = log2(v20);
      }
      else {
        double v21 = kBrotliLog2Table[v18];
      }
      double v16 = v16 - v20 * v21;
LABEL_13:
      unsigned int v23 = *v17++;
      uint64_t v22 = v23;
      unint64_t v13 = v14 + v23;
      double v24 = (double)v23;
      if (v23 > 0xFF) {
        double v25 = log2(v24);
      }
      else {
        double v25 = kBrotliLog2Table[v22];
      }
      double v16 = v16 - v24 * v25;
    }
  }

  if (!v6) {
    goto LABEL_83;
  }
  uint64_t v82 = v0[3];
  int v83 = v6;
  int v85 = v1;
  unint64_t v7 = 0LL;
  unint64_t v8 = 0LL;
  v9 = &v5[548 * v0[9]];
  double v10 = *(double *)v0;
  v11 = &v9[*v0];
  double v12 = 0.0;
  __src = v9;
  v87 = v0 + 12;
  if ((*v0 & 1) == 0) {
    goto LABEL_28;
  }
  while (1)
  {
    unsigned int v36 = *v9++;
    uint64_t v35 = v36;
    unint64_t v7 = v8 + v36;
    double v37 = (double)v36;
    double v38 = v36 > 0xFF ? log2(v37) : kBrotliLog2Table[v35];
    double v12 = v12 - v37 * v38;
LABEL_28:
    if (v9 >= v11) {
      break;
    }
    unsigned int v32 = *v9++;
    uint64_t v31 = v32;
    unint64_t v8 = v7 + v32;
    double v33 = (double)v32;
    if (v32 > 0xFF) {
      double v34 = log2(v33);
    }
    else {
      double v34 = kBrotliLog2Table[v31];
    }
    double v12 = v12 - v33 * v34;
  }

  double v39 = (double)v7;
  v84 = v4;
  if (v7)
  {
    if (v7 > 0xFF) {
      double v40 = log2((double)v7);
    }
    else {
      double v40 = kBrotliLog2Table[v7];
    }
    double v12 = v12 + v39 * v40;
  }

  uint64_t v41 = 0LL;
  char v42 = 1;
  if (v12 < v39) {
    double v12 = (double)v7;
  }
  do
  {
    char v43 = v42;
    v44 = v3;
    double v45 = v3[v41 + 10];
    v46 = (char *)&v91[137 * v41];
    memcpy(v46, __src, 0x890uLL);
    uint64_t v47 = 0LL;
    v48 = v5;
    v49 = &v5[548 * *(void *)&v45];
    *((void *)v46 + 272) += *((void *)v49 + 272);
    do
    {
      *(_DWORD *)&v46[v47 * 4] += v49[v47];
      ++v47;
    }

    while (v47 != 544);
    unint64_t v50 = 0LL;
    unint64_t v51 = 0LL;
    v52 = &v46[4 * *(void *)&v10];
    double v53 = 0.0;
    if ((LOBYTE(v10) & 1) != 0) {
      goto LABEL_56;
    }
    while (v46 < v52)
    {
      unsigned int v55 = *(_DWORD *)v46;
      v46 += 4;
      uint64_t v54 = v55;
      unint64_t v51 = v50 + v55;
      double v56 = (double)v55;
      if (v55 > 0xFF) {
        double v57 = log2(v56);
      }
      else {
        double v57 = kBrotliLog2Table[v54];
      }
      double v53 = v53 - v56 * v57;
LABEL_56:
      unsigned int v61 = *(_DWORD *)v46;
      v46 += 4;
      uint64_t v60 = v61;
      unint64_t v50 = v51 + v61;
      double v62 = (double)v61;
      if (v61 > 0xFF) {
        double v63 = log2(v62);
      }
      else {
        double v63 = kBrotliLog2Table[v60];
      }
      double v53 = v53 - v62 * v63;
    }

    double v58 = (double)v50;
    if (v50)
    {
      if (v50 > 0xFF) {
        double v59 = log2((double)v50);
      }
      else {
        double v59 = kBrotliLog2Table[v50];
      }
      v5 = v48;
      double v53 = v53 + v58 * v59;
    }

    else
    {
      v5 = v48;
    }

    v3 = v44;
    char v42 = 0;
    if (v53 >= v58) {
      double v64 = v53;
    }
    else {
      double v64 = v58;
    }
    *(double *)&v90[v41] = v64;
    *(&v88 + v41) = v64 - v12 - *(double *)&v87[v41];
    uint64_t v41 = 1LL;
  }

  while ((v43 & 1) != 0);
  v4 = v84;
  uint64_t v65 = *v84;
  if (*v84 >= 0x100uLL)
  {
    double v68 = v88;
    double v67 = v89;
    int v2 = v85;
  }

  else
  {
    double v66 = v44[2];
    double v68 = v88;
    double v67 = v89;
    BOOL v69 = v88 <= v66 || v89 <= v66;
    int v2 = v85;
    if (!v69)
    {
      *(_DWORD *)(v84[3] + 4 * v82) = v83;
      *(_BYTE *)(v84[2] + v82) = v65;
      v44[11] = v44[10];
      *((void *)v44 + 10) = *(unsigned __int8 *)v84;
      uint64_t v70 = *((void *)v44 + 12);
      v44[12] = v12;
      *((void *)v44 + 13) = v70;
      ++*((void *)v44 + 3);
      ++*v84;
      unint64_t v71 = *((void *)v44 + 9) + 1LL;
      *((void *)v44 + 9) = v71;
      if (v71 < **((void **)v44 + 6))
      {
        v72 = &v5[548 * v71];
        bzero(v72, 0x888uLL);
        *((void *)v72 + 273) = 0x7FF0000000000000LL;
      }

      v44[14] = 0.0;
      uint64_t v73 = *((void *)v44 + 1);
      v44[8] = 0.0;
LABEL_82:
      *((void *)v44 + 7) = v73;
      goto LABEL_83;
    }
  }

  uint64_t v74 = v84[3];
  if (v67 < v68 + -20.0)
  {
    *(_DWORD *)(v74 + 4 * v82) = v83;
    *(_BYTE *)(v84[2] + v82) = *(_BYTE *)(v84[2] + v82 - 2);
    uint64_t v75 = *((void *)v44 + 10);
    uint64_t v76 = *((void *)v44 + 11);
    *((void *)v44 + 10) = v76;
    *((void *)v44 + 11) = v75;
    memcpy(&v5[548 * v76], v92, 0x890uLL);
    uint64_t v77 = *((void *)v44 + 12);
    v44[12] = *(double *)&v90[1];
    *((void *)v44 + 13) = v77;
    ++*((void *)v44 + 3);
    v44[8] = 0.0;
    v78 = &v5[548 * *((void *)v44 + 9)];
    bzero(v78, 0x888uLL);
    *((void *)v78 + 273) = 0x7FF0000000000000LL;
    v44[14] = 0.0;
    uint64_t v73 = *((void *)v44 + 1);
    goto LABEL_82;
  }

  *(_DWORD *)(v74 + 4 * v82 - 4) += v83;
  memcpy(&v5[548 * *((void *)v44 + 10)], v91, 0x890uLL);
  uint64_t v79 = v90[0];
  v44[12] = *(double *)v90;
  if (*v84 == 1LL) {
    *((void *)v44 + 13) = v79;
  }
  v44[8] = 0.0;
  v80 = &v5[548 * *((void *)v44 + 9)];
  bzero(v80, 0x888uLL);
  *((void *)v80 + 273) = 0x7FF0000000000000LL;
  unint64_t v81 = *((void *)v44 + 14) + 1LL;
  *((void *)v44 + 14) = v81;
  if (v81 >= 2)
  {
    uint64_t v73 = *((void *)v44 + 7) + *((void *)v44 + 1);
    goto LABEL_82;
  }

uint64_t MapStaticContexts(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = *a4 << 6;
  a4[19] = v8;
  if (v8) {
    uint64_t result = BrotliAllocate(a1);
  }
  else {
    uint64_t result = 0LL;
  }
  a4[18] = result;
  if (!*(_DWORD *)(a1 + 24))
  {
    uint64_t v10 = *a4;
    if (*a4)
    {
      uint64_t v11 = 0LL;
      do
      {
        for (uint64_t i = 0LL; i != 256; i += 4LL)
          *(_DWORD *)(result + i) = *(_DWORD *)(a3 + i) + v11 * a2;
        ++v11;
        result += 256LL;
      }

      while (v11 != v10);
    }
  }

  return result;
}

uint64_t lzfse_decode_scratch_size(int a1)
{
  if (a1 == 2193) {
    return 22376LL;
  }
  else {
    return 47376LL;
  }
}

uint64_t lzfse_decode_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  if (a6 == 2193) {
    size_t v11 = 22376LL;
  }
  else {
    size_t v11 = 47376LL;
  }
  if (a6 == 2193) {
    int v12 = 15000;
  }
  else {
    int v12 = 40000;
  }
  bzero(a5, v11);
  *a5 = a3;
  a5[1] = a3;
  a5[2] = a3 + a4;
  a5[3] = a1;
  a5[4] = a1;
  a5[5] = a1 + a2;
  *((_DWORD *)a5 + 1826) = v12;
  int v13 = lzfseDecode((uint64_t)a5);
  if (v13 != -2)
  {
    if (v13) {
      return 0LL;
    }
    else {
      return a5[3] - a1;
    }
  }

  return a2;
}

uint64_t lzfseEncodeGetScratchSize(int a1)
{
  uint64_t v1 = 684288LL;
  if (a1 == 2193) {
    uint64_t v1 = 584288LL;
  }
  if (a1 == 2050) {
    return 64768LL;
  }
  else {
    return v1;
  }
}

uint64_t lzfseEncodeSetStateScratch(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 68);
  uint64_t v3 = a2 + (32LL << *(_DWORD *)(a1 + 64));
  *(void *)(a1 + 112) = a2;
  *(void *)(a1 + 120) = v3;
  uint64_t v4 = v3 + 4 * v2;
  uint64_t v5 = v4 + 4 * v2;
  *(void *)(a1 + 128) = v4;
  *(void *)(a1 + 136) = v5;
  *(void *)(a1 + 144) = v5 + 4 * v2;
  return 0LL;
}

uint64_t lzfseEncodeInitState(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 2050) {
    int v3 = 10;
  }
  else {
    int v3 = 14;
  }
  *(_DWORD *)(a1 + 64) = v3;
  int8x8_t v4 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a2 == 2050), 0x1FuLL)),  (int8x8_t)34359738370000LL,  vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a2 == 2193), 0x1FuLL)),  (int8x8_t)0x3A9800000EA6LL,  (int8x8_t)171798691850000LL));
  *(int8x8_t *)(a1 + 68) = v4;
  uint64_t v5 = a3 + (32LL << v3);
  *(void *)(a1 + 112) = a3;
  *(void *)(a1 + 120) = v5;
  uint64_t v6 = (4 * v4.i32[0]);
  uint64_t v7 = v5 + v6;
  *(void *)(a1 + 128) = v7;
  *(void *)(a1 + 136) = v7 + v6;
  *(void *)(a1 + 144) = v7 + v6 + v6;
  unsigned int v8 = 1;
  int32x4_t v9 = vdupq_n_s32(0xFFF00014);
  do
  {
    uint64_t v10 = (int32x4_t *)(a3 + 32LL * (v8 - 1));
    v10[1].i64[0] = 0LL;
    v10[1].i64[1] = 0LL;
    *uint64_t v10 = v9;
    LODWORD(v10) = v8++ >> v3;
  }

  while (!(_DWORD)v10);
  *(void *)(a1 + 16) = 0LL;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return 0LL;
}

uint64_t lzfseEncodeTranslateState(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    *(void *)a1 += a2;
    int64x2_t v2 = vdupq_n_s64(a2);
    *(int64x2_t *)(a1 + 24) = vsubq_s64(*(int64x2_t *)(a1 + 24), v2);
    *(int64x2_t *)(a1 + 8) = vsubq_s64(*(int64x2_t *)(a1 + 8), v2);
    *(int64x2_t *)(a1 + 80) = vsubq_s64(*(int64x2_t *)(a1 + 80), v2);
    int32x4_t v3 = vdupq_n_s32(a2);
    int v4 = *(_DWORD *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 112);
    unsigned int v6 = 1;
    int32x4_t v7 = vdupq_n_s32(0xFFF00014);
    do
      *(int32x4_t *)(v5 + 32LL * (v6 - 1)) = vmaxq_s32(vsubq_s32(*(int32x4_t *)(v5 + 32LL * (v6 - 1)), v3), v7);
    while (!(v6++ >> v4));
  }

  return 0LL;
}

uint64_t lzfseEncodeBase(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1 < *(void *)(a1 + 32))
  {
    uint64_t v3 = a1 + 80;
    int32x4_t v32 = vdupq_n_s32(0x3FFFBu);
    int8x16_t v4 = (int8x16_t)xmmword_1810D3B90;
    do
    {
      uint64_t v5 = *(void *)a1;
      unsigned int v6 = (unsigned int *)(*(void *)a1 + v1);
      unsigned int v7 = *v6;
      unsigned int v8 = (int32x4_t *)(*(void *)(a1 + 112) + 32LL * ((-1640531535 * *v6) >> -*(_BYTE *)(a1 + 64)));
      int32x4_t v9 = *v8;
      int32x4_t v10 = v8[1];
      int64_t v11 = *(void *)(a1 + 16);
      if (v1 >= v11)
      {
        int8x16_t v4 = vandq_s8( (int8x16_t)vcgeq_s32(vaddq_s32(v9, v32), vdupq_n_s32(v1)),  (int8x16_t)vceqq_s32(v10, vdupq_n_s32(v7)));
        if ((vmaxvq_u32((uint32x4_t)v4) & 0x80000000) != 0)
        {
          int v14 = 0;
          unsigned int v15 = 0;
          uint64_t v16 = 0LL;
          do
          {
            int8x16_t v36 = v4;
            if (*(_DWORD *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3LL | (4LL * (v14 & 3))))
            {
              int32x4_t v35 = v9;
              unsigned int v17 = 4;
              while (v17 < *(_DWORD *)(a1 + 8) - (int)v1 - 8)
              {
                uint64_t v18 = *(void *)(v5 + *(int *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3LL | (4LL * (v14 & 3))) + v17);
                uint64_t v19 = *(void *)((char *)v6 + v17);
                v17 += 8;
                unint64_t v20 = v19 ^ v18;
                if (v20)
                {
                  unsigned int v17 = v17 + (__clz(__rbit64(v20)) >> 3) - 8;
                  break;
                }
              }

              if (v17 > v15)
              {
                uint64_t v16 = *(int *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3LL | (4LL * (v14 & 3)));
                unsigned int v15 = v17;
              }
            }

            ++v14;
          }

          while (v14 != 4);
          LODWORD(v38) = v15;
          v37.i64[1] = v16;
          if (v15)
          {
            if (v15 >= 0x3997C) {
              int v21 = 235900;
            }
            else {
              int v21 = v15;
            }
            if (v1 <= v11 || v16 < 1)
            {
              uint64_t v24 = v16;
              int64_t v23 = v1;
            }

            else
            {
              uint64_t v22 = v5 - 1;
              int64_t v23 = v1;
              while (*(unsigned __int8 *)(v22 + v16) == *(unsigned __int8 *)(v22 + v23))
              {
                --v23;
                uint64_t v24 = v16 - 1;
                goto LABEL_32;
              }

              uint64_t v24 = v16;
            }

LABEL_38:
      int8x16_t v4 = vextq_s8(v4, (int8x16_t)v10, 0xCuLL);
      int8x16_t v28 = vextq_s8(v4, (int8x16_t)v9, 0xCuLL);
      v28.i32[0] = v1;
      v4.i32[0] = v7;
      *unsigned int v8 = (int32x4_t)v28;
      v8[1] = (int32x4_t)v4;
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v1 = *(void *)(a1 + 24) + 1LL;
      *(void *)(a1 + 24) = v1;
    }

    while (v1 < v29);
  }

  return 0LL;
}

uint64_t lzfseBackendMatch(uint64_t *a1, int *a2)
{
  uint64_t result = lzfsePushMatch(a1, a2);
  if ((_DWORD)result)
  {
    else {
      return lzfsePushMatch(a1, a2);
    }
  }

  return result;
}

uint64_t lzfseEncodeFinish(uint64_t *a1)
{
  if (*((_DWORD *)a1 + 24))
  {
    int64x2_t v2 = a1 + 10;
    *int64x2_t v2 = 0LL;
    a1[11] = 0LL;
    a1[12] = 0LL;
  }

  uint64_t v3 = a1[1];
  if (v3 <= a1[2] || (v6[0] = a1[1], v6[1] = v3 - 1, int v7 = 0, !lzfseBackendMatch(a1, (int *)v6)))
  {
    if (!lzfseEncodeMatches())
    {
      int8x16_t v4 = (_DWORD *)a1[5];
      if ((unint64_t)(v4 + 1) <= a1[7])
      {
        uint64_t result = 0LL;
        _DWORD *v4 = 611874402;
        a1[5] = (uint64_t)(v4 + 1);
        return result;
      }
    }
  }

  return 4294967294LL;
}

uint64_t lzfsePushMatch(uint64_t *a1, int *a2)
{
  int v3 = *((_DWORD *)a1 + 26);
  int v4 = *((_DWORD *)a1 + 27);
  uint64_t v5 = a1[2];
  int v6 = *a2;
  unsigned int v7 = *a2 - v5;
  unsigned int v8 = a2[4];
  int v9 = a2[2];
  if (v7 >= 0x13C)
  {
    uint64_t v10 = a1[2];
    int v11 = *((_DWORD *)a1 + 27);
    while (1)
    {
      uint64_t v12 = *((unsigned int *)a1 + 26);
      *((_DWORD *)a1 + 26) = v12 + 1;
      uint64_t v13 = a1[16];
      *(_DWORD *)(a1[15] + 4 * v12) = 315;
      *(_DWORD *)(v13 + 4 * v12) = 0;
      uint64_t v14 = a1[18];
      *(_DWORD *)(a1[17] + 4 * v12) = 1;
      unsigned int v15 = (char *)(v14 + *((unsigned int *)a1 + 27));
      uint64_t v16 = (__int128 *)(*a1 + v10);
      if (v10 + 331 <= a1[1])
      {
        unsigned int v17 = v15 + 315;
        __int128 v19 = *v16;
        uint64_t v18 = v16 + 1;
        *(_OWORD *)unsigned int v15 = v19;
        unint64_t v20 = v15 + 16;
        do
        {
          __int128 v21 = *v18++;
          *(_OWORD *)unint64_t v20 = v21;
          v20 += 16;
        }

        while (v20 < v17);
      }

      else
      {
        memcpy(v15, v16, 0x13BuLL);
      }

      int v11 = *((_DWORD *)a1 + 27) + 315;
      *((_DWORD *)a1 + 27) = v11;
      uint64_t v10 = a1[2] + 315;
      a1[2] = v10;
      v7 -= 315;
      if (v7 <= 0x13B) {
        goto LABEL_12;
      }
    }
  }

  uint64_t v10 = a1[2];
  int v11 = *((_DWORD *)a1 + 27);
LABEL_12:
  int v22 = v6 - v9;
  if (v8 >= 0x938)
  {
    while (1)
    {
      uint64_t v23 = *((unsigned int *)a1 + 26);
      *((_DWORD *)a1 + 26) = v23 + 1;
      uint64_t v24 = a1[16];
      *(_DWORD *)(a1[15] + 4 * v23) = v7;
      *(_DWORD *)(v24 + 4 * v23) = 2359;
      uint64_t v25 = a1[18];
      *(_DWORD *)(a1[17] + 4 * v23) = v22;
      int v26 = (_OWORD *)(v25 + *((unsigned int *)a1 + 27));
      uint64_t v27 = *a1;
      int8x16_t v28 = (_OWORD *)(*a1 + v10);
      if (v10 + v7 + 16 <= a1[1])
      {
        *int v26 = *v28;
        if (v7 >= 0x11)
        {
          uint64_t v29 = v26 + 1;
          uint64_t v30 = (__int128 *)(v27 + v10 + 16);
          do
          {
            __int128 v31 = *v30++;
            *v29++ = v31;
          }

          while (v29 < (_OWORD *)((char *)v26 + v7));
        }
      }

      else if (v7)
      {
        memcpy(v26, v28, v7);
      }

      unsigned int v32 = 0;
      int v11 = *((_DWORD *)a1 + 27) + v7;
      *((_DWORD *)a1 + 27) = v11;
      uint64_t v10 = a1[2] + v7 + 2359;
      a1[2] = v10;
      v8 -= 2359;
      unsigned int v7 = 0;
      if (v8 <= 0x937) {
        goto LABEL_24;
      }
    }
  }

  unsigned int v32 = v7;
LABEL_24:
  if (v8 | v32)
  {
    uint64_t v33 = *((unsigned int *)a1 + 26);
    if ((v33 + 9) <= *((_DWORD *)a1 + 17) && v32 + v11 + 16 <= *((_DWORD *)a1 + 18))
    {
      *((_DWORD *)a1 + 26) = v33 + 1;
      uint64_t v35 = a1[16];
      *(_DWORD *)(a1[15] + 4 * v33) = v32;
      *(_DWORD *)(v35 + 4 * v33) = v8;
      uint64_t v36 = a1[18];
      *(_DWORD *)(a1[17] + 4 * v33) = v22;
      int8x16_t v37 = (_OWORD *)(v36 + *((unsigned int *)a1 + 27));
      uint64_t v38 = *a1;
      int64x2_t v39 = (_OWORD *)(*a1 + v10);
      if (v10 + v32 + 16 <= a1[1])
      {
        *int8x16_t v37 = *v39;
        if (v32 >= 0x11)
        {
          int v40 = v37 + 1;
          uint64_t v41 = (__int128 *)(v10 + v38 + 16);
          do
          {
            __int128 v42 = *v41++;
            *v40++ = v42;
          }

          while (v40 < (_OWORD *)((char *)v37 + v32));
        }
      }

      else if (v32)
      {
        memcpy(v37, v39, v32);
      }

      uint64_t result = 0LL;
      *((_DWORD *)a1 + 27) += v32;
      uint64_t v5 = a1[2] + v8 + v32;
      goto LABEL_28;
    }

uint64_t lzfseEncodeMatches()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v1 = v0;
  uint64_t v252 = *MEMORY[0x1895F89C0];
  unsigned int v2 = *(_DWORD *)(v0 + 108);
  if (v2)
  {
    bzero(&v233, 0x304uLL);
    int v3 = (unint64_t **)(v1 + 40);
    uint64_t v230 = *(void *)(v1 + 40);
    unsigned int v231 = v2;
    if ((v2 & 3) != 0)
    {
      unsigned int v4 = v2;
      do
      {
        *(_DWORD *)(v1 + 108) = v4 + 1;
        *(_BYTE *)(*(void *)(v1 + 144) + v4) = 0;
        unsigned int v4 = *(_DWORD *)(v1 + 108);
      }

      while ((v4 & 3) != 0);
    }
  }

  else
  {
    if (!*(_DWORD *)(v0 + 104)) {
      return 0LL;
    }
    unsigned int v231 = 0;
    bzero(&v233, 0x304uLL);
    int v3 = (unint64_t **)(v1 + 40);
    uint64_t v230 = *(void *)(v1 + 40);
  }

  unint64_t v5 = *(unsigned int *)(v1 + 104);
  if ((_DWORD)v5)
  {
    unint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)(v1 + 136);
    do
    {
      uint64_t v9 = *(unsigned int *)(v8 + 4 * v6);
      if ((_DWORD)v9 == (_DWORD)v7)
      {
        *(_DWORD *)(v8 + 4 * v6) = 0;
        unint64_t v5 = *(unsigned int *)(v1 + 104);
        uint64_t v9 = v7;
      }

      ++v6;
      uint64_t v7 = v9;
    }

    while (v6 < v5);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  memset(v250, 0, sizeof(v250));
  memset(v251, 0, 80);
  memset(v249, 0, sizeof(v249));
  bzero(v248, 0x400uLL);
  if (v5)
  {
    int v10 = 0;
    int v11 = *(int **)(v1 + 120);
    unint64_t v12 = v5;
    do
    {
      uint64_t v13 = *v11++;
      v10 += v13;
      ++v251[getLSymbolFromValue_sym[v13]];
      --v12;
    }

    while (v12);
    int v14 = 0;
    unsigned int v15 = *(int **)(v1 + 128);
    unint64_t v16 = v5;
    do
    {
      uint64_t v17 = *v15++;
      v14 += v17;
      ++*(_DWORD *)&v250[4 * getMSymbolFromValue_sym[v17]];
      --v16;
    }

    while (v16);
    uint64_t v18 = *(unsigned int **)(v1 + 136);
    unint64_t v19 = v5;
    do
    {
      unsigned int v21 = *v18++;
      unsigned int v20 = v21;
      unsigned int v22 = v21 - 60;
      if (v21 >= 0x3C) {
        char v23 = 0;
      }
      else {
        char v23 = v20;
      }
      if (v22 >= 0x3C0) {
        char v24 = 0;
      }
      else {
        char v24 = (v22 >> 4) + 64;
      }
      char v25 = v24 | v23;
      if ((v20 - 1020) >> 10 >= 0xF) {
        char v26 = 0;
      }
      else {
        char v26 = ((unsigned __int16)(v20 - 1020) >> 8) + 0x80;
      }
      unsigned int v27 = v20 - 16380;
      unsigned int v28 = ((v20 + 1032196) >> 12) + 192;
      if (v27 >= 0x3C000) {
        LOBYTE(v28) = 0;
      }
      uint64_t v29 = getDSymbolFromValue_sym[(v25 | v26 | v28)];
      ++*(_DWORD *)&v249[4 * v29];
      --v19;
    }

    while (v19);
  }

  else
  {
    int v14 = 0;
    int v10 = 0;
  }

  unsigned int v30 = *(_DWORD *)(v1 + 108);
  if (v30)
  {
    __int128 v31 = *(unsigned __int8 **)(v1 + 144);
    uint64_t v32 = *(unsigned int *)(v1 + 108);
    do
    {
      int v33 = *v31++;
      ++v248[v33];
      --v32;
    }

    while (v32);
  }

  uint64_t v232 = *(void *)(v1 + 40);
  uint64_t v34 = 0LL;
  int v233 = 829978210;
  int v234 = v14 + v10;
  unsigned int v235 = v30;
  unsigned int v236 = v5;
  int32x4_t v35 = 0uLL;
  do
  {
    int32x4_t v35 = vaddq_s32(*(int32x4_t *)&v251[v34], v35);
    v34 += 4LL;
  }

  while (v34 != 20);
  unsigned int v36 = vaddvq_s32(v35);
  if (v36) {
    unsigned int v37 = 0x80000000 / v36;
  }
  else {
    unsigned int v37 = 0;
  }
  uint64_t v38 = 0LL;
  int v39 = 0;
  unsigned int v40 = 0;
  int v41 = 64;
  do
  {
    int v42 = v251[v38];
    unsigned int v43 = (v42 * v37) >> 24;
    unsigned int v44 = v42 != 0;
    if (v43) {
      unsigned int v44 = (v43 + 1) >> 1;
    }
    v240[v38] = v44;
    v41 -= v44;
    BOOL v45 = v44 > v40;
    if (v45) {
      int v39 = v38;
    }
    ++v38;
  }

  while (v38 != 20);
  else {
    v240[v39] += v41;
  }
  uint64_t v46 = 0LL;
  int32x4_t v47 = 0uLL;
  do
  {
    int32x4_t v47 = vaddq_s32(*(int32x4_t *)&v250[v46], v47);
    v46 += 16LL;
  }

  while (v46 != 80);
  unsigned int v48 = vaddvq_s32(v47);
  if (v48) {
    unsigned int v49 = 0x80000000 / v48;
  }
  else {
    unsigned int v49 = 0;
  }
  uint64_t v50 = 0LL;
  int v51 = 0;
  unsigned int v52 = 0;
  int v53 = 64;
  do
  {
    int v54 = *(_DWORD *)&v250[4 * v50];
    unsigned int v55 = (v54 * v49) >> 24;
    unsigned int v56 = v54 != 0;
    if (v55) {
      unsigned int v56 = (v55 + 1) >> 1;
    }
    v241[v50] = v56;
    v53 -= v56;
    BOOL v57 = v56 > v52;
    if (v57) {
      int v51 = v50;
    }
    ++v50;
  }

  while (v50 != 20);
  else {
    v241[v51] += v53;
  }
  uint64_t v58 = 0LL;
  int32x4_t v59 = 0uLL;
  do
  {
    int32x4_t v59 = vaddq_s32(*(int32x4_t *)&v249[v58], v59);
    v58 += 16LL;
  }

  while (v58 != 256);
  unsigned int v60 = vaddvq_s32(v59);
  if (v60) {
    unsigned int v61 = 0x80000000 / v60;
  }
  else {
    unsigned int v61 = 0;
  }
  uint64_t v62 = 0LL;
  int v63 = 0;
  unsigned int v64 = 0;
  int v65 = 256;
  do
  {
    int v66 = *(_DWORD *)&v249[4 * v62];
    unsigned int v67 = v66 * v61;
    unsigned int v68 = (((v66 * v61) >> 22) + 1) >> 1;
    unsigned int v69 = v66 != 0;
    if (v67 >= 0x400000) {
      unsigned int v69 = v68;
    }
    v242[v62] = v69;
    v65 -= v69;
    BOOL v70 = v69 > v64;
    if (v70) {
      int v63 = v62;
    }
    ++v62;
  }

  while (v62 != 64);
  else {
    v242[v63] += v65;
  }
  uint64_t v71 = 0LL;
  int32x4_t v72 = 0uLL;
  do
  {
    int32x4_t v72 = vaddq_s32(*(int32x4_t *)&v248[v71], v72);
    v71 += 4LL;
  }

  while (v71 != 256);
  unsigned int v73 = vaddvq_s32(v72);
  if (v73) {
    unsigned int v74 = 0x80000000 / v73;
  }
  else {
    unsigned int v74 = 0;
  }
  uint64_t v75 = 0LL;
  int v76 = 0;
  unsigned int v77 = 0;
  int v78 = 1024;
  do
  {
    int v79 = v248[v75];
    unsigned int v80 = v79 * v74;
    unsigned int v81 = (((v79 * v74) >> 20) + 1) >> 1;
    unsigned int v82 = v79 != 0;
    if (v80 >= 0x100000) {
      unsigned int v82 = v81;
    }
    v243[v75] = v82;
    v78 -= v82;
    BOOL v83 = v82 > v77;
    if (v83) {
      int v76 = v75;
    }
    ++v75;
  }

  while (v75 != 256);
  else {
    v243[v76] += v78;
  }
  uint64_t v84 = 0LL;
  unsigned int v85 = 0;
  int v86 = 0;
  v87 = (_BYTE *)(v232 + 32);
  do
  {
    unsigned int v88 = (unsigned __int16)v240[v84];
    unsigned int v89 = (__int16)v88;
    if (v88 >= 8)
    {
      int v92 = 16 * v88;
      int v93 = v92 - 369;
      int v91 = v92 - 121;
      BOOL v94 = v89 > 0x17;
      if (v89 <= 0x17) {
        int v90 = 8;
      }
      else {
        int v90 = 14;
      }
      if (v94) {
        int v91 = v93;
      }
    }

    else
    {
      int v90 = dword_1810D4920[(__int16)v88];
      int v91 = dword_1810D4940[(__int16)v88];
    }

    v85 |= v91 << v86;
    int v95 = v90 + v86;
    if (v95 < 8)
    {
      int v86 = v95;
    }

    else
    {
      do
      {
        *v87++ = v85;
        v85 >>= 8;
        int v86 = v95 - 8;
        BOOL v45 = v95 > 0xF;
        v95 -= 8;
      }

      while (v45);
    }

    ++v84;
  }

  while (v84 != 360);
  if (v86 > 0)
  {
    _BYTE *v87 = v85;
    LODWORD(v87) = (_DWORD)v87 + 1;
  }

  uint64_t v96 = 0LL;
  int v97 = 0;
  uint64_t v98 = ((_DWORD)v87 - v232);
  *(void *)(v232 + 8) = 0LL;
  *(void *)(v232 + 16) = 0LL;
  *(void *)(v232 + 24) = v98;
  v99 = (unint64_t *)((char *)*v3 + v98);
  double *v3 = v99;
  v100 = &v247;
  do
  {
    unsigned int v101 = (unsigned __int16)v240[v96];
    if (v240[v96])
    {
      __int16 v102 = __clz(v101);
      *((_WORD *)v100 - 2) = (v101 << (v102 - 25)) - 64;
      *((_WORD *)v100 - 1) = v102 - 25;
      *(_WORD *)v100 = (0x40u >> (v102 - 25)) + v97 - v101;
      *((_WORD *)v100 + 1) = (0x40u >> (v102 - 26)) + v97 - v101;
      v97 += v101;
    }

    ++v96;
    v100 += 2;
  }

  while (v96 != 20);
  uint64_t v103 = 0LL;
  int v104 = 0;
  v105 = v246;
  do
  {
    unsigned int v106 = (unsigned __int16)v241[v103];
    if (v241[v103])
    {
      __int16 v107 = __clz(v106);
      *(v105 - 2) = (v106 << (v107 - 25)) - 64;
      *(v105 - 1) = v107 - 25;
      _WORD *v105 = (0x40u >> (v107 - 25)) + v104 - v106;
      v105[1] = (0x40u >> (v107 - 26)) + v104 - v106;
      v104 += v106;
    }

    ++v103;
    v105 += 4;
  }

  while (v103 != 20);
  uint64_t v108 = 0LL;
  int v109 = 0;
  v110 = v245;
  do
  {
    unsigned int v111 = (unsigned __int16)v242[v108];
    if (v242[v108])
    {
      __int16 v112 = __clz(v111);
      *(v110 - 2) = (v111 << (v112 - 23)) - 256;
      *(v110 - 1) = v112 - 23;
      _WORD *v110 = (0x100u >> (v112 - 23)) + v109 - v111;
      v110[1] = (0x100u >> (v112 - 24)) + v109 - v111;
      v109 += v111;
    }

    ++v108;
    v110 += 4;
  }

  while (v108 != 64);
  uint64_t v113 = 0LL;
  int v114 = 0;
  v115 = v244;
  do
  {
    unsigned int v116 = (unsigned __int16)v243[v113];
    if (v243[v113])
    {
      __int16 v117 = __clz(v116);
      *(v115 - 2) = (v116 << (v117 - 21)) - 1024;
      *(v115 - 1) = v117 - 21;
      _WORD *v115 = (0x400u >> (v117 - 21)) + v114 - v116;
      v115[1] = (0x400u >> (v117 - 22)) + v114 - v116;
      v114 += v116;
    }

    ++v113;
    v115 += 4;
  }

  while (v113 != 256);
  int v118 = *(_DWORD *)(v1 + 108);
  if (v118)
  {
    int v119 = 0;
    LOWORD(v120) = 0;
    LOWORD(v121) = 0;
    LOWORD(v122) = 0;
    LOWORD(v123) = 0;
    unint64_t v124 = 0LL;
    unsigned int v125 = v118 - 2;
    while ((unint64_t)(v99 + 2) <= *(void *)(v1 + 56))
    {
      uint64_t v126 = *(void *)(v1 + 144);
      v127 = &v243[4 * *(unsigned __int8 *)(v126 + v125 + 1) + 257];
      int v128 = *v127;
      int v129 = v127[1];
      v130 = v127 + 2;
      v131 = v127 + 3;
      BOOL v132 = (unsigned __int16)v120 < v128;
      if (!v132) {
        v131 = v130;
      }
      int v133 = v129 - v132;
      int v134 = (unsigned __int16)*v131;
      unint64_t v135 = (unint64_t)(unsigned __int16)(v120 & FSE_mask_lsb64_mtable_0[v133]) << v119;
      int v136 = v133 + v119;
      int v120 = v134 + ((unsigned __int16)v120 >> v133);
      v137 = &v243[4 * *(unsigned __int8 *)(v126 + v125) + 257];
      int v138 = *v137;
      int v139 = v137[1];
      v140 = v137 + 2;
      v141 = v137 + 3;
      BOOL v142 = (unsigned __int16)v121 < v138;
      if (!v142) {
        v141 = v140;
      }
      int v143 = v139 - v142;
      unint64_t v144 = (unint64_t)(unsigned __int16)(v121 & FSE_mask_lsb64_mtable_0[v143]) << v136;
      int v145 = v143 + v136;
      int v121 = (unsigned __int16)*v141 + ((unsigned __int16)v121 >> v143);
      v146 = &v243[4 * *(unsigned __int8 *)(v126 + v125 - 1) + 257];
      int v147 = *v146;
      int v148 = v146[1];
      v149 = v146 + 2;
      v150 = v146 + 3;
      BOOL v151 = (unsigned __int16)v122 < v147;
      if (!v151) {
        v150 = v149;
      }
      int v152 = v148 - v151;
      unint64_t v153 = (unint64_t)(unsigned __int16)(v122 & FSE_mask_lsb64_mtable_0[v152]) << v145;
      int v154 = v152 + v145;
      int v122 = (unsigned __int16)*v150 + ((unsigned __int16)v122 >> v152);
      v155 = &v243[4 * *(unsigned __int8 *)(v126 + v125 - 2) + 257];
      int v156 = *v155;
      int v157 = v155[1];
      v158 = v155 + 2;
      v159 = v155 + 3;
      BOOL v160 = (unsigned __int16)v123 < v156;
      if (!v160) {
        v159 = v158;
      }
      int v161 = v157 - v160;
      unint64_t v162 = v135 | v124 | v144 | v153 | ((unint64_t)(unsigned __int16)(v123 & FSE_mask_lsb64_mtable_0[v161]) << v154);
      int v163 = v161 + v154;
      int v123 = (unsigned __int16)*v159 + ((unsigned __int16)v123 >> v161);
      unint64_t *v99 = v162;
      v99 = (unint64_t *)((char *)v99 + (v163 >> 3));
      unint64_t v124 = v162 >> (v163 & 0xF8);
      int v119 = v163 & 7;
      v125 -= 4;
      if (v125 == -2) {
        goto LABEL_148;
      }
    }

    goto LABEL_149;
  }

  unint64_t v124 = 0LL;
  LOWORD(v123) = 0;
  LOWORD(v122) = 0;
  LOWORD(v121) = 0;
  LOWORD(v120) = 0;
  int v119 = 0;
LABEL_148:
  unint64_t *v99 = v124;
  v164 = (unint64_t *)((char *)v99 + ((v119 + 7) >> 3));
  int v165 = *(_DWORD *)(v1 + 40);
  LOWORD(v166) = v123;
  WORD1(v166) = v122;
  WORD2(v166) = v121;
  HIWORD(v166) = v120;
  int v238 = v119 - ((v119 + 7) & 8);
  unsigned int v237 = (_DWORD)v164 - v165;
  uint64_t v239 = v166;
  *(void *)(v1 + 40) = v164;
  v167 = v164 + 1;
  int v174 = *(_DWORD *)(v1 + 104);
  void *v164 = 0LL;
  if (v174)
  {
    LOWORD(v175) = 0;
    LOWORD(v176) = 0;
    LOWORD(v177) = 0;
    unint64_t v178 = 0LL;
    int v179 = 0;
    uint64_t v180 = 4LL * (v174 - 1);
    while ((unint64_t)(v167 + 2) <= *(void *)(v1 + 56))
    {
      unint64_t v181 = *(int *)(*(void *)(v1 + 136) + v180);
      if (v181 >= 0x3C) {
        char v182 = 0;
      }
      else {
        char v182 = *(_DWORD *)(*(void *)(v1 + 136) + v180);
      }
      else {
        char v183 = ((v181 - 60) >> 4) + 64;
      }
      char v184 = v183 | v182;
      else {
        char v185 = ((unsigned __int16)(v181 - 1020) >> 8) + 0x80;
      }
      unsigned int v186 = ((v181 + 1032196) >> 12) + 192;
      uint64_t v187 = getDSymbolFromValue_sym[(v184 | v185 | v186)];
      unint64_t v188 = (v181 - (int)kDSymbolVBase[v187]) << v179;
      int v189 = v179 + kDSymbolVBits[v187];
      v190 = (__int16 *)&v244[8 * v187 + 2044];
      int v191 = *v190;
      int v192 = v190[1];
      v193 = v190 + 2;
      v194 = v190 + 3;
      BOOL v195 = (unsigned __int16)v175 < v191;
      if (!v195) {
        v194 = v193;
      }
      int v196 = v192 - v195;
      unint64_t v197 = (unint64_t)(unsigned __int16)(v175 & FSE_mask_lsb64_mtable_0[v196]) << v189;
      int v198 = v196 + v189;
      uint64_t v175 = (unsigned __int16)*v194 + ((unsigned __int16)v175 >> v196);
      uint64_t v199 = *(int *)(*(void *)(v1 + 128) + v180);
      uint64_t v200 = getMSymbolFromValue_sym[v199];
      uint64_t v201 = (v199 - (int)kMSymbolVBase[v200]) << v198;
      int v202 = v198 + kMSymbolVBits[v200];
      v203 = (__int16 *)&v245[8 * v200 + 508];
      int v204 = *v203;
      int v205 = v203[1];
      v206 = v203 + 2;
      v207 = v203 + 3;
      BOOL v208 = (unsigned __int16)v176 < v204;
      if (v208) {
        v206 = v207;
      }
      int v209 = v205 - v208;
      unint64_t v210 = (unint64_t)(unsigned __int16)(v176 & FSE_mask_lsb64_mtable_0[v209]) << v202;
      int v211 = v209 + v202;
      int v176 = (unsigned __int16)*v206 + ((unsigned __int16)v176 >> v209);
      uint64_t v212 = *(int *)(*(void *)(v1 + 120) + v180);
      uint64_t v213 = getLSymbolFromValue_sym[v212];
      uint64_t v214 = (v212 - (int)kLSymbolVBase[v213]) << v211;
      int v215 = v211 + kLSymbolVBits[v213];
      v216 = (__int16 *)&v246[8 * v213 + 156];
      int v217 = v216[1];
      BOOL v45 = (unsigned __int16)v177 < *v216;
      v218 = v216 + 2;
      v219 = v216 + 3;
      if (v45)
      {
        int v220 = 1;
      }

      else
      {
        v219 = v218;
        int v220 = 0;
      }

      int v221 = v217 - v220;
      unint64_t v222 = v188 | v178 | v201 | v210 | v214 | ((unint64_t)(unsigned __int16)(v177 & FSE_mask_lsb64_mtable_0[v221]) << v215) | v197;
      int v177 = (unsigned __int16)*v219 + ((unsigned __int16)v177 >> v221);
      unint64_t *v167 = v222;
      v167 = (unint64_t *)((char *)v167 + ((v221 + v215) >> 3));
      unint64_t v178 = v222 >> ((v221 + v215) & 0xF8);
      int v179 = (v221 + v215) & 7;
      v180 -= 4LL;
      if (!--v174)
      {
        unint64_t v223 = (unint64_t)(unsigned __int16)v177 << 32;
        unint64_t v224 = (unint64_t)(unsigned __int16)v176 << 42;
        uint64_t v225 = v175 << 52;
        goto LABEL_180;
      }
    }

_WORD *fse_adjust_freqs(_WORD *result, signed int a2, int a3)
{
  if (a2)
  {
    for (char i = 3; ; --i)
    {
      uint64_t v4 = a3;
      unint64_t v5 = result;
      if (a3 >= 1) {
        break;
      }
LABEL_9:
      ;
    }

    while (1)
    {
      unsigned int v6 = (unsigned __int16)*v5;
      if (v6 >= 2)
      {
        signed int v7 = (v6 - 1) >> i;
        if (v7 >= a2) {
          signed int v7 = a2;
        }
        _WORD *v5 = v6 - v7;
        a2 -= v7;
        if (!a2) {
          break;
        }
      }

      ++v5;
      if (!--v4) {
        goto LABEL_9;
      }
    }
  }

  return result;
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return deflateInit2_(strm, level, 8, 15, 8, 0, version, stream_size);
}

int deflateInit2_( z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  if (!version) {
    return -6;
  }
  int result = -6;
  if (stream_size == 112 && *version == 49)
  {
    if (strm)
    {
      strm->msg = 0LL;
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
      if (!zalloc)
      {
        zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))zcalloc;
        strm->zalloc = (alloc_func)zcalloc;
        strm->opaque = 0LL;
      }

      if (!strm->zfree) {
        strm->zfree = (free_func)zcfree;
      }
      if (level == -1) {
        unsigned int v13 = 6;
      }
      else {
        unsigned int v13 = level;
      }
      int v14 = windowBits - 16;
      if (windowBits > 0xF)
      {
        int v15 = 2;
      }

      else
      {
        int v14 = windowBits;
        int v15 = 1;
      }

      if (windowBits < 0) {
        unsigned int v16 = -windowBits;
      }
      else {
        unsigned int v16 = v14;
      }
      if (windowBits < 0) {
        int v17 = 0;
      }
      else {
        int v17 = v15;
      }
      int result = -2;
      if (strategy <= 4
        && v13 <= 9
        && method == 8
        && (memLevel - 10) >= 0xFFFFFFF7
        && v16 >= 8
        && v16 <= 0xF)
      {
        uint64_t v18 = zalloc(strm->opaque, 1LL, 5936LL);
        if (v18)
        {
          uint64_t v19 = v18;
          if (v16 == 8) {
            int v20 = 9;
          }
          else {
            int v20 = v16;
          }
          strm->state = (internal_state *)v18;
          *(void *)uint64_t v18 = strm;
          *(_DWORD *)(v18 + 44) = v17;
          *(void *)(v18 + 48) = 0LL;
          *(_DWORD *)(v18 + 68) = 1 << v20;
          *(_DWORD *)(v18 + 72) = v20;
          *(_DWORD *)(v18 + 76) = (1 << v20) - 1;
          *(_DWORD *)(v18 + 116) = 128 << memLevel;
          *(_DWORD *)(v18 + 120) = memLevel + 7;
          *(_DWORD *)(v18 + 124) = (128 << memLevel) - 1;
          *(_DWORD *)(v18 + 128) = (memLevel + 9) / 3u;
          *(void *)(v18 + 80) = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          *(void *)(v19 + 96) = ((uint64_t (*)(voidpf, void, uint64_t))strm->zalloc)( strm->opaque,  *(unsigned int *)(v19 + 68),  2LL);
          *(void *)(v19 + 104) = ((uint64_t (*)(voidpf, void, uint64_t))strm->zalloc)( strm->opaque,  *(unsigned int *)(v19 + 116),  2LL);
          *(void *)(v19 + 5928) = 0LL;
          *(_DWORD *)(v19 + 5880) = 64 << memLevel;
          uint64_t v21 = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          uint64_t v22 = *(unsigned int *)(v19 + 5880);
          *(void *)(v19 + 16) = v21;
          *(void *)(v19 + 24) = 4 * v22;
          if (*(void *)(v19 + 80) && *(void *)(v19 + 96) && *(void *)(v19 + 104) && v21)
          {
            *(void *)(v19 + 5888) = v21 + (v22 & 0xFFFFFFFE);
            *(void *)(v19 + 5872) = v21 + 3 * v22;
            *(_DWORD *)(v19 + 180) = v13;
            *(_DWORD *)(v19 + 184) = strategy;
            *(_BYTE *)(v19 + 60) = 8;
            return deflateReset(strm);
          }

          *(_DWORD *)(v19 + 8) = 666;
          strm->msg = "insufficient memory";
          deflateEnd(strm);
        }

        return -4;
      }
    }

    else
    {
      return -2;
    }
  }

  return result;
}

int deflateEnd(z_streamp strm)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state) {
    return -2;
  }
  int v3 = *((_DWORD *)state + 2);
  BOOL v4 = (v3 - 69) > 0x2C || ((1LL << (v3 - 69)) & 0x100400400011LL) == 0;
  if (v4 && v3 != 666 && v3 != 42) {
    return -2;
  }
  if (*((void *)state + 2))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 2));
    state = strm->state;
  }

  if (*((void *)state + 13))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 13));
    state = strm->state;
  }

  if (*((void *)state + 12))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 12));
    state = strm->state;
  }

  if (*((void *)state + 10))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 10));
    state = strm->state;
  }

  ((void (*)(voidpf, internal_state *))strm->zfree)(strm->opaque, state);
  strm->state = 0LL;
  if (v3 == 113) {
    return -3;
  }
  else {
    return 0;
  }
}

int deflateReset(z_streamp strm)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state || !strm->zalloc || !strm->zfree) {
    return -2;
  }
  strm->total_in = 0LL;
  strm->total_out = 0LL;
  strm->msg = 0LL;
  strm->data_type = 2;
  *((_DWORD *)state + 10) = 0;
  *((void *)state + 4) = *((void *)state + 2);
  int v3 = *((_DWORD *)state + 11);
  if (v3 < 0)
  {
    int v3 = -v3;
    *((_DWORD *)state + 11) = v3;
  }

  if (v3) {
    int v4 = 42;
  }
  else {
    int v4 = 113;
  }
  *((_DWORD *)state + 2) = v4;
  if (v3 == 2) {
    uLong v5 = crc32(0LL, 0LL, 0);
  }
  else {
    uLong v5 = adler32(0LL, 0LL, 0);
  }
  strm->adler = v5;
  *((_DWORD *)state + 16) = 0;
  _tr_init((uint64_t)state);
  *((void *)state + 11) = 2LL * *((unsigned int *)state + 17);
  signed int v7 = (char *)*((void *)state + 13);
  size_t v8 = 2LL * (*((_DWORD *)state + 29) - 1);
  *(_WORD *)&v7[v8] = 0;
  bzero(v7, v8);
  int result = 0;
  uint64_t v9 = (unsigned __int16 *)((char *)&configuration_table + 16 * *((int *)state + 45));
  int v10 = v9[2];
  *((_DWORD *)state + 47) = *v9;
  *((_DWORD *)state + 48) = v10;
  int v11 = v9[1];
  *((_DWORD *)state + 43) = v9[3];
  *((_DWORD *)state + 44) = v11;
  *((void *)state + 17) = 0LL;
  *(void *)((char *)state + 164) = 0x200000000LL;
  *((_DWORD *)state + 36) = 2;
  *((void *)state + 19) = 0LL;
  *((_DWORD *)state + 28) = 0;
  return result;
}

int deflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  if (!strm) {
    return -2;
  }
  int result = -2;
  if (dictionary)
  {
    state = strm->state;
    if (state)
    {
      LODWORD(v7) = dictLength;
      int v8 = *((_DWORD *)state + 11);
      if (v8)
      {
        if (v8 == 2 || v8 == 1 && *((_DWORD *)state + 2) != 42) {
          return result;
        }
        strm->adler = adler32(strm->adler, dictionary, dictLength);
      }

      if (v7 >= 3)
      {
        unsigned int v9 = *((_DWORD *)state + 17);
        LODWORD(v10) = v7 - v9;
        else {
          uint64_t v10 = 0LL;
        }
        else {
          size_t v7 = v9;
        }
        memcpy(*((void **)state + 10), &dictionary[v10], v7);
        uint64_t v11 = 0LL;
        *((_DWORD *)state + 39) = v7;
        *((void *)state + 17) = v7;
        unint64_t v12 = (unsigned __int8 *)*((void *)state + 10);
        int v13 = *v12;
        *((_DWORD *)state + 28) = v13;
        int v15 = *((_DWORD *)state + 31);
        int v14 = *((_DWORD *)state + 32);
        unsigned int v16 = ((v13 << v14) ^ v12[1]) & v15;
        *((_DWORD *)state + 28) = v16;
        uint64_t v18 = *((void *)state + 12);
        uint64_t v17 = *((void *)state + 13);
        int v19 = *((_DWORD *)state + 19);
        LODWORD(v20) = v7 - 2;
        else {
          uint64_t v20 = v20;
        }
        do
        {
          unsigned int v16 = ((v16 << v14) ^ v12[(v11 + 2)]) & v15;
          *((_DWORD *)state + 28) = v16;
          *(_WORD *)(v18 + 2LL * (v19 & v11)) = *(_WORD *)(v17 + 2LL * v16);
          *(_WORD *)(v17 + 2LL * v16) = v11++;
        }

        while (v20 != v11);
      }

      return 0;
    }
  }

  return result;
}

int deflateSetHeader(z_streamp strm, gz_headerp head)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state || *((_DWORD *)state + 11) != 2) {
    return -2;
  }
  int result = 0;
  *((void *)state + 6) = head;
  return result;
}

int deflatePrime(z_streamp strm, int bits, int value)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state) {
    return -2;
  }
  int result = 0;
  *((_DWORD *)state + 1481) = bits;
  *((_WORD *)state + 2960) = value & ~(-1 << bits);
  return result;
}

int deflateParams(z_streamp strm, int level, int strategy)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state) {
    return -2;
  }
  if (level == -1) {
    unsigned int v6 = 6;
  }
  else {
    unsigned int v6 = level;
  }
  int result = -2;
  if (strategy <= 4 && v6 <= 9)
  {
    if (*((_DWORD *)state + 46) == strategy
      && configuration_table[2 * *((int *)state + 45) + 1] == configuration_table[2 * v6 + 1]
      || !strm->total_in)
    {
      int result = 0;
    }

    else
    {
      int result = deflate(strm, 5);
    }

    if (*((_DWORD *)state + 45) != v6)
    {
      *((_DWORD *)state + 45) = v6;
      int v8 = (unsigned __int16 *)&configuration_table[2 * v6];
      int v9 = v8[1];
      int v10 = v8[2];
      *((_DWORD *)state + 47) = *v8;
      *((_DWORD *)state + 48) = v10;
      *((_DWORD *)state + 43) = v8[3];
      *((_DWORD *)state + 44) = v9;
    }

    *((_DWORD *)state + 46) = strategy;
  }

  return result;
}

int deflate(z_streamp strm, int flush)
{
  if (!strm) {
    return -2;
  }
  uint64_t v2 = *(void *)&flush;
  int result = -2;
  if (flush <= 5)
  {
    state = strm->state;
    if (state)
    {
      if (!strm->next_out || !strm->next_in && strm->avail_in || (int v6 = *((_DWORD *)state + 2), flush != 4) && v6 == 666)
      {
        strm->msg = "stream error";
        return result;
      }

      if (!strm->avail_out) {
        goto LABEL_136;
      }
      *(void *)state = strm;
      int v7 = *((_DWORD *)state + 16);
      *((_DWORD *)state + 16) = flush;
      if (v6 == 42)
      {
        if (*((_DWORD *)state + 11) == 2)
        {
          strm->uLong adler = crc32(0LL, 0LL, 0);
          uint64_t v8 = *((void *)state + 2);
          uint64_t v9 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v9 + 1;
          *(_BYTE *)(v8 + v9) = 31;
          uint64_t v10 = *((void *)state + 2);
          uint64_t v11 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v11 + 1;
          *(_BYTE *)(v10 + v11) = -117;
          uint64_t v12 = *((void *)state + 2);
          uint64_t v13 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v13 + 1;
          *(_BYTE *)(v12 + v13) = 8;
          uint64_t v14 = *((void *)state + 6);
          if (!v14)
          {
            uint64_t v52 = *((void *)state + 2);
            uint64_t v53 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v53 + 1;
            *(_BYTE *)(v52 + v53) = 0;
            uint64_t v54 = *((void *)state + 2);
            uint64_t v55 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v55 + 1;
            *(_BYTE *)(v54 + v55) = 0;
            uint64_t v56 = *((void *)state + 2);
            uint64_t v57 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v57 + 1;
            *(_BYTE *)(v56 + v57) = 0;
            uint64_t v58 = *((void *)state + 2);
            uint64_t v59 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v59 + 1;
            *(_BYTE *)(v58 + v59) = 0;
            uint64_t v60 = *((void *)state + 2);
            uint64_t v61 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v61 + 1;
            *(_BYTE *)(v60 + v61) = 0;
            int v62 = *((_DWORD *)state + 45);
            if (v62 == 9)
            {
              char v63 = 2;
            }

            else if (*((int *)state + 46) > 1 || v62 < 2)
            {
              char v63 = 4;
            }

            else
            {
              char v63 = 0;
            }

            uint64_t v112 = *((void *)state + 2);
            uint64_t v113 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v113 + 1;
            *(_BYTE *)(v112 + v113) = v63;
            uint64_t v114 = *((void *)state + 2);
            uint64_t v115 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v115 + 1;
            *(_BYTE *)(v114 + v115) = 3;
LABEL_127:
            *((_DWORD *)state + 2) = 113;
            goto LABEL_128;
          }

          char v15 = (*(_DWORD *)v14 != 0) | (2 * (*(_DWORD *)(v14 + 68) != 0)) | (4 * (*(void *)(v14 + 24) != 0LL)) | (8 * (*(void *)(v14 + 40) != 0LL)) | (16 * (*(void *)(v14 + 56) != 0LL));
          uint64_t v16 = *((void *)state + 2);
          uint64_t v17 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v17 + 1;
          *(_BYTE *)(v16 + v17) = v15;
          uint64_t v18 = *(void *)(*((void *)state + 6) + 8LL);
          uint64_t v19 = *((void *)state + 2);
          uint64_t v20 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v20 + 1;
          *(_BYTE *)(v19 + v20) = v18;
          uint64_t v21 = *(void *)(*((void *)state + 6) + 8LL) >> 8;
          uint64_t v22 = *((void *)state + 2);
          uint64_t v23 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v23 + 1;
          *(_BYTE *)(v22 + v23) = v21;
          uint64_t v24 = *(void *)(*((void *)state + 6) + 8LL) >> 16;
          uint64_t v25 = *((void *)state + 2);
          uint64_t v26 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v26 + 1;
          *(_BYTE *)(v25 + v26) = v24;
          uint64_t v27 = *(void *)(*((void *)state + 6) + 8LL) >> 24;
          uint64_t v28 = *((void *)state + 2);
          uint64_t v29 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v29 + 1;
          *(_BYTE *)(v28 + v29) = v27;
          int v30 = *((_DWORD *)state + 45);
          if (v30 == 9)
          {
            char v31 = 2;
          }

          else if (*((int *)state + 46) > 1 || v30 < 2)
          {
            char v31 = 4;
          }

          else
          {
            char v31 = 0;
          }

          uint64_t v65 = *((void *)state + 2);
          uint64_t v66 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v66 + 1;
          *(_BYTE *)(v65 + v66) = v31;
          char v67 = *(_DWORD *)(*((void *)state + 6) + 20LL);
          uint64_t v68 = *((void *)state + 2);
          uint64_t v69 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v69 + 1;
          *(_BYTE *)(v68 + v69) = v67;
          uint64_t v70 = *((void *)state + 6);
          if (*(void *)(v70 + 24))
          {
            char v71 = *(_DWORD *)(v70 + 32);
            uint64_t v72 = *((void *)state + 2);
            uint64_t v73 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v73 + 1;
            *(_BYTE *)(v72 + v73) = v71;
            int v74 = *(_DWORD *)(*((void *)state + 6) + 32LL) >> 8;
            uint64_t v75 = *((void *)state + 2);
            uint64_t v76 = *((unsigned int *)state + 10);
            *((_DWORD *)state + 10) = v76 + 1;
            *(_BYTE *)(v75 + v76) = v74;
            uint64_t v70 = *((void *)state + 6);
          }

          if (*(_DWORD *)(v70 + 68)) {
            strm->uLong adler = crc32(strm->adler, *((const Bytef **)state + 2), *((_DWORD *)state + 10));
          }
          *((_DWORD *)state + 14) = 0;
          *((_DWORD *)state + 2) = 69;
LABEL_49:
          uint64_t v77 = *((void *)state + 6);
          if (!*(void *)(v77 + 24)) {
            goto LABEL_68;
          }
          unsigned int v78 = *((_DWORD *)state + 10);
          unsigned int v79 = *((_DWORD *)state + 14);
          while (1)
          {
            uint64_t v80 = *((unsigned int *)state + 10);
            if (*((void *)state + 3) == v80)
            {
              if (*(_DWORD *)(v77 + 68)) {
                BOOL v81 = v80 > v78;
              }
              else {
                BOOL v81 = 0;
              }
              if (v81) {
                strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v78), v80 - v78);
              }
              flush_pending(strm);
              uint64_t v80 = *((unsigned int *)state + 10);
              uint64_t v77 = *((void *)state + 6);
              if (*((void *)state + 3) == v80)
              {
                unsigned int v78 = *((_DWORD *)state + 10);
LABEL_63:
                if (*(_DWORD *)(v77 + 68))
                {
                  unsigned int v84 = *((_DWORD *)state + 10);
                  if (v84 > v78)
                  {
                    strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v78), v84 - v78);
                    uint64_t v77 = *((void *)state + 6);
                  }
                }

                if (*((_DWORD *)state + 14) == *(_DWORD *)(v77 + 32))
                {
                  *((_DWORD *)state + 14) = 0;
LABEL_68:
                  *((_DWORD *)state + 2) = 73;
LABEL_72:
                  if (*(void *)(v77 + 40))
                  {
                    unsigned int v85 = *((_DWORD *)state + 10);
                    do
                    {
                      uint64_t v86 = *((unsigned int *)state + 10);
                      uint64_t v87 = *((void *)state + 6);
                      if (*((void *)state + 3) == v86)
                      {
                        if (*(_DWORD *)(v87 + 68)) {
                          BOOL v88 = v86 > v85;
                        }
                        else {
                          BOOL v88 = 0;
                        }
                        if (v88) {
                          strm->uLong adler = crc32( strm->adler,  (const Bytef *)(*((void *)state + 2) + v85),  v86 - v85);
                        }
                        flush_pending(strm);
                        uint64_t v86 = *((unsigned int *)state + 10);
                        if (*((void *)state + 3) == v86)
                        {
                          char v92 = 0;
                          goto LABEL_86;
                        }

                        uint64_t v87 = *((void *)state + 6);
                        unsigned int v85 = *((_DWORD *)state + 10);
                      }

                      uint64_t v89 = *(void *)(v87 + 40);
                      uint64_t v90 = *((unsigned int *)state + 14);
                      *((_DWORD *)state + 14) = v90 + 1;
                      LODWORD(v89) = *(unsigned __int8 *)(v89 + v90);
                      uint64_t v91 = *((void *)state + 2);
                      *((_DWORD *)state + 10) = v86 + 1;
                      *(_BYTE *)(v91 + v86) = v89;
                    }

                    while ((_DWORD)v89);
                    char v92 = 1;
                    LODWORD(v86) = v85;
LABEL_86:
                    if (*(_DWORD *)(*((void *)state + 6) + 68LL))
                    {
                      unsigned int v93 = *((_DWORD *)state + 10);
                      if (v93 > v86) {
                        strm->uLong adler = crc32( strm->adler,  (const Bytef *)(*((void *)state + 2) + v86),  v93 - v86);
                      }
                    }

                    if ((v92 & 1) != 0)
                    {
                      *((_DWORD *)state + 14) = 0;
                      goto LABEL_91;
                    }

                    int v6 = *((_DWORD *)state + 2);
LABEL_93:
                    if (v6 != 91) {
                      goto LABEL_114;
                    }
                  }

                  else
                  {
LABEL_91:
                    *((_DWORD *)state + 2) = 91;
                  }

                  if (!*(void *)(*((void *)state + 6) + 56LL)) {
                    goto LABEL_112;
                  }
                  unsigned int v94 = *((_DWORD *)state + 10);
                  while (1)
                  {
                    uint64_t v95 = *((unsigned int *)state + 10);
                    uint64_t v96 = *((void *)state + 6);
                    if (*((void *)state + 3) == v95)
                    {
                      if (*(_DWORD *)(v96 + 68)) {
                        BOOL v97 = v95 > v94;
                      }
                      else {
                        BOOL v97 = 0;
                      }
                      if (v97) {
                        strm->uLong adler = crc32( strm->adler,  (const Bytef *)(*((void *)state + 2) + v94),  v95 - v94);
                      }
                      flush_pending(strm);
                      uint64_t v95 = *((unsigned int *)state + 10);
                      if (*((void *)state + 3) == v95)
                      {
                        char v101 = 0;
LABEL_108:
                        if (*(_DWORD *)(*((void *)state + 6) + 68LL))
                        {
                          unsigned int v102 = *((_DWORD *)state + 10);
                          if (v102 > v95) {
                            strm->uLong adler = crc32( strm->adler,  (const Bytef *)(*((void *)state + 2) + v95),  v102 - v95);
                          }
                        }

                        if ((v101 & 1) != 0)
                        {
LABEL_112:
                          *((_DWORD *)state + 2) = 103;
                          goto LABEL_115;
                        }

                        int v6 = *((_DWORD *)state + 2);
LABEL_114:
                        if (v6 == 103)
                        {
LABEL_115:
                          if (!*(_DWORD *)(*((void *)state + 6) + 68LL)) {
                            goto LABEL_127;
                          }
                          unsigned int v103 = *((_DWORD *)state + 10);
                          unint64_t v104 = v103 + 2;
                          unint64_t v105 = *((void *)state + 3);
                          if (v105 < v104)
                          {
                            flush_pending(strm);
                            unsigned int v103 = *((_DWORD *)state + 10);
                            unint64_t v105 = *((void *)state + 3);
                            unint64_t v104 = v103 + 2;
                          }

                          if (v105 >= v104)
                          {
                            uLong adler = strm->adler;
                            uint64_t v107 = *((void *)state + 2);
                            *((_DWORD *)state + 10) = v103 + 1;
                            *(_BYTE *)(v107 + v103) = adler;
                            uLong v108 = strm->adler >> 8;
                            uint64_t v109 = *((void *)state + 2);
                            uint64_t v110 = *((unsigned int *)state + 10);
                            *((_DWORD *)state + 10) = v110 + 1;
                            *(_BYTE *)(v109 + v110) = v108;
                            strm->uLong adler = crc32(0LL, 0LL, 0);
                            goto LABEL_127;
                          }
                        }

LABEL_128:
                        if (*((_DWORD *)state + 10))
                        {
                          flush_pending(strm);
                          if (strm->avail_out) {
                            goto LABEL_130;
                          }
LABEL_162:
                          int result = 0;
                          *((_DWORD *)state + 16) = -1;
                          return result;
                        }

                        if (!strm->avail_in && (_DWORD)v2 != 4 && v7 >= (int)v2)
                        {
LABEL_136:
                          strm->msg = "buffer error";
                          return -5;
                        }

LABEL_130:
                        int v116 = *((_DWORD *)state + 2);
                        uInt avail_in = strm->avail_in;
                        if (v116 != 666)
                        {
                          if (!avail_in) {
                            goto LABEL_138;
                          }
                          goto LABEL_139;
                        }

                        if (avail_in) {
                          goto LABEL_136;
                        }
LABEL_138:
                        if (*((_DWORD *)state + 41))
                        {
LABEL_139:
                          int v118 = *((_DWORD *)state + 46);
                          if (v118 == 3)
                          {
                            int v119 = deflate_rle((uint64_t)state, v2);
                          }

                          else if (v118 == 2)
                          {
                            int v119 = deflate_huff((uint64_t)state, v2);
                          }

                          else
                          {
                            int v119 = configuration_table[2 * *((int *)state + 45) + 1](state, v2);
                          }

                          if ((v119 & 0xFFFFFFFE) == 2) {
                            *((_DWORD *)state + 2) = 666;
                          }
                          if ((v119 & 0xFFFFFFFD) != 0)
                          {
                            if (v119 == 1)
                            {
                              if ((_DWORD)v2 != 5)
                              {
                                if ((_DWORD)v2 == 1)
                                {
                                  _tr_align((uint64_t)state);
                                }

                                else
                                {
                                  _tr_stored_block((uint64_t)state, 0LL, 0, 0);
                                  if ((_DWORD)v2 == 3)
                                  {
                                    int v120 = (char *)*((void *)state + 13);
                                    size_t v121 = 2LL * (*((_DWORD *)state + 29) - 1);
                                    *(_WORD *)&v120[v121] = 0;
                                    bzero(v120, v121);
                                    if (!*((_DWORD *)state + 41))
                                    {
                                      *((_DWORD *)state + 39) = 0;
                                      *((void *)state + 17) = 0LL;
                                    }
                                  }
                                }
                              }

                              flush_pending(strm);
                              if (!strm->avail_out) {
                                goto LABEL_162;
                              }
                            }

                            goto LABEL_160;
                          }

                          if (!strm->avail_out) {
                            goto LABEL_162;
                          }
                        }

                        else if ((_DWORD)v2)
                        {
                          if (v116 != 666) {
                            goto LABEL_139;
                          }
LABEL_160:
                          if ((_DWORD)v2 == 4)
                          {
                            int v122 = *((_DWORD *)state + 11);
                            if (v122 < 1) {
                              return 1;
                            }
                            uLong v123 = strm->adler;
                            if (v122 == 2)
                            {
                              uint64_t v124 = *((void *)state + 2);
                              uint64_t v125 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v125 + 1;
                              *(_BYTE *)(v124 + v125) = v123;
                              uLong v126 = strm->adler >> 8;
                              uint64_t v127 = *((void *)state + 2);
                              uint64_t v128 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v128 + 1;
                              *(_BYTE *)(v127 + v128) = v126;
                              uLong v129 = strm->adler >> 16;
                              uint64_t v130 = *((void *)state + 2);
                              uint64_t v131 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v131 + 1;
                              *(_BYTE *)(v130 + v131) = v129;
                              uLong v132 = strm->adler >> 24;
                              uint64_t v133 = *((void *)state + 2);
                              uint64_t v134 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v134 + 1;
                              *(_BYTE *)(v133 + v134) = v132;
                              uLong total_in = strm->total_in;
                              uint64_t v136 = *((void *)state + 2);
                              uint64_t v137 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v137 + 1;
                              *(_BYTE *)(v136 + v137) = total_in;
                              uLong v138 = strm->total_in >> 8;
                              uint64_t v139 = *((void *)state + 2);
                              uint64_t v140 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v140 + 1;
                              *(_BYTE *)(v139 + v140) = v138;
                              uLong v141 = strm->total_in >> 16;
                              uint64_t v142 = *((void *)state + 2);
                              uint64_t v143 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v143 + 1;
                              *(_BYTE *)(v142 + v143) = v141;
                              uLong v144 = strm->total_in >> 24;
                            }

                            else
                            {
                              uLong v145 = v123 >> 16;
                              uint64_t v146 = *((void *)state + 2);
                              uint64_t v147 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v147 + 1;
                              *(_BYTE *)(v146 + v147) = BYTE3(v123);
                              uint64_t v148 = *((void *)state + 2);
                              uint64_t v149 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v149 + 1;
                              *(_BYTE *)(v148 + v149) = v145;
                              uLong v144 = strm->adler;
                              uint64_t v150 = *((void *)state + 2);
                              uint64_t v151 = *((unsigned int *)state + 10);
                              *((_DWORD *)state + 10) = v151 + 1;
                              *(_BYTE *)(v150 + v151) = BYTE1(v144);
                            }

                            uint64_t v152 = *((void *)state + 2);
                            uint64_t v153 = *((unsigned int *)state + 10);
                            *((_DWORD *)state + 10) = v153 + 1;
                            *(_BYTE *)(v152 + v153) = v144;
                            flush_pending(strm);
                            int v154 = *((_DWORD *)state + 11);
                            if (v154 >= 1) {
                              *((_DWORD *)state + 11) = -v154;
                            }
                            return *((_DWORD *)state + 10) == 0;
                          }
                        }

                        return 0;
                      }

                      uint64_t v96 = *((void *)state + 6);
                      unsigned int v94 = *((_DWORD *)state + 10);
                    }

                    uint64_t v98 = *(void *)(v96 + 56);
                    uint64_t v99 = *((unsigned int *)state + 14);
                    *((_DWORD *)state + 14) = v99 + 1;
                    LODWORD(v98) = *(unsigned __int8 *)(v98 + v99);
                    uint64_t v100 = *((void *)state + 2);
                    *((_DWORD *)state + 10) = v95 + 1;
                    *(_BYTE *)(v100 + v95) = v98;
                    if (!(_DWORD)v98)
                    {
                      char v101 = 1;
                      LODWORD(v95) = v94;
                      goto LABEL_108;
                    }
                  }
                }

                int v6 = *((_DWORD *)state + 2);
LABEL_70:
                if (v6 == 73)
                {
                  uint64_t v77 = *((void *)state + 6);
                  goto LABEL_72;
                }

                goto LABEL_93;
              }

              unsigned int v79 = *((_DWORD *)state + 14);
              unsigned int v78 = *((_DWORD *)state + 10);
            }

            char v82 = *(_BYTE *)(*(void *)(v77 + 24) + v79);
            uint64_t v83 = *((void *)state + 2);
            *((_DWORD *)state + 10) = v80 + 1;
            *(_BYTE *)(v83 + v80) = v82;
            unsigned int v79 = *((_DWORD *)state + 14) + 1;
            *((_DWORD *)state + 14) = v79;
            uint64_t v77 = *((void *)state + 6);
          }
        }

        if (*((int *)state + 46) <= 1)
        {
          int v33 = *((_DWORD *)state + 45);
          if (v33 == 6) {
            int v34 = 128;
          }
          else {
            int v34 = 192;
          }
          else {
            int v35 = 64;
          }
          if (v33 >= 2) {
            int v32 = v35;
          }
          else {
            int v32 = 0;
          }
        }

        else
        {
          int v32 = 0;
        }

        unsigned int v36 = v32 | ((*((_DWORD *)state + 18) << 12) - 30720);
        if (*((_DWORD *)state + 39)) {
          v36 |= 0x20u;
        }
        *((_DWORD *)state + 2) = 113;
        uint64_t v37 = *((void *)state + 2);
        uint64_t v38 = *((unsigned int *)state + 10);
        *((_DWORD *)state + 10) = v38 + 1;
        *(_BYTE *)(v37 + v38) = BYTE1(v36);
        uint64_t v39 = *((void *)state + 2);
        uint64_t v40 = *((unsigned int *)state + 10);
        *((_DWORD *)state + 10) = v40 + 1;
        *(_BYTE *)(v39 + v40) = ((v36 % 0x1F) | v36) ^ 0x1F;
        if (*((_DWORD *)state + 39))
        {
          uLong v41 = strm->adler;
          uLong v42 = v41 >> 16;
          uint64_t v43 = *((void *)state + 2);
          uint64_t v44 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v44 + 1;
          *(_BYTE *)(v43 + v44) = BYTE3(v41);
          uint64_t v45 = *((void *)state + 2);
          uint64_t v46 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v46 + 1;
          *(_BYTE *)(v45 + v46) = v42;
          uLong v47 = strm->adler;
          uint64_t v48 = *((void *)state + 2);
          uint64_t v49 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v49 + 1;
          *(_BYTE *)(v48 + v49) = BYTE1(v47);
          uint64_t v50 = *((void *)state + 2);
          uint64_t v51 = *((unsigned int *)state + 10);
          *((_DWORD *)state + 10) = v51 + 1;
          *(_BYTE *)(v50 + v51) = v47;
        }

        strm->uLong adler = adler32(0LL, 0LL, 0);
        int v6 = *((_DWORD *)state + 2);
      }

      if (v6 != 69) {
        goto LABEL_70;
      }
      goto LABEL_49;
    }
  }

  return result;
}

int deflateTune(z_streamp strm, int good_length, int max_lazy, int nice_length, int max_chain)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state) {
    return -2;
  }
  int result = 0;
  *((_DWORD *)state + 47) = good_length;
  *((_DWORD *)state + 48) = nice_length;
  *((_DWORD *)state + 43) = max_chain;
  *((_DWORD *)state + 44) = max_lazy;
  return result;
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  uLong v2 = sourceLen + ((sourceLen + 7) >> 3) + ((sourceLen + 63) >> 6);
  if (!strm) {
    return v2 + 11;
  }
  state = strm->state;
  if (!state) {
    return v2 + 11;
  }
  uint64_t v4 = *((unsigned int *)state + 11);
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 2)
    {
      uint64_t v6 = *((void *)state + 6);
      if (v6)
      {
        if (*(void *)(v6 + 24)) {
          uint64_t v7 = (*(_DWORD *)(v6 + 32) + 2) + 18LL;
        }
        else {
          uint64_t v7 = 18LL;
        }
        uint64_t v8 = *(unsigned __int8 **)(v6 + 40);
        if (v8)
        {
          do
            ++v7;
          while (*v8++);
        }

        uint64_t v10 = *(unsigned __int8 **)(v6 + 56);
        if (v10)
        {
          do
            ++v7;
          while (*v10++);
        }

        if (*(_DWORD *)(v6 + 68)) {
          uint64_t v4 = v7 + 2;
        }
        else {
          uint64_t v4 = v7;
        }
      }

      else
      {
        uint64_t v4 = 18LL;
      }
    }

    else if ((_DWORD)v4 == 1)
    {
      uint64_t v4 = 10LL;
      if (!*((_DWORD *)state + 39)) {
        uint64_t v4 = 6LL;
      }
    }

    else
    {
      uint64_t v4 = 6LL;
    }
  }

  if (*((_DWORD *)state + 18) == 15 && *((_DWORD *)state + 30) == 15) {
    uLong v12 = sourceLen + 7 + (sourceLen >> 12) + (sourceLen >> 14) + (sourceLen >> 25);
  }
  else {
    uLong v12 = v2 + 5;
  }
  return v12 + v4;
}

void *flush_pending(void *result)
{
  uint64_t v1 = *((void *)result + 7);
  unsigned int v2 = *(_DWORD *)(v1 + 40);
  unsigned int v3 = *((_DWORD *)result + 8);
  if (v2 >= v3) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v2;
  }
  if ((_DWORD)v4)
  {
    uLong v5 = result;
    int result = memcpy(*((void **)result + 3), *(const void **)(v1 + 32), v4);
    v5[3] += v4;
    uint64_t v6 = v5[7];
    *(void *)(v6 + 32) += v4;
    v5[5] += v4;
    *((_DWORD *)v5 + 8) -= v4;
    int v7 = *(_DWORD *)(v6 + 40) - v4;
    *(_DWORD *)(v6 + 40) = v7;
    if (!v7) {
      *(void *)(v6 + 32) = *(void *)(v6 + 16);
    }
  }

  return result;
}

uint64_t deflate_huff(uint64_t a1, int a2)
{
  while (1)
  {
    if (!*(_DWORD *)(a1 + 164))
    {
      fill_window((uint64_t *)a1);
      if (!*(_DWORD *)(a1 + 164)) {
        break;
      }
    }

    *(_DWORD *)(a1 + 144) = 0;
    uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1 + 80) + *(unsigned int *)(a1 + 156));
    uint64_t v5 = *(unsigned int *)(a1 + 5884);
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v5) = 0;
    uint64_t v6 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v5 + 1;
    *(_BYTE *)(v6 + v5) = v4;
    ++*(_WORD *)(a1 + 4 * v4 + 196);
    LODWORD(v6) = *(_DWORD *)(a1 + 5884);
    LODWORD(v5) = *(_DWORD *)(a1 + 5880) - 1;
    --*(_DWORD *)(a1 + 164);
    uint64_t v7 = (*(_DWORD *)(a1 + 156) + 1);
    *(_DWORD *)(a1 + 156) = v7;
    if ((_DWORD)v6 == (_DWORD)v5)
    {
      uint64_t v8 = *(void *)(a1 + 136);
      uint64_t v9 = v8 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v8);
      _tr_flush_block((int *)a1, v9, v7 - v8, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
        return 0LL;
      }
    }
  }

  if (!a2) {
    return 0LL;
  }
  uint64_t v10 = *(void *)(a1 + 136);
  if (v10 < 0) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = (char *)(*(void *)(a1 + 80) + v10);
  }
  _tr_flush_block((int *)a1, v11, *(unsigned int *)(a1 + 156) - v10, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3LL;
  }
  return 1LL;
}

uint64_t deflate_rle(uint64_t a1, int a2)
{
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (v4 >= 0x102)
    {
      *(_DWORD *)(a1 + 144) = 0;
      uint64_t v5 = *(unsigned int *)(a1 + 156);
      if (!*(_DWORD *)(a1 + 156)) {
        goto LABEL_23;
      }
      goto LABEL_9;
    }

    fill_window((uint64_t *)a1);
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (!a2 && v4 < 0x102) {
      return 0LL;
    }
    if (!v4) {
      break;
    }
    *(_DWORD *)(a1 + 144) = 0;
    uint64_t v5 = *(unsigned int *)(a1 + 156);
    if (v4 < 3 || !*(_DWORD *)(a1 + 156))
    {
LABEL_23:
      LODWORD(v16) = *(_DWORD *)(a1 + 5884);
LABEL_24:
      uint64_t v17 = *(unsigned __int8 *)(*(void *)(a1 + 80) + v5);
      *(_WORD *)(*(void *)(a1 + 5888) + 2LL * v16) = 0;
      uint64_t v18 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v16 + 1;
      *(_BYTE *)(v18 + v16) = v17;
      ++*(_WORD *)(a1 + 4 * v17 + 196);
      int v19 = *(_DWORD *)(a1 + 5884);
      int v20 = *(_DWORD *)(a1 + 5880) - 1;
      --*(_DWORD *)(a1 + 164);
      unsigned int v21 = *(_DWORD *)(a1 + 156) + 1;
      *(_DWORD *)(a1 + 156) = v21;
      goto LABEL_25;
    }

LABEL_9:
    uint64_t v6 = (unsigned __int8 *)(*(void *)(a1 + 80) + v5);
    int v7 = *(v6 - 1);
    if (v7 != *v6 || v7 != v6[1] || v7 != v6[2]) {
      goto LABEL_23;
    }
    uint64_t v8 = 0LL;
    int v9 = (_DWORD)v6 + 258;
    while (1)
    {
      uint64_t v10 = &v6[v8];
      if (v7 != v6[v8 + 3])
      {
        int v15 = (_DWORD)v10 + 3;
        goto LABEL_38;
      }

      if (v7 != v10[4])
      {
        int v15 = (_DWORD)v6 + v8 + 4;
        goto LABEL_38;
      }

      uint64_t v11 = &v6[v8];
      if (v7 != v6[v8 + 5])
      {
        int v15 = (_DWORD)v11 + 5;
        goto LABEL_38;
      }

      if (v7 != v11[6])
      {
        int v15 = (_DWORD)v6 + v8 + 6;
        goto LABEL_38;
      }

      uLong v12 = &v6[v8];
      if (v7 != v6[v8 + 7])
      {
        int v15 = (_DWORD)v12 + 7;
        goto LABEL_38;
      }

      if (v7 != v12[8])
      {
        int v15 = (_DWORD)v6 + v8 + 8;
        goto LABEL_38;
      }

      uint64_t v13 = &v6[v8];
      if (v7 != v6[v8 + 9]) {
        break;
      }
      unint64_t v14 = v8 + 2;
      v8 += 8LL;
      if (v14 > 0xF9 || v7 != v13[10])
      {
        int v15 = (_DWORD)v6 + v8 + 2;
        goto LABEL_38;
      }
    }

    int v15 = (_DWORD)v13 + 9;
LABEL_38:
    unsigned int v24 = v15 - v9 + 258;
    if (v24 >= v4) {
      unsigned int v24 = v4;
    }
    *(_DWORD *)(a1 + 144) = v24;
    uint64_t v16 = *(unsigned int *)(a1 + 5884);
    BOOL v25 = v24 >= 3;
    unsigned __int8 v26 = v24 - 3;
    if (!v25) {
      goto LABEL_24;
    }
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v16) = 1;
    uint64_t v27 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v16 + 1;
    *(_BYTE *)(v27 + v16) = v26;
    uint64_t v28 = a1 + 4LL * _length_code[v26];
    ++*(_WORD *)(v28 + 1224);
    ++*(_WORD *)(a1 + 4LL * _dist_code[0] + 2488);
    int v19 = *(_DWORD *)(a1 + 5884);
    int v20 = *(_DWORD *)(a1 + 5880) - 1;
    LODWORD(v28) = *(_DWORD *)(a1 + 144);
    *(_DWORD *)(a1 + 164) -= v28;
    unsigned int v21 = *(_DWORD *)(a1 + 156) + v28;
    *(_DWORD *)(a1 + 156) = v21;
    *(_DWORD *)(a1 + 144) = 0;
LABEL_25:
    if (v19 == v20)
    {
      uint64_t v22 = *(void *)(a1 + 136);
      uint64_t v23 = v22 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v22);
      _tr_flush_block((int *)a1, v23, v21 - v22, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
        return 0LL;
      }
    }
  }

  uint64_t v30 = *(void *)(a1 + 136);
  if (v30 < 0) {
    char v31 = 0LL;
  }
  else {
    char v31 = (char *)(*(void *)(a1 + 80) + v30);
  }
  _tr_flush_block((int *)a1, v31, *(unsigned int *)(a1 + 156) - v30, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3LL;
  }
  return 1LL;
}

int deflateCopy(z_streamp dest, z_streamp source)
{
  int result = -2;
  if (dest)
  {
    if (source)
    {
      state = source->state;
      if (state)
      {
        __int128 v6 = *(_OWORD *)&source->opaque;
        __int128 v5 = *(_OWORD *)&source->adler;
        __int128 v7 = *(_OWORD *)&source->msg;
        *(_OWORD *)&dest->zalloc = *(_OWORD *)&source->zalloc;
        *(_OWORD *)&dest->opaque = v6;
        __int128 v8 = *(_OWORD *)&source->total_in;
        __int128 v9 = *(_OWORD *)&source->avail_out;
        *(_OWORD *)&dest->next_in = *(_OWORD *)&source->next_in;
        *(_OWORD *)&dest->uLong total_in = v8;
        *(_OWORD *)&dest->uLong adler = v5;
        *(_OWORD *)&dest->avail_out = v9;
        *(_OWORD *)&dest->msg = v7;
        uint64_t v10 = (internal_state *)((uint64_t (*)(voidpf, uint64_t, uint64_t))dest->zalloc)( dest->opaque,  1LL,  5936LL);
        if (v10)
        {
          uint64_t v11 = v10;
          dest->state = v10;
          memcpy(v10, state, 0x1730uLL);
          *(void *)uint64_t v11 = dest;
          *((void *)v11 + 10) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)( dest->opaque,  *((unsigned int *)v11 + 17),  2LL);
          *((void *)v11 + 12) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)( dest->opaque,  *((unsigned int *)v11 + 17),  2LL);
          *((void *)v11 + 13) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)( dest->opaque,  *((unsigned int *)v11 + 29),  2LL);
          uint64_t v12 = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)( dest->opaque,  *((unsigned int *)v11 + 1470),  4LL);
          *((void *)v11 + 2) = v12;
          uint64_t v13 = (void *)*((void *)v11 + 10);
          if (v13 && *((void *)v11 + 12) && *((void *)v11 + 13) && v12)
          {
            memcpy(v13, *((const void **)state + 10), (2 * *((_DWORD *)v11 + 17)));
            memcpy(*((void **)v11 + 12), *((const void **)state + 12), 2LL * *((unsigned int *)v11 + 17));
            memcpy(*((void **)v11 + 13), *((const void **)state + 13), 2LL * *((unsigned int *)v11 + 29));
            memcpy(*((void **)v11 + 2), *((const void **)state + 2), *((unsigned int *)v11 + 6));
            int result = 0;
            uint64_t v14 = *((void *)v11 + 2);
            *((void *)v11 + 4) = v14 + *((void *)state + 4) - *((void *)state + 2);
            uint64_t v15 = *((unsigned int *)v11 + 1470);
            *((void *)v11 + 736) = v12 + (v15 & 0xFFFFFFFE);
            *((void *)v11 + 734) = v14 + 3 * v15;
            *((void *)v11 + 361) = (char *)v11 + 196;
            *((void *)v11 + 364) = (char *)v11 + 2488;
            *((void *)v11 + 367) = (char *)v11 + 2732;
            return result;
          }

          deflateEnd(dest);
        }

        return -4;
      }
    }
  }

  return result;
}

uint64_t deflate_stored(uint64_t a1, int a2)
{
  else {
    uint64_t v4 = *(void *)(a1 + 24) - 5LL;
  }
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (v5 >= 2)
    {
      uint64_t v6 = *(void *)(a1 + 136);
      goto LABEL_9;
    }

    fill_window((uint64_t *)a1);
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (!(v5 | a2)) {
      return 0LL;
    }
    uint64_t v6 = *(void *)(a1 + 136);
    if (!v5) {
      break;
    }
LABEL_9:
    unint64_t v7 = *(_DWORD *)(a1 + 156) + v5;
    *(_DWORD *)(a1 + 156) = v7;
    *(_DWORD *)(a1 + 164) = 0;
    unint64_t v8 = v6 + v4;
    if ((_DWORD)v7) {
      BOOL v9 = v8 > v7;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      *(_DWORD *)(a1 + 164) = v7 - v8;
      *(_DWORD *)(a1 + 156) = v8;
      if (v6 < 0) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = (char *)(*(void *)(a1 + 80) + v6);
      }
      _tr_flush_block((int *)a1, v10, (v6 + v4) - v6, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
        return 0LL;
      }
      LODWORD(v7) = *(_DWORD *)(a1 + 156);
      uint64_t v6 = *(void *)(a1 + 136);
    }

    if ((int)v7 - (int)v6 >= (*(_DWORD *)(a1 + 68) - 262))
    {
      uint64_t v11 = v6 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v6);
      _tr_flush_block((int *)a1, v11, v7 - v6, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
        return 0LL;
      }
    }
  }

  if (v6 < 0) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = (char *)(*(void *)(a1 + 80) + v6);
  }
  _tr_flush_block((int *)a1, v13, *(unsigned int *)(a1 + 156) - v6, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3LL;
  }
  return 1LL;
}

uint64_t deflate_fast(uint64_t a1, int a2)
{
  while (1)
  {
    if (*(_DWORD *)(a1 + 164) > 0x105u) {
      goto LABEL_6;
    }
    fill_window((uint64_t *)a1);
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (!a2 && v4 < 0x106) {
      return 0LL;
    }
    if (!v4) {
      break;
    }
    if (v4 < 3) {
      goto LABEL_8;
    }
LABEL_6:
    unsigned int v5 = *(_DWORD *)(a1 + 156);
    unsigned int v6 = ((*(_DWORD *)(a1 + 112) << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(*(void *)(a1 + 80) + v5 + 2)) & *(_DWORD *)(a1 + 124);
    *(_DWORD *)(a1 + 112) = v6;
    uint64_t v7 = *(void *)(a1 + 104);
    unsigned int v8 = *(unsigned __int16 *)(v7 + 2LL * v6);
    *(_WORD *)(*(void *)(a1 + 96) + 2LL * (*(_DWORD *)(a1 + 76) & v5)) = v8;
    *(_WORD *)(v7 + 2LL * v6) = v5;
    if (!v8 || v5 - v8 > *(_DWORD *)(a1 + 68) - 262)
    {
LABEL_8:
      unsigned int v9 = *(_DWORD *)(a1 + 144);
      goto LABEL_10;
    }

    unsigned int v9 = longest_match(a1, v8);
    *(_DWORD *)(a1 + 144) = v9;
LABEL_10:
    if (v9 < 3)
    {
      uint64_t v30 = *(unsigned __int8 *)(*(void *)(a1 + 80) + *(unsigned int *)(a1 + 156));
      uint64_t v31 = *(unsigned int *)(a1 + 5884);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v31) = 0;
      uint64_t v32 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v31 + 1;
      *(_BYTE *)(v32 + v31) = v30;
      ++*(_WORD *)(a1 + 4 * v30 + 196);
      int v17 = *(_DWORD *)(a1 + 5884);
      int v18 = *(_DWORD *)(a1 + 5880) - 1;
      --*(_DWORD *)(a1 + 164);
      unsigned int v29 = *(_DWORD *)(a1 + 156) + 1;
LABEL_19:
      *(_DWORD *)(a1 + 156) = v29;
      goto LABEL_21;
    }

    int v10 = *(_DWORD *)(a1 + 156) - *(_DWORD *)(a1 + 160);
    uint64_t v11 = *(unsigned int *)(a1 + 5884);
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v11) = v10;
    uint64_t v12 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v11 + 1;
    *(_BYTE *)(v12 + v11) = v9 - 3;
    unsigned __int16 v13 = v10 - 1;
    uint64_t v14 = a1 + 4LL * _length_code[(v9 - 3)];
    ++*(_WORD *)(v14 + 1224);
    unsigned __int16 v15 = (v13 >> 7) + 256;
    if ((v13 & 0xFF00) == 0) {
      unsigned __int16 v15 = v13;
    }
    uint64_t v16 = a1 + 4LL * _dist_code[v15];
    ++*(_WORD *)(v16 + 2488);
    int v17 = *(_DWORD *)(a1 + 5884);
    int v18 = *(_DWORD *)(a1 + 5880) - 1;
    unsigned int v19 = *(_DWORD *)(a1 + 144);
    unsigned int v20 = *(_DWORD *)(a1 + 164) - v19;
    *(_DWORD *)(a1 + 164) = v20;
    if (v19 <= *(_DWORD *)(a1 + 176) && v20 >= 3)
    {
      *(_DWORD *)(a1 + 144) = v19 - 1;
      uint64_t v21 = *(void *)(a1 + 80);
      int v23 = *(_DWORD *)(a1 + 124);
      int v22 = *(_DWORD *)(a1 + 128);
      uint64_t v25 = *(void *)(a1 + 96);
      uint64_t v24 = *(void *)(a1 + 104);
      int v26 = *(_DWORD *)(a1 + 76);
      unsigned int v27 = *(_DWORD *)(a1 + 112);
      unsigned int v28 = v19 - 2;
      unsigned int v29 = *(_DWORD *)(a1 + 156) + 1;
      do
      {
        *(_DWORD *)(a1 + 156) = v29;
        unsigned int v27 = ((v27 << v22) ^ *(unsigned __int8 *)(v21 + v29 + 2)) & v23;
        *(_DWORD *)(a1 + 112) = v27;
        *(_WORD *)(v25 + 2LL * (v26 & v29)) = *(_WORD *)(v24 + 2LL * v27);
        *(_WORD *)(v24 + 2LL * v27) = v29;
        *(_DWORD *)(a1 + 144) = v28--;
        ++v29;
      }

      while (v28 != -1);
      goto LABEL_19;
    }

    unsigned int v29 = *(_DWORD *)(a1 + 156) + v19;
    *(_DWORD *)(a1 + 156) = v29;
    *(_DWORD *)(a1 + 144) = 0;
    uint64_t v33 = *(void *)(a1 + 80);
    int v34 = *(unsigned __int8 *)(v33 + v29);
    *(_DWORD *)(a1 + 112) = v34;
    *(_DWORD *)(a1 + 112) = ((v34 << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(v33 + v29 + 1)) & *(_DWORD *)(a1 + 124);
LABEL_21:
    if (v17 == v18)
    {
      uint64_t v35 = *(void *)(a1 + 136);
      unsigned int v36 = v35 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v35);
      _tr_flush_block((int *)a1, v36, v29 - v35, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
        return 0LL;
      }
    }
  }

  uint64_t v38 = *(void *)(a1 + 136);
  if (v38 < 0) {
    uint64_t v39 = 0LL;
  }
  else {
    uint64_t v39 = (char *)(*(void *)(a1 + 80) + v38);
  }
  _tr_flush_block((int *)a1, v39, *(unsigned int *)(a1 + 156) - v38, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3LL;
  }
  return 1LL;
}

uint64_t deflate_slow(uint64_t a1, int a2)
{
  while (1)
  {
    if (*(_DWORD *)(a1 + 164) >= 0x106u)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 144);
      int v6 = *(_DWORD *)(a1 + 160);
      goto LABEL_8;
    }

    fill_window((uint64_t *)a1);
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (!a2 && v4 < 0x106) {
      return 0LL;
    }
    if (!v4) {
      break;
    }
    unsigned int v5 = *(_DWORD *)(a1 + 144);
    int v6 = *(_DWORD *)(a1 + 160);
    if (v4 <= 2)
    {
      *(_DWORD *)(a1 + 168) = v5;
      unsigned int v7 = 2;
      *(_DWORD *)(a1 + 144) = 2;
      *(_DWORD *)(a1 + 148) = v6;
      goto LABEL_18;
    }

void fill_window(uint64_t *a1)
{
  size_t v2 = *((unsigned int *)a1 + 17);
  unsigned int v3 = *((_DWORD *)a1 + 41);
  int32x2_t v4 = vdup_n_s32(v2);
  while (1)
  {
    unsigned int v5 = *((_DWORD *)a1 + 39);
    LODWORD(v6) = *((_DWORD *)a1 + 22) - (v3 + v5);
    if (v5 >= (int)v2 - 262 + *((_DWORD *)a1 + 17))
    {
      memcpy((void *)a1[10], (const void *)(a1[10] + v2), v2);
      int32x2_t v7 = vsub_s32(*(int32x2_t *)((char *)a1 + 156), v4);
      *(uint64_t *)((char *)a1 + 156) = (uint64_t)v7;
      a1[17] -= v2;
      uint64_t v8 = *((unsigned int *)a1 + 29);
      unsigned int v9 = (_WORD *)(a1[13] + 2 * v8 - 2);
      do
      {
        unsigned int v10 = (unsigned __int16)*v9;
        BOOL v11 = v10 >= v2;
        __int16 v12 = v10 - v2;
        if (!v11) {
          __int16 v12 = 0;
        }
        *v9-- = v12;
        LODWORD(v8) = v8 - 1;
      }

      while ((_DWORD)v8);
      int v13 = (_WORD *)(a1[12] + 2 * v2 - 2);
      int v14 = v2;
      do
      {
        unsigned int v15 = (unsigned __int16)*v13;
        BOOL v11 = v15 >= v2;
        __int16 v16 = v15 - v2;
        if (!v11) {
          __int16 v16 = 0;
        }
        *v13-- = v16;
        --v14;
      }

      while (v14);
      LODWORD(v6) = v2 + v6;
      unsigned int v5 = v7.i32[0];
    }

    uint64_t v17 = *a1;
    unsigned int v18 = *(_DWORD *)(*a1 + 8);
    if (!v18) {
      break;
    }
    uint64_t v19 = *((unsigned int *)a1 + 41);
    else {
      size_t v6 = v18;
    }
    if (!(_DWORD)v6) {
      goto LABEL_23;
    }
    uint64_t v20 = a1[10];
    *(_DWORD *)(v17 + 8) = v18 - v6;
    int v21 = *(_DWORD *)(*(void *)(v17 + 56) + 44LL);
    if (v21 == 2)
    {
      uLong v22 = crc32(*(void *)(v17 + 96), *(const Bytef **)v17, v6);
      goto LABEL_21;
    }

    if (v21 == 1)
    {
      uLong v22 = adler32(*(void *)(v17 + 96), *(const Bytef **)v17, v6);
LABEL_21:
      *(void *)(v17 + 96) = v22;
    }

    memcpy((void *)(v20 + v5 + v19), *(const void **)v17, v6);
    *(void *)v17 += v6;
    *(void *)(v17 + 16) += v6;
    LODWORD(v19) = *((_DWORD *)a1 + 41);
LABEL_23:
    unsigned int v3 = v19 + v6;
    *((_DWORD *)a1 + 41) = v19 + v6;
    if ((v19 + v6) >= 3
      && (uint64_t v23 = a1[10],
          uint64_t v24 = *((unsigned int *)a1 + 39),
          int v25 = *(unsigned __int8 *)(v23 + v24),
          *((_DWORD *)a1 + 28) = v25,
          *((_DWORD *)a1 + 28) = ((v25 << *((_DWORD *)a1 + 32)) ^ *(unsigned __int8 *)(v23 + (v24 + 1))) & *((_DWORD *)a1 + 31),
          v3 > 0x105)
      || !*(_DWORD *)(*a1 + 8))
    {
      unint64_t v26 = a1[741];
      unint64_t v27 = a1[11];
      if (v27 <= v26) {
        return;
      }
      unint64_t v28 = *((unsigned int *)a1 + 39) + (unint64_t)v3;
      if (v26 >= v28)
      {
        if (v28 + 258 <= v26) {
          return;
        }
        if (v28 + 258 - v26 >= v27 - v26) {
          unint64_t v31 = v27 - v26;
        }
        else {
          unint64_t v31 = v28 + 258 - v26;
        }
        bzero((void *)(a1[10] + v26), v31);
        size_t v30 = a1[741] + v31;
      }

      else
      {
        if (v27 - v28 >= 0x102) {
          size_t v29 = 258LL;
        }
        else {
          size_t v29 = v27 - v28;
        }
        bzero((void *)(a1[10] + v28), v29);
        size_t v30 = v29 + v28;
      }

      a1[741] = v30;
      return;
    }
  }

uint64_t longest_match(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 172);
  uint64_t v3 = *(int *)(a1 + 168);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(unsigned int *)(a1 + 156);
  size_t v6 = (unsigned __int8 *)(v4 + v5);
  unsigned int v7 = *(_DWORD *)(a1 + 68) - 262;
  BOOL v8 = v5 >= v7;
  unsigned int v9 = v5 - v7;
  if (!v8) {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 96);
  unsigned int v11 = *(_DWORD *)(a1 + 76);
  unsigned int v12 = *(_DWORD *)(a1 + 164);
  int v13 = v6[v3 - 1];
  int v14 = v6[v3];
  unsigned int v15 = *(_DWORD *)(a1 + 192);
  if (v15 >= v12) {
    unsigned int v15 = *(_DWORD *)(a1 + 164);
  }
  while (1)
  {
    __int16 v16 = (unsigned __int8 *)(v4 + a2);
    uint64_t v17 = 0LL;
    uint64_t v18 = v4 + 5 + a2;
    while (1)
    {
      uint64_t v19 = &v6[v17];
      if (v6[v17 + 3] != *(unsigned __int8 *)(v18 + v17 - 2))
      {
        int v25 = (_DWORD)v19 + 3;
        goto LABEL_29;
      }

      if (v19[4] != *(unsigned __int8 *)(v18 + v17 - 1))
      {
        int v25 = (_DWORD)v6 + v17 + 4;
        goto LABEL_29;
      }

      uint64_t v20 = &v6[v17];
      if (v6[v17 + 5] != *(unsigned __int8 *)(v18 + v17))
      {
        int v25 = (_DWORD)v20 + 5;
        goto LABEL_29;
      }

      if (v20[6] != *(unsigned __int8 *)(v18 + v17 + 1))
      {
        int v25 = (_DWORD)v6 + v17 + 6;
        goto LABEL_29;
      }

      int v21 = &v6[v17];
      if (v6[v17 + 7] != *(unsigned __int8 *)(v18 + v17 + 2))
      {
        int v25 = (_DWORD)v21 + 7;
        goto LABEL_29;
      }

      if (v21[8] != *(unsigned __int8 *)(v18 + v17 + 3))
      {
        int v25 = (_DWORD)v6 + v17 + 8;
        goto LABEL_29;
      }

      uLong v22 = &v6[v17];
      int v23 = v17 + 8;
      if ((unint64_t)(v17 + 2) <= 0xF9)
      {
        int v24 = *(unsigned __int8 *)(v18 + v17 + 5);
        v17 += 8LL;
        if (v22[10] == v24) {
          continue;
        }
      }

      int v25 = (_DWORD)v6 + v23 + 2;
      goto LABEL_29;
    }

    int v25 = (_DWORD)v22 + 9;
LABEL_29:
    int v26 = v25 - ((_DWORD)v6 + 258);
    int v27 = v25 - (_DWORD)v6;
    *(_DWORD *)(a1 + 160) = a2;
    int v13 = v6[v26 + 257];
    int v14 = v6[v27];
    LODWORD(v3) = v27;
LABEL_32:
    a2 = *(unsigned __int16 *)(v10 + 2LL * (a2 & v11));
    --v2;
    if (v9 >= a2 || v2 == 0) {
      goto LABEL_37;
    }
  }

  LODWORD(v3) = v27;
LABEL_37:
  else {
    return v3;
  }
}

uint64_t adler32_vec(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    int v5 = a4 - 5552;
    do
    {
      uint8x16_t v6 = *a3;
      uint16x8_t v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      uint64_t v8 = (uint64_t)vadd_s32( (int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)),  vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      int v9 = 173;
      do
      {
        uint8x16_t v10 = *a3;
        uint8x16_t v11 = a3[1];
        uint16x4_t v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        int32x2_t v13 = (int32x2_t)(v8 + *(void *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        uint16x8_t v14 = vmlal_high_u8( vmlal_u8( vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table),  *(uint8x8_t *)v11.i8,  (uint8x8_t)vec_table[2]),  v11,  *(uint8x16_t *)&vec_table[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        uint64_t v8 = (uint64_t)vadd_s32( v13,  vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        BOOL v15 = __OFSUB__(v9--, 1);
      }

      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      uint64x2_t v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1LL, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      uint64_t v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1LL, 0);
      BOOL v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }

    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }

  BOOL v15 = __OFSUB__(a4, 32);
  for (int i = a4 - 32; i < 0 == v15; i -= 32)
  {
    uint8x16_t v18 = *a3;
    uint8x16_t v19 = a3[1];
    uint16x4_t v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    int32x2_t v21 = (int32x2_t)(v4 + *(void *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    uint16x8_t v22 = vmlal_high_u8( vmlal_u8( vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table),  *(uint8x8_t *)v19.i8,  (uint8x8_t)vec_table[2]),  v19,  *(uint8x16_t *)&vec_table[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    uint64_t v4 = (uint64_t)vadd_s32( v21,  vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    BOOL v15 = __OFSUB__(i, 32);
  }

  if ((i & 0x10) != 0)
  {
    uint8x16_t v23 = *a3;
    uint16x8_t v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    uint64_t v4 = (uint64_t)vadd_s32( (int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)),  vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }

  for (int j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    unsigned int v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }

  uint64x2_t v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1LL, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  int32x2_t v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1LL, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

size_t lzma_xz_buffer_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  size_t result = 0LL;
  if (a4 >= 0xC && a5)
  {
    if (*(_DWORD *)a3 != 1484404733 || *(_WORD *)(a3 + 4) != 90) {
      return 0LL;
    }
    int v12 = *(_DWORD *)(a3 + 8);
    int32x2_t v13 = (_BYTE *)(a3 + 6);
    if (*v13) {
      return 0LL;
    }
    uint64_t v14 = *(unsigned __int8 *)(a3 + 7);
    size_t result = 0LL;
    if (*(unsigned __int8 *)(a3 + 7) > 3u)
    {
      if ((_DWORD)v14 == 4)
      {
        uint64_t v14 = 8LL;
      }

      else
      {
        if ((_DWORD)v14 != 10) {
          return result;
        }
        uint64_t v14 = 32LL;
      }
    }

    else if (*(_BYTE *)(a3 + 7))
    {
      if ((_DWORD)v14 != 1) {
        return result;
      }
      uint64_t v14 = 4LL;
    }

    if (a4 < 0xD) {
      return 0LL;
    }
    size_t v15 = 0LL;
    unint64_t v16 = 12LL;
    uint64_t v33 = v14;
    while (1)
    {
      uint64_t v17 = (unsigned __int8 *)(a3 + v16);
      uint64_t v18 = *(unsigned __int8 *)(a3 + v16);
      unint64_t v19 = v16 + 1;
      if (!*(_BYTE *)(a3 + v16)) {
        break;
      }
      uint64_t v34 = 4 * v18 + 4;
      size_t v35 = v15;
      unint64_t v20 = v34 + v19;
      if (v34 + v19 <= a4)
      {
        unint64_t v21 = v16;
        int v22 = *(_DWORD *)&v17[4 * v18];
        if (v22 == xz_simple_crc32(v17, 4 * v18))
        {
          unint64_t v39 = v21 + 2;
          char v23 = *(_BYTE *)(a3 + v19);
          if ((v23 & 0x3F) == 0
            && ((*(_BYTE *)(a3 + v19) & 0x40) == 0 || (xz_read_multi_byte(a3, v20, &v39, &v38) & 0x80000000) == 0)
            && ((v23 & 0x80) == 0 || (xz_read_multi_byte(a3, v20, &v39, &v38) & 0x80000000) == 0))
          {
            uint64_t v36 = 0LL;
            uint64_t v37 = 0LL;
            if ((xz_read_multi_byte(a3, v20, &v39, &v37) & 0x80000000) == 0
              && (xz_read_multi_byte(a3, v20, &v39, &v36) & 0x80000000) == 0
              && v37 == 33
              && v36 == 1
              && v39 < v20
              && *(unsigned __int8 *)(a3 + v39) <= 0x28u)
            {
              unint64_t v24 = v34 + v21;
              unint64_t v39 = 0LL;
              size_t v25 = lzma2_block_decode(a1 + v35, a2 - v35, a3 + v24, a4 - v24, &v39, a5);
              if (v25)
              {
                if (v39)
                {
                  unint64_t v16 = v24 + v33 + ((v39 + 3) & 0xFFFFFFFFFFFFFFFCLL);
                  size_t v15 = v25 + v35;
                  if (v16 < a4) {
                    continue;
                  }
                }
              }
            }
          }
        }
      }

      return 0LL;
    }

    uint64_t v38 = 0LL;
    unint64_t v39 = v16 + 1;
    if ((xz_read_multi_byte(a3, a4, &v39, &v38) & 0x80000000) != 0) {
      return 0LL;
    }
    uint64_t v26 = v38;
    if (v38)
    {
      while ((xz_read_multi_byte(a3, a4, &v39, &v37) & 0x80000000) == 0
           && (xz_read_multi_byte(a3, a4, &v39, &v37) & 0x80000000) == 0)
      {
        if (!--v26) {
          goto LABEL_44;
        }
      }

      return 0LL;
    }

uint64_t lzma_xz_buffer_decode_scratch_size()
{
  return 30080LL;
}

uint64_t xz_simple_crc32(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  unsigned int v2 = -1;
  do
  {
    int v3 = *a1++;
    unsigned int v4 = crc32_lut4[(v2 ^ v3) & 0xF];
    unsigned int v2 = (v4 >> 4) ^ (v2 >> 8) ^ crc32_lut4[(v4 ^ ((v2 ^ v3) >> 4)) & 0xF];
    --a2;
  }

  while (a2);
  return ~v2;
}

uint64_t xz_read_multi_byte(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a3;
  if (*a3 < a2)
  {
    if (v4 + 9 >= a2) {
      unint64_t v5 = a2;
    }
    else {
      unint64_t v5 = v4 + 9;
    }
    char v6 = *(_BYTE *)(a1 + v4);
    uint64_t v7 = v6 & 0x7F;
    unint64_t v8 = v4 + 1;
    if ((v6 & 0x80) == 0)
    {
LABEL_6:
      uint64_t result = 0LL;
      *a3 = v8;
      *a4 = v7;
      return result;
    }

    uint64_t v10 = 7LL;
    while (v5 != v8)
    {
      char v11 = *(_BYTE *)(a1 + v8);
      if (!v11) {
        break;
      }
      v7 |= (unint64_t)(v11 & 0x7F) << v10;
      v10 += 7LL;
      ++v8;
      if ((v11 & 0x80) == 0) {
        goto LABEL_6;
      }
    }
  }

  return 0xFFFFFFFFLL;
}

double lzma_stream_init(uint64_t a1, int a2)
{
  *(void *)(a1 + 32) = 0LL;
  unint64_t v4 = malloc(0xA0uLL);
  if (v4)
  {
    char v6 = v4;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    if (a2)
    {
      if (lzma_auto_decoder())
      {
LABEL_4:
        free(v6);
        return result;
      }
    }

    else if (lzma_easy_encoder())
    {
      goto LABEL_4;
    }

    *char v6 = a2;
    double result = -1.06069509e-97;
    *(void *)(v6 + 1) = 0xABCD000500000306LL;
    *(void *)(a1 + 32) = v6;
  }

  return result;
}

uint64_t lzma_stream_process(void *a1, char a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[3];
  *(void *)(v3 + 24) = a1[2];
  *(void *)(v3 + 32) = v4;
  uint64_t v5 = a1[1];
  *(void *)(v3 + 48) = *a1;
  *(void *)(v3 + 56) = v5;
  *(_DWORD *)(v3 + 16) |= a2 & 1;
  uint64_t result = lzma_code();
  uint64_t v7 = *(void *)(v3 + 32);
  a1[2] += a1[3] - v7;
  a1[3] = v7;
  uint64_t v8 = *(void *)(v3 + 56);
  *a1 += a1[1] - v8;
  a1[1] = v8;
  if (!(_DWORD)result) {
    return 0LL;
  }
  if ((_DWORD)result == 1) {
    return result;
  }
  if ((_DWORD)result != 10) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t lzma_stream_end(uint64_t a1)
{
  return 0LL;
}

BOOL lzma_stream_identify_algorithm(_DWORD *a1)
{
  return *a1 == 1484404733;
}

unint64_t touchpadCodecEncodeImage( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, int a6)
{
  unint64_t v7 = *(unsigned int *)(a1 + 664);
  if (a5 < 2 * v7) {
    goto LABEL_120;
  }
  unsigned int v8 = (*(void *)(a1 + 656) == 0LL) | a6;
  if (v8 > 1) {
    return 0LL;
  }
  uint64_t v11 = *(unsigned int *)(a1 + 668);
  uint64_t v120 = a2;
  unint64_t v121 = a3;
  uint64_t v123 = 0LL;
  unint64_t v124 = 0LL;
  unint64_t v122 = 0LL;
  unsigned __int8 v118 = v8;
  codecWriteHeader(&v120, v7, v11, *(unsigned __int8 *)(a1 + 672), v8);
  unsigned __int8 v12 = v118;
  if ((v118 & 1) != 0)
  {
    codecResetModel(a1);
    unsigned __int8 v12 = v118;
  }

  if ((_DWORD)v11)
  {
    unsigned int v119 = 0;
    uint64_t v13 = 0LL;
    uint64_t v116 = v11;
    unint64_t v117 = a5;
    while (1)
    {
      uint64_t v14 = (v12 & (v13 != 0)) != 0 ? -(uint64_t)v7 : 0LL;
      if ((_DWORD)v7) {
        break;
      }
LABEL_104:
      ++v13;
      a4 += v117;
      v119 += v7;
      unsigned __int8 v12 = v118;
      if (v13 == v116) {
        goto LABEL_105;
      }
    }

    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)(a1 + 632);
    int v17 = *(__int16 *)(v16 + 2LL * (v7 * v13) + 2 * v14);
    uint64_t v18 = v16 + 2LL * v119;
    uint64_t v19 = v18 + 2 * v14;
    int v20 = v17;
    int v21 = v17;
    int v22 = v17;
    while (1)
    {
      uint64_t v23 = v15 + 1;
      if (v15 + 1 < v7) {
        int v22 = *(__int16 *)(v19 + 2 * v15 + 2);
      }
      int v24 = *(__int16 *)(a4 + 2 * v15);
      *(_WORD *)(v18 + 2 * v15) = *(_WORD *)(a4 + 2 * v15);
      int v25 = v17 - v20;
      if (v17 - v20 <= -2) {
        int v26 = -2;
      }
      else {
        int v26 = 0;
      }
      if (v25 > 1) {
        int v26 = 2;
      }
      if (v25 < -40) {
        int v26 = -1;
      }
      if (v25 <= 40) {
        int v27 = v26;
      }
      else {
        int v27 = 1;
      }
      int v28 = 25 * v27;
      int v29 = v20 - v21;
      if (v20 - v21 <= -2) {
        int v30 = -2;
      }
      else {
        int v30 = 0;
      }
      if (v29 > 1) {
        int v30 = 2;
      }
      if (v29 < -40) {
        int v30 = -1;
      }
      if (v29 <= 40) {
        int v31 = v30;
      }
      else {
        int v31 = 1;
      }
      int v32 = 5 * v31 + v28;
      int v33 = v21 - v22;
      if (v21 - v22 <= -2) {
        int v34 = -2;
      }
      else {
        int v34 = 0;
      }
      if (v33 > 1) {
        int v34 = 2;
      }
      if (v33 < -40) {
        int v34 = -1;
      }
      if (v33 <= 40) {
        int v35 = v34;
      }
      else {
        int v35 = 1;
      }
      int v36 = v32 + v35;
      int v37 = v21 - v20 + v17;
      if (v37 <= v17) {
        int v38 = v17;
      }
      else {
        int v38 = v37;
      }
      if (v37 < v17) {
        int v17 = v37;
      }
      if (v38 >= v21) {
        int v39 = v21;
      }
      else {
        int v39 = v38;
      }
      if (v17 <= v39) {
        int v17 = v39;
      }
      int v40 = v24 - v17;
      if (v36 >= 0) {
        unsigned int v41 = v36;
      }
      else {
        unsigned int v41 = -v36;
      }
      if (v36 < 0) {
        int v40 = -v40;
      }
      uint64_t v42 = a1 + 10LL * v41;
      uint64_t v43 = (_BYTE *)(v42 + 8);
      int v44 = *(unsigned __int8 *)(v42 + 8);
      unsigned int v45 = v40 - ((*(_DWORD *)(v42 + 4) + 8) >> 4);
      int v46 = (__int16)v45;
      int v47 = ~(2 * (__int16)v45);
      int v48 = (2 * (__int16)v45) ^ ~(v47 >> 31);
      unsigned int v49 = (unsigned __int16)((2 * v45) ^ ~(unsigned __int16)(v47 >> 31));
      unsigned int v50 = v49 >> v44;
      if (v49 >> v44 > 0xF)
      {
        unsigned int v69 = v124;
        int v68 = HIDWORD(v124);
        int v70 = HIDWORD(v124) + 16;
        HIDWORD(v124) += 16;
        if (v68 >= 1)
        {
          unint64_t v72 = v121;
          unint64_t v71 = v122;
          unint64_t v73 = ++v122;
          if (v71 < v121)
          {
            uint64_t v74 = v123++;
            *(_BYTE *)(v120 + v74) = v124;
            unsigned int v69 = v124;
            int v70 = HIDWORD(v124);
            unint64_t v72 = v121;
            unint64_t v73 = v122;
          }

          unsigned int v75 = v69 >> 8;
          int v76 = v70 - 8;
          unint64_t v124 = __PAIR64__(v76, v75);
          unint64_t v122 = v73 + 1;
          if (v73 < v72)
          {
            uint64_t v77 = v123++;
            *(_BYTE *)(v120 + v77) = v75;
            unsigned int v75 = v124;
            int v76 = HIDWORD(v124);
          }

          unsigned int v69 = v75 >> 8;
          int v70 = v76 - 8;
        }

        unsigned int v78 = v69 | (v49 << v70);
        int v79 = v70 + 16;
        LODWORD(v124) = v78;
        HIDWORD(v124) = v70 + 16;
        if (v70 >= 1)
        {
          unint64_t v81 = v121;
          unint64_t v80 = v122;
          unint64_t v82 = ++v122;
          if (v80 < v121)
          {
            uint64_t v83 = v123++;
            *(_BYTE *)(v120 + v83) = v78;
            unsigned int v78 = v124;
            int v79 = HIDWORD(v124);
            unint64_t v81 = v121;
            unint64_t v82 = v122;
          }

          unsigned int v66 = v78 >> 8;
          int v67 = v79 - 8;
          LODWORD(v124) = v66;
          HIDWORD(v124) = v79 - 8;
          unint64_t v122 = v82 + 1;
          if (v82 < v81)
          {
LABEL_81:
            uint64_t v84 = v123++;
            *(_BYTE *)(v120 + v84) = v66;
            unsigned int v66 = v124;
            int v67 = HIDWORD(v124);
          }

LABEL_82:
          LODWORD(v124) = v66 >> 8;
          HIDWORD(v124) = v67 - 8;
        }
      }

      else
      {
        unsigned int v51 = v124 | (1 << v50 << SBYTE4(v124));
        int v52 = v50 + HIDWORD(v124) + 1;
        unint64_t v124 = __PAIR64__(v52, v51);
        if (v52 >= 17)
        {
          unint64_t v54 = v121;
          unint64_t v53 = v122;
          unint64_t v55 = ++v122;
          if (v53 < v121)
          {
            uint64_t v56 = v123++;
            *(_BYTE *)(v120 + v56) = v51;
            unsigned int v51 = v124;
            int v52 = HIDWORD(v124);
            unint64_t v54 = v121;
            unint64_t v55 = v122;
          }

          unsigned int v57 = v51 >> 8;
          int v58 = v52 - 8;
          unint64_t v124 = __PAIR64__(v58, v57);
          unint64_t v122 = v55 + 1;
          if (v55 < v54)
          {
            uint64_t v59 = v123++;
            *(_BYTE *)(v120 + v59) = v57;
            unsigned int v57 = v124;
            int v58 = HIDWORD(v124);
          }

          unsigned int v51 = v57 >> 8;
          int v52 = v58 - 8;
        }

        unsigned int v60 = v51 | ((unsigned __int16)(v48 - (v50 << v44)) << v52);
        int v61 = v52 + v44;
        unint64_t v124 = __PAIR64__(v61, v60);
        if (v61 >= 17)
        {
          unint64_t v63 = v121;
          unint64_t v62 = v122;
          unint64_t v64 = ++v122;
          if (v62 < v121)
          {
            uint64_t v65 = v123++;
            *(_BYTE *)(v120 + v65) = v60;
            unsigned int v60 = v124;
            int v61 = HIDWORD(v124);
            unint64_t v63 = v121;
            unint64_t v64 = v122;
          }

          unsigned int v66 = v60 >> 8;
          int v67 = v61 - 8;
          unint64_t v124 = __PAIR64__(v67, v66);
          unint64_t v122 = v64 + 1;
          if (v64 < v63) {
            goto LABEL_81;
          }
          goto LABEL_82;
        }
      }

      uint64_t v85 = a1 + 10LL * v41;
      char v87 = *(_BYTE *)(v85 + 9);
      uint64_t v86 = (_BYTE *)(v85 + 9);
      int v88 = *(_DWORD *)v42;
      unsigned __int8 v89 = v87 + 1;
      *uint64_t v86 = v87 + 1;
      int v90 = *v43;
      if (v46 >= 0) {
        int v91 = v46;
      }
      else {
        int v91 = -v46;
      }
      if (v46 <= 0)
      {
        if ((v46 & 0x80000000) == 0) {
          goto LABEL_90;
        }
        int v92 = -1;
      }

      else
      {
        int v92 = 1;
      }

      *(_DWORD *)(v42 + 4) += v92;
LABEL_90:
      int v93 = v88 + v91;
      int v94 = v89;
      int v95 = v89 << v90;
      int v97 = v95 >= 2 * v93 && v90 != 0;
      int v98 = v97 << 31 >> 31;
      if (v95 >= v93) {
        char v99 = v98;
      }
      else {
        char v99 = 1;
      }
      *(_DWORD *)uint64_t v42 = v93;
      *uint64_t v43 = v90 + v99;
      if (v94 == 64)
      {
        *uint64_t v86 = 32;
        *(_DWORD *)uint64_t v42 = v93 - (v93 >> 1);
      }

      uint64_t v15 = v23;
      int v17 = v24;
      int v20 = v21;
      int v21 = v22;
      if (v7 == v23) {
        goto LABEL_104;
      }
    }
  }

size_t lzma2_block_decode( unint64_t a1, size_t a2, uint64_t a3, unint64_t a4, unint64_t *a5, void *a6)
{
  __n128 v32 = 0u;
  __int128 v33 = 0u;
  if (!a4) {
    return 0LL;
  }
  size_t v9 = 0LL;
  unint64_t v10 = 0LL;
  unint64_t v29 = a1 + a2;
  while (1)
  {
    unint64_t v11 = v10 + 1;
    unsigned int v12 = *(unsigned __int8 *)(a3 + v10);
    unint64_t v18 = v10 + 5;
    if (v10 + 5 > a4) {
      return 0LL;
    }
    int v19 = *(unsigned __int8 *)(a3 + v11);
    int v20 = *(unsigned __int8 *)(v10 + a3 + 2);
    unsigned int v21 = *(unsigned __int16 *)(v10 + a3 + 3);
    int v22 = (v12 >> 5) & 3;
    if ((v22 - 2) >= 2)
    {
      if (!v22) {
        goto LABEL_22;
      }
    }

    else
    {
      if (v18 >= a4) {
        return 0LL;
      }
      unsigned int v23 = *(unsigned __int8 *)(a3 + v18);
      if (v23 > 0xE0) {
        return 0LL;
      }
      __int16 v24 = *(unsigned __int8 *)(a3 + v18) / 9u;
      BYTE10(v33) = v23 - 9 * v24;
      BYTE8(v33) = (((v23 - ((unsigned __int16)(109 * v23) >> 8)) >> 1) + ((109 * v23) >> 8)) >> 5;
      BYTE9(v33) = v24 - 5 * ((unsigned __int16)(52 * v24) >> 8);
      BYTE11(v33) = ~(-1 << SBYTE9(v33));
      BYTE12(v33) = ~(-1 << SBYTE8(v33));
      unint64_t v18 = v10 + 6;
    }

    lzma1_model_reset(&v32, a6);
LABEL_22:
    uint64_t v25 = ((v20 | (v19 << 8)) & 0xFFE0FFFF | ((v12 & 0x1F) << 16)) + 1;
    unint64_t v10 = __rev16(v21) + 1LL + v18;
    size_t v16 = v9 + v25;
    BOOL v26 = v10 > a4 || v16 > a2;
    if (v26
      || lzma1_chunk_decode( (unsigned int *)&v32,  a1,  (_BYTE *)(a1 + v9),  (_BYTE *)(a1 + v9 + v25),  v29,  (unsigned __int8 *)(a3 + v18),  a4 - v18) != v25)
    {
      return 0LL;
    }

uint64_t lzfseDecode(uint64_t a1)
{
  unsigned int v2 = (char *)&__dst[16] + 2;
  uint64_t v3 = a1 + 3208;
  uint64_t v4 = a1 + 136;
  uint64_t v154 = a1 + 1160;
  uint64_t v155 = a1 + 648;
  int v156 = (_DWORD *)(a1 + 7308);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        int v5 = *(_DWORD *)(a1 + 52);
        uint64_t result = 4294967293LL;
        if (v5 <= 829978209) {
          break;
        }
        if (v5 == 829978210 || v5 == 846755426)
        {
          unint64_t v8 = *(void *)(a1 + 16);
          BOOL v9 = v8 > *(void *)a1;
          unint64_t v10 = v8 - *(void *)a1;
          uint64_t result = lzfse_decode_lmd(a1);
          if ((_DWORD)result) {
            return result;
          }
          *(_DWORD *)(a1 + 52) = 0;
          *(void *)a1 += *(unsigned int *)(a1 + 76);
        }

        else
        {
          if (v5 != 1853388386) {
            return result;
          }
          uint64_t v18 = *(unsigned int *)(a1 + 60);
          int v19 = *(const void **)a1;
          unint64_t v20 = *(void *)(a1 + 16);
          *(_OWORD *)((char *)&__dst[3] + 8) = 0u;
          *(_OWORD *)((char *)&__dst[4] + 8) = 0u;
          *(_OWORD *)((char *)&__dst[2] + 8) = 0u;
          BOOL v9 = (uint64_t)(v20 - (void)v19) <= v18;
          unint64_t v21 = (unint64_t)v19 + v18;
          if (v9) {
            unint64_t v21 = v20;
          }
          *(void *)&__dst[0] = v19;
          *((void *)&__dst[0] + 1) = v21;
          __int128 v22 = *(_OWORD *)(a1 + 24);
          __dst[1] = v22;
          *(void *)&__dst[2] = *(void *)(a1 + 40);
          uint64_t v23 = *(unsigned int *)(a1 + 56);
          if (*(void *)&__dst[2] - (void)v22 > v23) {
            *(void *)&__dst[2] = v22 + v23;
          }
          *((void *)&__dst[4] + 1) = *(unsigned int *)(a1 + 64);
          LODWORD(__dst[5]) = 0;
          uint64_t result = lzvnDecode((uint64_t)__dst);
          if ((_DWORD)result == -3) {
            return result;
          }
          unint64_t v24 = *(void *)&__dst[0] - *(void *)a1;
          unint64_t v25 = *(unsigned int *)(a1 + 60);
          if (v24 > v25) {
            return 4294967293LL;
          }
          uint64_t v26 = *(void *)&__dst[1];
          unint64_t v27 = *(void *)&__dst[1] - *(void *)(a1 + 24);
          unint64_t v28 = *(unsigned int *)(a1 + 56);
          if (v27 > v28) {
            return 4294967293LL;
          }
          *(void *)a1 = *(void *)&__dst[0];
          *(void *)(a1 + 24) = v26;
          int v29 = DWORD2(__dst[4]);
          int v30 = __dst[5];
          int v31 = v25 - v24;
          *(_DWORD *)(a1 + 60) = v31;
          *(_DWORD *)(a1 + 64) = v29;
          *(_DWORD *)(a1 + 56) = v28 - v27;
          if (v31)
          {
            if (v30) {
              BOOL v149 = 1;
            }
            else {
              BOOL v149 = (_DWORD)v28 == (_DWORD)v27;
            }
            if (v149) {
              return 4294967293LL;
            }
            else {
              return 4294967294LL;
            }
          }

          uint64_t result = 4294967293LL;
          if ((_DWORD)v28 != (_DWORD)v27 || !v30) {
            return result;
          }
LABEL_41:
          *(_DWORD *)(a1 + 52) = 0;
        }
      }

      if (!v5) {
        break;
      }
      if (v5 != 762869346) {
        return result;
      }
      unint64_t v11 = *(unsigned int *)(a1 + 68);
      if (!(_DWORD)v11) {
        goto LABEL_41;
      }
      unint64_t v12 = *(void *)(a1 + 16);
      BOOL v9 = v12 > *(void *)a1;
      unint64_t v13 = v12 - *(void *)a1;
      if (!v9) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v14 = *(void *)(a1 + 40);
      size_t v15 = *(void **)(a1 + 24);
      BOOL v9 = v14 > (unint64_t)v15;
      unint64_t v16 = v14 - (void)v15;
      if (!v9) {
        return 4294967294LL;
      }
      if (v13 >= v11) {
        unint64_t v11 = v11;
      }
      else {
        unint64_t v11 = v13;
      }
      if (v16 >= v11) {
        size_t v17 = v11;
      }
      else {
        size_t v17 = v16;
      }
      memmove(v15, *(const void **)a1, v17);
      *(void *)a1 += v17;
      *(void *)(a1 + 24) += v17;
      *(_DWORD *)(a1 + 68) -= v17;
    }

    __n128 v32 = *(unsigned int **)a1;
    __int128 v33 = (_DWORD *)(*(void *)a1 + 4LL);
    unint64_t v34 = *(void *)(a1 + 16);
    int v35 = *v32;
    if (v35 != 846755426)
    {
      if (v35 != 1853388386) {
        return result;
      }
      *(_DWORD *)(a1 + 56) = v32[1];
      *(void *)(a1 + 60) = v32[2];
      *(void *)a1 = v32 + 3;
      int v36 = 1853388386;
      goto LABEL_122;
    }

LABEL_51:
    int v153 = *v32;
    if (v35 == 846755426)
    {
      uint64_t v151 = v3;
      int v37 = (unsigned __int8 *)(v32 + 8);
      uint64_t v152 = v4;
      unint64_t v38 = *((void *)v32 + 3);
      if ((v38 & 0xFFFFFFE0) == 0) {
        return result;
      }
      uint64_t v150 = v2;
      int v39 = (unsigned __int8 *)v32 + *((void *)v32 + 3);
      bzero(&__dst[3], 0x2D4uLL);
      uint64_t v40 = v38;
      unint64_t v41 = *((void *)v32 + 1);
      unint64_t v42 = *((void *)v32 + 2);
      unsigned int v43 = v32[1];
      LODWORD(__dst[0]) = 829978210;
      DWORD1(__dst[0]) = v43;
      unint64_t v44 = v42 >> 30;
      uint64_t v45 = (v42 >> 40) & 0xFFFFF;
      uint64_t v46 = (v42 >> 60) & 7;
      LOWORD(v47) = v42;
      WORD1(v47) = v42 >> 10;
      WORD2(v47) = v42 >> 20;
      uint64_t v48 = (v41 >> 20) & 0xFFFFF;
      LODWORD(v47) = v47 & 0x3FF03FF;
      WORD2(v47) &= 0x3FFu;
      HIWORD(v47) = v44 & 0x3FF;
      *(void *)&__dst[2] = v47;
      LODWORD(__dst[1]) = (v41 >> 40) & 0xFFFFF;
      *(void *)((char *)&__dst[1] + 4) = __PAIR64__(v45, v48);
      HIDWORD(__dst[1]) = ((v41 >> 60) & 7) - 7;
      DWORD2(__dst[2]) = v46 - 7;
      WORD6(__dst[2]) = WORD2(v38) & 0x3FF;
      HIWORD(__dst[2]) = (v38 >> 42) & 0x3FF;
      LOWORD(__dst[3]) = (v38 >> 52) & 0x3FF;
      DWORD2(__dst[0]) = v45 + v48;
      HIDWORD(__dst[0]) = v41 & 0xFFFFF;
      BOOL v49 = v38 >= 0x20uLL;
      if (v38 != 32LL)
      {
        uint64_t v4 = v152;
        if (v49)
        {
          uint64_t v141 = 0LL;
          int v142 = 0;
          unsigned int v143 = 0;
          while (1)
          {
            if (v37 >= v39 || v142 > 24)
            {
              int v144 = v142;
            }

            else
            {
              do
              {
                int v144 = v142 + 8;
                int v145 = *v37++;
                v143 |= v145 << v142;
                if (v37 >= v39) {
                  break;
                }
                BOOL v9 = v142 < 17;
                v142 += 8;
              }

              while (v9);
            }

            int v146 = lzfse_freq_nbits_table[v143 & 0x1F];
            if (v146 == 14) {
              int v147 = ((v143 >> 4) & 0x3FF) + 24;
            }
            else {
              LOWORD(v147) = v146 == 8 ? (v143 >> 4) + 8 : lzfse_freq_value_table[v143 & 0x1F];
            }
            int v148 = (char)v146;
            *((_WORD *)&__dst[3] + v141 + 1) = v147;
            int v142 = v144 - (char)v146;
            if (v144 < v148) {
              break;
            }
            v143 >>= v148;
            if (++v141 == 360)
            {
              uint64_t result = 4294967293LL;
              if (v37 == v39)
              {
                unsigned int v2 = v150;
                uint64_t v3 = v151;
                if (v142 < 8) {
                  goto LABEL_61;
                }
              }

              return result;
            }
          }
        }

        return 4294967293LL;
      }

      unsigned int v2 = v150;
      uint64_t v3 = v151;
      uint64_t v4 = v152;
    }

    else
    {
      memcpy(__dst, v32, 0x304uLL);
      uint64_t v48 = DWORD1(__dst[1]);
      uint64_t v45 = DWORD2(__dst[1]);
      uint64_t v40 = 772LL;
    }

LABEL_61:
    unsigned int v50 = (char *)v32 + v40;
    unint64_t v51 = 0LL;
    int v52 = __dst[1];
    for (uint64_t i = 50LL; i != 90; i += 2LL)
      v51 += *(unsigned __int16 *)((char *)__dst + i);
    unint64_t v54 = 0LL;
    for (uint64_t j = 90LL; j != 130; j += 2LL)
      v54 += *(unsigned __int16 *)((char *)__dst + j);
    int64x2_t v56 = 0uLL;
    int64x2_t v57 = 0uLL;
    int64x2_t v58 = 0uLL;
    int64x2_t v59 = 0uLL;
    do
    {
      uint16x8_t v60 = *(uint16x8_t *)((char *)__dst + j);
      uint32x4_t v61 = vmovl_u16(*(uint16x4_t *)v60.i8);
      uint32x4_t v62 = vmovl_high_u16(v60);
      int64x2_t v59 = (int64x2_t)vaddw_high_u32((uint64x2_t)v59, v62);
      int64x2_t v58 = (int64x2_t)vaddw_u32((uint64x2_t)v58, *(uint32x2_t *)v62.i8);
      int64x2_t v57 = (int64x2_t)vaddw_high_u32((uint64x2_t)v57, v61);
      int64x2_t v56 = (int64x2_t)vaddw_u32((uint64x2_t)v56, *(uint32x2_t *)v61.i8);
      j += 16LL;
    }

    while (j != 258);
    unint64_t v63 = vaddvq_s64(vaddq_s64(vaddq_s64(v56, v58), vaddq_s64(v57, v59)));
    int64x2_t v64 = 0uLL;
    uint64_t v65 = 258LL;
    int64x2_t v66 = 0uLL;
    int64x2_t v67 = 0uLL;
    int64x2_t v68 = 0uLL;
    do
    {
      uint16x8_t v69 = *(uint16x8_t *)((char *)__dst + v65);
      uint32x4_t v70 = vmovl_u16(*(uint16x4_t *)v69.i8);
      uint32x4_t v71 = vmovl_high_u16(v69);
      int64x2_t v68 = (int64x2_t)vaddw_high_u32((uint64x2_t)v68, v71);
      int64x2_t v67 = (int64x2_t)vaddw_u32((uint64x2_t)v67, *(uint32x2_t *)v71.i8);
      int64x2_t v66 = (int64x2_t)vaddw_high_u32((uint64x2_t)v66, v70);
      int64x2_t v64 = (int64x2_t)vaddw_u32((uint64x2_t)v64, *(uint32x2_t *)v70.i8);
      v65 += 16LL;
    }

    while (v65 != 770);
    int8x16_t v72 = vbicq_s8( (int8x16_t)xmmword_181096F40,  (int8x16_t)vmovl_u16(vcgt_u16((uint16x4_t)0x400040004000400LL, *(uint16x4_t *)&__dst[2])));
    *(int8x8_t *)v72.i8 = vorr_s8(*(int8x8_t *)v72.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL));
    if (v72.i32[0] | v72.i32[1] | (2 * (HIDWORD(__dst[0]) > 0x9C40)) | ((WORD6(__dst[2]) > 0x3Fu) << 7) | (4 * (LODWORD(__dst[1]) > 0x2710)) | ((LOWORD(__dst[3]) > 0xFFu) << 9) | ((HIWORD(__dst[2]) > 0x3Fu) << 8) | ((v54 > 0x40) << 11) | ((v51 > 0x40) << 10) | (((unint64_t)vaddvq_s64(vaddq_s64(vaddq_s64(v64, v67), vaddq_s64(v66, v68))) > 0x400) << 13) | ((v63 > 0x100) << 12) | (LODWORD(__dst[0]) != 829978210)
      || *(_DWORD *)(a1 + 7304) < HIDWORD(__dst[0]))
    {
      return 4294967293LL;
    }

    uint64_t v73 = 0LL;
    int v74 = 0;
    *(void *)a1 = v50;
    uint64_t v75 = v3;
    *(_DWORD *)(a1 + 72) = v52;
    *(_DWORD *)(a1 + 76) = v45;
    do
    {
      unsigned int v76 = *(unsigned __int16 *)&v2[2 * v73];
      if (*(_WORD *)&v2[2 * v73])
      {
        v74 += v76;
        if (v74 > 1024) {
          break;
        }
        signed int v77 = 0;
        char v78 = __clz(v76);
        char v79 = v78 - 21;
        unsigned int v80 = 0x800u >> (v78 - 21);
        signed int v81 = v80 - v76;
        char v82 = v78 - 22;
        unsigned int v83 = v76 - v80;
        do
        {
          int v84 = (v83 + v77) << v82;
          if (v77 >= v81)
          {
            char v85 = v82;
          }

          else
          {
            LOWORD(v84) = (((_WORD)v76 + (_WORD)v77) << v79) - 1024;
            char v85 = v79;
          }

          *(_BYTE *)uint64_t v75 = v85;
          *(_BYTE *)(v75 + 1) = v73;
          *(_WORD *)(v75 + 2) = v84;
          v75 += 4LL;
          ++v77;
        }

        while (v76 != v77);
      }

      ++v73;
    }

    while (v73 != 256);
    uint64_t v86 = 0LL;
    uint64_t v87 = v4;
    do
    {
      unsigned int v88 = *((unsigned __int16 *)&__dst[3] + v86 + 1);
      if (*((_WORD *)&__dst[3] + v86 + 1))
      {
        signed int v89 = 0;
        char v90 = __clz(v88);
        char v91 = v90 - 25;
        unsigned int v92 = 0x80u >> (v90 - 25);
        signed int v93 = v92 - v88;
        char v94 = kLSymbolVBits[v86];
        int v95 = kLSymbolVBase[v86];
        char v96 = v90 - 26;
        unsigned int v97 = v88 - v92;
        do
        {
          int v98 = (v97 + v89) << v96;
          if (v89 >= v93)
          {
            char v99 = v96;
          }

          else
          {
            LOWORD(v98) = (((_WORD)v88 + (_WORD)v89) << v91) - 64;
            char v99 = v91;
          }

          *(_BYTE *)uint64_t v87 = v94 + v99;
          *(_BYTE *)(v87 + 1) = v94;
          *(_WORD *)(v87 + 2) = v98;
          *(_DWORD *)(v87 + 4) = v95;
          v87 += 8LL;
          ++v89;
        }

        while (v88 != v89);
      }

      ++v86;
    }

    while (v86 != 20);
    uint64_t v100 = 0LL;
    uint64_t v101 = v155;
    do
    {
      unsigned int v102 = *((unsigned __int16 *)&__dst[5] + v100 + 5);
      if (*((_WORD *)&__dst[5] + v100 + 5))
      {
        signed int v103 = 0;
        char v104 = __clz(v102);
        char v105 = v104 - 25;
        unsigned int v106 = 0x80u >> (v104 - 25);
        signed int v107 = v106 - v102;
        char v108 = kMSymbolVBits[v100];
        int v109 = kMSymbolVBase[v100];
        char v110 = v104 - 26;
        unsigned int v111 = v102 - v106;
        do
        {
          int v112 = (v111 + v103) << v110;
          if (v103 >= v107)
          {
            char v113 = v110;
          }

          else
          {
            LOWORD(v112) = (((_WORD)v102 + (_WORD)v103) << v105) - 64;
            char v113 = v105;
          }

          *(_BYTE *)uint64_t v101 = v108 + v113;
          *(_BYTE *)(v101 + 1) = v108;
          *(_WORD *)(v101 + 2) = v112;
          *(_DWORD *)(v101 + 4) = v109;
          v101 += 8LL;
          ++v103;
        }

        while (v102 != v103);
      }

      ++v100;
    }

    while (v100 != 20);
    uint64_t v114 = 0LL;
    uint64_t v115 = v154;
    do
    {
      unsigned int v116 = *((unsigned __int16 *)&__dst[8] + v114 + 1);
      if (*((_WORD *)&__dst[8] + v114 + 1))
      {
        signed int v117 = 0;
        char v118 = __clz(v116);
        char v119 = v118 - 23;
        unsigned int v120 = 0x200u >> (v118 - 23);
        signed int v121 = v120 - v116;
        char v122 = kDSymbolVBits[v114];
        int v123 = kDSymbolVBase[v114];
        char v124 = v118 - 24;
        unsigned int v125 = v116 - v120;
        do
        {
          int v126 = (v125 + v117) << v124;
          if (v117 >= v121)
          {
            char v127 = v124;
          }

          else
          {
            LOWORD(v126) = (((_WORD)v116 + (_WORD)v117) << v119) - 256;
            char v127 = v119;
          }

          *(_BYTE *)uint64_t v115 = v122 + v127;
          *(_BYTE *)(v115 + 1) = v122;
          *(_WORD *)(v115 + 2) = v126;
          *(_DWORD *)(v115 + 4) = v123;
          v115 += 8LL;
          ++v117;
        }

        while (v116 != v117);
      }

      ++v114;
    }

    while (v114 != 64);
    unint64_t v128 = *(void *)(a1 + 8);
    unsigned int v129 = HIDWORD(__dst[1]);
    unint64_t v130 = *(void *)a1 + DWORD1(__dst[1]);
    *(void *)a1 = v130;
    if (v129)
    {
      if (v130 < v128 + 8) {
        return 4294967293LL;
      }
      int v157 = (void *)(v130 - 8);
      unint64_t v131 = *(void *)(v130 - 8);
      unint64_t v158 = v131;
      char v132 = v129 + 64;
      int v159 = v129 + 64;
      if (v129 < 0xFFFFFFF8) {
        return 4294967293LL;
      }
    }

    else
    {
      if (v130 < v128 + 7) {
        return 4294967293LL;
      }
      int v157 = (void *)(v130 - 7);
      int v133 = *(_DWORD *)(v130 - 7);
      *(_DWORD *)((char *)&v158 + 3) = *(_DWORD *)(v130 - 4);
      char v132 = 56;
      LODWORD(v158) = v133;
      unint64_t v131 = v158 & 0xFFFFFFFFFFFFFFLL;
      v158 &= 0xFFFFFFFFFFFFFFuLL;
      int v159 = 56;
    }

    if (v131 >> v132
      || lzfse_decode_literals( v156,  v3,  HIDWORD(__dst[0]),  (uint64_t)&v158,  &v157,  v128,  *(double *)&__dst[2]) == -3)
    {
      return 4294967293LL;
    }

    *(void *)(a1 + 80) = v156;
    uint64_t v134 = *(const void **)a1;
    uint64_t v135 = *(void *)a1 + DWORD2(__dst[1]);
    if (DWORD2(__dst[2]))
    {
      if (DWORD2(__dst[1]) < 8) {
        return 4294967293LL;
      }
      unint64_t v138 = *(void *)(v135 - 8);
      unint64_t v136 = v135 - 8;
      unint64_t v137 = v138;
      int v139 = DWORD2(__dst[2]) + 64;
    }

    else
    {
      if (DWORD2(__dst[1]) < 7) {
        return 4294967293LL;
      }
      unsigned int v140 = *(_DWORD *)(v135 - 7);
      unint64_t v136 = v135 - 7;
      unint64_t v137 = v140 | ((unint64_t)(*(unsigned __int16 *)(v136 + 4) | (*(unsigned __int8 *)(v136 + 6) << 16)) << 32);
      int v139 = 56;
    }

    uint64_t result = 4294967293LL;
    if ((v139 & 0xFFFFFFF8) != 0x38) {
      return result;
    }
    if (v137 >> v139) {
      return result;
    }
    *(_WORD *)(a1 + 124) = WORD6(__dst[2]);
    *(_DWORD *)(a1 + 126) = *(_DWORD *)((char *)&__dst[2] + 14);
    *(_DWORD *)(a1 + 120) = v136 - (_DWORD)v134;
    *(void *)(a1 + 88) = 0LL;
    *(_DWORD *)(a1 + 96) = -1;
    *(void *)(a1 + 104) = v137;
    *(_DWORD *)(a1 + 112) = v139;
    int v36 = v153;
LABEL_122:
    *(_DWORD *)(a1 + 52) = v36;
  }

  switch(v35)
  {
    case 762869346:
      *(_DWORD *)(a1 + 68) = *v33;
      *(void *)a1 = v32 + 2;
      int v36 = 762869346;
      goto LABEL_122;
    case 829978210:
      goto LABEL_51;
    case 611874402:
      uint64_t result = 0LL;
      *(void *)a1 = v33;
      *(_DWORD *)(a1 + 48) = 1;
      break;
  }

  return result;
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

double log2(double a1)
{
  return result;
}

uint64_t lzma_auto_decoder()
{
  return MEMORY[0x189615E48]();
}

uint64_t lzma_code()
{
  return MEMORY[0x189615E50]();
}

uint64_t lzma_easy_buffer_encode()
{
  return MEMORY[0x189615E60]();
}

uint64_t lzma_easy_encoder()
{
  return MEMORY[0x189615E68]();
}

uint64_t lzma_end()
{
  return MEMORY[0x189615E70]();
}

uint64_t lzma_stream_buffer_decode()
{
  return MEMORY[0x189615EB8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC940](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC958](a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1895FC988](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1895FCA58](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}