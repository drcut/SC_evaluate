; ModuleID = 'kernel.bc'
source_filename = "cuda/aes_cuda_benchmark.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@block_size = external thread_local local_unnamed_addr global i32
@block_size_x = external thread_local local_unnamed_addr global i32
@block_index_x = external thread_local local_unnamed_addr global i32

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z14AddRoundKeyGpuPhPji(i8* noalias %0, i32* noalias %1, i32 %2) local_unnamed_addr #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load i32*, i32** %5, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32, i32* %6, align 4
  %11 = mul nsw i32 16, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8, i8* %9, i64 %12
  store i8* %13, i8** %7, align 8
  %14 = load i8*, i8** %7, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = load i8*, i8** %4, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 0
  %19 = load i8, i8* %18, align 1
  %20 = xor i8 %19, %16
  store i8 %20, i8* %18, align 1
  %21 = load i8*, i8** %7, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 2
  %23 = load i8, i8* %22, align 1
  %24 = load i8*, i8** %4, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 1
  %26 = load i8, i8* %25, align 1
  %27 = xor i8 %26, %23
  store i8 %27, i8* %25, align 1
  %28 = load i8*, i8** %7, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  %30 = load i8, i8* %29, align 1
  %31 = load i8*, i8** %4, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 2
  %33 = load i8, i8* %32, align 1
  %34 = xor i8 %33, %30
  store i8 %34, i8* %32, align 1
  %35 = load i8*, i8** %7, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 0
  %37 = load i8, i8* %36, align 1
  %38 = load i8*, i8** %4, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 3
  %40 = load i8, i8* %39, align 1
  %41 = xor i8 %40, %37
  store i8 %41, i8* %39, align 1
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 7
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %4, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 4
  %47 = load i8, i8* %46, align 1
  %48 = xor i8 %47, %44
  store i8 %48, i8* %46, align 1
  %49 = load i8*, i8** %7, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 6
  %51 = load i8, i8* %50, align 1
  %52 = load i8*, i8** %4, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 5
  %54 = load i8, i8* %53, align 1
  %55 = xor i8 %54, %51
  store i8 %55, i8* %53, align 1
  %56 = load i8*, i8** %7, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 5
  %58 = load i8, i8* %57, align 1
  %59 = load i8*, i8** %4, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 6
  %61 = load i8, i8* %60, align 1
  %62 = xor i8 %61, %58
  store i8 %62, i8* %60, align 1
  %63 = load i8*, i8** %7, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 4
  %65 = load i8, i8* %64, align 1
  %66 = load i8*, i8** %4, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 7
  %68 = load i8, i8* %67, align 1
  %69 = xor i8 %68, %65
  store i8 %69, i8* %67, align 1
  %70 = load i8*, i8** %7, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 11
  %72 = load i8, i8* %71, align 1
  %73 = load i8*, i8** %4, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 8
  %75 = load i8, i8* %74, align 1
  %76 = xor i8 %75, %72
  store i8 %76, i8* %74, align 1
  %77 = load i8*, i8** %7, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 10
  %79 = load i8, i8* %78, align 1
  %80 = load i8*, i8** %4, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 9
  %82 = load i8, i8* %81, align 1
  %83 = xor i8 %82, %79
  store i8 %83, i8* %81, align 1
  %84 = load i8*, i8** %7, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 9
  %86 = load i8, i8* %85, align 1
  %87 = load i8*, i8** %4, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 10
  %89 = load i8, i8* %88, align 1
  %90 = xor i8 %89, %86
  store i8 %90, i8* %88, align 1
  %91 = load i8*, i8** %7, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 8
  %93 = load i8, i8* %92, align 1
  %94 = load i8*, i8** %4, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 11
  %96 = load i8, i8* %95, align 1
  %97 = xor i8 %96, %93
  store i8 %97, i8* %95, align 1
  %98 = load i8*, i8** %7, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 15
  %100 = load i8, i8* %99, align 1
  %101 = load i8*, i8** %4, align 8
  %102 = getelementptr inbounds i8, i8* %101, i64 12
  %103 = load i8, i8* %102, align 1
  %104 = xor i8 %103, %100
  store i8 %104, i8* %102, align 1
  %105 = load i8*, i8** %7, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 14
  %107 = load i8, i8* %106, align 1
  %108 = load i8*, i8** %4, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 13
  %110 = load i8, i8* %109, align 1
  %111 = xor i8 %110, %107
  store i8 %111, i8* %109, align 1
  %112 = load i8*, i8** %7, align 8
  %113 = getelementptr inbounds i8, i8* %112, i64 13
  %114 = load i8, i8* %113, align 1
  %115 = load i8*, i8** %4, align 8
  %116 = getelementptr inbounds i8, i8* %115, i64 14
  %117 = load i8, i8* %116, align 1
  %118 = xor i8 %117, %114
  store i8 %118, i8* %116, align 1
  %119 = load i8*, i8** %7, align 8
  %120 = getelementptr inbounds i8, i8* %119, i64 12
  %121 = load i8, i8* %120, align 1
  %122 = load i8*, i8** %4, align 8
  %123 = getelementptr inbounds i8, i8* %122, i64 15
  %124 = load i8, i8* %123, align 1
  %125 = xor i8 %124, %121
  store i8 %125, i8* %123, align 1
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z11SubBytesGpuPhS_(i8* noalias %0, i8* noalias %1) local_unnamed_addr #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = load i8, i8* %7, align 1
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds i8, i8* %5, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = load i8*, i8** %3, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  store i8 %11, i8* %13, align 1
  %14 = load i8*, i8** %4, align 8
  %15 = load i8*, i8** %3, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i64
  %19 = getelementptr inbounds i8, i8* %14, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = load i8*, i8** %3, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  store i8 %20, i8* %22, align 1
  %23 = load i8*, i8** %4, align 8
  %24 = load i8*, i8** %3, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 2
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds i8, i8* %23, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = load i8*, i8** %3, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 2
  store i8 %29, i8* %31, align 1
  %32 = load i8*, i8** %4, align 8
  %33 = load i8*, i8** %3, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 3
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i8, i8* %32, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %3, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 3
  store i8 %38, i8* %40, align 1
  %41 = load i8*, i8** %4, align 8
  %42 = load i8*, i8** %3, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 4
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i8, i8* %41, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = load i8*, i8** %3, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 4
  store i8 %47, i8* %49, align 1
  %50 = load i8*, i8** %4, align 8
  %51 = load i8*, i8** %3, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 5
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds i8, i8* %50, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = load i8*, i8** %3, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 5
  store i8 %56, i8* %58, align 1
  %59 = load i8*, i8** %4, align 8
  %60 = load i8*, i8** %3, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 6
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8* %59, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = load i8*, i8** %3, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 6
  store i8 %65, i8* %67, align 1
  %68 = load i8*, i8** %4, align 8
  %69 = load i8*, i8** %3, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 7
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i64
  %73 = getelementptr inbounds i8, i8* %68, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = load i8*, i8** %3, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 7
  store i8 %74, i8* %76, align 1
  %77 = load i8*, i8** %4, align 8
  %78 = load i8*, i8** %3, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 8
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i64
  %82 = getelementptr inbounds i8, i8* %77, i64 %81
  %83 = load i8, i8* %82, align 1
  %84 = load i8*, i8** %3, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 8
  store i8 %83, i8* %85, align 1
  %86 = load i8*, i8** %4, align 8
  %87 = load i8*, i8** %3, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 9
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds i8, i8* %86, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = load i8*, i8** %3, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 9
  store i8 %92, i8* %94, align 1
  %95 = load i8*, i8** %4, align 8
  %96 = load i8*, i8** %3, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 10
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i64
  %100 = getelementptr inbounds i8, i8* %95, i64 %99
  %101 = load i8, i8* %100, align 1
  %102 = load i8*, i8** %3, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 10
  store i8 %101, i8* %103, align 1
  %104 = load i8*, i8** %4, align 8
  %105 = load i8*, i8** %3, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 11
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i64
  %109 = getelementptr inbounds i8, i8* %104, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = load i8*, i8** %3, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 11
  store i8 %110, i8* %112, align 1
  %113 = load i8*, i8** %4, align 8
  %114 = load i8*, i8** %3, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 12
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i64
  %118 = getelementptr inbounds i8, i8* %113, i64 %117
  %119 = load i8, i8* %118, align 1
  %120 = load i8*, i8** %3, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 12
  store i8 %119, i8* %121, align 1
  %122 = load i8*, i8** %4, align 8
  %123 = load i8*, i8** %3, align 8
  %124 = getelementptr inbounds i8, i8* %123, i64 13
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i64
  %127 = getelementptr inbounds i8, i8* %122, i64 %126
  %128 = load i8, i8* %127, align 1
  %129 = load i8*, i8** %3, align 8
  %130 = getelementptr inbounds i8, i8* %129, i64 13
  store i8 %128, i8* %130, align 1
  %131 = load i8*, i8** %4, align 8
  %132 = load i8*, i8** %3, align 8
  %133 = getelementptr inbounds i8, i8* %132, i64 14
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i64
  %136 = getelementptr inbounds i8, i8* %131, i64 %135
  %137 = load i8, i8* %136, align 1
  %138 = load i8*, i8** %3, align 8
  %139 = getelementptr inbounds i8, i8* %138, i64 14
  store i8 %137, i8* %139, align 1
  %140 = load i8*, i8** %4, align 8
  %141 = load i8*, i8** %3, align 8
  %142 = getelementptr inbounds i8, i8* %141, i64 15
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i64
  %145 = getelementptr inbounds i8, i8* %140, i64 %144
  %146 = load i8, i8* %145, align 1
  %147 = load i8*, i8** %3, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 15
  store i8 %146, i8* %148, align 1
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12ShiftRowsGpuPh(i8* noalias %0) local_unnamed_addr #0 {
  %2 = alloca i8*, align 8
  %3 = alloca [16 x i8], align 1
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 1
  %7 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0
  store i8 %6, i8* %7, align 1
  %8 = load i8*, i8** %2, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 5
  %10 = load i8, i8* %9, align 1
  %11 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 1
  store i8 %10, i8* %11, align 1
  %12 = load i8*, i8** %2, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 10
  %14 = load i8, i8* %13, align 1
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 2
  store i8 %14, i8* %15, align 1
  %16 = load i8*, i8** %2, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 15
  %18 = load i8, i8* %17, align 1
  %19 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 3
  store i8 %18, i8* %19, align 1
  %20 = load i8*, i8** %2, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 4
  %22 = load i8, i8* %21, align 1
  %23 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 4
  store i8 %22, i8* %23, align 1
  %24 = load i8*, i8** %2, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 9
  %26 = load i8, i8* %25, align 1
  %27 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 5
  store i8 %26, i8* %27, align 1
  %28 = load i8*, i8** %2, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 14
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 6
  store i8 %30, i8* %31, align 1
  %32 = load i8*, i8** %2, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 3
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 7
  store i8 %34, i8* %35, align 1
  %36 = load i8*, i8** %2, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 8
  %38 = load i8, i8* %37, align 1
  %39 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 8
  store i8 %38, i8* %39, align 1
  %40 = load i8*, i8** %2, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 13
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 9
  store i8 %42, i8* %43, align 1
  %44 = load i8*, i8** %2, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 2
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 10
  store i8 %46, i8* %47, align 1
  %48 = load i8*, i8** %2, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 7
  %50 = load i8, i8* %49, align 1
  %51 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 11
  store i8 %50, i8* %51, align 1
  %52 = load i8*, i8** %2, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 12
  %54 = load i8, i8* %53, align 1
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 12
  store i8 %54, i8* %55, align 1
  %56 = load i8*, i8** %2, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  %58 = load i8, i8* %57, align 1
  %59 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 13
  store i8 %58, i8* %59, align 1
  %60 = load i8*, i8** %2, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 6
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 14
  store i8 %62, i8* %63, align 1
  %64 = load i8*, i8** %2, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 11
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 15
  store i8 %66, i8* %67, align 1
  %68 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0
  %69 = load i8, i8* %68, align 1
  %70 = load i8*, i8** %2, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 0
  store i8 %69, i8* %71, align 1
  %72 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 1
  %73 = load i8, i8* %72, align 1
  %74 = load i8*, i8** %2, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 1
  store i8 %73, i8* %75, align 1
  %76 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 2
  %77 = load i8, i8* %76, align 1
  %78 = load i8*, i8** %2, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 2
  store i8 %77, i8* %79, align 1
  %80 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 3
  %81 = load i8, i8* %80, align 1
  %82 = load i8*, i8** %2, align 8
  %83 = getelementptr inbounds i8, i8* %82, i64 3
  store i8 %81, i8* %83, align 1
  %84 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 4
  %85 = load i8, i8* %84, align 1
  %86 = load i8*, i8** %2, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 4
  store i8 %85, i8* %87, align 1
  %88 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 5
  %89 = load i8, i8* %88, align 1
  %90 = load i8*, i8** %2, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 5
  store i8 %89, i8* %91, align 1
  %92 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 6
  %93 = load i8, i8* %92, align 1
  %94 = load i8*, i8** %2, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 6
  store i8 %93, i8* %95, align 1
  %96 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 7
  %97 = load i8, i8* %96, align 1
  %98 = load i8*, i8** %2, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 7
  store i8 %97, i8* %99, align 1
  %100 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 8
  %101 = load i8, i8* %100, align 1
  %102 = load i8*, i8** %2, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 8
  store i8 %101, i8* %103, align 1
  %104 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 9
  %105 = load i8, i8* %104, align 1
  %106 = load i8*, i8** %2, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 9
  store i8 %105, i8* %107, align 1
  %108 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 10
  %109 = load i8, i8* %108, align 1
  %110 = load i8*, i8** %2, align 8
  %111 = getelementptr inbounds i8, i8* %110, i64 10
  store i8 %109, i8* %111, align 1
  %112 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 11
  %113 = load i8, i8* %112, align 1
  %114 = load i8*, i8** %2, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 11
  store i8 %113, i8* %115, align 1
  %116 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 12
  %117 = load i8, i8* %116, align 1
  %118 = load i8*, i8** %2, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 12
  store i8 %117, i8* %119, align 1
  %120 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 13
  %121 = load i8, i8* %120, align 1
  %122 = load i8*, i8** %2, align 8
  %123 = getelementptr inbounds i8, i8* %122, i64 13
  store i8 %121, i8* %123, align 1
  %124 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 14
  %125 = load i8, i8* %124, align 1
  %126 = load i8*, i8** %2, align 8
  %127 = getelementptr inbounds i8, i8* %126, i64 14
  store i8 %125, i8* %127, align 1
  %128 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 15
  %129 = load i8, i8* %128, align 1
  %130 = load i8*, i8** %2, align 8
  %131 = getelementptr inbounds i8, i8* %130, i64 15
  store i8 %129, i8* %131, align 1
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z13MixColumnsGpuPh(i8* noalias %0) local_unnamed_addr #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca [4 x i8], align 1
  %6 = alloca [4 x i8], align 1
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %3, align 4
  br label %9

9:                                                ; preds = %125, %1
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %10, 4
  br i1 %11, label %12, label %128

12:                                               ; preds = %9
  %13 = load i8*, i8** %2, align 8
  %14 = load i32, i32* %3, align 4
  %15 = mul nsw i32 4, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %13, i64 %16
  store i8* %17, i8** %4, align 8
  store i32 0, i32* %8, align 4
  br label %18

18:                                               ; preds = %57, %12
  %19 = load i32, i32* %8, align 4
  %20 = icmp slt i32 %19, 4
  br i1 %20, label %21, label %60

21:                                               ; preds = %18
  %22 = load i8*, i8** %4, align 8
  %23 = load i32, i32* %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8* %22, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = load i32, i32* %8, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 %28
  store i8 %26, i8* %29, align 1
  %30 = load i8*, i8** %4, align 8
  %31 = load i32, i32* %8, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = and i8 %34, -128
  store i8 %35, i8* %7, align 1
  %36 = load i8*, i8** %4, align 8
  %37 = load i32, i32* %8, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = shl i32 %41, 1
  %43 = trunc i32 %42 to i8
  %44 = load i32, i32* %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 %45
  store i8 %43, i8* %46, align 1
  %47 = load i8, i8* %7, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp eq i32 %48, 128
  br i1 %49, label %50, label %56

50:                                               ; preds = %21
  %51 = load i32, i32* %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = xor i8 %54, 27
  store i8 %55, i8* %53, align 1
  br label %56

56:                                               ; preds = %50, %21
  br label %57

57:                                               ; preds = %56
  %58 = load i32, i32* %8, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %8, align 4
  br label %18

60:                                               ; preds = %18
  %61 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 3
  %64 = load i8, i8* %63, align 1
  %65 = xor i8 %62, %64
  %66 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 2
  %67 = load i8, i8* %66, align 1
  %68 = xor i8 %65, %67
  %69 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  %70 = load i8, i8* %69, align 1
  %71 = xor i8 %68, %70
  %72 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 1
  %73 = load i8, i8* %72, align 1
  %74 = xor i8 %71, %73
  %75 = load i8*, i8** %4, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 0
  store i8 %74, i8* %76, align 1
  %77 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  %78 = load i8, i8* %77, align 1
  %79 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 0
  %80 = load i8, i8* %79, align 1
  %81 = xor i8 %78, %80
  %82 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 3
  %83 = load i8, i8* %82, align 1
  %84 = xor i8 %81, %83
  %85 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  %86 = load i8, i8* %85, align 1
  %87 = xor i8 %84, %86
  %88 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 2
  %89 = load i8, i8* %88, align 1
  %90 = xor i8 %87, %89
  %91 = load i8*, i8** %4, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 1
  store i8 %90, i8* %92, align 1
  %93 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  %94 = load i8, i8* %93, align 1
  %95 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 1
  %96 = load i8, i8* %95, align 1
  %97 = xor i8 %94, %96
  %98 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 0
  %99 = load i8, i8* %98, align 1
  %100 = xor i8 %97, %99
  %101 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  %102 = load i8, i8* %101, align 1
  %103 = xor i8 %100, %102
  %104 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 3
  %105 = load i8, i8* %104, align 1
  %106 = xor i8 %103, %105
  %107 = load i8*, i8** %4, align 8
  %108 = getelementptr inbounds i8, i8* %107, i64 2
  store i8 %106, i8* %108, align 1
  %109 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  %110 = load i8, i8* %109, align 1
  %111 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 2
  %112 = load i8, i8* %111, align 1
  %113 = xor i8 %110, %112
  %114 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 1
  %115 = load i8, i8* %114, align 1
  %116 = xor i8 %113, %115
  %117 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %118 = load i8, i8* %117, align 1
  %119 = xor i8 %116, %118
  %120 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 0
  %121 = load i8, i8* %120, align 1
  %122 = xor i8 %119, %121
  %123 = load i8*, i8** %4, align 8
  %124 = getelementptr inbounds i8, i8* %123, i64 3
  store i8 %122, i8* %124, align 1
  br label %125

125:                                              ; preds = %60
  %126 = load i32, i32* %3, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %3, align 4
  br label %9

128:                                              ; preds = %9
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z8aes_cudaPhPjS_(i8* noalias %0, i32* noalias %1, i8* noalias %2) local_unnamed_addr #0 {
  %local_intra_warp_idx = alloca i32
  %local_inter_warp_idx = alloca i32
  store i32 0, i32* %local_inter_warp_idx
  %4 = load i32, i32* @block_size
  %"7_intra_warp_" = alloca i32, i32 %4
  %5 = load i32, i32* @block_size
  %"6_intra_warp_" = alloca i32, i32 %5
  %6 = load i32, i32* @block_size
  %"5_intra_warp_" = alloca i32, i32 %6
  %7 = load i32, i32* @block_size
  %"4_intra_warp_" = alloca i32, i32 %7
  %8 = load i32, i32* @block_size
  %"3_intra_warp_" = alloca [16 x i8], i32 %8
  %9 = load i32, i32* @block_size
  %"2_intra_warp_" = alloca i8*, i32 %9
  %10 = load i32, i32* @block_size
  %"1_intra_warp_" = alloca i32*, i32 %10
  %11 = load i32, i32* @block_size
  %"0_intra_warp_" = alloca i8*, i32 %11
  %12 = alloca i8*, align 8
  br label %_after_block_sync_0

_after_block_sync_0:                              ; preds = %3
  %13 = alloca i32*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca [16 x i8], align 1
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  br label %_after_block_sync_0_after_block_sync_4

_after_block_sync_0_after_block_sync_4:           ; preds = %_after_block_sync_0
  br label %intra_warp_init

intra_warp_init:                                  ; preds = %_after_block_sync_0_after_block_sync_4
  store i32 0, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_inc:                                   ; preds = %131
  %20 = load i32, i32* %local_intra_warp_idx
  %intra_warp_index_increment = add i32 %20, 1
  store i32 %intra_warp_index_increment, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_cond:                                  ; preds = %intra_warp_inc, %intra_warp_init
  %21 = load i32, i32* %local_inter_warp_idx
  %22 = load i32, i32* %local_intra_warp_idx
  %23 = mul i32 %21, 32
  %thread_idx41 = add i32 %22, %23
  %24 = load i32, i32* @block_size
  %25 = load i32, i32* %local_intra_warp_idx
  %26 = icmp ult i32 %25, %24
  br i1 %26, label %_after_block_sync_0_after_block_sync_1, label %reset_block, !llvm.loop !10

_after_block_sync_0_after_block_sync_1:           ; preds = %intra_warp_cond
  %27 = getelementptr i8*, i8** %"0_intra_warp_", i32 %thread_idx41
  store i8* %0, i8** %27, align 8, !llvm.mem.parallel_loop_access !13
  %28 = getelementptr i32*, i32** %"1_intra_warp_", i32 %thread_idx41
  store i32* %1, i32** %28, align 8, !llvm.mem.parallel_loop_access !13
  %29 = getelementptr i8*, i8** %"2_intra_warp_", i32 %thread_idx41
  store i8* %2, i8** %29, align 8, !llvm.mem.parallel_loop_access !13
  %30 = load i32, i32* @block_index_x
  %31 = load i32, i32* @block_size_x
  %32 = mul i32 %30, %31
  %33 = load i32, i32* @block_size_x
  %thread_id_x = srem i32 %thread_idx41, %33
  %34 = add i32 %32, %thread_id_x
  %35 = getelementptr i32, i32* %"4_intra_warp_", i32 %thread_idx41
  store i32 %34, i32* %35, align 4, !llvm.mem.parallel_loop_access !13
  %36 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  store i32 0, i32* %36, align 4, !llvm.mem.parallel_loop_access !13
  br label %37

37:                                               ; preds = %58, %_after_block_sync_0_after_block_sync_1
  %38 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  %39 = load i32, i32* %38, align 4, !llvm.mem.parallel_loop_access !13
  %40 = icmp slt i32 %39, 16
  br i1 %40, label %41, label %63

41:                                               ; preds = %37
  %42 = getelementptr i8*, i8** %"0_intra_warp_", i32 %thread_idx41
  %43 = load i8*, i8** %42, align 8, !llvm.mem.parallel_loop_access !13
  %44 = getelementptr i32, i32* %"4_intra_warp_", i32 %thread_idx41
  %45 = load i32, i32* %44, align 4, !llvm.mem.parallel_loop_access !13
  %46 = mul i32 %45, 16
  %47 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  %48 = load i32, i32* %47, align 4, !llvm.mem.parallel_loop_access !13
  %49 = add i32 %46, %48
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %43, i64 %50
  %52 = load i8, i8* %51, align 1, !llvm.mem.parallel_loop_access !13
  %53 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  %54 = load i32, i32* %53, align 4, !llvm.mem.parallel_loop_access !13
  %55 = sext i32 %54 to i64
  %56 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %57 = getelementptr inbounds [16 x i8], [16 x i8]* %56, i64 0, i64 %55
  store i8 %52, i8* %57, align 1, !llvm.mem.parallel_loop_access !13
  br label %58

58:                                               ; preds = %41
  %59 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  %60 = load i32, i32* %59, align 4, !llvm.mem.parallel_loop_access !13
  %61 = add nsw i32 %60, 1
  %62 = getelementptr i32, i32* %"5_intra_warp_", i32 %thread_idx41
  store i32 %61, i32* %62, align 4, !llvm.mem.parallel_loop_access !13
  br label %37

63:                                               ; preds = %37
  %64 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %65 = getelementptr inbounds [16 x i8], [16 x i8]* %64, i64 0, i64 0
  %66 = getelementptr i32*, i32** %"1_intra_warp_", i32 %thread_idx41
  %67 = load i32*, i32** %66, align 8, !llvm.mem.parallel_loop_access !13
  call void @_Z14AddRoundKeyGpuPhPji(i8* %65, i32* %67, i32 0) #2, !llvm.mem.parallel_loop_access !13
  %68 = getelementptr i32, i32* %"6_intra_warp_", i32 %thread_idx41
  store i32 1, i32* %68, align 4, !llvm.mem.parallel_loop_access !13
  br label %69

69:                                               ; preds = %88, %63
  %70 = getelementptr i32, i32* %"6_intra_warp_", i32 %thread_idx41
  %71 = load i32, i32* %70, align 4, !llvm.mem.parallel_loop_access !13
  %72 = icmp slt i32 %71, 14
  br i1 %72, label %73, label %93

73:                                               ; preds = %69
  %74 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %75 = getelementptr inbounds [16 x i8], [16 x i8]* %74, i64 0, i64 0
  %76 = getelementptr i8*, i8** %"2_intra_warp_", i32 %thread_idx41
  %77 = load i8*, i8** %76, align 8, !llvm.mem.parallel_loop_access !13
  call void @_Z11SubBytesGpuPhS_(i8* %75, i8* %77) #2, !llvm.mem.parallel_loop_access !13
  %78 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %79 = getelementptr inbounds [16 x i8], [16 x i8]* %78, i64 0, i64 0
  call void @_Z12ShiftRowsGpuPh(i8* %79) #2, !llvm.mem.parallel_loop_access !13
  %80 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %81 = getelementptr inbounds [16 x i8], [16 x i8]* %80, i64 0, i64 0
  call void @_Z13MixColumnsGpuPh(i8* %81) #2, !llvm.mem.parallel_loop_access !13
  %82 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %83 = getelementptr inbounds [16 x i8], [16 x i8]* %82, i64 0, i64 0
  %84 = getelementptr i32*, i32** %"1_intra_warp_", i32 %thread_idx41
  %85 = load i32*, i32** %84, align 8, !llvm.mem.parallel_loop_access !13
  %86 = getelementptr i32, i32* %"6_intra_warp_", i32 %thread_idx41
  %87 = load i32, i32* %86, align 4, !llvm.mem.parallel_loop_access !13
  call void @_Z14AddRoundKeyGpuPhPji(i8* %83, i32* %85, i32 %87) #2, !llvm.mem.parallel_loop_access !13
  br label %88

88:                                               ; preds = %73
  %89 = getelementptr i32, i32* %"6_intra_warp_", i32 %thread_idx41
  %90 = load i32, i32* %89, align 4, !llvm.mem.parallel_loop_access !13
  %91 = add nsw i32 %90, 1
  %92 = getelementptr i32, i32* %"6_intra_warp_", i32 %thread_idx41
  store i32 %91, i32* %92, align 4, !llvm.mem.parallel_loop_access !13
  br label %69

93:                                               ; preds = %69
  %94 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %95 = getelementptr inbounds [16 x i8], [16 x i8]* %94, i64 0, i64 0
  %96 = getelementptr i8*, i8** %"2_intra_warp_", i32 %thread_idx41
  %97 = load i8*, i8** %96, align 8, !llvm.mem.parallel_loop_access !13
  call void @_Z11SubBytesGpuPhS_(i8* %95, i8* %97) #2, !llvm.mem.parallel_loop_access !13
  %98 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %99 = getelementptr inbounds [16 x i8], [16 x i8]* %98, i64 0, i64 0
  call void @_Z12ShiftRowsGpuPh(i8* %99) #2, !llvm.mem.parallel_loop_access !13
  %100 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %101 = getelementptr inbounds [16 x i8], [16 x i8]* %100, i64 0, i64 0
  %102 = getelementptr i32*, i32** %"1_intra_warp_", i32 %thread_idx41
  %103 = load i32*, i32** %102, align 8, !llvm.mem.parallel_loop_access !13
  call void @_Z14AddRoundKeyGpuPhPji(i8* %101, i32* %103, i32 14) #2, !llvm.mem.parallel_loop_access !13
  %104 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  store i32 0, i32* %104, align 4, !llvm.mem.parallel_loop_access !13
  br label %105

105:                                              ; preds = %126, %93
  %106 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  %107 = load i32, i32* %106, align 4, !llvm.mem.parallel_loop_access !13
  %108 = icmp slt i32 %107, 16
  br i1 %108, label %109, label %131

109:                                              ; preds = %105
  %110 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  %111 = load i32, i32* %110, align 4, !llvm.mem.parallel_loop_access !13
  %112 = sext i32 %111 to i64
  %113 = getelementptr [16 x i8], [16 x i8]* %"3_intra_warp_", i32 %thread_idx41
  %114 = getelementptr inbounds [16 x i8], [16 x i8]* %113, i64 0, i64 %112
  %115 = load i8, i8* %114, align 1, !llvm.mem.parallel_loop_access !13
  %116 = getelementptr i8*, i8** %"0_intra_warp_", i32 %thread_idx41
  %117 = load i8*, i8** %116, align 8, !llvm.mem.parallel_loop_access !13
  %118 = getelementptr i32, i32* %"4_intra_warp_", i32 %thread_idx41
  %119 = load i32, i32* %118, align 4, !llvm.mem.parallel_loop_access !13
  %120 = mul i32 %119, 16
  %121 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  %122 = load i32, i32* %121, align 4, !llvm.mem.parallel_loop_access !13
  %123 = add i32 %120, %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8* %117, i64 %124
  store i8 %115, i8* %125, align 1, !llvm.mem.parallel_loop_access !13
  br label %126

126:                                              ; preds = %109
  %127 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  %128 = load i32, i32* %127, align 4, !llvm.mem.parallel_loop_access !13
  %129 = add nsw i32 %128, 1
  %130 = getelementptr i32, i32* %"7_intra_warp_", i32 %thread_idx41
  store i32 %129, i32* %130, align 4, !llvm.mem.parallel_loop_access !13
  br label %105

131:                                              ; preds = %105
  br label %intra_warp_inc

reset_block:                                      ; preds = %intra_warp_cond
  store i32 0, i32* %local_intra_warp_idx
  br label %_after_block_sync_3

_after_block_sync_3:                              ; preds = %reset_block
  br label %_after_block_sync_2

_after_block_sync_2:                              ; preds = %_after_block_sync_3
  ret void
}

; Function Attrs: nounwind
define void @_Z8aes_cudaPhPjS__wrapper(i8* noalias nocapture readonly %0) local_unnamed_addr #1 {
  %2 = bitcast i8* %0 to i8***
  %3 = load i8**, i8*** %2, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr i8, i8* %0, i64 8
  %6 = bitcast i8* %5 to i32***
  %7 = load i32**, i32*** %6, align 8
  %8 = load i32*, i32** %7, align 8
  %9 = getelementptr i8, i8* %0, i64 16
  %10 = bitcast i8* %9 to i8***
  %11 = load i8**, i8*** %10, align 8
  %12 = load i8*, i8** %11, align 8
  tail call void @_Z8aes_cudaPhPjS_(i8* %4, i32* %8, i8* %12)
  ret void
}

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvmir.version = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i8*, i32*, i8*)* @_Z8aes_cudaPhPjS_, !"kernel", i32 1}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = !{i32 1, i32 4}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.parallel_accesses", !12}
!12 = distinct !{}
!13 = !{!12}
